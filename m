Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF614A26
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 19:50:57 +0000 (UTC)
Received: by mail-ua1-f73.google.com with SMTP id 95-20020a9f23e8000000b0038caa7cd5c1so2984382uao.8
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=gQRJcVGVry+O+rO0ClNB2v9fZHzTw/QBigbLMMx2lx4=;
        b=qL4m/RexaXk1mzhmuPHOla2wkRlr9DJpg+3jV4dsmZ4U/uKncjqKf36W4zf52rWGz7
         xV3j0xkv+Jl1prJK4yrGOiITEqwx6kaQBAdfsaLTg5/6aoljklvy6PJeNIdNToEaLn53
         We4o9T+piGhVRQAqwAOvF7xgsCwdLNNO8nyjtml9dw5YN7Uz//YhsMDiwjVtQ5KcArV9
         Wxv1Ost1gpBOfJaTjtuJXcwooKsvoKn8Lw51HtNkr7NE8V1hvETVOKQGoU8vW097dU6k
         EFPClS9vg+5sU33mJ6TzGQ7V1JBAG1oY1RNZelI4WN5jzy7zSsUhbQmAR7FB+SSYSwhC
         82NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=gQRJcVGVry+O+rO0ClNB2v9fZHzTw/QBigbLMMx2lx4=;
        b=ByTG6xKtBtEHlrQuQsYasC2rUTKybSNDEBJUxFph7i/KxeDxgkAcbkm2FoIVnETdkN
         0tnUDZILzFJVxPhi/0hNM6RYGGN1mxSGC9Q6/AO4wSUmBOlDJJ2kB3jrkMYOhUahhXjG
         jTFPH1qmuXoL3pTmf8UafdH4ewPV7pWJRdkNLqtKxBzD1fz9HNqX9vZvsNDFp7bwE00q
         0/ndleYwPaoHfewyi3WC24iHtHMU+UM4ixzB74gwKcC5JZapXduMZzdv3gzBDJ8oZbyl
         0hwXJZPgBDH+fbz4iTM8SKMfLXnLiTGFIo3pDbgdqvR5ELpUPZBtofq54qDWN/XfhYuP
         DCRA==
X-Gm-Message-State: ACgBeo2x76N96oNZGqqsX9BakotO7Kq1f9g841OV37k52w8bjEMFlJa1
	2mfDIYuvb2+tKDOOYr74Is4KRx2BUA==
X-Google-Smtp-Source: AA6agR7rJ+0cHLUZrt4DFI/aWWTLh81TsF5sCMpgejD4ykJrhUmdF8T/XLQdjfvjQq4m/De/l6Eg2aQYPg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2a4b:0:b0:39e:8dc0:75e0 with SMTP id
 q72-20020a1f2a4b000000b0039e8dc075e0mr8961536vkq.37.1663012256093; Mon, 12
 Sep 2022 12:50:56 -0700 (PDT)
Date: Mon, 12 Sep 2022 12:50:19 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912195023.810319-1-nhuck@google.com>
Subject: [PATCH] net: ethernet: ti: davinci_emac: Fix return type of emac_dev_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Grygorii Strashko <grygorii.strashko@ti.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxim Kiselev <bigunclemax@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>, 
	linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of emac_dev_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/ti/davinci_emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 2a3e4e842fa5..e203a5984f03 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -949,7 +949,7 @@ static void emac_tx_handler(void *token, int len, int status)
  *
  * Returns success(NETDEV_TX_OK) or error code (typically out of desc's)
  */
-static int emac_dev_xmit(struct sk_buff *skb, struct net_device *ndev)
+static netdev_tx_t emac_dev_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	struct device *emac_dev = &ndev->dev;
 	int ret_code;
-- 
2.37.2.789.g6183377224-goog

