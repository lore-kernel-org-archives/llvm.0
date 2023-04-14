Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C27C
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681474980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yPCGffG6qbUGI7F6FTErQ0LH3cHGPkEEbnsErQvfFxw=;
	b=b/1x6luHPegLm6mZpHK+2Wu7u9um7zXBw4i5l0Nf8vNQ80OtffQ5G+t6Zp6VU1POQVBy0U
	hqVEro3JB2lpnud/yUB+qJ9zELPxDEk2SrvW0v3W9KtAd24y25/KehfumMKH24AN+uS/KG
	mc7xrjy9YUijjMtWCkbsvUiZl145+z8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-3tHAK6zjPp61bDNcxGCGxg-1; Fri, 14 Apr 2023 08:22:57 -0400
X-MC-Unique: 3tHAK6zjPp61bDNcxGCGxg-1
Received: by mail-qk1-f200.google.com with SMTP id a62-20020ae9e841000000b0074abdff4ccdso4483512qkg.13
        for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 05:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681474977; x=1684066977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPCGffG6qbUGI7F6FTErQ0LH3cHGPkEEbnsErQvfFxw=;
        b=TL/iKP7BOW/4iODUpQMgILVNvz7TLtDDlVCA042njX1an2D/nfiufYC9KCOKV4viCF
         YdAtVWeQhz6Xmwyxg5UA6QfFxopZ8C5r4ebvj6CyQA9ceTfWBBNPjoCIDPNWYWG3KZWn
         6dZDGis0zODz5t0DhEVXbNgptUwx8Ems3NVBpbbcom4dnp+cQ+BEgX44X3lJq7m0JvSE
         CUFl0qpOHCCIhqtYfpokE2kdfbjDwgrex0TwyoZKK2ypFa6ZNYDXN09O53rPOhFwyayB
         Rl5inSkoIeAwpknhM+3m2BEXeuckxoJEV8GiDczi1LVEkxyy1rHpXX5sEH7UqB4ECqF8
         8GNw==
X-Gm-Message-State: AAQBX9f1smzolFbSX1Ss5qNxj8MLZSCnhwC6ue1H83G7s4W4KpH1zHsH
	gAyHHjN9KBUR7gkJDISstuGcj+zbzhjtQJaNzvt+T8EW0aRpk4G8iLcfP6VFRVSqYaQSE62UhFL
	3Zs8vH50zOg7f3w==
X-Received: by 2002:ac8:5945:0:b0:3e4:e2fa:66b0 with SMTP id 5-20020ac85945000000b003e4e2fa66b0mr7771657qtz.29.1681474977147;
        Fri, 14 Apr 2023 05:22:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrFNjLa1K+ogArho3OQ0SXUeh36MSY9HRSMAimwdY9UWoY7qElQIx2CPz+MS7Z6iLrkNomrA==
X-Received: by 2002:ac8:5945:0:b0:3e4:e2fa:66b0 with SMTP id 5-20020ac85945000000b003e4e2fa66b0mr7771633qtz.29.1681474976909;
        Fri, 14 Apr 2023 05:22:56 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r4-20020ac85e84000000b003e302c1f498sm1193420qtx.37.2023.04.14.05.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 05:22:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] phy: mediatek: fix returning garbage
Date: Fri, 14 Apr 2023 08:22:53 -0400
Message-Id: <20230414122253.3171524-1-trix@redhat.com>
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

clang reports
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
  'ret' is uninitialized when used here [-Werror,-Wuninitialized]
        if (ret)
            ^~~
ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.

Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..c63294e451d6 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 
-	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
-			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
-			    txposdiv, digital_div);
+	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
+				  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
+				  txposdiv, digital_div);
 	if (ret)
 		return -EINVAL;
 
-- 
2.27.0

