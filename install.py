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

def shell(cmd):
  log1("executing '%s'..." % cmd)
  log1(subprocess.check_output(cmd, shell=True))

def is_remote():
  return sys.platform != "darwin"

FILE_DIR = os.path.dirname(os.path.abspath(__file__))
os.chdir(FILE_DIR)

REMOTE = is_remote()
shell("git checkout -- zshrc")
shell("git checkout -- bashrc")
shell("sed -i '' -e 's/__sed_here_plz__/export IS_REMOTE=%d/g' bashrc zshrc" % (REMOTE and 1 or 0))
HOME_DIR = os.path.expanduser("~/")

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

rm_dir(HOME_DIR + ".vim")
mk_dir(HOME_DIR + ".vim/bundle")
mk_dir(HOME_DIR + ".vim/undodir")
shell("git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")

shell("vim +PluginInstall +qall")
if not REMOTE:
    shell("~/.vim/bundle/YouCompleteMe/install.py --clang-completer")
else:
    log0("please create the undodir for vim!")

log0("finished!")
