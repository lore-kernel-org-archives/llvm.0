Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512F4A26
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 19:47:51 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3496e668a5dso16011797b3.5
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 12:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=GgY4PD0XdGxMhCUuq3XqhucmQpNzXv+vjyVGjdIJj2M=;
        b=V6C+VfKk/2QPgJkI01g/ulQ507A+EpfDlY95WsN1ZobPp77HMgvmJE1SJ63ZqKEqjm
         O6wHz+82hTeMs+E5hAFLuFtGh0rpPXzVTzY3apHgwavbbEwmrPYjnYhr9XTnPkSoMXBM
         x34E87UW41lC+Hevg6hT3L2/VuyRcpSH0bPrBPNKSmP9T92dWjQsQ5ts6WxPO5WSEgk8
         8lxUULlr2f8AM+kLOdkjCnicwASkSWX/ShO7fJbyiklvH47HGWqUnX3ztRTW0ZyXUPUN
         IV0YbiFzwztjTe2vya12UKYFWxWvfZQjf++rU9noncjlCfrkqp16oEM1XZJ2sxrWNLIh
         u+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=GgY4PD0XdGxMhCUuq3XqhucmQpNzXv+vjyVGjdIJj2M=;
        b=SxT6L5UPeuvWTZxJJh87qhoJc34nBiIEQvMrn6a7Dd9DemHTgpQClCiu50rQORGRJt
         mxWDEE8xKQ7FR9dz7oeDEgVwld+FCaieAlTZOjhycW80eo7M/Q7KoTRsMFFp6u/OEzbR
         3fQqLvB/qiX1kermR0dLlmLGSzlqAi9FRp7IwTC/gMtzIRJu+dW7O02zJL+IHlAP9gSn
         vbvH2TaH1veBmR4aXJFDF6o6vanPbv81Z3nNty5eWjtIvb4bZWImLDcsKtFLt0A8mU+B
         sfZmUtBMnNdI/qoqIsbqg6JideQRrGWCMHegwQ/GHz6WZciU7zhzYQzdoX/7y1GIH7L+
         Gn9A==
X-Gm-Message-State: ACgBeo2dLrDtvf/tuvf9D7+8Dt/pOGn3nlcbRpHhO3iRFhEoL9pyb0vQ
	QOcHki+A8rLuPRtzAA4OAuDTRBenig==
X-Google-Smtp-Source: AA6agR5GPQr1uNUFoyJ5ver00tftXGD7aWRLmNZklbPxaADwNWwe0WJWzmPX/omhMP3EjY1GkbnBhuIDlg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6902:512:b0:6a8:24a1:5daf with SMTP id
 x18-20020a056902051200b006a824a15dafmr22863793ybs.592.1663012070252; Mon, 12
 Sep 2022 12:47:50 -0700 (PDT)
Date: Mon, 12 Sep 2022 12:47:19 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912194722.809525-1-nhuck@google.com>
Subject: [PATCH] net: davicom: Fix return type of dm9000_start_xmit
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

The return type of dm9000_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/davicom/dm9000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index 0985ab216566..186a5e0a7862 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1012,7 +1012,7 @@ static void dm9000_send_packet(struct net_device *dev,
  *  Hardware start transmission.
  *  Send a packet to media from the upper layer.
  */
-static int
+static netdev_tx_t
 dm9000_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	unsigned long flags;
-- 
2.37.2.789.g6183377224-goog

