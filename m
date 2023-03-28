Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D9621
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 00:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679962615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l9TloykkvVXc8o7UP6x81LrTcABAgCIQ1kB1+I+fT8w=;
	b=KZAq13fErVIq/d4WsEei+H6XPStetvA+0zgwvbz/ZLZv8WRlZ9pAMl7KpTgg/gMhpxAUna
	ZUdNs79dEB4KbMeL73SWuRYizVCngl52IE5bwsrvd9V3KLRFpi1xQqRHi3UUFoNZdPFHV+
	s/AiQKM0kEg6gQQrmdKr4XH0hXaiBtw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-q9MXKduzMhyvYe4Uup-UNA-1; Mon, 27 Mar 2023 20:16:52 -0400
X-MC-Unique: q9MXKduzMhyvYe4Uup-UNA-1
Received: by mail-qv1-f72.google.com with SMTP id l15-20020a0cd6cf000000b005df451a51ddso268345qvi.9
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 17:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679962612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9TloykkvVXc8o7UP6x81LrTcABAgCIQ1kB1+I+fT8w=;
        b=A1z/KuivlDAN2wIVZrUpsMCA9VJzgPWr6NvtAvD8kR22bwGNVKsAhVFwOEPq/6+L6k
         btJSWV1q8oIzwegQvrhxJJGlG3J1VVRT6Cu5Ft4gnaSrPphRPYk7Gc4bTTrUdaeh4jao
         ASsLiIeDQMa/ukpwIRQI8pBz3T9C8iOz143RXuNvs23mDIwjFviUFT3MqAGM8Gnq/UDd
         xU+NMtp55EF7PP4RbsR677YvBcVRdYQGNrvxo2q7HY9/6cNxZsPzF6twR3mfBer52DGd
         lFrlR3O95CVjcPLZewItjI3RIszKj/EU3st1kR4q7Tsz2pfCcwjGsXT+H1un+R1ESSUV
         o6aw==
X-Gm-Message-State: AO0yUKX2PaLIoEBDksH4D97ouayQWquO7gBUgbgFTVv6ecFXuVAA185y
	S692QdbDBa9lBV6q8NWctiVbMapT7sroIAul6tWgGcjYzEgjnqBs5DZ53Q/V49SEVoKX81qShX6
	PVaiSvywhtFVVAA==
X-Received: by 2002:a05:622a:18aa:b0:3b8:6442:2575 with SMTP id v42-20020a05622a18aa00b003b864422575mr22673852qtc.49.1679962612315;
        Mon, 27 Mar 2023 17:16:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350btSLeE0R9uHWk3nYnNxmFX2+jJghagg9JtvjX2KzEzjA2jaBgsmO5jb10c3S8J3WgiOfmnHw==
X-Received: by 2002:a05:622a:18aa:b0:3b8:6442:2575 with SMTP id v42-20020a05622a18aa00b003b864422575mr22673825qtc.49.1679962612093;
        Mon, 27 Mar 2023 17:16:52 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id m4-20020ac866c4000000b003e30aec0b70sm9500482qtp.64.2023.03.27.17.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 17:16:51 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: kartilak@cisco.com,
	sebaddel@cisco.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] scsi: snic: remove unused xfer_len variable
Date: Mon, 27 Mar 2023 20:16:47 -0400
Message-Id: <20230328001647.1778448-1-trix@redhat.com>
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
drivers/scsi/snic/snic_scsi.c:490:6: error: variable
  'xfer_len' set but not used [-Werror,-Wunused-but-set-variable]
        u64 xfer_len = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/scsi/snic/snic_scsi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/scsi/snic/snic_scsi.c b/drivers/scsi/snic/snic_scsi.c
index 961af6fc21bc..c50ede326cc4 100644
--- a/drivers/scsi/snic/snic_scsi.c
+++ b/drivers/scsi/snic/snic_scsi.c
@@ -487,7 +487,6 @@ snic_process_icmnd_cmpl_status(struct snic *snic,
 			       struct scsi_cmnd *sc)
 {
 	u8 scsi_stat = icmnd_cmpl->scsi_status;
-	u64 xfer_len = 0;
 	int ret = 0;
 
 	/* Mark the IO as complete */
@@ -496,15 +495,11 @@ snic_process_icmnd_cmpl_status(struct snic *snic,
 	if (likely(cmpl_stat == SNIC_STAT_IO_SUCCESS)) {
 		sc->result = (DID_OK << 16) | scsi_stat;
 
-		xfer_len = scsi_bufflen(sc);
-
 		/* Update SCSI Cmd with resid value */
 		scsi_set_resid(sc, le32_to_cpu(icmnd_cmpl->resid));
 
-		if (icmnd_cmpl->flags & SNIC_ICMND_CMPL_UNDR_RUN) {
-			xfer_len -= le32_to_cpu(icmnd_cmpl->resid);
+		if (icmnd_cmpl->flags & SNIC_ICMND_CMPL_UNDR_RUN)
 			atomic64_inc(&snic->s_stats.misc.io_under_run);
-		}
 
 		if (icmnd_cmpl->scsi_status == SAM_STAT_TASK_SET_FULL)
 			atomic64_inc(&snic->s_stats.misc.qfull);
-- 
2.27.0

