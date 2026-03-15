Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0895366069
	for <llvm@lists.linux.dev>; Sun, 15 Mar 2026 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773584306; cv=none; b=JYD78/00dYUm0tm5u/y6gG3XxPERKnlQ+Dj91dp5IdxD4ElafQ8jldg0bnCkprBexntZJ1KyOchu4S/Tmiz8mMV5jhpxPyTr7jH1Jyr8kynMINXXfel92O3IilaK3rkkyq95Peo6TIYG/Beh03GwOuviTJSO00zqHw8JhOowjFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773584306; c=relaxed/simple;
	bh=Y8fUBbvyzMQviIAW9sd4PkX24w/Vd0VYkVpKNberqqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hOcsQXlTfGE0s8nFyR/2z7MrkmEw4lzykbzjOjU9+DDWgudUqh2IaH7QPWTwbPMJQVOeN3wXraZJdj+RySkwSicvKd/SLmC3ZA0IZqY+r08WBCg4l5tzcrdCkEHGmiV4sbDhP7D4JB9zAiezxH+ZjNWShPnPo01k0mhLw2vELmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=doAtnTNI; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="doAtnTNI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82a07738118so2140985b3a.0
        for <llvm@lists.linux.dev>; Sun, 15 Mar 2026 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1773584303; x=1774189103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnEVg49IYI7HJLp/yxY4lgc89fYbkbBOZ6L8Tars9Cg=;
        b=doAtnTNI43XdeP964DnYBbyVPylku8ygeXLrIZ+qy//iIg5OGFP3RYEURM4TBGAAzs
         i5g1ilf9IvAQbMhkpbw4RS2r5KqzvHO97NwUW135SqrHCIPUVLrx4DbUbs4yuKDrd637
         9ep8BpcRPtNlJHGjU6wtgBD5IGZqUI+4OihpA8yHfsc9rUB6k2VbQOffAXfPk3oUS084
         CRx7piToxPsisbRfcMDUa0IlbeNxYSSyragsNIh+c6jIxZnRD2lgLV5SEZBzBF4pqTeX
         PwaQc3IpSZL3PfJFv7SCV2BBSIrFKh6eJi0SgmxPb+QnMQK11ovj6U0Yi93yBqwEOpll
         s+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773584303; x=1774189103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnEVg49IYI7HJLp/yxY4lgc89fYbkbBOZ6L8Tars9Cg=;
        b=bNavi0EaUl8+hg40WVy24qrb8SNoTYX8BQjz+GgoMH9vKQXH2orYvzglQE2uGYqaap
         MxDqTjm7wsIs+1tfW68sTudFnSLjPMufre5hTIB5qXP4iIl2bypudFLA+dHNz9hNGWSl
         M9slZ9hbvNCFvxsuw0pRmOQe1Xp/MMc33UxDuSfEnIXBDhzs5iSO6kQw/58IMXU9SIAN
         L/0g+v5KlsqlSqdJ5cPfkYt4mPzDXN00KzmebP/Ezd/m0n6f5hP6UUGMzmVUf+D1vIsN
         8cKTIJYjW3ULaKGThS/8CIQX2Z3p5Tg7M2iKvRMPHYoghq4prARQKaeTTa7n43UBC8z3
         g7BA==
X-Forwarded-Encrypted: i=1; AJvYcCWrF5eAV8rYM4OTqxsztLNV6WE/KXK6i7nWgQYppfmNjCSgodrm1AXovESiIsJ/JZ3R9XcZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzkIulpzQUc8DBqaVFDzqfwNy/rlgis0+yiMvbzf612E+iOmRBA
	vV3umVg1xOXpgOGmCWKoR7CYly1oAVvwPEeXKJPnNLEr5MaL+WPyqIA+a17R4otmymY=
X-Gm-Gg: ATEYQzwDAjKqO8q9JOYwBPSqZDTVw3sQLkfHlDhwbaBotijd97kA3tewPzq16RtTV4Q
	SaEhKBQuy7cysBnoJG/qMxng0lwIvGrpeW9YqhppXnD9aldnTnjr+8pahFMfmw1OsjLXITV3JNI
	GA9blezrixoRAYUmmhlVKPMIgf3l07DGgkV4Bar4URvRmJnXQsFn6OOYDiM4rbPUpYZFW+BYV98
	aiiSkxJpUzviAdizTwQGYHfM4bk3oMTqY35mVGAlgkjvqu7t8odXdjKTvntD++uochs+p145Wk7
	CCLqA0qE8WW/sxrLgPJQE7iGhtlrTcIb0IxdFxuhnuSnXee8ayScn9HBIwY5s8dMrRzy7OWF0aY
	5flrBMxa4PR+OA6mEb5q5kFH4UlM1wC+WgybznQmAIkDEGZFDI8igfxep3P0sSfWZ8Vc+LTyrqs
	WWJwrLbmtR19KOutGVNRI8D2rj9L12vGlxe7UXSd7Y9XLzFMI=
X-Received: by 2002:a05:6a00:4196:b0:82a:ea3:c172 with SMTP id d2e1a72fcca58-82a198f68f3mr8174011b3a.46.1773584303210;
        Sun, 15 Mar 2026 07:18:23 -0700 (PDT)
