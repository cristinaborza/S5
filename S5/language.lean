inductive form where 
  | atom : Nat → form 
  | bot : form
  | impl : form → form → form 
  | box : form → form 

set_option quotPrecheck false

notation:40 "¬"p => form.impl p (form.bot)
infix:50 "→" => form.impl 
notation p "∧" q => ¬(p → (form.neg q))
notation p "∨" q => ((form.neg p) ∧ (form.neg q))
prefix:80 "□" => form.box 
notation "⋄"p => ¬(□(¬p))
notation "⊤" => ¬ form.bot 
notation "⊥" => form.bot