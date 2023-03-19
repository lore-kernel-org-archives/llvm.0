Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEBB1856
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679235807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T/hIkiUkQpnPgtTLze7otKxFbigf/WOsrX7aDGKl4Xk=;
	b=eWsaXKn2RPxxApNuIluoStLQcmTpnWoZDxgwYtjxatvbvQI9X+aQgZHOytmzwftrxlhotQ
	RwuFnzDUMcfxUAnlKs3L35oWts9U7yYmUjko7ZNtdr8g6vHxLVDXlDbGOJ9OFhvNIBn0sN
	2bDmnYN9MZa1/LJC/0Bekgyxz1CV9G8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-GASHENiGOkCZIp1Eh7jq9g-1; Sun, 19 Mar 2023 10:23:24 -0400
X-MC-Unique: GASHENiGOkCZIp1Eh7jq9g-1
Received: by mail-qt1-f200.google.com with SMTP id i24-20020ac84f58000000b003bfe3358691so5317837qtw.21
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 07:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679235804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/hIkiUkQpnPgtTLze7otKxFbigf/WOsrX7aDGKl4Xk=;
        b=tIz0AWNprFsyzLPBlUCORKzY2N/a7yKtXRvn+XnCPkhg7B4B6Hw9DThbhZz1JG1lNb
         SqUtNkG945Kfdw1ho0vdw87A56xlJoDvQdGxpwBW0r1xtMAiErpP/gUOeuPxnPV0YQZ1
         7gpmoYo1m/t3sfRhlfnNfgxtUJPBwOx7k4jXlut7DWIeDP4T/m34pd9qSjyQu6y4hjjm
         dUGz1WA5z0lvA8jroaRwLcwhZ4kMeM89DxN8Nf6Apz0TYRm8en2XW3NkFS2ojeCWUlux
         gv+MfDI2gtfZQZ1lFGt17o/ogrOv4oCUbrK6Gy+VGFFrJNpbDHFSrjdc4ywv1xmh4QNY
         yQLQ==
X-Gm-Message-State: AO0yUKVlHZBxmZWQsqKkPug0Npz+/yQjWc3Y6S8ivQ1EI4182UEtX16w
	lCPIJi/xR2el0GYsrjx7nsi7c+i+zcz8t+OzZ/6lKT3aKb1EUsb2as3WuulSfNxeh2/DZD4HNuk
	Td1txGi5w0tha00Xtmbd/mA==
X-Received: by 2002:ac8:5c81:0:b0:3b8:2504:e90a with SMTP id r1-20020ac85c81000000b003b82504e90amr14481137qta.3.1679235803805;
        Sun, 19 Mar 2023 07:23:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set+VdKmYQdrgrfLXblYozKf6KZb4B0tCRITCJXTgRYRA6AKoIA4AB44uaiwX/F6ze/obzO3pzQ==
X-Received: by 2002:ac8:5c81:0:b0:3b8:2504:e90a with SMTP id r1-20020ac85c81000000b003b82504e90amr14481124qta.3.1679235803572;
        Sun, 19 Mar 2023 07:23:23 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o8-20020ac841c8000000b003de4e646d63sm2103047qtm.32.2023.03.19.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 07:23:23 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/gma500: remove unused gma_pipe_event function
Date: Sun, 19 Mar 2023 10:23:20 -0400
Message-Id: <20230319142320.1704336-1-trix@redhat.com>
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
drivers/gpu/drm/gma500/psb_irq.c:35:19: error: unused function
  'gma_pipe_event' [-Werror,-Wunused-function]
static inline u32 gma_pipe_event(int pipe)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/gma500/psb_irq.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index d421031462df..343c51250207 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -32,17 +32,6 @@ static inline u32 gma_pipestat(int pipe)
 	BUG();
 }
 
-static inline u32 gma_pipe_event(int pipe)
-{
-	if (pipe == 0)
-		return _PSB_PIPEA_EVENT_FLAG;
-	if (pipe == 1)
-		return _MDFLD_PIPEB_EVENT_FLAG;
-	if (pipe == 2)
-		return _MDFLD_PIPEC_EVENT_FLAG;
-	BUG();
-}
-
 static inline u32 gma_pipeconf(int pipe)
 {
 	if (pipe == 0)
-- 
2.27.0

