import S5.context 

open Classical 

def world := ctx 

-- Kripke models
structure model where
  worlds : List world
  access : world → world → Bool
  val : Nat → world → Bool
  refl : (∀ w, w ∈ worlds) → access w w = True
  symm : (∀ w, w ∈ worlds) → (∀ v, v ∈ worlds) → access w v = True → access v w = True
  trans : (∀ w, w ∈ worlds) → (∀ v, v ∈ worlds) → (∀ u, u ∈ worlds) → access w v = True → access v u = True → access w u = True


noncomputable def forces_form (M : model) : form → world → Bool
| (form.atom p) => fun w => M.val p w 
| (form.bot) => fun w => False 
| (form.impl p q) => fun w => (!(forces_form M p w) || (forces_form M q w)) 
| (form.box p) => fun w => 
    if (∀ v , (v ∈ M.worlds) → (w ∈ M.worlds) → (M.access w v = True) → (forces_form M p v = True))
      then True 
    else False

notation M "," w "⊩" p => forces_form M p w
