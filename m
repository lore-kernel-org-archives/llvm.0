Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7809538D
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:44:26 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3454647ff7dso85605907b3.12
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=0Wdj+RXvtzSTWVCBC3E7Qvw8dMmiW0pb/ksTMDuYAvw=;
        b=Ajm7KGtZDxaAtqs155/MmwWxM6UwHlfv1/ltpg+APIwxnT3r1WoPDzMRNnoIeGMDkw
         qba7V8fAUK6z4GU96imY+n5v3zq+Hr5EeWufMvmssnHW6fprfNZ2r+cGy4TBm8sTXwQO
         qndhToQiip1Kl1SPvNUYQ4hZCiZHTXmX3O9JPLYQzdY+ePhKiwI3bDCgI19IivD1bXUg
         9WlsJwSPOhsTAJTaqe+uYOqIihE0wjLV6yYLFI7LB7XC36wBe6i7016KvDjl8vb9pvzL
         R2vnULoJLvkasYdaL+LI+MYrtV3wDegDJeE+xdE6rjWS4uBQyKKJNQgGYJA7A8Ucug5w
         Qp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=0Wdj+RXvtzSTWVCBC3E7Qvw8dMmiW0pb/ksTMDuYAvw=;
        b=pJrWox+uI+X1khfwmGPgD8CjDlBzWSp3XjwaypnEiZ4MyyvpztEFLMhxEfcCdYVOdG
         G0RU2dI+GbidVmMtpAYmD0avYdMicDkPTtPl6tanNIYWLK3kUhCZSPtfacbfvC6C+9w/
         z0QLGnwqExltXFg6SyZnCQKYoBVlAMJF1F/qWVCT10Q4JCUN/vB22stslLsgcueoMtV7
         1Ra/Mmv66XXAaGmq+X6qnDP4jghikd3A2DYKsGhfDf+nYnUCj4bLD1kh/dy1ogSQSK1n
         wXQloqArrVJZTEl8gi68Epr56lf/iWJamE0yPlPXT31MzwEIP2XpJyuPHOb1A92YplCp
         4RwA==
X-Gm-Message-State: ACgBeo39IrcSvIGgoMO4Oz3/udHI81qOVbgxXMW0cSfLWleiPrgeLodz
	N5posZ5FYBuCr0K8XUP5UjBBUp9R3g==
X-Google-Smtp-Source: AA6agR7FTpMgJFFFhEJanQ9OsNJ/kOQCxwc/V8biQsMWsiREPO/EQAx7Q06z8jzX5tkWKR1sDAcACTfQzw==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:c0c1:0:b0:6a9:4913:95a8 with SMTP id
 c184-20020a25c0c1000000b006a9491395a8mr23166139ybf.168.1663019065938; Mon, 12
 Sep 2022 14:44:25 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:43:53 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214357.928947-1-nhuck@google.com>
Subject: [PATCH] net: mana: Fix return type of mana_start_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-hyperv@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mana_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/microsoft/mana/mana_en.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microsoft/mana/mana_en.c b/drivers/net/ethernet/microsoft/mana/mana_en.c
index 9259a74eca40..dfecef8c08e5 100644
--- a/drivers/net/ethernet/microsoft/mana/mana_en.c
+++ b/drivers/net/ethernet/microsoft/mana/mana_en.c
@@ -128,7 +128,7 @@ static int mana_map_skb(struct sk_buff *skb, struct mana_port_context *apc,
 	return -ENOMEM;
 }
 
-int mana_start_xmit(struct sk_buff *skb, struct net_device *ndev)
+netdev_tx_t mana_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	enum mana_tx_pkt_format pkt_fmt = MANA_SHORT_PKT_FMT;
 	struct mana_port_context *apc = netdev_priv(ndev);
-- 
2.37.2.789.g6183377224-goog

