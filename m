Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925F7E
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 17:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646675362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WjmvGsZUfh0/LVVvQ+FZnEKXpArrzRi5L5/MW0I2M4c=;
	b=D14ibv7KP+XcSwW8eumU4v2cosvKDRps4YoAe+YE8KFp+DQq3S1wVDO35Pk8ubnQMh4B+S
	VN1+7fNtApbpeSs1f/Cg0WgoDCgolEJz3tWSMfea3H45DzzHipRcu+wNdXbrqagXOBB4Kj
	djTYL0YeXYrcVWzqA/PvzL3tIRJ9wn8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351--XQDnenzMfm4qtXfyRQeKA-1; Mon, 07 Mar 2022 12:49:21 -0500
X-MC-Unique: -XQDnenzMfm4qtXfyRQeKA-1
Received: by mail-oi1-f200.google.com with SMTP id m16-20020a056808025000b002d9ddfbc38fso1839531oie.10
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 09:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WjmvGsZUfh0/LVVvQ+FZnEKXpArrzRi5L5/MW0I2M4c=;
        b=4hWsGW9wtCRZ2rDh5B2uW4n7gVPVtDrQeBy5iZ3jIvw3p1ppy7eJKCN4qUH/pKcrsE
         J8TW8LR0K7HzdS40pO98TNkYiHdAIbuQM3t+7B9O/6ZiCD8qnrRVecdlj9wiRFE42UZC
         QiPlAiodYZyikk7Kl0YPNCQO6CBZKCGkodCccDeYxey5iyer7Qr7385KyWNsPzjNfgCT
         KtTWlb42OqESzR7oVmoQyVETBpbyccdhUf3POskGFYd4L0lmTJp6C8rW1jFO7D/rhrAt
         Csy1TuVMFkeerW5JfspmgJeB7pqIB2433M91lO255R11IVX5awbHBXvFfejHlw0WisZX
         H8EA==
X-Gm-Message-State: AOAM531F7kD5Lu/jwA3msklCxvIrPAnq04jwAxkG8fnf1AR+GGgceDz9
	8xtDJJSwolsrBONUnnIte+o5YUQ12nAxqnhmXJp3F+D1kqOWgKV4EUSPHLWBuHaOvCtdSLAa3AE
	G4swvB5+QtHwbXg==
X-Received: by 2002:a05:6820:188f:b0:31c:f277:b473 with SMTP id bm15-20020a056820188f00b0031cf277b473mr5199312oob.51.1646675360840;
        Mon, 07 Mar 2022 09:49:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW27+RoBUGuOR02iKAwaAC7oA6O5mFi5GTvGrqEDVLIeNffjired4MrR2gOCNb8+5KybmYtw==
X-Received: by 2002:a05:6820:188f:b0:31c:f277:b473 with SMTP id bm15-20020a056820188f00b0031cf277b473mr5199293oob.51.1646675360638;
        Mon, 07 Mar 2022 09:49:20 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w25-20020a4a6d59000000b003208276963esm5423521oof.14.2022.03.07.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 09:49:20 -0800 (PST)
From: trix@redhat.com
To: mst@redhat.com,
	jasowang@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] virtio_ring: Initialize vring_size_in_bytes
Date: Mon,  7 Mar 2022 09:49:16 -0800
Message-Id: <20220307174916.892433-1-trix@redhat.com>
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

On the clang build, there is this error
virtio_ring.c:1772:26: error: variable 'ring_size_in_bytes'
  is uninitialized when used here
  vring_free_queue(vdev, ring_size_in_bytes,
                         ^~~~~~~~~~~~~~~~~~

ring_dma_addr was intialized twice, once with the ring_size_in_bytes.
value.  So fix typo.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/virtio/virtio_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 905c882600618..b2b567ebb9120 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1756,7 +1756,7 @@ static void vring_free_vring_packed(struct vring_packed *vring,
 	ring                  = vring->ring;
 	driver                = vring->driver;
 	device                = vring->device;
-	ring_dma_addr         = vring->ring_size_in_bytes;
+	ring_size_in_bytes    = vring->ring_size_in_bytes;
 	event_size_in_bytes   = vring->event_size_in_bytes;
 	ring_dma_addr         = vring->ring_dma_addr;
 	driver_event_dma_addr = vring->driver_event_dma_addr;
-- 
2.26.3

