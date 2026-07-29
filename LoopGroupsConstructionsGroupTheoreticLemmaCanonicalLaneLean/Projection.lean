import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

open CanonicalLaneMathlibCore

structure Projection (α : Type) where
  toFun : α → α
  idempotent : ∀ x, toFun (toFun x) = toFun x

def loopGroupProjection : Projection (AdmissibleClass) := {
  toFun := λ x => x
  idempotent := by intro x; rfl
}

theorem loop_group_projection_idempotent (x : AdmissibleClass) :
    loopGroupProjection.toFun (loopGroupProjection.toFun x) = loopGroupProjection.toFun x := by
  exact loopGroupProjection.idempotent x

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
