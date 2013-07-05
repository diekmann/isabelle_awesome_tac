theory Example
imports AwesomeTac 
begin

lemma "(\<forall>y. P y) \<or> (\<forall>z. Q z) \<longrightarrow> (\<forall>x. P x \<or> Q x)"
apply pony
by blast

end

