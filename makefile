# Run the JAILJUDGE as attack enhancer for AutoDAN attack

JAILBREAK_JUDGE_METHOD = llamaguard1
ATTACK = AutoDAN
TARGET_MODEL = meta-llama/Llama-3.2-1B 
MODEL_NICKNAME = llama1 
SAVE_RESULT_PATH = ./exp_results/$(ATTACK)_$(JAILBREAK_JUDGE_METHOD)/$(MODEL_NICKNAME)
EXP_NAME = $(MODEL_NICKNAME)_$(ATTACK)_$(JAILBREAK_JUDGE_METHOD)

autodan:
	python -u main.py \
		--target_model_path $(TARGET_MODEL) \
		--defense_type None_defense \
		--attack $(ATTACK) \
		--instructions_path ./data/HEx-PHI.csv \
		--save_result_path $(SAVE_RESULT_PATH) \
		--agent_evaluation \
		--resume_exp \
		--agent_recheck \
		--exp_name $(EXP_NAME) \
		--jailbreak_judge_method $(JAILBREAK_JUDGE_METHOD)

# Run the JAILJUDGE as attack enhancer for PAIR attack
pair:
	python -u main.py \
		--target_model_path $(TARGET_MODEL) \
		--defense_type None_defense \
		--attack PAIR \
		--attack_model $(TARGET_MODEL) \
		--instructions_path ./data/HEx-PHI.csv \
		--save_result_path $(SAVE_RESULT_PATH) \
		--agent_evaluation \
		--resume_exp \
		--agent_recheck \
		--exp_name $(EXP_NAME) \
		--jailbreak_judge_method $(JAILBREAK_JUDGE_METHOD)

# Run the JAILJUDGE as attack enhancer for AmpleGCG attack
amplegcg:
	python -u main.py \
		--target_model_path $(TARGET_MODEL) \
		--defense_type None_defense \
		--attack AmpleGCG \
		--instructions_path ./data/HEx-PHI.csv \
		--save_result_path $(SAVE_RESULT_PATH) \
		--agent_evaluation \
		--resume_exp \
		--agent_recheck \
		--exp_name $(EXP_NAME) \
		--attack_source $(MODEL_NICKNAME) \
		--jailbreak_judge_method $(JAILBREAK_JUDGE_METHOD)

# Run the JAILJUDGE as attack enhancer for AdvPrompter attack
advprompter:
	python -u main.py \
		--target_model_path $(TARGET_MODEL) \
		--defense_type None_defense \
		--attack AdvPrompter \
		--instructions_path ./data/HEx-PHI.csv \
		--save_result_path $(SAVE_RESULT_PATH) \
		--agent_evaluation \
		--resume_exp \
		--agent_recheck \
		--exp_name $(EXP_NAME) \
		--adv_prompter_model_path ./models/attack/advprompter_vicuna_7b_merged \
		--jailbreak_judge_method $(JAILBREAK_JUDGE_METHOD)
