Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC21C38
	for <llvm@lists.linux.dev>; Sat,  8 Apr 2023 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680972630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qy6SYd3f0i8ho8eow+vyxJgxXrM08wU7g/SGD1LI0yQ=;
	b=i1Gx6z0jy16VyqEUyKRFEYmd9wPWBp0MM3rjsYHxAUbDE8suZf9FnMrA/Gtli4K6hK0w1a
	BikDCdXGiFGWXclHQK71JzLbOS5OAQ615Rlz6MlZFezFB5GkwPfwaEKpGPzBCeTaLOJJeS
	l4jOPIKBcZUR4ybc8/257vuVzVW/Uco=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-NYfMGG7DPbmAR3v7OHMerw-1; Sat, 08 Apr 2023 12:50:26 -0400
X-MC-Unique: NYfMGG7DPbmAR3v7OHMerw-1
Received: by mail-qv1-f71.google.com with SMTP id h6-20020a0cd806000000b005a33510e95aso728415qvj.16
        for <llvm@lists.linux.dev>; Sat, 08 Apr 2023 09:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680972626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qy6SYd3f0i8ho8eow+vyxJgxXrM08wU7g/SGD1LI0yQ=;
        b=mNNlckuwmLfow0UU5iuMa7+DareQtJVK6BRMDQ29WCWAJTm8EM4UmblxdHKIwx5ViU
         95c3864T12E0mtYGir5ys1Q6bT1PnTlTR76oC/Q8DNNhI9znzRlez6PSi95aOubXrArn
         CRIOG0+0y2UDj/LEmlHaYiofvofNlMPR+u2h309tcX77J/le+w7+LoogsUgEDQqwx6fx
         JecL+OmZ5YeNCDT5wLH9WoF5CQY205ZKCikmkp5QPwe+if4zCgA188JVdM3rnreBa7m2
         1xaSA8Mmu4DMHoiFpVNNNr2nF10RTjt9efFtpoZmXMJ793y1XqRifSsNk/SyG1elA4ZP
         FBIA==
X-Gm-Message-State: AAQBX9dBIgzoUSiVJxt8Nt1idJsf91UXwnW1IR6iXBiqGIZO8mzMmjCN
	p4fHGezt4K4HeEFlFkYbXrbrJ9R0hwZ3TPJKk8ftr9sobip0SLm665r1yzZ8M/DqMDHptvNgKoH
	nl3VjTbGMhAllcg==
X-Received: by 2002:a05:622a:15c3:b0:3e1:b06d:e9e1 with SMTP id d3-20020a05622a15c300b003e1b06de9e1mr3842265qty.57.1680972626216;
        Sat, 08 Apr 2023 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350a46s9y+/itqppzPjf57cV1ZevRRKIKzqVvsO1UIrG/xBtSg7j5IKxAIQvMkkT/GV64uTG74Q==
X-Received: by 2002:a05:622a:15c3:b0:3e1:b06d:e9e1 with SMTP id d3-20020a05622a15c300b003e1b06de9e1mr3842236qty.57.1680972625999;
        Sat, 08 Apr 2023 09:50:25 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s128-20020a372c86000000b0074688c36facsm2113865qkh.56.2023.04.08.09.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 09:50:25 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/qxl: remove variable count
Date: Sat,  8 Apr 2023 12:50:23 -0400
Message-Id: <20230408165023.2706235-1-trix@redhat.com>
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
drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable
  'count' set but not used [-Werror,-Wunused-but-set-variable]
        int count = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_cmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 281edab518cd..d6ea01f3797b 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -421,7 +421,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
 {
 	uint32_t handle;
 	int idr_ret;
-	int count = 0;
 again:
 	idr_preload(GFP_ATOMIC);
 	spin_lock(&qdev->surf_id_idr_lock);
@@ -433,7 +432,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
 	handle = idr_ret;
 
 	if (handle >= qdev->rom->n_surfaces) {
-		count++;
 		spin_lock(&qdev->surf_id_idr_lock);
 		idr_remove(&qdev->surf_id_idr, handle);
 		spin_unlock(&qdev->surf_id_idr_lock);
-- 
2.27.0

