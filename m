Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FA5C82
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:44:53 +0000 (UTC)
Received: by mail-ua1-f74.google.com with SMTP id y25-20020ab05b99000000b003b052ce30c6so3023908uae.5
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=ZdDMxu/ZwxZ1kfijbUS9jX+Fr0880+xk0f4yDMu0NZI=;
        b=TzmR12Pg0ciwHsSRilryLck3zq7AvCYzYIn5LknBVwADhQJbYBuVJhFfiRJzhoJGNl
         qx+w7EWJwj4oOMa5VXVaHsMB6Bpz2AMxgzkvBwjQhY1yqpB7EbixMDE+n6ZtBm2G9SmZ
         Mr4tW2dmGQE9SwT6bML7O7dwMaZp5Pc8e6SFkOMNyCA+JpuW+nktWMLc4CXT2hX8H3fL
         uFSIWAGmRrgsJUUYvPq0MsC2zASQ713KJJzIJcx+vVE/1yzaAEpW6/J1YUY5D8lnhE5h
         PE3/YgqQ9FxdoPMmnP97lybNvrzJXq4Odz6bFs6ajafdslKdNnJ5hpZ/iedjIuj4ykM7
         OBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ZdDMxu/ZwxZ1kfijbUS9jX+Fr0880+xk0f4yDMu0NZI=;
        b=fl9g+0nvCf8KRxfth0P8Q7WCfqSFfrjhb6hYOpcF7Gd1yHvZqyNCKALYsvZlnYt1b5
         KTzOpJWW+Wnu4ol29PqzQdceq1y08tHNBmnBEs6UKQ5gjVEbwokFXLnSMCdQSAw6HVFE
         D69bRifSfW9IDOHbVIXA3WVXtb8ZIElpmh644nSmU5dv5WXTYxNkp+ie6n05iELtBkJQ
         ttmHE2QobeTADsY1CCIjBgyIND3IZjRmVrWAKp90RmdsIVoKbMDBNSWidCzH60WxB16Y
         RLy2MxOOtYDMPiX8J1gjuc8Tff5F1Q95nh0bJYGwej99oh4HJX+sGrq9Ha3eBZan47Iw
         Ik8Q==
X-Gm-Message-State: ACgBeo34Vl+g+52bx2LIY2nTxXOFbLI17CEg/YPieMsYM7Jqr7DOrAcJ
	shnTdUKRuPHMlTA7hx4hfQZQ6l7qIA==
X-Google-Smtp-Source: AA6agR6zF9XNyhGeFJB3NgH+4XzRWF08FblJtq30Iirz1/CziA6jHADZJImizAICLxZzt9PWN/yccy8XUg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:6082:0:b0:3a2:1b57:795f with SMTP id
 u124-20020a1f6082000000b003a21b57795fmr3256154vkb.8.1663019092342; Mon, 12
 Sep 2022 14:44:52 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:44:29 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214432.928989-1-nhuck@google.com>
Subject: [PATCH] net: sparx5: Fix return type of sparx5_port_xmit_impl
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	UNGLinuxDriver@microchip.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Casper Andersson <casper.casan@gmail.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of sparx5_port_xmit_impl should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
index 21844beba72d..83c16ca5b30f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
@@ -222,13 +222,13 @@ static int sparx5_inject(struct sparx5 *sparx5,
 	return NETDEV_TX_OK;
 }
 
-int sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
 {
 	struct net_device_stats *stats = &dev->stats;
 	struct sparx5_port *port = netdev_priv(dev);
 	struct sparx5 *sparx5 = port->sparx5;
 	u32 ifh[IFH_LEN];
-	int ret;
+	netdev_tx_t ret;
 
 	memset(ifh, 0, IFH_LEN * 4);
 	sparx5_set_port_ifh(ifh, port->portno);
-- 
2.37.2.789.g6183377224-goog

