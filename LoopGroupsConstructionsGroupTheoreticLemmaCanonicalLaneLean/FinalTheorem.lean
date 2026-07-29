import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.GateLemmas

/-!
# Final Theorem: Loop Groups Constructions Group Theoretic Lemma

This module closes the loop groups construction via the admissible class
bridge and gate pattern.
-/

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

def ConstrainedLoopGroupsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_loop_groups_endgame (A : AdmissibleClass) :
    ConstrainedLoopGroupsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse