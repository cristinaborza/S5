inductive form where 
  | atom : form 
  | neg : form → form 
  | impl : form → form → form 
  | box : form → form 

set_option quotPrecheck false

notation:40 "¬"p => form.neg p 
infix:50 "→" => form.impl 
notation p "∧" q => ¬(p → (form.neg q))
notation p "∨" q => ((form.neg p) ∧ (form.neg q))
prefix:80 "□" => form.box 
notation "⋄"p => ¬(□(¬p))