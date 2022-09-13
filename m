Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD9366EE
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 19:34:13 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-349b38b500eso1115227b3.20
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 12:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=ZrnfMcG0b0qdMa/HG9lWVFWiMRD2rFKVvj8aOqoB5NA=;
        b=jl+otp4drEgbzDYTQOVQCe/lGQ641MtaMVO7qinvKC5Z/Z0dR7bW2ruruvElf91Mza
         rWIG6jxnLFpbzjxYmb5hdLxpqCph4WGtedV0jYKug9pvcFi9GKMNHWYQ3MhV7Z1j88yk
         C6zM9+8uEYYRmMjCgT2yhu2soVB4o4GEEhV6Odeyn040LBTrLoxj9PC9Bi0MW8tbwkYI
         korKEqKCSvt1O5ysUgMORQ32kUTSRx8d6O3P6JSNr0CgxHOGMjDy+FKt3dd0tgXbyMJQ
         fFYaGkhOwh3jf1mzUPxBWJrYHZfFC32tZr/0bRlCZwAl2Snl3C6f92W1eOGwTq3xkwJJ
         cGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=ZrnfMcG0b0qdMa/HG9lWVFWiMRD2rFKVvj8aOqoB5NA=;
        b=P7z8RgFt57ETkHkL46YIjBEYwEBkjXCVAoyxy0jvf9q+0CKNp0xispbqXRYX+aGS0X
         bYgzeo7HKqqSF1QWgxtWlmyCeZhzoQAv3xg7pU7IBq7JHNDMfKWnNNQOX+JfulntgXPY
         uaHxoUZ5pp4J7Vc+rD5jeUmCyAt+amUOJ6l87f93MG1Gx3vSj9b//5jiZ7CF2H3xrRMN
         Ol67Nv5NUJW5JWSuewTgLuoIQdYYkvFsihn+EH+/pnOhs+1DcnkPB7jw5CP7sK/L+t5c
         ZbCMQdzczkYb9GV0QJCXiclsjcmMOnYdQMVUYwpdQCluAhdYvDyTFgZq4g7CrNkQmEtr
         KRww==
X-Gm-Message-State: ACgBeo3oD/Oo6wsw+zpePACFomY6Dk3nLjTr3v5WGaMV0zvvJSKn415c
	xaEdXTeiZDgXOyBffTkXZ1tTw+y5tA==
X-Google-Smtp-Source: AA6agR4LglXqDawoel4yrWBMkm6qEgbPHBpN7FxtOlMNyNGMQNx6OftnLwFFbJ4OUngWXoBIeukihYgGyg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6902:124d:b0:66d:5ce6:5924 with SMTP id
 t13-20020a056902124d00b0066d5ce65924mr28556708ybu.320.1663097652806; Tue, 13
 Sep 2022 12:34:12 -0700 (PDT)
Date: Tue, 13 Sep 2022 12:33:22 -0700
In-Reply-To: <CA+sZ8B8RStBhofQ0=vvzH5FeQ66fj90DdCj9EQSaVErbVPLi7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CA+sZ8B8RStBhofQ0=vvzH5FeQ66fj90DdCj9EQSaVErbVPLi7g@mail.gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913193322.18776-1-nhuck@google.com>
Subject: [PATCH v2] staging: r8188eu: Fix return type of rtw_xmit_entry
From: Nathan Huckleberry <nhuck@google.com>
To: namcaov@gmail.com
Cc: Larry.Finger@lwfinger.net, error27@gmail.com, gregkh@linuxfoundation.org, 
	insafonov@gmail.com, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev, makvihas@gmail.com, 
	nathan@kernel.org, ndesaulniers@google.com, nhuck@google.com, 
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

Changes v1 -> v2:
 - Rebased onto linux-next/master

---
 drivers/staging/r8188eu/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.37.2.789.g6183377224-goog

