#! /usr/bin/env python

from __future__ import print_function
import os, sys, shutil, subprocess

LOG_LEVEL=1

def log(level, *l, **d):
  if level <= LOG_LEVEL:
    print(*l, **d)

def log0(*l, **d):
  log(0, *l, **d)

def log1(*l, **d):
  log(1, *l, **d)

def copy(src, dst):
  log1("cp '%s' to '%s'..." % (src, dst), end=" ")
  shutil.copy(src, dst)
  log1("done")

def copy_to_home_dir(src, hidden=True):
  home_dir = HOME_DIR
  if hidden:
    home_dir += "."
  copy(src, home_dir + src)

def rm_dir(name):
  log1("rm directory '%s'..." % name, end=" ")
  shutil.rmtree(name, ignore_errors=True)
  log1("done")

def mk_dir(name):
  log1("mk directory '%s'..." % name, end=" ")
  os.makedirs(name)
  log1("done")

def check_output(*popenargs, **kwargs):
  process = subprocess.Popen(stdout=subprocess.PIPE, *popenargs, **kwargs)
  output, unused_err = process.communicate()
  retcode = process.poll()
  if retcode:
    raise Exception("return code isn't 0!")
  return output

def shell(cmd):
  log1("executing '%s'..." % cmd)
  log1(check_output(cmd, shell=True))

def is_macos():
  return sys.platform == "darwin"

def is_remote():
  return not is_macos()

FILE_DIR = os.path.dirname(os.path.abspath(__file__))
os.chdir(FILE_DIR)

MACOS = is_macos()
REMOTE = is_remote()
HOME_DIR = os.path.expanduser("~/")

if REMOTE:
  admin_scripts = os.environ.get("ADMIN_SCRIPTS")
  if not admin_scripts:
    if sys.version_info[:2] <= (2, 7):
      get_input = raw_input
    else:
      get_input = input
    admin_scripts = get_input("admin_scripts_path(do not include trailing '/'): ")
  log0("admin_scripts: %s" % admin_scripts)

shell("git checkout -- zshrc")
shell("git checkout -- bashrc")
shell("sed -i %s-e 's/__sed_here_plz__/export IS_REMOTE=%d/g' bashrc zshrc" % (MACOS and "'' " or "", REMOTE and 1 or 0))
if REMOTE:
  shell("sed -i %s-e 's/$ADMIN_SCRIPTS/%s/g' bashrc zshrc vimrc" % (MACOS and "'' " or "", admin_scripts.replace("/", "\/")))

copy_to_home_dir("zshrc")
copy_to_home_dir("bashrc")
copy_to_home_dir("vimrc")

if REMOTE:
  copy_to_home_dir("tmux.conf")
else:
  copy_to_home_dir("gitconfig")
  copy_to_home_dir("ycm_extra_conf.py")

rm_dir(HOME_DIR + ".oh-my-zsh")

shell("git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh")
if REMOTE:
  shell("sed -i %s-e 's/green/red/g' ~/.oh-my-zsh/themes/gentoo.zsh-theme" % (MACOS and "'' " or ""))

rm_dir(HOME_DIR + ".vim")
mk_dir(HOME_DIR + ".vim/bundle")
mk_dir(HOME_DIR + ".vim/undodir")
shell("git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")

shell("vim +PluginInstall +qall")
if REMOTE:
  log0("please finish all the steps in ````setup")
else:
  shell("~/.vim/bundle/YouCompleteMe/install.py --clang-completer")

log0("finished!")
