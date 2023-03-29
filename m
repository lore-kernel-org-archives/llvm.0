Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5A5AD30
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 23:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680131654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RDa5o+kZyCZFoDwvixD+yMC8DGY8pjS5wLyVr2om2qE=;
	b=MN7KF1G3kqjyvAM1Zf/cF3ZZCHd1rLB0Iou97JwRbK5SxCoSS8fs+X/MG8cFC67qVQqz3v
	SnlPJvN9ZJVtwzbDqScm9+IVO848EKuwjtvGqs52o4khwrdhCyDWukthU6JXESHX5wvHzi
	LMDA+AdT81rh1Gcm0DHY6ewRBGO3/4M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-5DQSHudTPzaA5b2yvQocBA-1; Wed, 29 Mar 2023 19:14:12 -0400
X-MC-Unique: 5DQSHudTPzaA5b2yvQocBA-1
Received: by mail-qk1-f200.google.com with SMTP id o63-20020a374142000000b007467ef381beso8131145qka.16
        for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680131652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDa5o+kZyCZFoDwvixD+yMC8DGY8pjS5wLyVr2om2qE=;
        b=wUJwd6FBnmLdIyONQ2/8F/HZOciIDBospGt+oKhcN+Zk80RgGpi6YxrijTWN/tocag
         frfCCmfNkMw1yv9ZN+ZbXzI8fokVJNvF0FoJk4MXAl0MGY5Z/xeMNsvoxD2Twhynjqka
         K5kHQ+9SkDWDdolRg9khmPAEVkDCRX3xcZSmBQfQ4OAse0d0Txhjzt4IUd2ACNGZP2r9
         FIwxUEUMKr3ZQZo2YQAt3xw/rNt3oG0kvLzhGLGBa1bIqSANuCP6Cr/f7WXw7hnqj73e
         3A2SkO9gIq5hqki7Ps1bu+M1pi6wcHrV1LFrbtXaV+63hCPsaPpF5h9hUGqBXGK0Qf+X
         iSIQ==
X-Gm-Message-State: AO0yUKUr31EHjituTOOKF0lFPBoIwgNeEtfofde6L1XmSMtppm6ql4Nh
	WZy7abUIgxuKq/HszIu9tUWvhYKs01XIXwD3ZsgpH6qsodkU+4B/a3/iPNJf9EMf6rEYuAEmA0W
	WtqnlvikUgt/u4Q==
X-Received: by 2002:a05:622a:53:b0:3bf:c3e8:c19b with SMTP id y19-20020a05622a005300b003bfc3e8c19bmr39717906qtw.22.1680131652535;
        Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set9FAlt8CkZ7gP0dtRURdKafeSyXrPgA0ctSwHl2YRdMc9jHIn4kx1HtMkkz0/D/w1j49owN7A==
X-Received: by 2002:a05:622a:53:b0:3bf:c3e8:c19b with SMTP id y19-20020a05622a005300b003bfc3e8c19bmr39717885qtw.22.1680131652329;
        Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x16-20020ae9e910000000b007435a646354sm12246105qkf.0.2023.03.29.16.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com,
	kherbst@redhat.com,
	lyude@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/nouveau/svm: remove unused ret variable
Date: Wed, 29 Mar 2023 19:14:07 -0400
Message-Id: <20230329231407.1816570-1-trix@redhat.com>
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
drivers/gpu/drm/nouveau/nouveau_svm.c:929:6: error: variable
  'ret' set but not used [-Werror,-Wunused-but-set-variable]
        int ret;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a74ba8d84ba7..e072d610f2f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -926,15 +926,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
 		 unsigned long addr, u64 *pfns, unsigned long npages)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
-	int ret;
 
 	args->p.addr = addr;
 	args->p.size = npages << PAGE_SHIFT;
 
 	mutex_lock(&svmm->mutex);
 
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
-				struct_size(args, p.phys, npages), NULL);
+	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
+			  struct_size(args, p.phys, npages), NULL);
 
 	mutex_unlock(&svmm->mutex);
 }
-- 
2.27.0

