extends Object

func initialize(chain: ModLoaderHookChain, body_, starting_conditions = null):
	chain.execute_next([body_, starting_conditions])
	var base_obj = chain.reference_object
	base_obj.states[SaberBotAI.States.STAB][SaberBotAI.PROCESS] = func():
			var r = 0.3 + 0.1*base_obj.AI_level
			base_obj.set_saber_target_point(base_obj.body.saber.target_point.lerp(base_obj.foe_pos - ( ((base_obj.foe_pos - base_obj.body.saber.global_position) * 2) * ((2 * int(SaveManager.tachi_aim_invert)) - 1)), r))
			#set_saber_target_point(body.saber.target_point.lerp(foe_pos - (foe_pos - body.saber.global_position)*2, r))
			if base_obj.dist_to_foe > 80:
				base_obj.body.target_velocity = base_obj.to_foe.rotated(PI*0.2*base_obj.circle_direction)
			else:
				base_obj.state_timer = min(base_obj.state_timer, (0.5 - 0.2*base_obj.AI_level) if base_obj.AI_level < 3 else 1.0)
				base_obj.body.target_velocity = -base_obj.to_foe.orthogonal()*base_obj.circle_direction
				
			if base_obj.state_health <= 0:
				base_obj.exit_behaviour(SaberBotAI.ABORTED)
				
			if base_obj.state_timer < 0.0:
				if base_obj.dist_to_foe < 150:
					base_obj.body.saber.start_stab()
					base_obj.exit_behaviour(SaberBotAI.COMPLETED)
				else:
					base_obj.exit_behaviour(SaberBotAI.ABORTED)
