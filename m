Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6207173
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641657010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nutHqRyjAUxs0OigylRB1piW55HI8TWHHwTVtcKgRN8=;
	b=YYyW1mYRcF08uaa3NWTCdoPxs5sKnXa0++qHGGN4fQmLJCvUFqJNFdB9u5t/EDGnC2JF/O
	3lMdOki5lmRsoWT4Ysy2Dd2IMf4imtWTneXKxZeqZnedvphjLSgWhZBVfAOtzTXxx7wnU0
	h5DFRGU/ubUwRVsEcoT45rBx1MthiGE=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-IF_XEVH1M_6xblhQYWPemA-1; Sat, 08 Jan 2022 10:50:09 -0500
X-MC-Unique: IF_XEVH1M_6xblhQYWPemA-1
Received: by mail-oo1-f72.google.com with SMTP id v30-20020a4a9761000000b002daad3afaf6so6127222ooi.18
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 07:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nutHqRyjAUxs0OigylRB1piW55HI8TWHHwTVtcKgRN8=;
        b=uP+RESVTsUZ1wvc8SW6ozD/hLJzgJJRdDn9TR3pD4JrVJpNBhQqM9oWVN636tIVMvG
         SiZOlpwiLnJrFZpi1FC4n5ENChnURIYNAhwfCvZJmh+IOhMxb5AvStLGBzz9V0ya3xqK
         VVFq4wFeSoPrg9QGw71LavcOLLWKErGBz5s53hXD2omtkl+cnm9TqwZ50ZzWp2V6Hpm/
         SFSK6tgqFe8ysHnBlphwtPPTW5QI+Ufi5eVb211j0wwRjCcgL+N2Okn4mEPRJI4uVwFk
         FGaye0kYPm9uj68sfRFJg1MC9axpPkLaum9wDuqfKA4GnGK3zdkDauN/6vVc1bwu06QL
         93pg==
X-Gm-Message-State: AOAM532UqXF9l7YCxvaNtvkeFbnwmnrXy1j4BPU4nLzQHraZx9LYH79M
	3IDKkbkKf1W130S7JSYBQpxO+HWSMx0I65tfVc1B0+e8thskSdgDQL7WbBaRH/+/Myhz63Wuwu2
	g35kqNnsT/Edkbg==
X-Received: by 2002:a4a:d5d5:: with SMTP id a21mr43792302oot.43.1641657008670;
        Sat, 08 Jan 2022 07:50:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDAnHZJpVjRqSRJBkvJ07yYIEgasx5S6n/t1vzZoDi6lprUw7Ku1TMowLE/zzd5lBQtwBZWg==
X-Received: by 2002:a4a:d5d5:: with SMTP id a21mr43792283oot.43.1641657008487;
        Sat, 08 Jan 2022 07:50:08 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q13sm384815otf.76.2022.01.08.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 07:50:08 -0800 (PST)
From: trix@redhat.com
To: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	kuba@kernel.org,
	matthias.bgg@gmail.com,
	linux@armlinux.org.uk,
	nathan@kernel.org,
	ndesaulniers@google.com,
	opensource@vdorst.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix error checking in mtk_mac_config()
Date: Sat,  8 Jan 2022 07:50:03 -0800
Message-Id: <20220108155003.3991055-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
mtk_eth_soc.c:394:7: warning: Branch condition evaluates
  to a garbage value
                if (err)
                    ^~~

err is not initialized and only conditionally set.
Check err consistently with the rest of mtk_mac_config(),
after even possible setting.

Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b67b4323cff08..a27e548488584 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -385,14 +385,16 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		       0 : mac->id;
 
 		/* Setup SGMIISYS with the determined property */
-		if (state->interface != PHY_INTERFACE_MODE_SGMII)
+		if (state->interface != PHY_INTERFACE_MODE_SGMII) {
 			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
 							 state);
-		else if (phylink_autoneg_inband(mode))
+			if (err)
+				goto init_err;
+		} else if (phylink_autoneg_inband(mode)) {
 			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
-
-		if (err)
-			goto init_err;
+			if (err)
+				goto init_err;
+		}
 
 		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
 				   SYSCFG0_SGMII_MASK, val);
-- 
2.26.3

