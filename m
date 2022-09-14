Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC4E4685
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 21:16:12 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-33dc888dc62so140884167b3.4
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=1qTbf9AeneJ+E0vsQj505sbaD/8VFWq9P44uV39tt6g=;
        b=NaoShQX0xB6ZSD3s/l2l8lUJHV8OlhoUIRJXBx9XMzxO4ISYASBDDL+6bgaKRwxwGa
         f0dKG1vN81GPaYIKzGTRwdvFnlg5Km7/n4zRahhCho5X3top90R1dU5MZW6Un6ipWHM6
         yPTWv97B07QcOxRYuD26rtbqzGKOGjOpUYchjTCoQOY5zRGGVYsC0ElnKF9W+Y//wTda
         eJcrs9jpvWVgK0EoHh0DjjUFjav87D7emCFvhb/qMorPp5CYB2HG4saqeQGxIAGjoqaj
         wacEa68UMGcSfzwqlpDYx1CAE7j3D3HnwVqG9s0wfTS2LsqvzXjeaPZntWOJ6cKkg6cM
         4MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=1qTbf9AeneJ+E0vsQj505sbaD/8VFWq9P44uV39tt6g=;
        b=yBLS6YA72iCO5ocWPbvyhAOum88KKd6On4jm83DDu1VlKW/O3Rx3cAd+0krl/kdjaG
         N0NT6EyXRnjdKe/jhgTmUPMptEMC7GEVcMpA5vfgSWwQwYg3wymuXWyUIpCNYM+ge3zb
         Ckm0R+ys8/ChltAkM3TgRZEbWfApiZCp80jcaQSae3Zos7k+86h8DrggzGFKvZ4IY377
         H1Nn+4k8e3geR2JpQqeQaSTNhhzN75zqPu2AG6iFrnUtctQRjoD9Ff6x48y+qYoKCSwQ
         fBRbvBlZa+Ira4GZnMml6jj4J/xfHNyCjWjhjx5i7GRi6cf19QpZ/RXbojWgIRUSU12V
         hQag==
X-Gm-Message-State: ACgBeo2c6ujBEdJMHopA8bQfC47grUOmXCQVVvgxOSJEHtAbLM098wya
	qvaKfsuucRPBZUzcKku3vYDFVwjbWg==
X-Google-Smtp-Source: AA6agR5pVF5gnh786/PeSQ3ck24+Vs242wAhkbehmJZ5cq2FVthE4UT/MDUK6JyMV4YbdAVQHFSUIj6UHA==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6902:150d:b0:6ad:2399:eaa7 with SMTP id
 q13-20020a056902150d00b006ad2399eaa7mr32621218ybu.413.1663190171406; Wed, 14
 Sep 2022 14:16:11 -0700 (PDT)
Date: Wed, 14 Sep 2022 14:16:06 -0700
In-Reply-To: <YyEPaMVRmdGQdoql@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <YyEPaMVRmdGQdoql@dev-arch.thelio-3990X>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220914211606.423959-1-nhuck@google.com>
Subject: [PATCH v3] staging: r8188eu: Fix return type of rtw_xmit_entry
From: Nathan Huckleberry <nhuck@google.com>
To: nathan@kernel.org
Cc: Larry.Finger@lwfinger.net, error27@gmail.com, gregkh@linuxfoundation.org, 
	insafonov@gmail.com, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev, makvihas@gmail.com, 
	namcaov@gmail.com, ndesaulniers@google.com, nhuck@google.com, 
	paskripkin@gmail.com, phil@philpotter.co.uk, saurav.girepunje@gmail.com, 
	trix@redhat.com
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
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

Changes v1 -> v2:
- Rebased onto linux-next/master

Changes v2 -> v3:
- Updated header file
- Add reviewed-by tag

 drivers/staging/r8188eu/core/rtw_xmit.c    | 4 ++--
 drivers/staging/r8188eu/include/rtw_xmit.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 98864fc55b25..ea13f11b231b 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -2289,7 +2289,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 	return true;
 }
 
-int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 {
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -2323,5 +2323,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	dev_kfree_skb_any(pkt);
 
 exit:
-	return 0;
+	return NETDEV_TX_OK;
 }
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 8f54c41ba927..82efcd54af3f 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -368,6 +368,6 @@ int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms);
 void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status);
 
 void rtw_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
-int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
 
 #endif	/* _RTL871X_XMIT_H_ */
-- 
2.37.2.789.g6183377224-goog

