import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure ModularInvariance (G : Type*) [TopologicalSpace G] [Group G] where
  char : ℤ
  modForm : ℂ × ℂ → ℂ
  invarianceUnderSL2Z : Prop
  modularInvarianceClosed : Prop

structure ModularInvarianceEvidence (G : Type*) [TopologicalSpace G] [Group G] (M : ModularInvariance G) where
  invarianceUnderSL2ZClosed : M.invarianceUnderSL2Z
  modularInvarianceClosedTerm : M.modularInvarianceClosed

def ModularInvarianceClosed (G : Type*) [TopologicalSpace G] [Group G] (M : ModularInvariance G) : Prop :=
  M.invarianceUnderSL2Z ∧ M.modularInvarianceClosed

theorem modular_invariance_closed_from_evidence (G : Type*) [TopologicalSpace G] [Group G] (M : ModularInvariance G) (E : ModularInvarianceEvidence G M) : ModularInvarianceClosed G M :=
  And.intro E.invarianceUnderSL2ZClosed E.modularInvarianceClosedTerm

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse