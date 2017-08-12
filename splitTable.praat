# Table splitting script
tableToSplit = selected("Table")
select tableToSplit
ncols = Get number of columns

for i to ncols
   colName'i'$ = Get column label: i
endfor

beginPause("Split for which column?")
   optionMenu ("Column label", 1)
   for i to ncols
      currCol$ = colName'i'$
      option ("'currCol$'")
   endfor
clicked = endPause("Continue",0)

@factorsToArray: column_label$

for j to factorsToArray.numLabels
   currLabel$ = factorsToArray.label$[j]
   select tableToSplit
   currentName$ = selected$("Table")
   Extract rows where column (text): column_label$, "is equal to", currLabel$
   newName$ = currentName$+"_"+column_label$ +"_"+currLabel$
   Rename: newName$
endfor

## Collects a string array of
procedure factorsToArray: .searchColumn$
   collapsed = Collapse rows: .searchColumn$, "", "", "", "", ""
   .numLabels = Get number of rows
   for .i to .numLabels
      .label$[.i] = Get value: .i, .searchColumn$
   endfor
   Remove
endproc