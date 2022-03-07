Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D27E
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 18:17:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id l10so5881560wmb.0
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 10:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sayrSIk+NDM65AKvFJGH6QJQ+sc3l62Epi/p4rWp0co=;
        b=oax+5ZR4uPTHvguofbQbtcUO/6gTvB/BultTtgRVppN+Esz2DDuKovZi47mRi4VUab
         voCR7Gz7m8k+D6WiKFDW3fubOt1z2EDvArL67+T8JgyD66xpEXqa/Toqn6f/pbrOJrcF
         ETUjSWPZgFa4LgVcFGzB51T78/WUfxACryDkxzAEaDnCyAh+gQU9Nww5E78NzHrPbPx7
         BWxccytxW3SW0v5bf85gZrIkwmECGTbOepkjvCgh7A7f9x46chlArdPVMQfq7+55wTtk
         xW18sa01nWH81gCf828GYjkClQEkYyP0WHjSMrXK60GYrwDbNx8GqV65ygerkdG0lx0C
         KGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sayrSIk+NDM65AKvFJGH6QJQ+sc3l62Epi/p4rWp0co=;
        b=4uy5X5QVIW8Q6yXyAlkSVldfYd4qewYD+5x3DKoFk/6LJeIy6yI8ISb1jqehZ0beLR
         TZBzipTDLcwPOhQIueL6O/bZoJQdTIuCLNSH7Nt8KMlCBXLGfV8TVTuPfTWsaeANhaju
         eOchweA5sgsev6IXqvEcJ3sPEg+64Fk31akFjd/vHXOZ0923CuBcmjx++P80g7RT8G6U
         SDv4JZIiGrgFhchLH7JRWTW7JQ2Y9FpmtceA9Dn+gm4V4FfD5Swd6BI+Dt/02+xYrpkJ
         bG+s1g77M2+GXqmWM5ZGmP9lGAEdx4vPVoIVdAHIOxLWTYw3vM5LGpM2qOsQgT7leiGJ
         MbHw==
X-Gm-Message-State: AOAM532G/mKnAJ0/hhGFQ1W/r1sr2nNomOCxUld9n8hwUSyRtTKRlszA
	ML7YJwl5DyqOURDgXZqNbKQ=
X-Google-Smtp-Source: ABdhPJxdUz78okhuvUq7H9aHqcb9xUZ5Eomn4OM9KtxAU3Wo+/Qd9m5moXVVdWEcWCu0X3A31wQ3Ow==
X-Received: by 2002:a7b:c8cf:0:b0:389:a5f5:5b0 with SMTP id f15-20020a7bc8cf000000b00389a5f505b0mr145235wml.37.1646677025308;
        Mon, 07 Mar 2022 10:17:05 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id a10-20020a7bc1ca000000b00389bc87db45sm66515wmj.7.2022.03.07.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 10:17:04 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/rockchip: remove redundant assignment to pointer connector
Date: Mon,  7 Mar 2022 18:17:04 +0000
Message-Id: <20220307181704.149076-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer connector is being assigned a value that is never read,
it is being re-assigned in the following statement. The assignment
is redundant and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/rockchip/rockchip_rgb.c:153:2: warning: Value stored
to 'connector' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 2494b079489d..92a727931a49 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -150,7 +150,6 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	if (ret)
 		goto err_free_encoder;
 
-	connector = &rgb->connector;
 	connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
 	if (IS_ERR(connector)) {
 		DRM_DEV_ERROR(drm_dev->dev,
-- 
2.35.1

