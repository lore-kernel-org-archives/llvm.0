Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310A79DE
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680279984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AvuVQhbB6sQNpw8Mymcj39/nOL4/GBRsblrkJXNADLc=;
	b=N+kktxco0+zwUemoQR4wXD0cK9S9AqQhQhtBY1UDlHxiEsM34SgBZMCIN3RJCmSe4jx7yG
	3EFusgMbc9RHBN4n7nRG0ZZYdQ326x7zwxMwNmolcncRTeQ3iJF5/OUkiR4QFAZf48gvNx
	qry+EIoo8rnLgGIdy0M9Vtk0Pd8mygY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-iiUphpQNNcSIhJa5yR0cgw-1; Fri, 31 Mar 2023 12:26:21 -0400
X-MC-Unique: iiUphpQNNcSIhJa5yR0cgw-1
Received: by mail-qt1-f197.google.com with SMTP id l2-20020ac87242000000b003bfecc6d046so14981581qtp.17
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 09:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680279980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvuVQhbB6sQNpw8Mymcj39/nOL4/GBRsblrkJXNADLc=;
        b=xVazZUAa4c4YQfF1WTLZ/RtvKre/n54EB7LK0J+bFAqkFYQk8JtM/KRpnbeU18Cazq
         e2zirHwhIgbrbl8n/YzN9uQq8CQGLlOCzLO0fT2wcTANYvU1MuGy8C06RBNckvPpezH7
         xhnjRKrBpG/kNKO0xGqiOiWE5xliCN4SxvuBH8EQssCkxS2kbsYvcF1Ir0qdDHJchu+7
         RiIVVxs95o2myCv73RtBVlGOTjY/HdS6UBrWCN4f/+dtgBbC3FTYHlDKSYyO+UywOyrQ
         dvqt2YkGZwdY+SoKpBtefwQvUD5T7y5liBZwLyXDwmxJlzN5yEgG9tHxKuTXW8O6GCV9
         gMeQ==
X-Gm-Message-State: AAQBX9dAyBgPQxw9Zk9Y5fP/wEA+a3sOLiVy/37aGhAXD1PVTNQ85rpn
	z0OFo22etqXZ1K5+bcJ/Xv9aBee/JvuTpM0Ju7A9uiJ0cZxJAoXzSqOWmJKNict+bLOEtbb7gtQ
	Bs3OAKcTMrQRXmA==
X-Received: by 2002:a05:6214:29e6:b0:5c4:2d5b:9ecb with SMTP id jv6-20020a05621429e600b005c42d5b9ecbmr45686512qvb.44.1680279980623;
        Fri, 31 Mar 2023 09:26:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350YD0+MFLtyL0hz01T2VfOCtBoAHzNkgeAtkgnyc80Jt1xyT6cWzJEU09c2avvC5ytNcGXvx6g==
X-Received: by 2002:a05:6214:29e6:b0:5c4:2d5b:9ecb with SMTP id jv6-20020a05621429e600b005c42d5b9ecbmr45686486qvb.44.1680279980365;
        Fri, 31 Mar 2023 09:26:20 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j2-20020a0cc342000000b005dd8b93459esm711514qvi.54.2023.03.31.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:26:20 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: sathya.prakash@broadcom.com,
	sreekanth.reddy@broadcom.com,
	suganath-prabu.subramani@broadcom.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] scsi: message: fusion: remove unused timeleft variable
Date: Fri, 31 Mar 2023 12:26:17 -0400
Message-Id: <20230331162617.1858394-1-trix@redhat.com>
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
drivers/message/fusion/mptsas.c:4796:17: error: variable
  'timeleft' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned long    timeleft;
                         ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/message/fusion/mptsas.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
index 86f16f3ea478..d458665e2fc9 100644
--- a/drivers/message/fusion/mptsas.c
+++ b/drivers/message/fusion/mptsas.c
@@ -4793,7 +4793,6 @@ mptsas_issue_tm(MPT_ADAPTER *ioc, u8 type, u8 channel, u8 id, u64 lun,
 	MPT_FRAME_HDR	*mf;
 	SCSITaskMgmt_t	*pScsiTm;
 	int		 retval;
-	unsigned long	 timeleft;
 
 	*issue_reset = 0;
 	mf = mpt_get_msg_frame(mptsasDeviceResetCtx, ioc);
@@ -4829,8 +4828,6 @@ mptsas_issue_tm(MPT_ADAPTER *ioc, u8 type, u8 channel, u8 id, u64 lun,
 	mpt_put_msg_frame_hi_pri(mptsasDeviceResetCtx, ioc, mf);
 
 	/* Now wait for the command to complete */
-	timeleft = wait_for_completion_timeout(&ioc->taskmgmt_cmds.done,
-	    timeout*HZ);
 	if (!(ioc->taskmgmt_cmds.status & MPT_MGMT_STATUS_COMMAND_GOOD)) {
 		retval = -1; /* return failure */
 		dtmprintk(ioc, printk(MYIOC_s_ERR_FMT
-- 
2.27.0

