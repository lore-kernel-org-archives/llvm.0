Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108145;
	b=LCTBZIbBrLZT8QiN/irZepMvYt1KCYQ5cBe4DtHAroHPvt+mQ+fxjW2gt7t8wTJEDcRm
	 7eJmtIbeNhVSttfANhbZmiWL9rY7skN06gLej5h0MlEXzB93gFRYjDRxhcrz93QGweemx
	 8dsuipXE5tPN2uaHOE18XT3DD76WeKqsRUiw4arPuZqUe2LR3Q8fTHGRJfx7icmRHHqZK
	 MTo0wJ5gLVO7l1PxcKAYVkGOaicHOpDkPQbnqFFGWATb9iglX1EPFwP+Cx8gRjkShjWfY
	 i37cjYPmdTXz+pjoDnVIxhmUmZKWovyUXEHcZ2rnWHcFgW7m+8uv3S7j+wlD4mGPv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=qewKek18Cekp1MLnhZnBB0dbzkIZGz1GDnRfqgtaoNs=;
	b=eh1VnI/a6J4Lct15cC7Aag7UGAYiqOzrLN0kwpp9dVilg8Brzp3TsLiZt3r6bbYWacBU
	 vEqohToAlFhjzz9JIowuMrnUKvIcaeri5d2359kZuO4ljZxsr93/oDWKfjUtH7giJNcfB
	 Mn3e8DoMJ0prEKXIq0EPoRrTXIJbt4H4WpafLdWF7t6ZFPwI9s6AtRicNjqK5PkoNBJed
	 1WElezASO8nWeTj2qpzpum4aLB84W1TtagdEM/0viJ2T4qWkVx4ccn1iA005r3eX9uxg9
	 hEJOAbDp2j1N7VPDI937lutQRVF1sQ5bPhrHS2sDEJytLZOVHCm2FOUOu0C083PZEyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jRXkhX+f;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B67606A320
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B67606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jRXkhX+f
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so6389010c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108144; x=1795712944; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qewKek18Cekp1MLnhZnBB0dbzkIZGz1GDnRfqgtaoNs=;
        b=jRXkhX+frLQFcXxzo3dFLXua3FmfVUGo+hFDokfX8FGb/JZQOagIO4t2kRKVCDHD/7
         UprU9eRgbeapzmkPPJLJRHt8niV1OqQZlyIgWgu3cvCl3qCN3a8vm0kfR6ICno20NMYn
         5MeonyTnhcD7PaGV09lBY0rYgYE8X6yWEETcoLu7deqJObrbzhU8QfLAwMG2gvaSPDLj
         0UNsnM076tJmnHmKrgkjdkS1RCSzuOQ+VtkZ1KnfzelPkS8R5bogYx77lnvyrm0WZvkG
         9LjS5T/au8ipAWn2jbbLr8DZ5QmdGG1c3MQvxDCx/LADEBZ3Zk+XSOSHK1P4gZegRebW
         c7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108144; x=1795712944;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qewKek18Cekp1MLnhZnBB0dbzkIZGz1GDnRfqgtaoNs=;
        b=rdDWyNA1yTt2Phe1qA3CGbCEX+iplAmbsk2IIPstTXEspZV6KqGPhNzI1DpeSWSy0W
         2p3+LtOgoiqR2i/1nRNZmowKPtxXfajtTkCJH3uyQqoLcwK79zcTH4w0Dd3tYnPU10Oh
         iKCg1nL9P5+C+QNy3OImlullo2oRPTA3/uhx3BJX09YdMguC36Ht4SEQTEErLDAw1817
         ijVzJiMIMwirrAsbeFGyiPqi6a74Vr2AWD2X/xxIr5V1blblltEeW5i8fFZsx02YC2SW
         VUXFwvKsoxLop3jqOWzRPNep4mEabNVwpKj9l9k3may3RLa1evzTWnRreuzkpKy11/Ke
         YTdw==
X-Forwarded-Encrypted: i=1; AL+hErEPF6siF8w3xRicJjly3pGcQmB8gf7XPEoK7VvGlsEqcNJ6ZFBnf0MFGsOBIKzGcMmjYuiu@lists.linux.dev
X-Gm-Message-State: APuU4Z+KDoxt1KweJFvZddhyOPp4fiQg3xsrNG7fmTh0KP6aJg6TzXQ7
	vy9uRuCRxDqBHV9T8PthYmW6BoLW9snq7pPIm06g1dLipCiotnVNo+irUIkk98Y/ohQNONwO+3q
	fdwX5YfBp8A==
X-Received: from dlep8-n1.prod.google.com ([2002:a05:701b:4588:10b0:161:df69:3983])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:5f08:b0:144:c112:5f24
 with SMTP id a92af1059eb24-1b5568f9e24mr242758c88.25.1795108143195; Thu, 19
 Nov 2026 09:09:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:00 -0800
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
Message-ID: <20261119170900.1530138-1-irogers@google.com>
Subject: [PATCH] scsi: mpi3mr: Fix start_time and error return in mpi3mr_bring_ioc_ready()
From: Ian Rogers <irogers@google.com>
To: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
	Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

