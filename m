Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD728EB
	for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679753165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1lbJBPwhH6Cq9r2UgzRHc6kwTuKIZL2sdzIekbj7z0w=;
	b=WH/z0kTWukUuPIufn7cvdDKAW/wgu505bzuzDrZjUg9cbZlqg88KVElMjFoPgebgAkhqfh
	unfQFV4clqsFh41Hs3AiVKyoH5kz5Xh1CaD4SKbYaZzcaO+hfIoyVnOi+CISA69+GQdgFi
	kqZwemixYLm5vVswO0YFyfPpvBYgZBw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281--8KcxxphMqiyWDBI3z00Yw-1; Sat, 25 Mar 2023 10:06:04 -0400
X-MC-Unique: -8KcxxphMqiyWDBI3z00Yw-1
Received: by mail-qk1-f199.google.com with SMTP id c80-20020ae9ed53000000b007468c560e1bso2179151qkg.2
        for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 07:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679753163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lbJBPwhH6Cq9r2UgzRHc6kwTuKIZL2sdzIekbj7z0w=;
        b=QxhsyZk08EpNEQsZqehjtKAUCPGUOjLwYL1+Q26s59k9NujnlBmQm3eKX96YtnNU3z
         ZAuf3TZF7JdZf4yvWT7uq77s4EELEpuQo6io6tBVdo2Q2OaBQ9v21yv+FPGaVy+S3fEi
         9YHbOwqOVeIoxZTbMZy0jDbG0uV0TS4yvoMTuYD8fHtzzJr+TTuXmvIlGQILk2rpqgWV
         EoZEjjRxxd3ZPe8Ni2q7cLE0biRxXezeMrpDv1wEvSEmxBDTxxmokC7MuU4MzO6n/Lqt
         c2c/hR+krlMk0v64sQJT/8jcb0HocKixQ0MCzT89h5LYM/cnT178wIC6J0WuYzfImZUE
         7o+g==
X-Gm-Message-State: AAQBX9dUZdmSEoA2LQoVGWdafH2a+syqQG+Aj+gC7qMldXkU8AXkAEx9
	BV5LVy076Dvm0uxgfvRv0WfWroKYjSET8yPpotteTEEs7/u2qvmlNz650t8Y0vsxtVZNUP4BKdT
	fcCn95YiH9jtXCg==
X-Received: by 2002:a05:6214:cc1:b0:5d9:cb0b:3de4 with SMTP id 1-20020a0562140cc100b005d9cb0b3de4mr12296848qvx.45.1679753163303;
        Sat, 25 Mar 2023 07:06:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/EL6Tkp3U6JqLt4Li2rJy95cscsYC+qqgT2enwwScQiVROP52ZEJU7J0WILTQqrJ+SkA3kQ==
X-Received: by 2002:a05:6214:cc1:b0:5d9:cb0b:3de4 with SMTP id 1-20020a0562140cc100b005d9cb0b3de4mr12296776qvx.45.1679753162854;
        Sat, 25 Mar 2023 07:06:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id oj9-20020a056214440900b005dd8b9345bbsm1478977qvb.83.2023.03.25.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 07:06:02 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: selvin.xavier@broadcom.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] RDMA/bnxt_re: remove unused num_srqne_processed and num_cqne_processed variables
Date: Sat, 25 Mar 2023 10:05:59 -0400
Message-Id: <20230325140559.1336056-1-trix@redhat.com>
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
drivers/infiniband/hw/bnxt_re/qplib_fp.c:303:6: error: variable
  'num_srqne_processed' set but not used [-Werror,-Wunused-but-set-variable]
        int num_srqne_processed = 0;
            ^
drivers/infiniband/hw/bnxt_re/qplib_fp.c:304:6: error: variable
  'num_cqne_processed' set but not used [-Werror,-Wunused-but-set-variable]
        int num_cqne_processed = 0;
            ^
These variables are not used so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/infiniband/hw/bnxt_re/qplib_fp.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/infiniband/hw/bnxt_re/qplib_fp.c b/drivers/infiniband/hw/bnxt_re/qplib_fp.c
index 96e581ced50e..0ba14087dfcd 100644
--- a/drivers/infiniband/hw/bnxt_re/qplib_fp.c
+++ b/drivers/infiniband/hw/bnxt_re/qplib_fp.c
@@ -300,8 +300,6 @@ static void bnxt_qplib_service_nq(struct tasklet_struct *t)
 {
 	struct bnxt_qplib_nq *nq = from_tasklet(nq, t, nq_tasklet);
 	struct bnxt_qplib_hwq *hwq = &nq->hwq;
-	int num_srqne_processed = 0;
-	int num_cqne_processed = 0;
 	struct bnxt_qplib_cq *cq;
 	int budget = nq->budget;
 	u32 sw_cons, raw_cons;
@@ -340,9 +338,7 @@ static void bnxt_qplib_service_nq(struct tasklet_struct *t)
 					    DBC_DBC_TYPE_CQ_ARMENA);
 			spin_lock_bh(&cq->compl_lock);
 			atomic_set(&cq->arm_state, 0);
-			if (!nq->cqn_handler(nq, (cq)))
-				num_cqne_processed++;
-			else
+			if (nq->cqn_handler(nq, (cq)))
 				dev_warn(&nq->pdev->dev,
 					 "cqn - type 0x%x not handled\n", type);
 			cq->cnq_events++;
@@ -361,11 +357,9 @@ static void bnxt_qplib_service_nq(struct tasklet_struct *t)
 			srq = (struct bnxt_qplib_srq *)q_handle;
 			bnxt_qplib_armen_db(&srq->dbinfo,
 					    DBC_DBC_TYPE_SRQ_ARMENA);
-			if (!nq->srqn_handler(nq,
-					      (struct bnxt_qplib_srq *)q_handle,
-					      nqsrqe->event))
-				num_srqne_processed++;
-			else
+			if (nq->srqn_handler(nq,
+					     (struct bnxt_qplib_srq *)q_handle,
+					     nqsrqe->event))
 				dev_warn(&nq->pdev->dev,
 					 "SRQ event 0x%x not handled\n",
 					 nqsrqe->event);
-- 
2.27.0

