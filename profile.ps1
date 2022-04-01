# Configure PSReadLine to predict what you are typing based on history
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[38;5;238m" }
