Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250628FE
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 20:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680295335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dpVbBRCiJ4We7LHm9u8gIxfqs0WEGOfu+33bncRZNio=;
	b=haFJkNwPItkcxwZgeXKoN0CaBppjIeYBoBJQP0JRgurjTGlWmGZAtEws4/8X5DeOc30jd1
	eq/32GGWMuqjOhJGBN05HRQ6J3Etstki4hwh9le7cT/85MD7p+YUbjFQSCgBIqzE3n4Tmr
	JyMW30wKH+wE0kIO0cCs++er/Ls2FeY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-4arEnG6YOcSWBqWTv_HzwA-1; Fri, 31 Mar 2023 16:42:14 -0400
X-MC-Unique: 4arEnG6YOcSWBqWTv_HzwA-1
Received: by mail-qv1-f72.google.com with SMTP id dl18-20020ad44e12000000b005a4d5420bc6so10285368qvb.11
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 13:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680295333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpVbBRCiJ4We7LHm9u8gIxfqs0WEGOfu+33bncRZNio=;
        b=MyoGGmk47V2XJXmhTq4sqXUNRGXVWpKYxAj6a9L+Z9LydLoUCrp3ck7YLzQov7lNAs
         r63uu/TnVG5ODFegX/UoVv2LzKDay70lB3PgQmTRnwu0N6yz53KooCTpTAttcfgtfTaj
         VH7sNX5dT0jQQ9XYiaZShadfXaUA6iY2kHhvZ+/tD4FeG+44bZFdXmXjKGDN64BAFFfV
         y1XTZveVZC0uuVczPdWebuC7LADvlxqFJRQ45EisbcZYsDkc5fqWeHIMHILjQeJViAgu
         M9fN2PQgZeVQ6jSFhshGKpykRoKp42jymioDiK2FBeGLNBBPODV14WqMnGB/QVIkrrwQ
         RQkg==
X-Gm-Message-State: AO0yUKVfx+SK0KelrEdRdYxpAJ1IFsBVlftAYyOXzuBX1kn5P1wNuHYD
	glv/on9JbK/6PKEa7BzxHHwB6imt8tFMsWc7aQloWlJeuBdnJl+qEQimgc/NgukntwFAadCKFH6
	q/cUzuPfmz84TnQ==
X-Received: by 2002:a05:622a:1d5:b0:3b8:6ae9:b107 with SMTP id t21-20020a05622a01d500b003b86ae9b107mr45596238qtw.17.1680295333579;
        Fri, 31 Mar 2023 13:42:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set/mIthcjf+qNMnYSZIwwm7EuAYx4smtbfumckwe21E1gR7bqyHXH49VRfud0h3afzJGf56gqA==
X-Received: by 2002:a05:622a:1d5:b0:3b8:6ae9:b107 with SMTP id t21-20020a05622a01d500b003b86ae9b107mr45596209qtw.17.1680295333331;
        Fri, 31 Mar 2023 13:42:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r194-20020a3744cb000000b007465ee178a3sm910309qka.96.2023.03.31.13.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 13:42:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com,
	kherbst@redhat.com,
	lyude@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	gsamaiya@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/nouveau/acr: remove unused loc variable
Date: Fri, 31 Mar 2023 16:42:09 -0400
Message-Id: <20230331204209.1863060-1-trix@redhat.com>
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
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: error: variable
  'loc' set but not used [-Werror,-Wunused-but-set-variable]
                u32 loc, sig, cnt, *meta;
                    ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index f36a359d4531..bd104a030243 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		const struct firmware *hsbl;
 		const struct nvfw_ls_hsbl_bin_hdr *hdr;
 		const struct nvfw_ls_hsbl_hdr *hshdr;
-		u32 loc, sig, cnt, *meta;
+		u32 sig, cnt, *meta;
 
 		ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
 		if (ret)
@@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
 		hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
 		meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
-		loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
 		sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
 		cnt = *(u32 *)(hsbl->data + hshdr->num_sig);
 
-- 
2.27.0

