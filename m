Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00B5C9C
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:45:43 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id k13-20020a056902024d00b0066fa7f50b97so8312460ybs.6
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=+OAWo6obQA5uOmNqmxhrbmYCLRgr4K4PfskcsDIp7Sk=;
        b=FX70JtZctz087sDCP5WjmRQG8blEx7SV2OF/xqXqlxZ8xRvnNeAnSI5jvtTv6NxsSA
         vtE95GbpjKQHMakctvkQ/SqVsGI5fpepp3Y2QWcI8yCwmS5kd7Zk/Qj40rVhfhxKkRLw
         SZqA4duhEDWn6aNoRzzJ50Cx9TiIjd2sHKRx/8W7a7sVC6hBwehwQQibCwmuDO0XtN2A
         JPo+q8qwlkb74eyW82VZosMZ+lcWeiFnjEkyxEa9bwUzxzKijwyIFdggnkYByg9FI8hF
         9EdHBX/rOMwuJ0LHTPl5hCimKfAjjhT+fglGRi2z1JqHn0yJ8uvGGjdgzBgWdcCh/9k3
         2yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=+OAWo6obQA5uOmNqmxhrbmYCLRgr4K4PfskcsDIp7Sk=;
        b=PV7ihSysaBryzoG15H5Z5qtsAJ+ie/p3de4s9igrMl5MGdHAD0WEcjkOsCvkFISaVu
         cCnaABpgwiOpbtfTv8I98zTxgeRPPc1F9e20Dj0TAKla8FuZiEURKtU1qioAUnOg5V7t
         4uZuHmHznccdUMMHM9tI3tNbqB/YHbcgXgrsYZMZ1CXc8l5vfj5kwnIakEhV/kJDODzm
         Pm+rtIrNXgf0ih5rP2x+blAFVPD8uzUGN6UxneehHVAfuASoDe19zSzwxUp1cqkWs7tG
         wvf8V3NNsWQJ7Ikysc7EzEMGa4emKdl3WCkDhAt9h+VVnlINFcc+hCsOtppL2PRyfHD2
         Fxyw==
X-Gm-Message-State: ACgBeo3Icu9zK1gfsG7ubOiFBBXptnWu9L3MHluqiSBEteX7Y5dTc50I
	l+4CYJwFFd08+79TmRrYM4dAastA0A==
X-Google-Smtp-Source: AA6agR4i1CEBghsid1Cfen84EGO8TUwI5lM4bZGhTEE5HnlAqt4yRYaPg+UVJjqLn9wyY4D6qL1/DESC1w==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:230d:0:b0:6a9:1d4d:6594 with SMTP id
 j13-20020a25230d000000b006a91d4d6594mr24540953ybj.616.1663019142446; Mon, 12
 Sep 2022 14:45:42 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:45:32 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214535.929116-1-nhuck@google.com>
Subject: [PATCH] staging: r8188eu: Fix return type of rtw_xmit_entry
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Pavel Skripkin <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ivan Safonov <insafonov@gmail.com>, Nam Cao <namcaov@gmail.com>, 
	Saurav Girepunje <saurav.girepunje@gmail.com>, Vihas Makwana <makvihas@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of rtw_xmit_entry should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/staging/r8188eu/os_dep/xmit_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 91a1e4e3219a..0b04010d6d82 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -198,7 +198,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 	return true;
 }
 
-int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
 {
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -233,5 +233,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
 
 exit:
 
-	return 0;
+	return NETDEV_TX_OK;
 }
-- 
2.37.2.789.g6183377224-goog

