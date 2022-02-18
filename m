Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72E28E5
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645205960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xAam+qFCmo3Rl80e7z26slziDVWmWKJYDMPephJD4B8=;
	b=W+cnxnrZExiM2xXXj0YhNsaF+qpgZJjiD7kvzyGH7LfogY5vjVhteQHP4BzIrWyByVHXdY
	WbiLMMTSoUtD1qdtiFXEH1B8YbWUjSbXlFTakw762dP11nLpchOWbu9MbkBYc/Eamn0eJq
	GM165eOlYemGmiYpBeM1VGzFsEr2cdQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-gU-olMCEN1mTiZsJqv4UFQ-1; Fri, 18 Feb 2022 12:39:19 -0500
X-MC-Unique: gU-olMCEN1mTiZsJqv4UFQ-1
Received: by mail-qv1-f70.google.com with SMTP id 3-20020a0562140d0300b0042d7c7ac26aso9575291qvh.7
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 09:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xAam+qFCmo3Rl80e7z26slziDVWmWKJYDMPephJD4B8=;
        b=5yys6nMM+5nfRFVZQcSfMmE6rPq7mZKgaC+rfHKb0+E8fRxtRr5PI5eEp9Hl3nvmZB
         gCbNwtm88/sKWoEu+m3m11SYJ0VZEzFlXcVdQWkekL0aw8j8tfRpopZAkErAJi+0Pm+g
         8zZmyZb/HQd4aYePnSyfPlt0xobcGKMwt0MW4UpuD4D3tquUXYSMKYPQ33g34say0V9H
         hSwlvsupbHP59P6yvdTRXMS2c8LylEF3WcqTo9cumnzA5H7CsI81bpbPrpHaQMsMDcc2
         yaX7RrZBJHb6B9SOnhWddjLN+jj0HY0TFMvOKFWHHyZiD4+a9ogAZe5pViRuxrqSb2lo
         LGzQ==
X-Gm-Message-State: AOAM532xnLj/TJnk4/GU4r7VBnq9txM86rRIEds/HLFfuKbElM0VLdEZ
	CXDXQsG9JExJrFtd8DqxsWrrJk4/UQFd/bGWM0CV1J9huNSBBnEL4bpRHIDK3NB75PQgGz72rZL
	O3aSEP6NaBVUSSg==
X-Received: by 2002:a05:6214:6ae:b0:42d:8c32:9697 with SMTP id s14-20020a05621406ae00b0042d8c329697mr6639079qvz.128.1645205959278;
        Fri, 18 Feb 2022 09:39:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHRTUjyiPCyav3YHqFIKehE5vskU34OYALKehiwfJAPYRDA2JG2akysROtDLt0A6lF7XH17w==
X-Received: by 2002:a05:6214:6ae:b0:42d:8c32:9697 with SMTP id s14-20020a05621406ae00b0042d8c329697mr6639057qvz.128.1645205959074;
        Fri, 18 Feb 2022 09:39:19 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g22sm3425738qkp.63.2022.02.18.09.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 09:39:18 -0800 (PST)
From: trix@redhat.com
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	david.yatsin@amd.com,
	rajneesh.bhardwaj@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdkfd: rework criu_restore_bos error handling
Date: Fri, 18 Feb 2022 09:39:13 -0800
Message-Id: <20220218173913.3376948-1-trix@redhat.com>
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
kfd_chardev.c:2327:2: warning: 1st function call argument
  is an uninitialized value
  kvfree(bo_privs);
  ^~~~~~~~~~~~~~~~

If the copy_from_users(bo_buckets, ...) fails, there is a jump to
the generic error handler at exit:.  The freeing of bo_privs and
unwinding of the dmabuf_fd loop do not need to be done.

Add some specific labels for the early failures.
Reorder the frees to be the reverse of their allocs.

Move the initialize of 'i' back to the loop.
The problem with the early frees predates the loop
unwinding problem.

Fixes: 73fa13b6a511 ("drm/amdkfd: CRIU Implement KFD restore ioctl")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 965af2a08bc0..1d5f41ac3832 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2102,7 +2102,7 @@ static int criu_restore_bos(struct kfd_process *p,
 	const bool criu_resume = true;
 	bool flush_tlbs = false;
 	int ret = 0, j = 0;
-	uint32_t i = 0;
+	uint32_t i;
 
 	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
 		return -EINVAL;
@@ -2119,13 +2119,13 @@ static int criu_restore_bos(struct kfd_process *p,
 	if (ret) {
 		pr_err("Failed to copy BOs information from user\n");
 		ret = -EFAULT;
-		goto exit;
+		goto free_buckets;
 	}
 
 	bo_privs = kvmalloc_array(args->num_bos, sizeof(*bo_privs), GFP_KERNEL);
 	if (!bo_privs) {
 		ret = -ENOMEM;
-		goto exit;
+		goto free_buckets;
 	}
 
 	ret = copy_from_user(bo_privs, (void __user *)args->priv_data + *priv_offset,
@@ -2133,12 +2133,12 @@ static int criu_restore_bos(struct kfd_process *p,
 	if (ret) {
 		pr_err("Failed to copy BOs information from user\n");
 		ret = -EFAULT;
-		goto exit;
+		goto free_privs;
 	}
 	*priv_offset += args->num_bos * sizeof(*bo_privs);
 
 	/* Create and map new BOs */
-	for (; i < args->num_bos; i++) {
+	for (i = 0; i < args->num_bos; i++) {
 		struct kfd_criu_bo_bucket *bo_bucket;
 		struct kfd_criu_bo_priv_data *bo_priv;
 		struct kfd_dev *dev;
@@ -2323,8 +2323,11 @@ static int criu_restore_bos(struct kfd_process *p,
 		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
 			close_fd(bo_buckets[i].dmabuf_fd);
 	}
-	kvfree(bo_buckets);
+free_privs:
 	kvfree(bo_privs);
+free_buckets:
+	kvfree(bo_buckets);
+
 	return ret;
 }
 
-- 
2.26.3

