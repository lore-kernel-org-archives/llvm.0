Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED72F2C
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 19:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679684813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m1e+oH63s8EilReY/6J1/4GgJ3Yip783LTwv8q9nidY=;
	b=YYsc4qpBx2omkoNEI5IOeW4Z4W5hO6PqAgVEjFU/XXIgVewYTMdBq/KgUXmoYrJAWzAuov
	dUTNUEoHjTmPJqs+vuZ0Lv8XS4J56fRRmtYwbhA9LgKwxdK1IaIhHs2a/5M+aLWy/J6a85
	ojgV+T7z9FGtW63S1ZPHK9eDRcJSUyo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-5XTyamG1P3yzduq1njKtmg-1; Fri, 24 Mar 2023 15:06:51 -0400
X-MC-Unique: 5XTyamG1P3yzduq1njKtmg-1
Received: by mail-qv1-f71.google.com with SMTP id w2-20020a0cc242000000b00583d8e55181so1449446qvh.23
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 12:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679684810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1e+oH63s8EilReY/6J1/4GgJ3Yip783LTwv8q9nidY=;
        b=EM4hgULGP4MirbjxEaiZ5FIXd9YAbObbmqx0zwISnXIfGvT0zTDlHpRfsDKZMjD6fh
         hPRzxuec0/pCfpLpeSv3w5sFG/p2QHwSmSXJRBsSGtCoXLiQ30G8C9Wfp0h4rPQ0yNgv
         bHfL82tSKQ2w4K4RcJ2HYNAmDvIsojqxNZzd7BvEMA0PeCpSDHTHMjXoHm5Epl02/3i0
         tMCjMtReVyo6k/YvHl5CDkaFrimwpSrZNfCOcaDGzVUr/USQUHhTWuLfY1ejsr/pZeli
         DtGNdQPGVJWrmWUk+t/99hhoIJ43YC6WZ4N57sGrILXS1Rpe1DeWDhhvUCkqQap2xtXQ
         grZg==
X-Gm-Message-State: AAQBX9dCMOp9MR9ZOcYbNxxfD8Y1WhmUIbiphfDVGzVcO6GLhrP12Twj
	DkK7IhORfROPbfnAJ43haQwtAYWuZmstOh97dRPYeBKI2JTOJkLcMRaBvUTmYzVx655CZn6/5iD
	ZqefmhGE+AJzC9Q==
X-Received: by 2002:a05:6214:27e8:b0:5a9:2bc0:ea8b with SMTP id jt8-20020a05621427e800b005a92bc0ea8bmr5351755qvb.47.1679684810466;
        Fri, 24 Mar 2023 12:06:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YuWvGXZU1QVTitk/8JsI8hEFHXd1EPDpR8zn1NFJSLnBRtZ4fzQy+1va5RMqv6w0SUiL2WXw==
X-Received: by 2002:a05:6214:27e8:b0:5a9:2bc0:ea8b with SMTP id jt8-20020a05621427e800b005a92bc0ea8bmr5351729qvb.47.1679684810228;
        Fri, 24 Mar 2023 12:06:50 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id kr15-20020a0562142b8f00b005dd8b93456csm885828qvb.4.2023.03.24.12.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 12:06:49 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: zajec5@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] bcma: remove unused mips_read32 function
Date: Fri, 24 Mar 2023 15:06:47 -0400
Message-Id: <20230324190647.2654293-1-trix@redhat.com>
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
drivers/bcma/driver_mips.c:49:19: error: unused function
  'mips_read32' [-Werror,-Wunused-function]
static inline u32 mips_read32(struct bcma_drv_mips *mcore,
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/bcma/driver_mips.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/bcma/driver_mips.c b/drivers/bcma/driver_mips.c
index 4f01e6b17bb9..9be0806eb033 100644
--- a/drivers/bcma/driver_mips.c
+++ b/drivers/bcma/driver_mips.c
@@ -46,12 +46,6 @@ static inline bool bcma_core_mips_bcm5357b0_quirk(struct bcma_device *dev)
 	       dev->id.id == BCMA_CORE_USB20_HOST;
 }
 
-static inline u32 mips_read32(struct bcma_drv_mips *mcore,
-			      u16 offset)
-{
-	return bcma_read32(mcore->core, offset);
-}
-
 static u32 bcma_core_mips_irqflag(struct bcma_device *dev)
 {
 	u32 flag;
-- 
2.27.0

