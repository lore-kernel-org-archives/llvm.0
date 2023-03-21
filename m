Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8D9440
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679401509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DvleXWzKo7owjdbsJ/ezqbFS/5grOQZp7Yc6+zUXHrg=;
	b=UYrOQQhcxaDUqEL+NvXB1vXPQ+kMmzGMA0tjRUR5zWS84L1nrRUd4UfuHKYz0xlu21NxKy
	TQGJLTLyi3x03JXg2W9AdrAP9tXhVHeNLgKc5nFyapjVBRNUko1OqGPO3oriC3gh4tUolI
	JMLhZ6qBXjhO3AF9X7kuJEvMRAT8Evc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-jbNIkBSkNNuHruCWTc7U0w-1; Tue, 21 Mar 2023 08:25:08 -0400
X-MC-Unique: jbNIkBSkNNuHruCWTc7U0w-1
Received: by mail-qv1-f71.google.com with SMTP id g6-20020ad45426000000b005a33510e95aso7506857qvt.16
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 05:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679401508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvleXWzKo7owjdbsJ/ezqbFS/5grOQZp7Yc6+zUXHrg=;
        b=cBf4VCSc9lN7vKlbWiCgmhRY/T+YroW0VfSCG2Onxr8hoI/T/k97WIzNQBzbXOyeTB
         3H45ZFG3AeSBBios6dFzsbPxgy7gkuxqTXor+Ri3LmW3OgE8Awp/8bg5VdhxHcRgvPCf
         XUC/EZO9Cg6fTyLs8TwqGguCMSanioOE6STOtRX2p/UcHcMqAgSHSAXbI+qh7X/QAcHt
         mLJg8xEF3UdbozoCpA25YKVJnzyM8LFuG3dg5dDy698YPo5McV1kcaQfmuDnicD+G3gk
         rvlBipmOb02WS875qf9AsYvJRNGpoGz3pW88gUJI315q3qiBVOkoeC/X7agtYnVJJPTg
         w08g==
X-Gm-Message-State: AO0yUKU0js1Uyhom0xgKTxkYvopXYaiAYp4of0974koiiOYz0vZ6ovVS
	N7o9V0oP//jnc4yiNm5GSuuSGcG26rWipim+EY4RTJ/V2yc9LQEWUJdgevtA261yvkPWrJ6p0kl
	2ENkcp2gUfTkyUEk0yNSyZq2s
X-Received: by 2002:ad4:5bc8:0:b0:5ad:45f2:4307 with SMTP id t8-20020ad45bc8000000b005ad45f24307mr4916130qvt.11.1679401507829;
        Tue, 21 Mar 2023 05:25:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set8EmpoZ3TdzqMTm7C9Sgu5MCLSpoN63jx/YwhAb0d2bZ8QbqQ6cud+66aHksMRuFeiqkzW2AA==
X-Received: by 2002:ad4:5bc8:0:b0:5ad:45f2:4307 with SMTP id t8-20020ad45bc8000000b005ad45f24307mr4916111qvt.11.1679401507571;
        Tue, 21 Mar 2023 05:25:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id d185-20020a37b4c2000000b007425ef4cbc2sm9192747qkf.100.2023.03.21.05.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 05:25:07 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] phy: rockchip-pcie: remove unused phy_rd_cfg function
Date: Tue, 21 Mar 2023 08:25:03 -0400
Message-Id: <20230321122503.1783311-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/phy/rockchip/phy-rockchip-pcie.c:122:19: error:
  unused function 'phy_rd_cfg' [-Werror,-Wunused-function]
static inline u32 phy_rd_cfg(struct rockchip_pcie_phy *rk_phy,
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 75216091d901..8234b83fdd88 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -119,21 +119,6 @@ static inline void phy_wr_cfg(struct rockchip_pcie_phy *rk_phy,
 				   PHY_CFG_WR_SHIFT));
 }
 
-static inline u32 phy_rd_cfg(struct rockchip_pcie_phy *rk_phy,
-			     u32 addr)
-{
-	u32 val;
-
-	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
-		     HIWORD_UPDATE(addr,
-				   PHY_CFG_RD_MASK,
-				   PHY_CFG_ADDR_SHIFT));
-	regmap_read(rk_phy->reg_base,
-		    rk_phy->phy_data->pcie_status,
-		    &val);
-	return val;
-}
-
 static int rockchip_pcie_phy_power_off(struct phy *phy)
 {
 	struct phy_pcie_instance *inst = phy_get_drvdata(phy);
-- 
2.27.0

