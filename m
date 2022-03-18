Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84415AC
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 00:39:30 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r6so9708061wrr.2
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 17:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7gsTkrihCJqnEHPeTUREyY+grPIvlwOYy2RYZrHaUHI=;
        b=FLPx3v9O3yp794Fc9m8+3Fms180PmpDjbtrLO0Xu1i8qXrAd/9enHHAeShbg4oSb7t
         md9G09lQyD5JyMP0ZOdKfNy4zxT1/xQDszXVsxP0F/x1wl9DLVVpLchZbrsin0Bk66P1
         6vop8DECEbBHRj1ikoWDW3T6qUgGUzdvVDfOLlDTvrq+71zXZi95SfBq+N42khglWfuX
         awl0h72ycsBAS7Vc2MvCwZJOkRdTx/T8lBcQ45hjGnfQ3EcTD2ycbkgFp385z3MYIC6P
         APBPni1nM3HPfu7A1b4AouHvNpwkbgHS7k3Dshz85Qn2R5p6/e7AC7alVu8nhg2wvHKX
         yjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7gsTkrihCJqnEHPeTUREyY+grPIvlwOYy2RYZrHaUHI=;
        b=bC6eS63SiWSU+sfpR/mAxNeSBHwNCz4vMGmgXKMQJ/siy+dwEgYgQgKaGg6wa5KPnd
         vwSCAIVE4MnLrbST3RMsM6hX0uqlStF638bhcrJRcn0kYbrqIt29aWCKlZ7kI/09KCMI
         Shd6S7VAfZsOUvvSOmrOgPxFbk4/Xn84NkhvM/Mo46OVQQe/PbHorYUWDUO7ddcBM4j2
         MzFO8j9xPL4uOI7ey4W+jPzxKbY8JgK9AAJogmiRU16u7q1dAGJLjGDBHe07e8kwgUSt
         iOQzHdX8e8JQEKvTywuCHQ8myjhLYjSTPxZGLr113O7p5hPUP6XC0tKLOBiB/k3O0dFm
         lT2Q==
X-Gm-Message-State: AOAM530w9T1eA0mWwLS1Aof5yPHEChx8bsZLOlrh6vA+xr1PvvpjfDk1
	Gi9mBKGDovsQpzeQcfiquMiCqik7Zuau1Q==
X-Google-Smtp-Source: ABdhPJwoQZOjUskNt5TU0ZyJE8Ju4uZEdL59fCI7gDoWZSkg2jY3/M90ILkKoeR3EvRnfG/qXKEatQ==
X-Received: by 2002:a05:6000:18ac:b0:203:ecad:a203 with SMTP id b12-20020a05600018ac00b00203ecada203mr4249744wri.177.1647563969021;
        Thu, 17 Mar 2022 17:39:29 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id 2-20020a1c1902000000b00380d3873d6asm5533293wmz.43.2022.03.17.17.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 17:39:28 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] scsi: message: fusion: mptbase: remove redundant variable dmp
Date: Fri, 18 Mar 2022 00:39:27 +0000
Message-Id: <20220318003927.81471-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable dmp is being assigned a value that is never read, the
variable is redundant and can be removed.

Cleans up clang scan build warning:
drivers/message/fusion/mptbase.c:6667:39: warning: Although
the value stored to 'dmp' is used in the enclosing expression,
the value is never actually read from 'dmp' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/message/fusion/mptbase.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
index e90adfa57950..9b3ba2df71c7 100644
--- a/drivers/message/fusion/mptbase.c
+++ b/drivers/message/fusion/mptbase.c
@@ -6658,13 +6658,13 @@ static int mpt_summary_proc_show(struct seq_file *m, void *v)
 static int mpt_version_proc_show(struct seq_file *m, void *v)
 {
 	u8	 cb_idx;
-	int	 scsi, fc, sas, lan, ctl, targ, dmp;
+	int	 scsi, fc, sas, lan, ctl, targ;
 	char	*drvname;
 
 	seq_printf(m, "%s-%s\n", "mptlinux", MPT_LINUX_VERSION_COMMON);
 	seq_printf(m, "  Fusion MPT base driver\n");
 
-	scsi = fc = sas = lan = ctl = targ = dmp = 0;
+	scsi = fc = sas = lan = ctl = targ = 0;
 	for (cb_idx = MPT_MAX_PROTOCOL_DRIVERS-1; cb_idx; cb_idx--) {
 		drvname = NULL;
 		if (MptCallbacks[cb_idx]) {
-- 
2.35.1

