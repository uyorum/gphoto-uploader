# gphoto-uploader
Google photos uploader working in Linux

## これは何？
[Google フォト](https://photos.google.com/) アップローダをLinux上で動かします．

## 概要
本来，Linux用のバイナリは配布されていないのでWindows用のバイナリを[Wine](https://www.winehq.org/)を使って動かします．  
ですので割と不安定かもしれません．

Wine上の認証はなぜかうまくいかないので，あらかじめWindows上で認証を済ませたレジストリを用意する必要があります．

1. 適当なWindowsにGoogleフォトアップローダをインストール
1. アップロードしたいアカウントでログインする
1. 「HKCU\Software\Google\Picasa\Picasa2\Preferences」をエクスポート，gphoto.regというファイル名で保存

Googleフォトアップローダをサイレントインストールできなかったのでコンテナを起動してからGUIでアップローダをインストールします．  
VNCクライアントを用意しておいてください．

```bash
$ git clone https://github.com/uyorum/gphoto-uploader
$ cd google-photos-uploader
(このディレクトリに「gphoto.reg」を保存)
$ docker build -t google-photos-uploader .
$ docker run -d \
    --name google-photos-uploader \
    -p 5900:5900
    -v /PATH/TO/UPLOAD:/upload \
    google-photos-uploader
```

VNCクライアントでDockerホストのIPアドレスへ接続するとインストーラが起動しているのでウィザードを進めてください．  
インストールが完了すると既にログインが済んでいるのでアップロードするディレクトリなどを選択してバックアップを開始してください．
