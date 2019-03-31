with import <nixpkgs> {};
                                                                                 
neovim.override {
  configure = {
    customRC = ''
      
      " search.vim
      "set incsearch
      "set hlsearch
      "nnoremap <leader><space> :nohlsearch<CR>
      
      
      " settings.vim
      set nocompatible
      let mapleader =" "
      
      set number relativenumber
      augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
      augroup END
      
      set mouse =""
      
      set statusline+=%#warningmsg#
      set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*
      
      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0
      " LaTeX
      map <leader>c :w! \| !pdflatex <c-r>%<CR><CR>
	  " autocmd VimLeave *.tex !texclear.sh %
      
      " ui.vim
      set showcmd
      set cursorline
      filetype indent on
      set lazyredraw
      set showmatch
      set laststatus=2
      set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
      " wildmenu
      set wildmenu
      set wildmode=list:longest,full wildmenu
      
      " whitespace.vim
      set tabstop=4
      set softtabstop=4
      set expandtab                                              
    '';
    packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ idris-vim YouCompleteMe Syntastic ];
      opt = [ vim-latex-live-preview ];
    };
  };
}
