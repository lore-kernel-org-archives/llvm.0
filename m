Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCD2CA2
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643468042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ug7sd4MyyeKE9edVrNKTjnr3ZIjzipUabJp6vX5YHNg=;
	b=IGysB2KkATyff85mIK5A+JMpNrrQyv94v3GY/ODyGwPvLYAwYNaul3S2sJ4P1uk9UJPC9m
	uSwRSxnNUWttF8oUvEK1hoQyu95DTmACk8SZ2IR3ukOmX/SOI5P7j9Omcfk2XcQFu3h8To
	le89jZRdtXUFfn9LkKf8WME0GTXOEZo=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321--Z1b3etgP_qdkcrIcyNTxg-1; Sat, 29 Jan 2022 09:54:01 -0500
X-MC-Unique: -Z1b3etgP_qdkcrIcyNTxg-1
Received: by mail-io1-f69.google.com with SMTP id b15-20020a056602330f00b006109348c3daso6541359ioz.3
        for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 06:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ug7sd4MyyeKE9edVrNKTjnr3ZIjzipUabJp6vX5YHNg=;
        b=wHVEKTCV9n9YgLTWPlS+KGWdBB4T+LOK46GAqxxVRa5kg5IGZf4x9EgfiA9V0wkGfN
         9C/uYnCpzo/nF4SMUOqPr7ZMfG0r7MhTntGgAXoVeoubCaQQ8CEbury6doMYLyF8sSUI
         VjyY4DNmIAHsQF3dbPjL+9lQ/GdGdMHOIZpBGz0CXP1IUjH1Ec12sOQ7TKgapcNrTZ7O
         H3Y4TPdSOcoNw/N2DZJpQgiX2+//XSfzRtJg+xOqH7rLu0n6psa1XXuInOVp2yaqc80t
         qbFInq6hRdVwOz3QHq4lJyXlq6TbEirZbjtBFXVn45iTc0Sz76ZVh7W3SjwLS1yPn3vG
         gaLg==
X-Gm-Message-State: AOAM533FHl9NuPouDbqJjgppD+RBmBDQoEqkOwEapc5ReuEESrSO7uOg
	EVaNp1Zo6Lh46w+Srml2y2Q1ydCouN9PLB7mmmtESdKxBWJILM2q2J6yFeOCYr16+QtF9Qou0ci
	fV00HLOJz6OdJqg==
X-Received: by 2002:a05:6638:33a1:: with SMTP id h33mr6293250jav.78.1643468040565;
        Sat, 29 Jan 2022 06:54:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwgXCva834kyAbS4ly/S/GHDc8v1pjp6kH32zHTbUhflIF5l0lCvtPA+s2R8yYYEuRITEFGA==
X-Received: by 2002:a05:6638:33a1:: with SMTP id h33mr6293223jav.78.1643468040391;
        Sat, 29 Jan 2022 06:54:00 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id p7sm14191616ilo.71.2022.01.29.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 06:53:59 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	PengJu.Zhou@amd.com,
	candice.li@amd.com,
	Hawking.Zhang@amd.com,
	john.clements@amd.com,
	Jingwen.Chen2@amd.com,
	bokun.zhang@amd.com,
	victor.skvortsov@amd.com,
	bernard@vivo.com,
	lijo.lazar@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdgpu: initialize reg_access_ctrl
Date: Sat, 29 Jan 2022 06:53:47 -0800
Message-Id: <20220129145347.1417849-1-trix@redhat.com>
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

clang build fails with
amdgpu_virt.c:878:51: error: variable 'reg_access_ctrl' is
  uninitialized when used here
  ... + 4 * reg_access_ctrl->scratch_reg0;
            ^~~~~~~~~~~~~~~

The reg_access_ctrl ptr is never initialized, so
initialize once we know it is supported.

Fixes: 5d447e296701 ("drm/amdgpu: add helper for rlcg indirect reg access")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 80c25176c9932..c137652189190 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -875,6 +875,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
 		return 0;
 	}
 
+	reg_access_ctrl = &adev->gfx.rlc.reg_access_ctrl;
 	scratch_reg0 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg0;
 	scratch_reg1 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg1;
 	scratch_reg2 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg2;
-- 
2.26.3

