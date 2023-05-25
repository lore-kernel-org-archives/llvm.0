Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF824142
	for <llvm@lists.linux.dev>; Thu, 25 May 2023 20:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685045284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pscghevf+cSG52ERcGqww4er3grbyjpAV659C+ZtVu8=;
	b=hy9jSxsVIgoQ/Gr8eBSTGYRVtZzFkCqXtRDjzMWcja5j2WhopiZeqPvhkLylaimUSrTLGN
	EKBszwDVhJGeXM4nmIX1JenqhuiJfbDNQZ0tgFI6yjxelUuXLmiKpoIJVFuft04NiuVKbG
	ZHQNWtWyT7maXArh/QwDPs6sbAFsIC0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-mKJSMdCAOlqwx5X2_BhR6w-1; Thu, 25 May 2023 16:08:03 -0400
X-MC-Unique: mKJSMdCAOlqwx5X2_BhR6w-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-623a43db679so1261626d6.1
        for <llvm@lists.linux.dev>; Thu, 25 May 2023 13:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685045282; x=1687637282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pscghevf+cSG52ERcGqww4er3grbyjpAV659C+ZtVu8=;
        b=X0rwf/w8Klk/0wWstDQ3kS569h8OEd2cCyM2sVy4o/ATz0fpLjW4xmXqn/TPCY2dK8
         YyZfZjyMyDcoqpJyrwz+LfP7Yn7mVF20VE0Q7tN8xHxVzw9cmIkOdnjeZejLVziDhB+y
         ZLHmwmwdS70d4FkIK+RWo2H19R5yB29AJpxIc99LtfMBnHAKkNV6106nLcRm0721bpjo
         wupv5dZqoI8nRcrYKfp7KbBXyE4MJcKXWmFE+swvvtSlCNZmbcJe2sjYDg/KrGVHFv9D
         xmd21L+d8FI+4QpQkEWLC6RSx9jZ5/Q+mtxeKML1VCabzulgmW+tAPKs/dYsIIAflvUZ
         VjRA==
X-Gm-Message-State: AC+VfDwoohUe7dJBbQ/+EDl3HH2iDdiTb1QOSR44T0trXr6YfgTZ/hxk
	KOEANLQyPSgOPAMNh3Tlb5kkQA2zGnnEJ6vpWDIGCZZje8KjcYMTJtlNbCBwNUoavinN/icS+TT
	9qbzH6Lhgw91c4Q==
X-Received: by 2002:ad4:5cce:0:b0:625:aa48:def6 with SMTP id iu14-20020ad45cce000000b00625aa48def6mr2958792qvb.54.1685045282646;
        Thu, 25 May 2023 13:08:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7LtC1076E/oGoBe45eqDKHdSLnAL80iwqLeHY19bYNAJnnZix57WmgzgioKtImTkWVm13Drg==
X-Received: by 2002:ad4:5cce:0:b0:625:aa48:def6 with SMTP id iu14-20020ad45cce000000b00625aa48def6mr2958758qvb.54.1685045282407;
        Thu, 25 May 2023 13:08:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id lw1-20020a05621457c100b005ef81cc63ccsm649736qvb.117.2023.05.25.13.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 13:08:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdkfd: remove unused function get_reserved_sdma_queues_bitmap
Date: Thu, 25 May 2023 16:07:59 -0400
Message-Id: <20230525200759.3214525-1-trix@redhat.com>
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
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:122:24: error:
  unused function 'get_reserved_sdma_queues_bitmap' [-Werror,-Wunused-function]
static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
                       ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 493b4b66f180..2fbd0a96424f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -119,11 +119,6 @@ unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm)
 		dqm->dev->kfd->device_info.num_sdma_queues_per_engine;
 }
 
-static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
-{
-	return dqm->dev->kfd->device_info.reserved_sdma_queues_bitmap;
-}
-
 static void init_sdma_bitmaps(struct device_queue_manager *dqm)
 {
 	bitmap_zero(dqm->sdma_bitmap, KFD_MAX_SDMA_QUEUES);
-- 
2.27.0

