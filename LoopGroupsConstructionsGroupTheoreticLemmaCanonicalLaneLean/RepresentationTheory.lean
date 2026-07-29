import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.CentralExtension

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure RepresentationPackage (O : LoopGroupObject) where
  representation : O.loopSpace → Matrix (Fin n) (Fin n) ℂ
  unitary : Prop
  irreducibility : Prop

def RepresentationClosed (O : LoopGroupObject) (R : RepresentationPackage O) : Prop :=
  R.unitary ∧ R.irreducibility

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
