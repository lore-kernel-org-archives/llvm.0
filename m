Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8151A5C9C
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:46:10 +0000 (UTC)
Received: by mail-ua1-f73.google.com with SMTP id x36-20020ab048a7000000b003b6287beda5so2874495uac.13
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=MLnObt6zyGNlUZeZEFTlRwd6ME4C5crSaLu9fRVEkDk=;
        b=GijQYHGGKwWbSF23cH9ICaVQFmj05rI1nUVD/vvAx3qrpszfnliUJK7YyB08pOymye
         gZDtQa+BwsrYcuM+aLvqJcs3ZOWEdbsHfyTD353Zl0vIaMkZXxcwo26iJuNzV8uGhtej
         ccke7EreWF7PQiGsN44hoJRscVySyu6513ywj3HbPlZUtKWW39CSJgdjSYNRtUaln4Sd
         FD4jEUB11cGgjIDcfLHO3ch5Bu8BTw8JOepyrnk2D4r4N6Sp5Ysrb1ocp3fopx8LofQ0
         Z5xz1Xhfg25SR9/vkyYbMc2/NwwfYpEg52xlbfkolcTkZXD3hVNY+aVupqtvunA96OsR
         yWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=MLnObt6zyGNlUZeZEFTlRwd6ME4C5crSaLu9fRVEkDk=;
        b=WY/l1k+THyHFG1fag1uLg4plYWghrl4qWbyWJaD6JYDiaakxmRlI5OzxG3gLoMWSOQ
         WLXX7u5YXzYY4BS5w/WAoW6mf6JvOfNpiEy4OVetThkM3hTDgi/+mobNQlJJpzXq3eaB
         uWcdVpdOuGGNxFSTorf8XvtOeIxOYMJsrsmoepzasNButoW0X9MRG9/DLGejCwUXnN3T
         Yu6ZJlVaoFH6Nb8v5jkXYMWbI+4Idua9yO8hTyS6mG74U2JVldWbuoTEdfddpHrNHLl3
         OuDRaxZ5AXCmfFOHKGlHLdu8m4bWiz3FkmrTFryV6NzeAItkUW3aSm7FuRc/34y8aOrP
         /nVQ==
X-Gm-Message-State: ACgBeo0Go2EQrLKDdq06eypsxrTmGTJEc84Kz/8B1NrgL3ANKwRTY6MT
	HGL4jHqFhAyMpv8L144e2YF1UsZm8g==
X-Google-Smtp-Source: AA6agR5jsRUdlZ+bhJTNzFf9ZUErRQqlTOo1r7FaxXI7zoJ+qBN5MY8HjpaN4/oVyi/sNldrnOcuxSPJvw==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a67:ad15:0:b0:398:6aef:316b with SMTP id
 t21-20020a67ad15000000b003986aef316bmr4372894vsl.17.1663019169572; Mon, 12
 Sep 2022 14:46:09 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:46:03 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214607.929211-1-nhuck@google.com>
Subject: [PATCH] staging: rtl8712: Fix return type of r8712_xmit_entry
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Larry Finger <Larry.Finger@lwfinger.net>, 
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Sathish Kumar <skumark1902@gmail.com>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of r8712_xmit_entry should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/staging/rtl8712/xmit_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 4a93839bf947..e84b9fa231cd 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -140,7 +140,7 @@ void r8712_xmit_complete(struct _adapter *padapter, struct xmit_frame *pxframe)
 	pxframe->pkt = NULL;
 }
 
-int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
+netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
 {
 	struct xmit_frame *xmitframe = NULL;
 	struct _adapter *adapter = netdev_priv(netdev);
@@ -165,11 +165,11 @@ int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
 	}
 	xmitpriv->tx_pkts++;
 	xmitpriv->tx_bytes += xmitframe->attrib.last_txcmdsz;
-	return 0;
+	return NETDEV_TX_OK;
 _xmit_entry_drop:
 	if (xmitframe)
 		r8712_free_xmitframe(xmitpriv, xmitframe);
 	xmitpriv->tx_drop++;
 	dev_kfree_skb_any(pkt);
-	return 0;
+	return NETDEV_TX_OK;
 }
-- 
2.37.2.789.g6183377224-goog

