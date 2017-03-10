Excel tricks
============

### Para tornar um célula absoluta dentro de uma fórmula (`F4` no windows)

* `CMD + t`

### Para mostrar o botão do vba script:

* arquivo -> opções -> personalizar faixa de opções -> liga a aba de desenvolvedor; OU, `alt + F11`


### Para incluir a biblioteca de Regxp

* ferramentas -> referencias -> escolhe Microsoft VBScript Regular Expressions 5.5

```vba
"Dim ehNumero As New RegExp
Dim pattern As String: pattern = "[0-9]"

With ehNumero
   .Global = True
   .pattern = pattern
End With

If ehNumero.test("AB") Then
  blah blah
End If"
```

### Para incluir uma função qualquer no excel

* É só criar um módulo novo e sair escrevendo as funções. Para usar, é só selecionar no user defined functions ou usar o nome certinho da função no excel.
