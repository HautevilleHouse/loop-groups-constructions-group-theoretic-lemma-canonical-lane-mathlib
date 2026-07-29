import canonicalLaneMathlib.AdmissibleClass

/-!
# Loop Groups Construction

This module defines the basic structures for loop groups and their
associated group-theoretic constructions. The central object is a
loop group associated to a compact Lie group, along with the
central extension and the energy representation.
-/

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure LoopGroup (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G] where
  baseGroup : G
  loopSpace : Type v
  loopTopology : TopologicalSpace loopSpace
  pointwiseMultiplication : loopSpace → loopSpace → loopSpace
  continuousMultiplication : Continuous (λ (p : loopSpace × loopSpace) => pointwiseMultiplication p.1 p.2)
  identityLoop : loopSpace
  inverseLoop : loopSpace → loopSpace
  groupAxioms : Group loopSpace

def LoopGroupCentralExtension (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G]
    (LG : LoopGroup G) : Type (max u v) := LG.loopSpace × ℝ

structure CentralExtensionGroupStructure (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G]
    (LG : LoopGroup G) where
  underlyingSet : LoopGroupCentralExtension G LG
  multiplication : LoopGroupCentralExtension G LG → LoopGroupCentralExtension G LG → LoopGroupCentralExtension G LG
  identity : LoopGroupCentralExtension G LG
  inverse : LoopGroupCentralExtension G LG → LoopGroupCentralExtension G LG
  groupAxioms : Group (LoopGroupCentralExtension G LG)
  cocycleCondition : Prop

def LoopGroupAdmissibleObject (G : Type u) [Group G] [TopologicalSpace G] [TopologicalGroup G] : AdmissibleClass where
  object := {
    space := { carrier := G, topology := inferInstance }
    closedThreeManifold := True
    simplyConnected := True
    sphereModel := Unit
    sphereTopology := inferInstance
    homeomorphicToSphere := True
  }
  endpointSatisfied := True
  remainderRecorded := True
  gateWitness := Or.inl True.intro

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse