Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C85538D
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:43:51 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id k13-20020a056902024d00b0066fa7f50b97so8309303ybs.6
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=2d3fydqfX2g65N3phYlMxqgvPYWylfGPLLgNinkZtt0=;
        b=ZyLbqVNgTed8/0xWnsk+tR2bOwO5rwirlfTupR72ID3PCTMhFXg/e8BAFLSWElwOIb
         kSEZWlZpBUDgCmHZ6FNZRaMsPx0f9XWxOS9KfY3ch50Le7A9zCo8OpgZd3aHfrxEZZdZ
         HNABn/7p+5t0vUxv4hrnNsVv7BjgfBaSxu8BYz7IY9/Ls7QRdUWJpJJsCx/GG0TjY4YL
         9osbkn93FTbkUyvA3D5z2WBxpQ6T35P0YiCNDIKnzirRfLvomOplATDlwkKMdVOHjLwb
         qoNnHtZ9PXj8el2ezt0rGJreHXQMtSRkv10hKARhx9ZHKUd5suGg2tJ06B+b/InWPt+g
         5yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=2d3fydqfX2g65N3phYlMxqgvPYWylfGPLLgNinkZtt0=;
        b=FA51rRiUMUQKvUNCYe/UUrt5ZDOep4iwMqv4FZAQBkuOfdauQMdh1bfK8DBrPWDU24
         fi2bXMojKyIbLbU1qhQxuEGIK4EPXP5bwW3vXsxx+5CiHiu5S3lJTFA+FpVhNtSWgWHV
         aWmyje1WiwItnbjxGXyPUaZ3OxphYQzdyrvSgE4sXQvL/FueAJptTf/UakgvWOhRRGsU
         w+F18VdBMddInYySO2ErxS/Qcf1cRnccOE1mAxpxzBDrDtMRCRC0M3LPLguXGdtgAKWg
         HaZVXF+xn4/dqGdeBSdu0rcTLQzBWLrGM7HskT/yHjpXbyHf+fP/SuTyHL7vpJMUfBJa
         nXPw==
X-Gm-Message-State: ACgBeo2Pc7+Tbq73S0DeREawchECDFCRLHynmA9cbJ2nEjO6iuN3V0ZL
	rTeexWEfu3/GC3qPult8NiWXJXNdMw==
X-Google-Smtp-Source: AA6agR6dOUbw4syADaJEIcxCeDzWlSzErY/9EAd+wVdfmpfcPpI7s8I6rNEgQ+gEJZAdtRqd6evKVLkZDw==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a0d:e946:0:b0:345:696:caaa with SMTP id
 s67-20020a0de946000000b003450696caaamr23604716ywe.507.1663019030957; Mon, 12
 Sep 2022 14:43:50 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:43:40 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214344.928925-1-nhuck@google.com>
Subject: [PATCH] net: korina: Fix return type of korina_send_packet
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of korina_send_packet should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/korina.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index df9a8eefa007..eec6a9ec528b 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -416,7 +416,8 @@ static void korina_abort_rx(struct net_device *dev)
 }
 
 /* transmit packet */
-static int korina_send_packet(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t korina_send_packet(struct sk_buff *skb,
+				      struct net_device *dev)
 {
 	struct korina_private *lp = netdev_priv(dev);
 	u32 chain_prev, chain_next;
-- 
2.37.2.789.g6183377224-goog

