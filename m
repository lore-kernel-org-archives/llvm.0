Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974910E7
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680208490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eGkxwG96GrqLVw0TE58Wpxl+P5cmdIKahbzznaGzN4I=;
	b=AjSYPjKjMlv7IXDBfWqcXJf6batpLGMO+6hUxXPFsIs7sgXWkw6yupmAQq/x2nkx1Ihq1d
	QEniijbX3H1e23WrtPcXoS8WEiLEeucioZID10r2KdvLLAzA4uEkzDa8l9U9qZ3MEQ/9/I
	cfVfOTOZjKjxb1GbKAHUCMo4RtqTkGk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-liVQWLTfMFOUD6gPJW18DA-1; Thu, 30 Mar 2023 16:34:48 -0400
X-MC-Unique: liVQWLTfMFOUD6gPJW18DA-1
Received: by mail-qk1-f198.google.com with SMTP id c186-20020a379ac3000000b007484744a472so9190883qke.22
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 13:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680208488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGkxwG96GrqLVw0TE58Wpxl+P5cmdIKahbzznaGzN4I=;
        b=rKhRV8wzo8GB6Mb8RdiLIBO8q027z4SzYzmHBPiNl8VefPnGcruvAr7ix2VKcz1mKV
         ckfj/TL5WDn0lqV7l5fs6a80s+pbo+9yt2qoDXCMzct8qlzinSOUP+WaGNQWcLzhbmsQ
         tTu3LjoqspajyIGKcFE9uMNoc6gwzz6cBmsQcVG3aTjKz+oKxVoy03Ag2+hfKxHUhjf2
         3sxjoYXRqIErzgVViVAoYTzbN60JL7tG/lwVnSG+52wXYIgDuoqbv5SQPss+jfEqIO3f
         ASxD6QnvYPpni3Lwh+0PlZtWTMiT2m4N3WdfCkLvmHvidGbrvefq68Lprten4a/hqiRo
         mS+w==
X-Gm-Message-State: AAQBX9c3BP/0Eiz6bPVdMAByUsLdccLN9Hs59oD0DpSK3xxr4RIQci7x
	7pTGYHTe8Te/KDSxDtf3mxiz0yiCD4HWGizs1qPv0LSvPnOUldaUlBfdiG11mxOpXtJdavHHKWr
	GbcOIHYIlexXiIQ==
X-Received: by 2002:ac8:584f:0:b0:3e1:6c7e:2ee0 with SMTP id h15-20020ac8584f000000b003e16c7e2ee0mr14242002qth.11.1680208488244;
        Thu, 30 Mar 2023 13:34:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350a1wvKlZbAtmYILYnVwfQgOtt39xMFyExjgnV3KppLGpi4BEL0uQtNYwb/Tvs8MCv4NdLJl4Q==
X-Received: by 2002:ac8:584f:0:b0:3e1:6c7e:2ee0 with SMTP id h15-20020ac8584f000000b003e16c7e2ee0mr14241984qth.11.1680208488012;
        Thu, 30 Mar 2023 13:34:48 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id u17-20020ac87511000000b003e38f8d564fsm110512qtq.66.2023.03.30.13.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:34:47 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: skashyap@marvell.com,
	jhasan@marvell.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: GR-QLogic-Storage-Upstream@marvell.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] scsi: qedf: remove unused num_handled variable
Date: Thu, 30 Mar 2023 16:34:44 -0400
Message-Id: <20230330203444.1842425-1-trix@redhat.com>
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
drivers/scsi/qedf/qedf_main.c:2227:6: error: variable
  'num_handled' set but not used [-Werror,-Wunused-but-set-variable]
        int num_handled = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/scsi/qedf/qedf_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index e7f2560b9f7d..3b64de81ea0d 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -2224,7 +2224,6 @@ static bool qedf_process_completions(struct qedf_fastpath *fp)
 	u16 prod_idx;
 	struct fcoe_cqe *cqe;
 	struct qedf_io_work *io_work;
-	int num_handled = 0;
 	unsigned int cpu;
 	struct qedf_ioreq *io_req = NULL;
 	u16 xid;
@@ -2247,7 +2246,6 @@ static bool qedf_process_completions(struct qedf_fastpath *fp)
 
 	while (new_cqes) {
 		fp->completions++;
-		num_handled++;
 		cqe = &que->cq[que->cq_cons_idx];
 
 		comp_type = (cqe->cqe_data >> FCOE_CQE_CQE_TYPE_SHIFT) &
-- 
2.27.0

