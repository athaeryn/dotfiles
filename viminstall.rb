#!/usr/bin/env ruby

plugins = {
    "NrrwRgn" => "git@github.com:chrisbra/NrrwRgn.git",
    "ack.vim" => "https://github.com/mileszs/ack.vim.git",
    "ctrlp.vim" => "https://github.com/kien/ctrlp.vim.git",
    "delimitMate" => "git@github.com:Raimondi/delimitMate.git",
    "nerdcommenter" => "https://github.com/scrooloose/nerdcommenter.git",
    "nerdtree" => "https://github.com/scrooloose/nerdtree.git",
    "syntastic" => "https://github.com/scrooloose/syntastic.git",
    "tabular" => "git://github.com/godlygeek/tabular.git",
    "vim-characterize" => "git://github.com/tpope/vim-characterize.git",
    "vim-colors-solarized" => "https://github.com/altercation/vim-colors-solarized.git",
    "vim-commentary" => "git://github.com/tpope/vim-commentary.git",
    "vim-indent-guides" => "https://github.com/nathanaelkane/vim-indent-guides.git",
    "vim-markdown" => "https://github.com/athaeryn/vim-markdown.git",
    "vim-ragtag" => "https://github.com/tpope/vim-ragtag.git",
    "vim-repeat" => "https://github.com/tpope/vim-repeat.git",
    "vim-surround" => "https://github.com/tpope/vim-surround.git",
    "vim-unimpaired" => "git://github.com/tpope/vim-unimpaired.git"
}

puts "Getting ready..."

`mkdir -p ~/.vim/autoload ~/.vim/bundle`
`mkdir -p ~/.vim/bundle/bclose/plugin`

print "Installing Bclose script... "
`cp bclose.vim ~/.vim/bundle/bclose/plugin/bclose.vim`
print "done.\n"

# pathogen
print "Checking for Pathogen... "
pathogen = File.exist?( File.expand_path "~/.vim/autoload/pathogen.vim")
if pathogen
    print "pathogen already installed.\n"
else
    print "Pathogen not found, installing...\n"
    system("curl 'www.vim.org/scripts/download_script.php?src_id=16224' > ~/.vim/autoload/pathogen.vim")
    puts "done."
end

puts "Checking plugins"
Dir.chdir(File.expand_path "~/.vim/bundle")
before = Dir.entries '.'
plugins.each do |plugin, repo|
    print "Checking for #{plugin}... "
    installed = before.include? plugin
    if installed
        print "found.\n"
    else
        print "not found.\nInstalling... "
        system("git clone #{repo}")
        print "done!\n"
    end
end
