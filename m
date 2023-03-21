Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954BFD30A
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679423061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1knlGgYN2VT/JtfLiS27/wQuiH/G9YJjnb0AMKUk5yM=;
	b=dQMUQ9kTd/6Ec1AnA8A/v7G4ifbEn4ZMPdAZiXAmv8xmVngjDznuFIIRPqFxFOcS8b+iwj
	O7MFuEXGhNUpmWnZqQpb/nH7XjEhq2ZW9lV8fDzN8KxjxPfIP0FhL3CREDKcAP55E8wNtV
	b6tOkqTrwgUxqVbYP5Mz+71qIv1pRBo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-J434zAjyPyetlJ9VSkYMkA-1; Tue, 21 Mar 2023 14:24:20 -0400
X-MC-Unique: J434zAjyPyetlJ9VSkYMkA-1
Received: by mail-qv1-f69.google.com with SMTP id f3-20020a0cc303000000b005c9966620daso3485369qvi.4
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 11:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679423060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1knlGgYN2VT/JtfLiS27/wQuiH/G9YJjnb0AMKUk5yM=;
        b=bWi0SGT+ixKt3sJKhmEGzoVd7FEVvt9p5NjRfasOow3aEMYpqsu29XSIIrOYH3nRPR
         4iQQID+Bp8PCdOG9vHCazptPrG7g7VYyGyTp8e6J+9cNr6avDbJNvjYv2t7qauJggWSp
         ppU3fr5vzQZIOrq8zhT8na25LM+lfOvSRmzFkDYWkI8+JvkXB4GNg8o3MgVM398FtrHO
         JISV176plTJWRlZB6+5mzjHsLi7wWZMCn7Jleasyx/F3H9wjGY4yG9MPlqnnZ+ZiIvED
         iqEnZ/Q2P02wtY5R8HaqvcGy9pXfTqXolNhBfwo68x3LtiFzuqiM1ezZps1iLdumZvF6
         G4cQ==
X-Gm-Message-State: AO0yUKUXbKTGPEmuoOG2kCxptsJ0fxx3eD8uPdYKgmAhIqlAiqjZSo7R
	Lu+CLsdrPeSgwXfklc2aNQVYZX9iIiXja8+A4CuGyH6CU60vlTYg0vFFk+xlxnSlSzp91n5xsnj
	YArPYf28J/uuOzQ==
X-Received: by 2002:ac8:5a13:0:b0:3e3:8392:a20e with SMTP id n19-20020ac85a13000000b003e38392a20emr1818994qta.11.1679423059995;
        Tue, 21 Mar 2023 11:24:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set+dI/AIvwoRVUqT1YTTXfDAONNxagr+5GYbKtG20x4g1N6bckO9liMnHnzF2jPTXjsqnR44fA==
X-Received: by 2002:ac8:5a13:0:b0:3e3:8392:a20e with SMTP id n19-20020ac85a13000000b003e38392a20emr1818956qta.11.1679423059754;
        Tue, 21 Mar 2023 11:24:19 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id d18-20020ac86692000000b003e386bb1566sm822618qtp.31.2023.03.21.11.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:24:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: zackr@vmware.com,
	linux-graphics-maintainer@vmware.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/vmwgfx: remove unused vmw_overlay function
Date: Tue, 21 Mar 2023 14:24:14 -0400
Message-Id: <20230321182414.1826372-1-trix@redhat.com>
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
drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:56:35: error:
  unused function 'vmw_overlay' [-Werror,-Wunused-function]
static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
                                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index 8d171d71cb8a..7e112319a23c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -53,12 +53,6 @@ struct vmw_overlay {
 	struct vmw_stream stream[VMW_MAX_NUM_STREAMS];
 };
 
-static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
-{
-	struct vmw_private *dev_priv = vmw_priv(dev);
-	return dev_priv ? dev_priv->overlay_priv : NULL;
-}
-
 struct vmw_escape_header {
 	uint32_t cmd;
 	SVGAFifoCmdEscape body;
-- 
2.27.0

