Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108150;
	b=W7pZoIgcdYbE8n+tWeskXcSBAsHr5bPr6qfVJblHp/a892OVWohWaoyvCBAhMIAYx56w
	 wdZgN9I8bHEx8CTSdhC6iHjsnp3gM1Vs65cHON8cq2vHMshUQ5N5D5fLi1Awc5Mhf+tFv
	 wdQemcZlcqo166pytEpmi2ci0rms+8wVA8XwoKNHo67pcec9Vj9u+aX5AqVl+snxvNJ6M
	 G/RxY5JrSJazCZVOrttQkZnCftpIwJNPbjkY2mtviz/hq+5hOCg+oSKlWB6aVjNC4KvWS
	 1WmUVutwxrVNyOYCpvNZYLQsgdIW1sOdBVSTWkRh6jR8rq1tm/lFt5Pi+U11I9ycDgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+J9B5x5CJ2GgYpJNi/eyfCmiUuk3TgTy4lgVddwqdZA=;
	b=wRLmUlehtoTkwuqbc5N1KqA9wH0XjBl+TPVYW1MoaYZG4ys1EJNWHCPTc/y9N76nclmj
	 uVVQ1YW8U9lrSXn7oGYWutBv7i76gcvBF3nkGrNFSsg2wr0K/ez9Hgbr5g31l7Rueq6No
	 86hv5UQk3CGJv7+FEc1RriWI7iKdVBb/pHtMhgcttBnn4WqaPUUE7+TTpwAK5wiA+v0NQ
	 hTXr1Nz40OLcNZfEg7lU/s86xM+XVvaRQmJIolMDfQfLgxn5Q0mMX7Cv2DLc/fcNR1w2R
	 RdoH/qf0XcRjTa/pbSqEVNirpedVPwGWNKDR8IBBbU+NebcJsORPFZqVI6o7N0eDNkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KXeVllMQ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73760A382A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B73760A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KXeVllMQ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso773227eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108150; x=1795712950; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+J9B5x5CJ2GgYpJNi/eyfCmiUuk3TgTy4lgVddwqdZA=;
        b=KXeVllMQsKSud6HzJLoepgS2BZmHKcWxbdUzzHJr802ZQp3EYETr+mi2sqJh4kfHXD
         rGz1nhDVK5y3xtZEc8dX5P5whjUxoEmCrgGcfrTdTZVVllgB9QGxbLaydtcQxvFN0gis
         fxAppX6FpoaHrir3SGUDHA4AQ66SS6inuevZyFWaT5Hp/Y4RnlaKw/B6IbC5C6IfG0TP
         fgVuPhn5uFHkrP/MnUWAN45RD3p/zkQvD366TY0o7CmCWoMfrcyM6J0Ec+mslwBJ56cB
         RSUk5pPrFuVuN0Hb01aiz8LPC+tagzmlz79pe0xg0fzNg4eq4esG0cjTT4PpDwEeSgMe
         25sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108150; x=1795712950;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+J9B5x5CJ2GgYpJNi/eyfCmiUuk3TgTy4lgVddwqdZA=;
        b=ySzjLVDee23EscomWDKj/IVbOQZVcVw4Oj7Ledfl+ZjDRtgeaYOJH4ZNJCbe6f21Pg
         wwdtTmVOloKJhPVg0TOiO7u6tP3QuW5afqmaF7ik8Xsy0004nyJtpn5cQx2ePmspCriG
         jvtnjKYYJ12KeUJADU4AiujosdfJG+nngt0Tb+UJc8WSfLuiwEeuQU8xjZ8kmdA4HI5P
         wGwy82bnmU/5iL83qExY0lBo6rUZDx8udfFIfrAaV2lajkwF0eH5YvJ44nOOMj5tYZGx
         bBaGotmj6kavN7V18RWH/M3TaVhzRARUnuRcYgwv4evecDcHF8pXXYZQ6UuwPq8Nzudy
         kL4g==
X-Forwarded-Encrypted: i=1; AL+hErHFd/T8/TPBFg0Hs2A7axh33cL8w2J3S5B6Hz7mI+dsW9PygfZ33fWUrvSZr1nIxgZkr+vj@lists.linux.dev
X-Gm-Message-State: APuU4Z/eQCIYXLWRwYqo1PzcJGfHeMUkeIU+e7NYwVndXkSyl3TfM5n4
	EFuhEtt9i5/irZGVTIxSAJ2XngcBQBu/v6Q7gSlVSNPzJmSouoZhMm6sazSV51XEPGQKxI+OxT1
	MwNmrYB8Hdg==
X-Received: from dyji33.prod.google.com ([2002:a05:7300:7a21:b0:36c:9a6e:5413])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:9e08:b0:379:7bb6:9c4b
 with SMTP id 5a478bee46e88-38281bfc037mr5432157eec.39.1795108149205; Thu, 19
 Nov 2026 09:09:09 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:05 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170905.1530613-1-irogers@google.com>
Subject: [PATCH] scsi: pm8001: Fix abort completion status in pm8001_mpi_task_abort_resp()
From: Ian Rogers <irogers@google.com>
To: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In pm8001_mpi_task_abort_resp(), the IO_NOT_VALID branch assigns
TMF_RESP_FUNC_FAILED (enum tmf_resp, 5) to ts->resp (enum
service_response) instead of ts->stat, leaving ts->stat at 0. In
addition, switch (status) has no default case, so any other non-zero
firmware abort failure status leaves both ts->resp and ts->stat at
their zero-initialized values (SAS_TASK_COMPLETE and
SAS_SAM_STAT_GOOD), causing sas_execute_internal_abort() to falsely
treat a failed abort as TMF_RESP_FUNC_COMPLETE.

Set ts->resp = SAS_TASK_COMPLETE and ts->stat = TMF_RESP_FUNC_FAILED
for both IO_NOT_VALID and default failure statuses, matching libsas
and hisi_sas expectations.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building drivers/scsi/pm8001/pm8001_hwi.o with LLVM=1 W=1
(-Werror) and -Wassign-enum, and with a standalone C reproducer under
ASan/UBSan; not runtime-tested on physical PM8001/PM80xx hardware.

Fixes: dbf9bfe61571 ("[SCSI] pm8001: add SAS/SATA HBA driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/pm8001/pm8001_hwi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/pm8001/pm8001_hwi.c b/drivers/scsi/pm8001/pm8001_hwi.c
index 55a01e533fd1..b8c59c152d89 100644
--- a/drivers/scsi/pm8001/pm8001_hwi.c
+++ b/drivers/scsi/pm8001/pm8001_hwi.c
@@ -3478,7 +3478,12 @@ int pm8001_mpi_task_abort_resp(struct pm8001_hba_info *pm8001_ha, void *piomb)
 		break;
 	case IO_NOT_VALID:
 		pm8001_dbg(pm8001_ha, FAIL, "IO_NOT_VALID for tag %#x\n", tag);
-		ts->resp = TMF_RESP_FUNC_FAILED;
+		ts->resp = SAS_TASK_COMPLETE;
+		ts->stat = TMF_RESP_FUNC_FAILED;
+		break;
+	default:
+		ts->resp = SAS_TASK_COMPLETE;
+		ts->stat = TMF_RESP_FUNC_FAILED;
 		break;
 	}
 	spin_lock_irqsave(&t->task_state_lock, flags);
-- 
2.56.1.708.g77570a6a1d-goog

