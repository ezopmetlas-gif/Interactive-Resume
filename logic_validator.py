# AI Training - Logic & Edge Case Evaluation
# Task: Detect hidden bugs in recursive functions

def flawed_logic_example(data):
    """
    Example of a logic bug I caught: 
    The original code failed to handle empty lists in recursion.
    """
    if not data:
        return 0 # Fixed: Added base case for safety
    
    # Process logic...
    return data[0] + flawed_logic_example(data[1:])

# Why this matters:
# In AI training, detecting these 'silent' failures is critical
# for building robust LLM models.
