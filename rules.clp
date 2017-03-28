(defrule opposite_relative_traits_commutativity
	(not (object (is-a lab1_proof_goal_reached)))
	(object (is-a opposite_relative_traits) (name1 ?an) (name2 ?bn))
	(not (object (is-a opposite_relative_traits) (name1 ?bn) (name2 ?an)))
	=>
	(make-instance of opposite_relative_traits (name1 ?bn) (name2 ?an))
)


(defrule none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3
	(not (object (is-a lab1_proof_goal_reached)))
	(object (is-a all_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3) (personal_trait1 ?source_personal_trait) (relative_trait2 ?relative_trait) (personal_trait3 ?target_personal_trait))
	(object (is-a opposite_relative_traits) (name1 ?relative_trait) (name2 ?opposite_relative_trait))
	(not (object (is-a none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3) (personal_trait1 ?source_personal_trait) (relative_trait2 ?opposite_relative_trait) (personal_trait3 ?target_personal_trait)))
	=>
	(make-instance of none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3 (personal_trait1 ?source_personal_trait) (relative_trait2 ?opposite_relative_trait) (personal_trait3 ?target_personal_trait))
)


(defrule no_persons_share_personal_traits
	(not (object (is-a lab1_proof_goal_reached)))
	(object (is-a at_least_one_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3) (personal_trait1 ?source_personal_trait) (relative_trait2 ?relative_trait) (personal_trait3 ?target_personal_trait1))
	(object (is-a none_with_personal_trait1_has_relative_trait2_with_any_with_personal_trait3) (personal_trait1 ?source_personal_trait) (relative_trait2 ?relative_trait) (personal_trait3 ?target_personal_trait2))
	(not (object (is-a no_persons_share_personal_traits) (personal_trait1 ?target_personal_trait1) (personal_trait2 ?target_personal_trait2)))
	=>
	(make-instance of no_persons_share_personal_traits (personal_trait1 ?target_personal_trait1) (personal_trait2 ?target_personal_trait2))
)


(defrule none_with_personal_trait1_has_personal_trait2_normal
	(not (object (is-a lab1_proof_goal_reached)))
	(object (is-a no_persons_share_personal_traits) (personal_trait1 ?personal_trait1) (personal_trait2 ?personal_trait2))
	(not (object (is-a none_with_personal_trait1_has_personal_trait2) (personal_trait1 ?personal_trait1) (personal_trait2 ?personal_trait2)))
	=>
	(make-instance of none_with_personal_trait1_has_personal_trait2 (personal_trait1 ?personal_trait1) (personal_trait2 ?personal_trait2))
)

(defrule none_with_personal_trait1_has_personal_trait2_reverse
	(not (object (is-a lab1_proof_goal_reached)))
	(object (is-a no_persons_share_personal_traits) (personal_trait1 ?personal_trait1) (personal_trait2 ?personal_trait2))
	(not (object (is-a none_with_personal_trait1_has_personal_trait2) (personal_trait1 ?personal_trait2) (personal_trait2 ?personal_trait1)))
	=>
	(make-instance of none_with_personal_trait1_has_personal_trait2 (personal_trait1 ?personal_trait2) (personal_trait2 ?personal_trait1))
)


(defrule lab1_proof_goal_reached
	(object (is-a none_with_personal_trait1_has_personal_trait2) (personal_trait1 ?personal_trait1) (personal_trait2 ?personal_trait2))
	(not (object (is-a lab1_proof_goal_reached)))
	=>
	(if (and (str-compare ?personal_trait1 "programmer") (str-compare ?personal_trait2 "slacker")) then
		(make-instance of lab1_proof_goal_reached)
		(printout t "No one with " ?personal_trait1 " trait have " ?personal_trait2 " trait." crlf)
		(printout t "Proof goal reached. See instances window for additional information." crlf)
	)
)
