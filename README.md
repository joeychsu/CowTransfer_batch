# CowTransfer_batch
 - 這個腳本可以批次的上傳多個檔案(每個都要低於2G)到奶牛快傳的 server，並記錄 local md5 到 file_url.txt
 - 因為下載的時候容易發生檔案些微損毀的情況，因此在 download_from_CT.sh 有加入 md5 確認的功能，確保檔案被完整下載

# 使用方式
 - 安裝奶牛快傳 curl -sL https://git.io/cowtransfer | sh (細節可參考 https://github.com/Mikubill/cowtransfer-uploader)
 - 執行 ./update2CT.sh 開始上傳
 - 複製 file_url.txt 到目的地的機器
 - 執行 download_from_CT.sh 下載檔案
 - 可多執行幾次 download_from_CT.sh 確保所有檔案完整