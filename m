Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6419E79C6
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680190574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mb7nuWgkDOaubTvnFO5OdcmmhR8tNP6kd6NFt0+SpiE=;
	b=PSQKlwwmVxKOYigoUEfu7Lf+35Thin6E8rvFflb9oic7XubXvbBTGGe4nsI5yeFKgFEq7k
	NownLjJKwYJZxVK2yixx/+DL2/f7Ray5d+WGW0rLqVrgaNgVZz9ByWjr0MgaN0CCrlm9hx
	2RrwrH1Xxbes1U9yXsVlHKFIj+kCIr4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-SG3zeQktOaOBsTJgSY03OQ-1; Thu, 30 Mar 2023 11:36:13 -0400
X-MC-Unique: SG3zeQktOaOBsTJgSY03OQ-1
Received: by mail-qv1-f69.google.com with SMTP id y19-20020ad445b3000000b005a5123cb627so8372138qvu.20
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 08:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680190572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb7nuWgkDOaubTvnFO5OdcmmhR8tNP6kd6NFt0+SpiE=;
        b=6NQFfNHC+mfbGbU/v5uRWulhOITYkCEE/FpgiqXdKEqMGZy3GEZ6LipB60LK2M7N4r
         ypwdRLsnyNfnsOR/OERQwqdItxrvH5suCO8MQN+7/MhKX3VZlR+gToD30ge3OOTYUcIX
         o7Z15qaF4Mg7TGgpIncy5PB0GSCpWCfcUtgO0L7tVkKAFEmmrdniwZm4pjdqQq4nDKAf
         JjlsfoLHtRF6i1aieK9oPAKhYj7AR+t5emjsN8u6ukLsk4MCL3Ork6ZM5QH9WJKGhrgn
         t/EO/pU9BAY7y7TT7ui16cROM3xsa0Ypr4qQK0cdRp7Gyo9XC7/txjIJyU7BAzSPIWoE
         rm4Q==
X-Gm-Message-State: AAQBX9fq//cLl1wS4ns9vM3/ENYYznD+4AsPfsLT+D+ZlZmi4z+4LFBm
	ga31T4iu0FMrbka5aiQauBmSmAJ9QVYs/fms8lry65fe+/haGxFC0rGkIA/li4RSMaHv0pca0Nd
	3kqbxSriHVtM5HQ==
X-Received: by 2002:a05:6214:3002:b0:5df:5533:6fb3 with SMTP id ke2-20020a056214300200b005df55336fb3mr8308392qvb.5.1680190572557;
        Thu, 30 Mar 2023 08:36:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZxnliOeH26xtjwgD2x1M5kHN0/tinm4772AhLlyfC8256JgzS/09VWGCpsmcHxshLjBJzC+A==
X-Received: by 2002:a05:6214:3002:b0:5df:5533:6fb3 with SMTP id ke2-20020a056214300200b005df55336fb3mr8308365qvb.5.1680190572308;
        Thu, 30 Mar 2023 08:36:12 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id mg18-20020a056214561200b005dd8b93457dsm5456912qvb.21.2023.03.30.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:36:11 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: leon@kernel.org,
	jgg@ziepe.ca,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] RDMA/mlx5: remove unused num_alloc_xa_entries variable
Date: Thu, 30 Mar 2023 11:36:07 -0400
Message-Id: <20230330153607.1838750-1-trix@redhat.com>
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
drivers/infiniband/hw/mlx5/devx.c:1996:6: error: variable
  'num_alloc_xa_entries' set but not used [-Werror,-Wunused-but-set-variable]
        int num_alloc_xa_entries = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/infiniband/hw/mlx5/devx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
index 2211a0be16f3..07037b829c7e 100644
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@ -1993,7 +1993,6 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_DEVX_SUBSCRIBE_EVENT)(
 	int redirect_fd;
 	bool use_eventfd = false;
 	int num_events;
-	int num_alloc_xa_entries = 0;
 	u16 obj_type = 0;
 	u64 cookie = 0;
 	u32 obj_id = 0;
@@ -2075,7 +2074,6 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_DEVX_SUBSCRIBE_EVENT)(
 		if (err)
 			goto err;
 
-		num_alloc_xa_entries++;
 		event_sub = kzalloc(sizeof(*event_sub), GFP_KERNEL);
 		if (!event_sub) {
 			err = -ENOMEM;
-- 
2.27.0