Received: from localhost.localdomain ([2402:8780:1329:fe1:ca3e:1abc:522f:35d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725e0cdsm10871428b3a.16.2026.03.15.07.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 07:18:22 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Yichun Zhang <yichun@openresty.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Yuka <yuka@umeyashiki.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jiri Pirko <jiri@resnulli.us>,
	David Hildenbrand <david@kernel.org>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	gwml@gnuweeb.org,
	stable@vger.kernel.org
Subject: [PATCH] virtio_pci: fix vq info pointer lookup via wrong index
Date: Sun, 15 Mar 2026 21:18:08 +0700
Message-Id: <20260315141808.547081-1-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a virtio balloon device:

    echo virtio0 > /sys/bus/virtio/drivers/virtio_balloon/unbind

triggers a NULL pointer dereference. The dmesg says:

    BUG: kernel NULL pointer dereference, address: 0000000000000008
    [...]
    RIP: 0010:__list_del_entry_valid_or_report+0x5/0xf0
    Call Trace:
    <TASK>
    vp_del_vqs+0x121/0x230
    remove_common+0x135/0x150
    virtballoon_remove+0xee/0x100
    virtio_dev_remove+0x3b/0x80
    device_release_driver_internal+0x187/0x2c0
    unbind_store+0xb9/0xe0
    kernfs_fop_write_iter.llvm.11660790530567441834+0xf6/0x180
    vfs_write+0x2a9/0x3b0
    ksys_write+0x5c/0xd0
    do_syscall_64+0x54/0x230
    entry_SYSCALL_64_after_hwframe+0x29/0x31
    [...]
    </TASK>

The virtio_balloon device registers 5 queues (inflate, deflate, stats,
free_page, reporting) but only the first two are unconditional. The
stats, free_page and reporting queues are each conditional on their
respective feature bits. When any of these features are absent, the
corresponding vqs_info entry has name == NULL, creating holes in the
array.

The root cause is an indexing mismatch introduced when vq info storage
was changed to be passed as an argument. vp_find_vqs_msix() and
vp_find_vqs_intx() store the info pointer at vp_dev->vqs[i], where 'i'
is the caller's sparse array index. However, the virtqueue itself gets
vq->index assigned from queue_idx, a dense index that skips NULL
entries. When holes exist, 'i' and queue_idx diverge. Later,
vp_del_vqs() looks up info via vp_dev->vqs[vq->index] using the dense
index into the sparsely-populated array, and hits NULL.

Fix this by storing info at vp_dev->vqs[queue_idx] instead of
vp_dev->vqs[i], so the store index matches the lookup index
(vq->index). Apply the fix to both the MSIX and INTX paths.

Cc: Yichun Zhang <yichun@openresty.com>
Cc: Jiri Pirko <jiri@nvidia.com>
Cc: stable@vger.kernel.org # v6.11+
Tested-by: Yuka <yuka@umeyashiki.org>
Fixes: 89a1c435aec2 ("virtio_pci: pass vq info as an argument to vp_setup_vq()")
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 drivers/virtio/virtio_pci_common.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index da97b6a988de..164f480b18a6 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -414,28 +414,29 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
 	err = vp_request_msix_vectors(vdev, nvectors, per_vq_vectors, desc);
 	if (err)
 		goto error_find;
 
 	vp_dev->per_vq_vectors = per_vq_vectors;
 	allocated_vectors = vp_dev->msix_used_vectors;
 	for (i = 0; i < nvqs; ++i) {
 		vqi = &vqs_info[i];
 		if (!vqi->name) {
 			vqs[i] = NULL;
 			continue;
 		}
-		vqs[i] = vp_find_one_vq_msix(vdev, queue_idx++, vqi->callback,
+		vqs[i] = vp_find_one_vq_msix(vdev, queue_idx, vqi->callback,
 					     vqi->name, vqi->ctx, false,
 					     &allocated_vectors, vector_policy,
-					     &vp_dev->vqs[i]);
+					     &vp_dev->vqs[queue_idx]);
+		queue_idx++;
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
 			goto error_find;
 		}
 	}
 
 	if (!avq_num)
 		return 0;
 	sprintf(avq->name, "avq.%u", avq->vq_index);
 	vq = vp_find_one_vq_msix(vdev, avq->vq_index, vp_modern_avq_done,
 				 avq->name, false, true, &allocated_vectors,
 				 vector_policy, &vp_dev->admin_vq.info);
@@ -476,27 +477,28 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
 	if (err)
 		goto out_del_vqs;
 
 	vp_dev->intx_enabled = 1;
 	vp_dev->per_vq_vectors = false;
 	for (i = 0; i < nvqs; ++i) {
 		struct virtqueue_info *vqi = &vqs_info[i];
 
 		if (!vqi->name) {
 			vqs[i] = NULL;
 			continue;
 		}
-		vqs[i] = vp_setup_vq(vdev, queue_idx++, vqi->callback,
+		vqs[i] = vp_setup_vq(vdev, queue_idx, vqi->callback,
 				     vqi->name, vqi->ctx,
-				     VIRTIO_MSI_NO_VECTOR, &vp_dev->vqs[i]);
+				     VIRTIO_MSI_NO_VECTOR, &vp_dev->vqs[queue_idx]);
+		queue_idx++;
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
 			goto out_del_vqs;
 		}
 	}
 
 	if (!avq_num)
 		return 0;
 	sprintf(avq->name, "avq.%u", avq->vq_index);
 	vq = vp_setup_vq(vdev, queue_idx++, vp_modern_avq_done, avq->name,
 			 false, VIRTIO_MSI_NO_VECTOR,
 			 &vp_dev->admin_vq.info);
-- 
Ammar Faizi

