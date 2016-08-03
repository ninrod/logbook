#Intellij | Idea

## shortcuts

* code folding: [`ctrl+shift+numpad-`](https://www.jetbrains.com/idea/help/folding-and-expanding-code-blocks.html)

* to extract a variable: `ctrl+alt+v`

```java
/* change this */
tir.getPagadorRecebedorNoPais(); 

/* to this */
PagadorRecebedorNoPais pag = tir.getPagadorRecebedorNoPais();
```

## ideavim

### listing/using possible actions

* just type: `:actionlist [pattern]`
* sample usage

```viml
nnoremap gcc :action CommentByLineComment<cr>
nnoremap <leader>fu :action FindUsages<cr>
nnoremap <leader>im :action GotoImplementation<cr>
nnoremap <leader>cv :action ChangeView<cr>
nnoremap <leader>br :action ViewBreakpoints<cr>
nnoremap <leader>ic :action InspectCode<cr>
nnoremap <leader>oi :action OptimizeImports<cr>
nnoremap <leader>re :action RenameElement<cr>
nnoremap <leader>rf :action RenameFile<cr>
```

## instalando colorschemes

### arquivo .icls

* linux: coloca o arquivo aqui: `~/.IdeaICXX/config/colors`
* more info [here](https://github.com/jkaving/intellij-colors-solarized)

### querydsl and code generators

* open dialog like this: settings -> build, execution, deployment -> compiler -> annotation processors 
* as vezes tem que configurar o nome do FQ processor, e.g:

    com.querydsl.apt.jpa.JPAAnnotationProcessor
    lombok.core.AnnotationProcessor
