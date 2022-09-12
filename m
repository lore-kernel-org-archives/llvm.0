Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6AF4A26
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 19:53:20 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-34577a9799dso82577977b3.6
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 12:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=8sTMVM1/pnPvLF7fhqDPDLdOpTI5ZpSq4c3KVwZi7B8=;
        b=JrlBaDs0ZkKcl3Uk56oah+oPXYV2ZheDwVBv9jrNVxtlz2FH6mnmY94iYZRLTpQvUj
         7z4vpjmWLtQ9sp9dMaKpR+9vgB/3Bs0vVXtV2zBtxtv0UXBzmxSixyyqsOKBePffgeF+
         gco1M7LQLkIka0idwtLB3M/+4YJJBODTdHUC/nPD1Rk1xwISEXv/1c4VREAg+paaRPd8
         xg7KQ5ck7FlWg4rall0Gfbr9I+UVotJKbbsyfPSw6LW18TaAks1aH7FXbKLEXvuKW1I5
         vz+S69zmoF5F7yWO3/pOiUsk/rC1dSeGL1RL5pFgFvMKtVsG2aAMYzVTyD0e11Avzo5Q
         K9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=8sTMVM1/pnPvLF7fhqDPDLdOpTI5ZpSq4c3KVwZi7B8=;
        b=fJwvgijqpVzmL0SlbU3+h0G8QrPRIP6WNphIB31NwAnXcaNdf4As/GJpLjg02hURbn
         FeHB766RhR/HMu20piSGHEzE7CGA3ESfiDnW4xA0zqk+1ez27QtD6IhisdLt5wmhC3X/
         Xoiq9F8ZkbHO9jFfsWgPxiikqHTR3+BCr7UK7CFUJ8IfCXriqzBW4GHslBdVLzxum0li
         jcU4Z7tjMQ+QrAf+XtZeFnqayEblT587Ue697332KCA38lV/giy7iFi2kkSOVRWfCfKq
         N82Xs8eJWSooptG8EU8wgCuLrQATQi+4FWBSiiJ6gF68oYbdrTwWnAqz8K7MkZwSPCXu
         Ky6A==
X-Gm-Message-State: ACgBeo1KNYgdUzMEzu/G7rnDf55qlj/t6N5NhUjwtBCHBlCllNaIttp6
	+LsF7ih+oE42vdgukivMw3kpSy16xA==
X-Google-Smtp-Source: AA6agR5d/Z544jZbE1LJyu1uNB6Y1C9nJRr/wEWCLOd9x2ozjDBcAgqEPSE4cPer2KDWhrbbquOwyiMjSw==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6902:1507:b0:6af:9e7:f947 with SMTP id
 q7-20020a056902150700b006af09e7f947mr6155067ybu.649.1663012399165; Mon, 12
 Sep 2022 12:53:19 -0700 (PDT)
Date: Mon, 12 Sep 2022 12:53:07 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912195307.812229-1-nhuck@google.com>
Subject: [PATCH] net: ethernet: litex: Fix return type of liteeth_start_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Karol Gugala <kgugala@antmicro.com>, 
	Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of liteeth_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/litex/litex_liteeth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/litex/litex_liteeth.c b/drivers/net/ethernet/litex/litex_liteeth.c
index fdd99f0de424..35f24e0f0934 100644
--- a/drivers/net/ethernet/litex/litex_liteeth.c
+++ b/drivers/net/ethernet/litex/litex_liteeth.c
@@ -152,7 +152,8 @@ static int liteeth_stop(struct net_device *netdev)
 	return 0;
 }
 
-static int liteeth_start_xmit(struct sk_buff *skb, struct net_device *netdev)
+static netdev_tx_t liteeth_start_xmit(struct sk_buff *skb,
+				      struct net_device *netdev)
 {
 	struct liteeth *priv = netdev_priv(netdev);
 	void __iomem *txbuffer;
-- 
2.37.2.789.g6183377224-goog

