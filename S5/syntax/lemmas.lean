import S5.syntax.basic

open prf 

-- Identity implication
theorem idd { p : form } { Γ : ctx } : Γ ⊢ₛ₅ p → p := by
  apply mp
  case hpq => 
    apply mp 
    case hpq => exact @pl2 Γ p (p → p) p 
    case hp => exact @pl1 Γ p (p → p)
  case hp => exact @pl1 Γ p p

-- Deduction metatheorem
theorem deduction { Γ : ctx } { p q : form } : ((Γ ∪ p) ⊢ₛ₅ q) → (Γ ⊢ₛ₅ p → q) := sorry 


-- Structural rules
theorem sub_weak { Γ Δ : ctx } { p : form } : (Δ ⊢ₛ₅ p) → (Δ ⊆ Γ) → (Γ ⊢ₛ₅ p) := sorry 
theorem weak { Γ : ctx } { p q : form } :(Γ ⊢ₛ₅ p) → ((Γ ∪ q) ⊢ₛ₅ p) := sorry 
theorem contr { Γ : ctx } { p q : form } : (((Γ ∪ p) ∪ p) ⊢ₛ₅ q) → ((Γ ∪ p) ⊢ₛ₅ q) := sorry
theorem exg { Γ : ctx } { p q r : form } : (((Γ ∪ p) ∪ q) ⊢ₛ₅ r) → (((Γ ∪ q) ∪ p) ⊢ₛ₅ r) := sorry
theorem subctx_ax { Γ Δ : ctx } { p : form } : (Δ ⊆ Γ) → (Δ ⊢ₛ₅ p) → (Γ ⊢ₛ₅ p) := sorry
--theorem subctx_contr { Γ Δ : ctx } { p : form } : (Δ ⊆ Γ) → ((Γ ∪ Δ) ⊢ₛ₅ p) → (Γ ⊢ₛ₅ p) := sorry


-- Right-hand side basic rules of inference
theorem pr { Γ : ctx } { p : form } : (Γ ∪ p) ⊢ₛ₅ p := ax $ by constructor
theorem pr1 { Γ : ctx } { p q : form } : ((Γ ∪ p) ∪ q) ⊢ₛ₅ p := ax $ by (repeat constructor)
theorem pr2 { Γ : ctx } { p q : form } : ((Γ ∪ p) ∪ q) ⊢ₛ₅ q := ax $ by constructor
theorem by_mp1 {Γ : ctx } {p q : form } : ((Γ ∪ p) ∪ p → q) ⊢ₛ₅ q := mp pr2 pr1
theorem by_mp2 {Γ : ctx } {p q : form } : ((Γ ∪ p → q) ∪ p) ⊢ₛ₅ q := mp pr1 pr2 
theorem cut { Γ : ctx } { p q r : form } : (Γ ⊢ₛ₅ p → q) → (Γ ⊢ₛ₅ q → r) → (Γ ⊢ₛ₅ p → r) := by 
  intro hpq hqr 
  apply mp (mp pl2 (mp pl1 hqr)) hpq

theorem conv_deduction { Γ : ctx } { p q : form } : (Γ ⊢ₛ₅ p → q) → ((Γ ∪ p) ⊢ₛ₅ q) := by 
  intro hpq
  apply mp (weak hpq) pr 


-- Left-hand side basic rules of inference
theorem mp_in_ctx_left { Γ : ctx } { p q r : form } : (((Γ ∪ p) ∪ q) ⊢ₛ₅ r) → (((Γ ∪ p) ∪ p → q) ⊢ₛ₅ r) := sorry
theorem mp_in_ctx_right { Γ : ctx } { p q r : form } : (((Γ ∪ p) ∪ p → q) ⊢ₛ₅ r) → (((Γ ∪ p) ∪ q) ⊢ₛ₅ r) := sorry 


-- Basic lemmas
theorem ot_impl { Γ : ctx } { p q : form } : Γ ⊢ₛ₅ (p → q) → ((¬q) → (¬p)) := sorry
theorem dne { Γ : ctx } { p : form } : Γ ⊢ₛ₅ (¬¬p) → p := sorry 
theorem dni { Γ : ctx } { p : form } : Γ ⊢ₛ₅ p → (¬¬p) := sorry
theorem lem { Γ : ctx } { p : form } : Γ ⊢ₛ₅ p ∨ ¬p := sorry
theorem not_impl_to_and { Γ : ctx } { p q : form } : Γ ⊢ₛ₅ (¬(p → q)) → (p ∨ (¬q)) := sorry
theorem and_not_to_not_impl { Γ : ctx } { p q : form } : Γ ⊢ₛ₅ (p ∨ (¬q)) → (¬(p → q)) := sorry
theorem box_contrap { p q : form } : ⊢ₛ₅ (□(p → q)) → (□((¬q) → (¬p))) := sorry