mpi3mr_bring_ioc_ready() has three bugs in its failure and retry
handling:

1. start_time is only assigned after MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC
   when retry == 0, after three earlier 'goto out_failed' paths. If
   soft reset, reset-state polling, or admin queue setup fails on the
   first attempt, out_failed computes elapsed_time_sec from an
   uninitialized start_time, and if a retry occurs (retry == 1),
   start_time remains uninitialized for the ready-polling loop as well.

2. In 'elapsed_time_sec < (mrioc->ready_timeout - 60)', ready_timeout
   is u32, so values below 60 wrap around in 32-bit unsigned arithmetic
   before zero-extending to u64, spuriously retrying past the timeout.

3. After mpi3mr_setup_admin_qpair() sets retval = 0 (or on entry where
   retval is initialized to 0), controller fault/reset-history checks,
   ready-state timeouts, and early unrecoverable or device-not-present
   exits return retval == 0 (success) to mpi3mr_init_ioc() and
   mpi3mr_reinit_ioc() even though controller bringup failed.

Initialize start_time = jiffies at function entry for pre-enable failure
exits, reset start_time = jiffies the first time
MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC is written so pre-enable waits do not
drain ready_timeout, rewrite the retry window check as
'elapsed_time_sec + 60 < mrioc->ready_timeout', and ensure retval = -1
on all failure exits.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/scsi/mpi3mr/mpi3mr_fw.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized, and with a
standalone C logic reproducer under ASan/UBSan; not runtime-tested on
physical MPI3 hardware.

Fixes: 59bd9cfe3fa0 ("scsi: mpi3mr: Code refactor of IOC init - part2")
Fixes: 0a319f162949 ("scsi: mpi3mr: Wait for diagnostic save during controller init")
Fixes: 9634bb07083c ("scsi: mpi3mr: Enhance the Enable Controller retry logic")
Fixes: 4616a4b3cb8a ("scsi: mpi3mr: Improve wait logic while controller transitions to READY state")
Fixes: fb6eb98f3965 ("scsi: mpi3mr: Handling of fault code for insufficient power")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/mpi3mr/mpi3mr_fw.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr_fw.c
index f0d3cd398dd0..b92b2467e995 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
@@ -1582,8 +1582,9 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 	int retval = 0;
 	enum mpi3mr_iocstate ioc_state;
 	u64 base_info;
+	bool enable_started = false;
 	u8 retry = 0;
-	u64 start_time, elapsed_time_sec;
+	u64 start_time = jiffies, elapsed_time_sec;
 
 retry_bring_ioc_ready:
 
@@ -1595,6 +1596,7 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 
 	if (!mpi3mr_is_fault_recoverable(mrioc)) {
 		mrioc->unrecoverable = 1;
+		retval = -1;
 		goto out_device_not_present;
 	}
 
@@ -1621,6 +1623,7 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 		if (!pci_device_is_present(mrioc->pdev)) {
 			mrioc->unrecoverable = 1;
 			ioc_err(mrioc, "controller is not present while waiting to reset\n");
+			retval = -1;
 			goto out_device_not_present;
 		}
 
@@ -1654,6 +1657,7 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 				if (!pci_device_is_present(mrioc->pdev)) {
 					mrioc->unrecoverable = 1;
 					ioc_err(mrioc, "controller is not present at the bringup\n");
+					retval = -1;
 					goto out_device_not_present;
 				}
 				msleep(100);
@@ -1690,8 +1694,10 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 	ioc_config |= MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC;
 	writel(ioc_config, &mrioc->sysif_regs->ioc_configuration);
 
-	if (retry == 0)
+	if (!enable_started) {
 		start_time = jiffies;
+		enable_started = true;
+	}
 
 	timeout = mrioc->ready_timeout * 10;
 	do {
@@ -1731,7 +1737,7 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 
 out_failed:
 	elapsed_time_sec = jiffies_to_msecs(jiffies - start_time)/1000;
-	if ((retry < 2) && (elapsed_time_sec < (mrioc->ready_timeout - 60))) {
+	if (retry < 2 && elapsed_time_sec + 60 < mrioc->ready_timeout) {
 		retry++;
 
 		ioc_warn(mrioc, "retrying to bring IOC ready, retry_count:%d\n"
@@ -1739,6 +1745,8 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 
 		goto retry_bring_ioc_ready;
 	}
+	if (!retval)
+		retval = -1;
 	ioc_state = mpi3mr_get_iocstate(mrioc);
 	ioc_err(mrioc,
 	    "failed to bring to ready state,  current state: %s\n",
-- 
2.56.1.708.g77570a6a1d-goog

