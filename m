Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03098835
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680285484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5O8+xHFKv06WCG7nCwq4CEs9To8ieEt1S6DRRcwc6+g=;
	b=A5B99WYlwwDuGgcTmeRylKb3L4ncKlj7ELA+DC7hcC7sdTbyTPMOlFFlgiGhO8O0xZuuGv
	VnoLpzxzIuEh1qCPaawDzNjfJJ0/ZhutOtVsw9f5AYtQdnCv+JlnCYTQit7C/38VZFe3wf
	lUFB/23WbbAtEaZzJW4tfY58H7ul3Ns=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-LSQsZPuZMyGlKbc73-asMA-1; Fri, 31 Mar 2023 13:58:01 -0400
X-MC-Unique: LSQsZPuZMyGlKbc73-asMA-1
Received: by mail-qv1-f69.google.com with SMTP id g6-20020ad45426000000b005a33510e95aso10113858qvt.16
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 10:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5O8+xHFKv06WCG7nCwq4CEs9To8ieEt1S6DRRcwc6+g=;
        b=EZAbV/Hbfq4P1gU036nwxALk62n6z5DeDrkh1AZuo51W5nZwIfjLvDx4d5DkHrYQ1I
         +GG2EXiStrIcKyM9bLujXdtHlZ2Cw+AcLutZ4i3wuBw3LNtN89i4N8N/s1OUsmjuLOvS
         6f9k8rdVej4kmlFHzGP2XbzKAC9MGZHLxCXu6C59bNLbmHusqXtyGL0voh8sEClL1cPX
         j+N4ltTGOo+iFjJfZh9PQuqsQy9ulvUsOZqW4nHyW5E0B4L6+Ak2C0eVf0P6LHJD2Wjm
         KqY4qUPvCtwSJLSSXxEdwWBdqf4G9jpKumQxJJm/hvOptzfYD38H0yvN5QQRNi5oIY1b
         1+uA==
X-Gm-Message-State: AAQBX9ft7Vj1wnSSabVGGGW57BA2M/nUgjCv7QTMAQ//yYEB2bgWWDrt
	4J/b6NMF7GnATrRF00dnZvzwMUjDQKSF9T7DYoiWJtc9Hhy2KvJu7uFyjzMDxi6nWubwJb4Agl2
	2099WTAeDQaD1ww==
X-Received: by 2002:a05:6214:410f:b0:572:80ea:5fc7 with SMTP id kc15-20020a056214410f00b0057280ea5fc7mr42990021qvb.41.1680285480467;
        Fri, 31 Mar 2023 10:58:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAB+2E58L9cx7PfO4++k4UHX5C/oFrianAF5m/clXDQYWYq5EBw8/U5MgBdC3hhUE5TFzLHg==
X-Received: by 2002:a05:6214:410f:b0:572:80ea:5fc7 with SMTP id kc15-20020a056214410f00b0057280ea5fc7mr42989995qvb.41.1680285480233;
        Fri, 31 Mar 2023 10:58:00 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cfd4a000000b005dd8b934578sm768480qvs.16.2023.03.31.10.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:57:59 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: njavali@marvell.com,
	mrangankar@marvell.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: GR-QLogic-Storage-Upstream@marvell.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] [SCSI] qla4xxx: remove unused count variable
Date: Fri, 31 Mar 2023 13:57:57 -0400
Message-Id: <20230331175757.1860780-1-trix@redhat.com>
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
drivers/scsi/qla4xxx/ql4_isr.c:475:11: error: variable
  'count' set but not used [-Werror,-Wunused-but-set-variable]
        uint32_t count = 0;
                 ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/scsi/qla4xxx/ql4_isr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/qla4xxx/ql4_isr.c b/drivers/scsi/qla4xxx/ql4_isr.c
index 6f0e77dc2a34..cf52258ecdde 100644
--- a/drivers/scsi/qla4xxx/ql4_isr.c
+++ b/drivers/scsi/qla4xxx/ql4_isr.c
@@ -472,14 +472,12 @@ static void qla4xxx_mbox_status_entry(struct scsi_qla_host *ha,
  **/
 void qla4xxx_process_response_queue(struct scsi_qla_host *ha)
 {
-	uint32_t count = 0;
 	struct srb *srb = NULL;
 	struct status_entry *sts_entry;
 
 	/* Process all responses from response queue */
 	while ((ha->response_ptr->signature != RESPONSE_PROCESSED)) {
 		sts_entry = (struct status_entry *) ha->response_ptr;
-		count++;
 
 		/* Advance pointers for next entry */
 		if (ha->response_out == (RESPONSE_QUEUE_DEPTH - 1)) {
-- 
2.27.0

