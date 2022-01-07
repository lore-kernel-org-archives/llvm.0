Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E7A29CA
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 21:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641590041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CoxKyAZnnR3hc0Xq4/bujSICkBAnBdTmtPeVb0xDLIM=;
	b=cOMd6MdCRu5plr7S3JoxJBpcfumIqCRpSeGmnqO7M3n0g556XlPEU0PbyDETWCSspkZMAA
	Owysu/fx4pPUxcbxIwalXZIvP8dUnrJ6WoCHYR65Bd07wgSrhrLFPQzk3T3ya3/4UELiUi
	VYx24BCJLtQz0l5S4d4IcEhfDk80KvM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-CykstN1xN36Mpg5V4gTPqw-1; Fri, 07 Jan 2022 16:13:59 -0500
X-MC-Unique: CykstN1xN36Mpg5V4gTPqw-1
Received: by mail-ot1-f69.google.com with SMTP id a89-20020a9d2662000000b005909e4d9585so458188otb.18
        for <llvm@lists.linux.dev>; Fri, 07 Jan 2022 13:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CoxKyAZnnR3hc0Xq4/bujSICkBAnBdTmtPeVb0xDLIM=;
        b=t6jPZ6JNVwuz6Q9+U85ls+gsplUEyXLPZRqBDDa4fWvAhr0Vt4pkYB0/XcNCR7/5BM
         68BCKJ95tdX1R+fdREdYQCdLnT5aPMkWA8eXao51f/Wup4gZOEsIIdC7H8DbDM/CqMdX
         3dHyHLnKAK+aBCOc0PYlfUEXVr60vcKN0WpSnwRr5oAtR7W3z8tuXTJSEUJHt0fNTX9Z
         dkFawOcAuTF6e37lJu6gZay/vLs44f0DRDNV5GfEayhV+rdW4wlD3VIb9b5ba0eMSLji
         4i11eJT8joSY1kbxYQUAt/FsHczu4eW6+bFu+PCBkvl/zVd5V4jqZBKEmAOWoCNeRGem
         FxOQ==
X-Gm-Message-State: AOAM530RK5+Yj2Tmhl5u04wU6NVCA9uxHE6Iy6iofaV2DwMNgb/yovab
	GP1Kz04Zl34K/RkHAE+IwWoqSHnKpXHxr9QZqDTFxm2xKb7NX+k/SWOU9qA+L+4WbY17db87akL
	FKImYVMLctxBDtg==
X-Received: by 2002:a05:6830:34a3:: with SMTP id c35mr46669377otu.379.1641590038532;
        Fri, 07 Jan 2022 13:13:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygIGgpJ6DCegCd7Ncbdf1YNgwG/+5B2jrt7mHpcIrnWFgKCg/rH7tBIAGfsm+B/wdvFZl52Q==
X-Received: by 2002:a05:6830:34a3:: with SMTP id c35mr46669365otu.379.1641590038351;
        Fri, 07 Jan 2022 13:13:58 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g61sm1111592otg.43.2022.01.07.13.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:13:57 -0800 (PST)
From: trix@redhat.com
To: mst@redhat.com,
	jasowang@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	elic@nvidia.com,
	parav@nvidia.com,
	si-wei.liu@oracle.com,
	xieyongji@bytedance.com
Cc: virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] vdpa/mlx5: fix error handling in mlx5_vdpa_dev_add()
Date: Fri,  7 Jan 2022 13:13:52 -0800
Message-Id: <20220107211352.3940570-1-trix@redhat.com>
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

Clang build fails with
mlx5_vnet.c:2574:6: error: variable 'mvdev' is used uninitialized whenever
  'if' condition is true
        if (!ndev->vqs || !ndev->event_cbs) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mlx5_vnet.c:2660:14: note: uninitialized use occurs here
        put_device(&mvdev->vdev.dev);
                    ^~~~~
This because mvdev is set after trying to allocate ndev->vqs,event_cbs.
So move the allocation to after mvdev is set but before the arrays
are used in init_mvqs()

Fixes: 7620d51af29a ("vdpa/mlx5: Support configuring max data virtqueue")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index b564c70475815..37220f6db7ad7 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -2569,16 +2569,18 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 	if (IS_ERR(ndev))
 		return PTR_ERR(ndev);
 
+	ndev->mvdev.mlx_features = mgtdev->mgtdev.supported_features;
+	ndev->mvdev.max_vqs = max_vqs;
+	mvdev = &ndev->mvdev;
+	mvdev->mdev = mdev;
+
 	ndev->vqs = kcalloc(max_vqs, sizeof(*ndev->vqs), GFP_KERNEL);
 	ndev->event_cbs = kcalloc(max_vqs + 1, sizeof(*ndev->event_cbs), GFP_KERNEL);
 	if (!ndev->vqs || !ndev->event_cbs) {
 		err = -ENOMEM;
 		goto err_alloc;
 	}
-	ndev->mvdev.mlx_features = mgtdev->mgtdev.supported_features;
-	ndev->mvdev.max_vqs = max_vqs;
-	mvdev = &ndev->mvdev;
-	mvdev->mdev = mdev;
+
 	init_mvqs(ndev);
 	mutex_init(&ndev->reslock);
 	config = &ndev->config;
-- 
2.26.3

