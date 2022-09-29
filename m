Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BB53A5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 18:27:14 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id j3-20020a256e03000000b006bc0294164dso1815112ybc.20
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=TCNjSWh2khixhi5M5S96BCZPDyWIajI7MNk5y1CP4tQ=;
        b=Yo13DwjTXnaoeS0y6g7A4ryURj7HmjxBjY1CIx8TA8YG0TkQeid3iS0nI73l52wOPY
         OG7zCxcPiuHhWJBN1wbHSYfw7cwCn5I35So62E5eR1kE8BK1SFxRmn3B89ABq5Lb0XCA
         c17V4jSFwNhveOL7+DoIvuf/GoktBvkCGTAZ6+BGzXcKPIcD7H4cYGGgvXGK7mjY9qT3
         Ok5lfnDgUNuXR8dXwGPndNvqxGPJSya/3tbK7N7qzE50pusBYGqq4fr9UJq1WdhrOaC5
         2yroxqPOSJx3ghVVkZkHFKDy/eVWAZdhB57BpYvOzbIwfAkbQaqOZGbYVChXyDnJex8Q
         WObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=TCNjSWh2khixhi5M5S96BCZPDyWIajI7MNk5y1CP4tQ=;
        b=htO+bpYXuGKRHWeWQXW+1QOz4oRDpvJAV8oM6WgqGyxWrxHkMQzsjWWr2hXMTqDRGu
         UurViCsyoZPZfkc/P4jEAxO30Jb4UK3Ok+t7J9bHapOZeizY/V1tP7dwYMVIWI/6grO+
         ESX9BchDzNtMh+R4PdrrCewOaj968tdfQIsC3AZkzZg+76u/J2yMzT1K6PaXmwHclFeI
         vXSgsoE1HXfdK/XPmx9a0QtyJzbzssDuM797naF+1fvcLCw7BEOxJF+lSpAj9uC28TBI
         2khWyDIgqmsvHjCzzks0uTnz1wBUZcertjXI8KSYNT53xbgaYXB5h7y5/D8f0Ndwt2Tk
         EZsw==
X-Gm-Message-State: ACrzQf2AjO11Cl6woL0ffsk8XdOCX9Xu+3EF+xfC89THyWugo20Q1POj
	hpL0qI21/Ridj2uoeW1WOLEPJ9VVeA==
X-Google-Smtp-Source: AMsMyM7izNOHKJTh4Ttf/2FZTV0VPOoAFMNNllUoSw1AaASTnPFHL4tWGLHJ4a22FeLFfd2iILIYokFOUg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a0d:d708:0:b0:354:b610:fd3d with SMTP id
 z8-20020a0dd708000000b00354b610fd3dmr4693272ywd.28.1664476033986; Thu, 29 Sep
 2022 11:27:13 -0700 (PDT)
Date: Thu, 29 Sep 2022 11:27:03 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220929182704.64438-1-nhuck@google.com>
Subject: [PATCH] net: lan966x: Fix return type of lan966x_port_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of lan966x_port_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index b98d37c76edb..be2fd030cccb 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -344,7 +344,8 @@ static void lan966x_ifh_set_timestamp(void *ifh, u64 timestamp)
 		IFH_POS_TIMESTAMP, IFH_LEN * 4, PACK, 0);
 }
 
-static int lan966x_port_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
+				     struct net_device *dev)
 {
 	struct lan966x_port *port = netdev_priv(dev);
 	struct lan966x *lan966x = port->lan966x;
-- 
2.38.0.rc1.362.ged0d419d3c-goog

