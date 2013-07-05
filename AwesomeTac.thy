theory AwesomeTac
imports Main
begin


definition "Pony \<equiv> True"
lemma PonyI: "Pony" by(subst Pony_def, rule TrueI)

ML {*
  signature AWESOMETAC =
  sig
    val awesometac_tac: bool -> Proof.context -> int -> tactic
    val setup: theory -> theory
  end;

  functor AwesomeTac(): AWESOMETAC =
  struct
    fun awesometac_tac timing _ n = 
      let val start = Timing.start ();
          val tac = Method.insert_tac [@{thm PonyI}] n
          val _ = if timing then
                    Output.urgent_message (Timing.message (Timing.result start))
                  else
                    ();
       val p = Isabelle_System.create_tmp_path "awesome_tac_temp" "awesome_tac_temp_file.png";
       val pp = (File.platform_path p);
       val ppp = "echo \"I have no idea what I'm doing. \" &&  wget -O  " ^ pp ^ " http://i.imgur.com/2Sc8Sip.png && xdg-open " ^ pp;
       
       in Isabelle_System.bash ppp; tac
      end
    val setup =
      Method.setup @{binding pony} 
          (Scan.option (Scan.lift (Args.parens (Args.$$$ "timing"))) >>
              (fn x => SIMPLE_METHOD' o (awesometac_tac (x <> NONE))))
          "Awesome prover";
  end; 

  structure AwesomeTac = AwesomeTac ()
*}

setup AwesomeTac.setup

end
