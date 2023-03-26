Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955B1C2F
	for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679832607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HbnW/Rgnvg5ujAUjgAGlY8Mc7i1z035Taln23xgjKTM=;
	b=Etm3T1benCqvHKDKc2tJoDvoHMWqyoNmN5iqf1mHpS0rgb0/cHNbw09hKLvS5r0K9OGHWO
	6F+Rklh2ym3Eoo5XRNM7Z2dG5VBqMx/iF25L9ILS0ggx4+3zvXVR/YpdG/LEWkp92OpIUv
	NoQAykIMvJeOucw29jt/YYoRwf6IFgM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-l88CqUf6NzCte6CiKOrfGw-1; Sun, 26 Mar 2023 08:10:03 -0400
X-MC-Unique: l88CqUf6NzCte6CiKOrfGw-1
Received: by mail-qt1-f197.google.com with SMTP id h21-20020ac87d55000000b003bffb1c9745so4129502qtb.4
        for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 05:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679832603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbnW/Rgnvg5ujAUjgAGlY8Mc7i1z035Taln23xgjKTM=;
        b=Nak0UlLN5OOemP/qanUMXOD+nq2bmamZE9gQiNJV4uBPxU4duggb/UZE/hCfNUqD28
         q5DN6qWOuGKCPrM4+9g2TUD/qYrjN6z/sbQXIYAoxOzPiNl5aQT9pOYTbxMcFCoOiHuw
         o+IX2DtltJ4WNjtES8w7YkA4C/OYkySSNGR6Ge1HUL4G1R9EeppFPoMgjbE1gHRvJAWC
         ch+tdsN7Mm+r/VVIGOT+7BNURqeoiDxjtUXbqALnmvkxZbOE6DI1oy+p/XdLqdvdkMiD
         Y7ztFVi1dJtbPVRokWEpkXDF9IlfUfhf7TWuvWKTUphMxdHimRgeJFUPNqKG1A5YYLLk
         Hd5w==
X-Gm-Message-State: AO0yUKXQesP94wiyGF59ZOUfMSCOmHjiEn0L1U3R3oC5bemnRwgRU0jW
	S6LLeQ3D33VsXHuxNhXn7/47sXR2p5fxOxyoiWv8EkLlcwD/VLDpkGvKKerJ5v9u/cIjzGwuR/2
	x8cr07uzJMsQPyA==
X-Received: by 2002:a05:6214:2484:b0:56f:768a:9bb8 with SMTP id gi4-20020a056214248400b0056f768a9bb8mr24767192qvb.26.1679832603160;
        Sun, 26 Mar 2023 05:10:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set+f0s1CKPEqIVVuYB6YrTJvY7M+h/pytIksz3Z008dcgKHhPNGRujHw3Gc1sAqT01/Ut/23dQ==
X-Received: by 2002:a05:6214:2484:b0:56f:768a:9bb8 with SMTP id gi4-20020a056214248400b0056f768a9bb8mr24767159qvb.26.1679832602910;
        Sun, 26 Mar 2023 05:10:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id mx16-20020a0562142e1000b005dd8b934588sm2158942qvb.32.2023.03.26.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:10:02 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: selvin.xavier@broadcom.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	mgurtovoy@nvidia.com
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] RDMA/ocrdma: remove unused discard_cnt variable
Date: Sun, 26 Mar 2023 08:09:59 -0400
Message-Id: <20230326120959.1351948-1-trix@redhat.com>
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
drivers/infiniband/hw/ocrdma/ocrdma_verbs.c:1592:6: error: variable
  'discard_cnt' set but not used [-Werror,-Wunused-but-set-variable]
        int discard_cnt = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index dd4021b11963..58f994341e9a 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -1589,7 +1589,6 @@ static void ocrdma_discard_cqes(struct ocrdma_qp *qp, struct ocrdma_cq *cq)
 {
 	unsigned long cq_flags;
 	unsigned long flags;
-	int discard_cnt = 0;
 	u32 cur_getp, stop_getp;
 	struct ocrdma_cqe *cqe;
 	u32 qpn = 0, wqe_idx = 0;
@@ -1641,7 +1640,6 @@ static void ocrdma_discard_cqes(struct ocrdma_qp *qp, struct ocrdma_cq *cq)
 		/* mark cqe discarded so that it is not picked up later
 		 * in the poll_cq().
 		 */
-		discard_cnt += 1;
 		cqe->cmn.qpn = 0;
 skip_cqe:
 		cur_getp = (cur_getp + 1) % cq->max_hw_cqe;
-- 
2.27.0

