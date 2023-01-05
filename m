Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2524233C0
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672955201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RJxX8F2Oi9p4ox5AYCJudMMSN3aLdKu313AtW9TP9ck=;
	b=hTyYEIyWgrYahIRZTwWvmJTWZCLyjpYdq/kHd9Gz9MqWBKDayPz54CtWteXSupVIodmwyf
	kzircvvK0tswNr7zqhzldWkUhK5TsTRIOtSp0D9cpqu9G0STyb4x/WAgNeTqp76fsZ3qLX
	nYfXwEyTh7bu2kUpP1Q3yA7/K4dC/RE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-E_ZOmZlWPgaQTByXpoJOrQ-1; Thu, 05 Jan 2023 16:46:40 -0500
X-MC-Unique: E_ZOmZlWPgaQTByXpoJOrQ-1
Received: by mail-qk1-f199.google.com with SMTP id de38-20020a05620a372600b0070224de1c6eso25977968qkb.17
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 13:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJxX8F2Oi9p4ox5AYCJudMMSN3aLdKu313AtW9TP9ck=;
        b=nRmLdMs1gEeCqOzrHMTvx9Nx0XwlfE0KaDaOAkOLIK5cbw9ta9wNgZkoSQZEeM0YH4
         PI6Ya7evkTef5IDW33ouImzdsopG6Lp6DaiHZd9dslIxHgorraxaOtUFf9xBAS1B998P
         fcTdbtGFD1iI1QgSKNrLcOkHQlMQim2aKcBD6rfXW3rflxByfqYFC1YpxKnAO0/V9MdE
         iSM42LU8p4O9GHI4TMET/p12gvZad/NwBwrzGJm9mq5NbeqyCw3O4Bzn9b93kH0v5pc3
         Ath/h21oaVAj4jXRv3ywXZl/PfBNSdovYqq/JYKosN6kbsnBa/8hOs+6yxdyePcYxhOI
         MK2Q==
X-Gm-Message-State: AFqh2krYaXP6DiZWUVZ7wUhRNT0c2dsJjdjRp/BFzCCqe2BZYwsoyRnW
	Bb9NVHgKeAU6U6B1UTIK7o6TEoFYqZL7zxoefFJJX0R/9+PfZFvGFml8brVIHPcmInV9VxzrQnI
	Gh+041Ab4yt+PuQ==
X-Received: by 2002:a05:622a:4d98:b0:3a5:24ac:a175 with SMTP id ff24-20020a05622a4d9800b003a524aca175mr79247730qtb.56.1672955199436;
        Thu, 05 Jan 2023 13:46:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOxlIpJae+yvLp/3VsoqW8D9MXFVzcQIHBPniSyIwWqQ9/WnS8U1M90QS9GG96j49U3uDZDA==
X-Received: by 2002:a05:622a:4d98:b0:3a5:24ac:a175 with SMTP id ff24-20020a05622a4d9800b003a524aca175mr79247709qtb.56.1672955199240;
        Thu, 05 Jan 2023 13:46:39 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id bq22-20020a05622a1c1600b0039c7b9522ecsm22189237qtb.35.2023.01.05.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 13:46:38 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	beanhuo@micron.com,
	Arthur.Simchaev@wdc.com,
	stanley.chu@mediatek.com,
	j-young.choi@samsung.com,
	peter.wang@mediatek.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] scsi: ufs: core: initialize sg_cnt, sg_list
Date: Thu,  5 Jan 2023 16:46:35 -0500
Message-Id: <20230105214635.874609-1-trix@redhat.com>
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

The clang build fails with
drivers/ufs/core/ufs_bsg.c:107:6: error: variable 'sg_cnt' is used
  uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if (dir != DMA_NONE) {
            ^~~~~~~~~~~~~~~
Similar for sg_list.

This is not an error because ufshcd_advanced_rpmb_req_handler() does a
similar check, but that check can be reduced if sg_list is initialized to NULL.
Initialize sg_cnt to silence its error.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/ufs/core/ufs_bsg.c | 4 ++--
 drivers/ufs/core/ufshcd.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs_bsg.c b/drivers/ufs/core/ufs_bsg.c
index 0044029bcf7b..0d38e7fa34cc 100644
--- a/drivers/ufs/core/ufs_bsg.c
+++ b/drivers/ufs/core/ufs_bsg.c
@@ -70,9 +70,9 @@ static int ufs_bsg_exec_advanced_rpmb_req(struct ufs_hba *hba, struct bsg_job *j
 	struct ufs_rpmb_reply *rpmb_reply = job->reply;
 	struct bsg_buffer *payload = NULL;
 	enum dma_data_direction dir;
-	struct scatterlist *sg_list;
+	struct scatterlist *sg_list = NULL;
 	int rpmb_req_type;
-	int sg_cnt;
+	int sg_cnt = 0;
 	int ret;
 	int data_len;
 
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index da81eafc19d5..6ed728885650 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7051,7 +7051,7 @@ int ufshcd_advanced_rpmb_req_handler(struct ufs_hba *hba, struct utp_upiu_req *r
 	/* Copy EHS, starting with byte32, immediately after the CDB package */
 	memcpy(lrbp->ucd_req_ptr + 1, req_ehs, sizeof(*req_ehs));
 
-	if (dir != DMA_NONE && sg_list)
+	if (sg_list)
 		ufshcd_sgl_to_prdt(hba, lrbp, sg_cnt, sg_list);
 
 	memset(lrbp->ucd_rsp_ptr, 0, sizeof(struct utp_upiu_rsp));
-- 
2.27.0

