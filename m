Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6BDAFED
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681845655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aai1WHo4fg1sxKcLX3kD4BGAw1PP+pR+m3nWfdfcZTU=;
	b=SEJPcsAflSfXP88Lt9fb57YukdDbEswjw1lGuKpACS5WyAxg0NBNTljoFiGj/vv/dAGvG9
	bC4WzVzxisL3tnNpi4w99QF8zVWcU3cXmA8L4JJOdkuZfZS5BExFrt+ii52s2XcBnfGW5O
	xTgRB9uwuE+7NeVoeakDW11IHC3YHAI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-eeLlsbT9PXGQ-eBZ5DyxIg-1; Tue, 18 Apr 2023 15:20:54 -0400
X-MC-Unique: eeLlsbT9PXGQ-eBZ5DyxIg-1
Received: by mail-qt1-f199.google.com with SMTP id bp42-20020a05622a1baa00b003e6748b05edso27785362qtb.2
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 12:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681845654; x=1684437654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aai1WHo4fg1sxKcLX3kD4BGAw1PP+pR+m3nWfdfcZTU=;
        b=ftU2T++Br3wF/TL8H7iOv0DGkJhV/giUG9jzQ4PRtMgtOCjQY/NWkkSFh/oDdub/kX
         PJDV7u6PXbgo7LgVWSDkhjWaIQiWZ3nN/kzUUzxIGQZ1QSG+CFHK+BLNrWn6h7x+KYii
         ZGfgQQUaMHPR9Ci7jz0eZbWjMM32AGkHTiylV/+bC6Ok/kzVCI2V0ar3EHR0ZAWBK9mn
         eK2JzNty+MJF1pFL5Yr+tLhYEs9G8tfsGlRRRariBAM0XcA36Wpn1wI5YnMpopctR+++
         2Y6vZbrwgb+OfbvZ/FggaNBtmewh864AygFGSH9pXY2UXY8aFZH1ZKqhotdt8IhVlA8r
         +cmg==
X-Gm-Message-State: AAQBX9dRM+nhoCHbbVKnIemqJrc0dJZZ/6b1xGfdZfvc1jKje+cdj3PP
	A0TqaxbhD+4BYEwiTbHxYgRbk+mh27elw59S3e5RBwukLMeLS/bOKEhWRoxj5DZhgkpvHB+aHTN
	KG4U6vT/0x0Dvew==
X-Received: by 2002:a05:6214:410:b0:56c:13cc:d21f with SMTP id z16-20020a056214041000b0056c13ccd21fmr25855297qvx.50.1681845654140;
        Tue, 18 Apr 2023 12:20:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZFUZ7JQR9xbohdXv2IbnkoRfbUviweblbnyFfC0N6wmvnsGUN3xBE3c2IZkXBZ0ZSdmAywfQ==
X-Received: by 2002:a05:6214:410:b0:56c:13cc:d21f with SMTP id z16-20020a056214041000b0056c13ccd21fmr25855272qvx.50.1681845653894;
        Tue, 18 Apr 2023 12:20:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 7-20020a370c07000000b0074df3f7e14esm1709609qkm.67.2023.04.18.12.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 12:20:53 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: quic_jhugo@quicinc.com,
	ogabbay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	jacek.lawrynowicz@linux.intel.com,
	quic_carlv@quicinc.com,
	stanislaw.gruszka@linux.intel.com,
	quic_pkanojiy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] accel/qaic: initialize ret variable to 0
Date: Tue, 18 Apr 2023 15:20:46 -0400
Message-Id: <20230418192046.3235870-1-trix@redhat.com>
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

clang static analysis reports
drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
  value returned to caller [core.uninitialized.UndefReturn]
        return ret;
        ^~~~~~~~~~

The ret variable is only set some of the time but is always returned.
So initialize ret to 0.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/qaic/qaic_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c0a574cd1b35..b46a16fb3080 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 	struct qaic_bo *bo = to_qaic_bo(obj);
 	unsigned long offset = 0;
 	struct scatterlist *sg;
-	int ret;
+	int ret = 0;
 
 	if (obj->import_attach)
 		return -EINVAL;
-- 
2.27.0

