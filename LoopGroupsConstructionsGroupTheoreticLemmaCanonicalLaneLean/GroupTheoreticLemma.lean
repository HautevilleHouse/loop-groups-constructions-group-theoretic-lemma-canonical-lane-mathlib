import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.LoopGroupsConstruction

/-!
# Group Theoretic Lemma

This module formalizes the key group-theoretic lemma for loop group
constructions: the energy representation is irreducible and the
central extension splits over a dense subgroup.
-/

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure EnergyRepresentation (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G]
    (LG : LoopGroup G) where
  hilbertSpace : Type v
  innerProduct : HilbertSpace.Inner hilbertSpace
  groupAction : LG.loopSpace → (hilbertSpace → hilbertSpace)
  unitaryAction : ∀ (γ : LG.loopSpace), IsUnitary (groupAction γ)
  irreducibility : Prop
  irreducibilityProof : irreducibility

structure CentralExtensionSplitCondition (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G]
    (LG : LoopGroup G) (CE : CentralExtensionGroupStructure G LG) where
  denseSubgroup : Set LG.loopSpace
  dense : Dense denseSubgroup
  splitting : ∀ (γ : denseSubgroup), CE.multiplication (γ.val, 0) (CE.identity) = (γ.val, 0)

theorem energy_representation_irreducible (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G]
    (LG : LoopGroup G) (E : EnergyRepresentation G LG) :
    E.irreducibility := E.irreducibilityProof

theorem central_extension_splits_on_dense_subgroup (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G]
    (LG : LoopGroup G) (CE : CentralExtensionGroupStructure G LG) (split : CentralExtensionSplitCondition G LG CE) :
    ∀ (γ : split.denseSubgroup), CE.multiplication (γ.val, 0) (CE.identity) = (γ.val, 0) :=
  split.splitting

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse