Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB122C9D
	for <llvm@lists.linux.dev>; Sat, 15 Jan 2022 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642268974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Ub1hbMwAGMv83XYOlhCXiwUBfOTPfG3vBCU3vhpmD4=;
	b=OYmneDM4yYU2wGmsAQ5nn+NVw0/rbpDIEs8U7XLICwAfydQ4Uo2F4jwhMtOVA9KI3Sig9r
	ELAcuhGpdrRLKULoyeWjntxTi1Q0rfaBmyc+Z7//dDBYCrTs0co2XUQaq0cXNHBvP/xaFn
	8YED88LlUEtDLYx0uZr0zH7kaQu8EQU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-UnzNH1SAPoWDxlPr9tcGZA-1; Sat, 15 Jan 2022 12:49:33 -0500
X-MC-Unique: UnzNH1SAPoWDxlPr9tcGZA-1
Received: by mail-ot1-f71.google.com with SMTP id v22-20020a0568301bd600b00590a8d65e0fso2874099ota.4
        for <llvm@lists.linux.dev>; Sat, 15 Jan 2022 09:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Ub1hbMwAGMv83XYOlhCXiwUBfOTPfG3vBCU3vhpmD4=;
        b=3jWjB4LposcM/YZZA0xGlHRP3Zz+hplnKqFm78MA7SQja0v5+TYP8oXE8A4sVeQxlM
         9LipUx3tHwWIbMKvuVpFiG+nu1B1ix02hLs3+m+8z5G7N1dFxYHEiNQzD7FMANhK1WIw
         DoDdsE6WVkczPU+RGevnaXhvxkdE6Q06NlTFfBKymVZu6n3owAbUhdl78RZJL1zHfIcf
         5sOAh8vliAhPnIew+hF7oI0mCtJ79rZqhjLToJgbXEs3mMbC0EEicNxPYb/FV6DsHCpy
         oG219rynTZ3MxKIh9sf3xeykWdoXZWDFcyaIvEDyqFPnKRGL/b9xm9KEGk5goNzTHROZ
         JTFA==
X-Gm-Message-State: AOAM533n18rn6antFfYkM+dOpxT1WbsyNpXpho8z9909+tk+h/Gw3UbO
	902Epf30kwnJSi5g2yfYm9IrH6cVxta9OuobdKLCtFR3yiMgEu1GM1YwkejvTqcepJCby2N5Sey
	WCGaazDhjz4N6Zg==
X-Received: by 2002:a9d:6d90:: with SMTP id x16mr10349761otp.104.1642268973022;
        Sat, 15 Jan 2022 09:49:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR+KmHmEAcU1CSZCeT7bkPUleD6/z8y+Ucc7A0A1vb7OVK0PdYFegZBJKcQW1fj3jjvlhqdQ==
X-Received: by 2002:a9d:6d90:: with SMTP id x16mr10349749otp.104.1642268972841;
        Sat, 15 Jan 2022 09:49:32 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w20sm3239438oti.69.2022.01.15.09.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:49:32 -0800 (PST)
From: trix@redhat.com
To: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	kuba@kernel.org,
	matthias.bgg@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	opensource@vdorst.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] net: ethernet: mtk_eth_soc: fix error checking in mtk_mac_config()
Date: Sat, 15 Jan 2022 09:49:18 -0800
Message-Id: <20220115174918.297002-1-trix@redhat.com>
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
So intitialize err.

Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: change to initializing

drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b67b4323cff08..f02d07ec5ccbf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -267,7 +267,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 					   phylink_config);
 	struct mtk_eth *eth = mac->hw;
 	u32 mcr_cur, mcr_new, sid, i;
-	int val, ge_mode, err;
+	int val, ge_mode, err = 0;
 
 	/* MT76x8 has no hardware settings between for the MAC */
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
-- 
2.26.3

