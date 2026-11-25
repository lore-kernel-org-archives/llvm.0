Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645263;
	b=zFheRPIZ8Kz25TJjZKu4QAaU6n9Yshq8W5lRKc9emyzcRYyrZDz2N98fFK9rYEkR27Hi
	 +RNco3BtywYSN1nBulPe+kLdYGVFEVWCBOhXHRVUgJfH0V2s/qN+C66u85oFN02Oq6poW
	 V4XTbpKx0/E6TJscWbQ+wkzcEJvyVVQHopMVqoTmJgtZTbYDcqH4rXTzM/alKXT2oQsOz
	 sZrvvwUb8MSsB9c42nAOX9bDYt3Kjn9/2vaSzAscZuYCh468KiskR1N5u1DGNfZofumsS
	 mHd8JgIrkPlQS9XSdNFkPjNZExnwLvuDePjga5+sKRUdmTUSvQdu8WxwKahuFiMJBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=eRKibpmzTNA+GjiY0JkXP7GhIa2AHFH27weV8F24hYk=;
	b=BaxToLHWpmX/GiA+psnqn7Xwxxm9yyrj8ab3/Cv+jVG1DIhYy8xBmJDC7oZmiF/Hm9XL
	 EZl4UfP0o5is4ai9DFPYZHD57HDnZk5PBYkj95wwpBkmdYr4CP6VUniniJvjfDy/L/erj
	 kAAXtdmF8KeSXcdzCpyqM6Y9mrITrTgHuJ2JP7teh93jZrqFYVVRwUJZXB0FNJtYohglv
	 tA3Qc0SNwli2rc82tQ7eZMhzSg+rSRPX942PJ9KDfFG8xHDxt3dOOPK10/62gqc7G6OZf
	 gXMjS9+FBdN2MZAKGzdjUmRIMLv4/v1vb1rHDpTENt8DjGxRXhax/KP046AZAGABuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X1a1tm3j;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB0606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BB0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X1a1tm3j
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8366529eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645262; x=1796250062; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRKibpmzTNA+GjiY0JkXP7GhIa2AHFH27weV8F24hYk=;
        b=X1a1tm3jCjkCvxHtWngnsQCwvPtYuUI9Lwcfa5ISgdWyO9ZRSqOvo1UmNjR0RqRngK
         HC7tPHGSST2thYWhDb7n6wiv3OcOpP1tqRFtX/GMuUKBWhDQpAFAbMD1RlFf0nukxUlL
         iu5uJ1x4pUuUZuhPxAvDvdv5RBGAwhnNIbufFxAMrf2EVofImDAZ93L28DvXWQoq7guN
         eBlyAub8Eh+YgfEcTM04ti3UdSfGy715RYco0bXugl8LJoKENQqE1wSy22K0+vAGAnAP
         47FniEQb2OaGyfw8gXDbDSSUko0I+3eMeQORnQdQy6XwEKDUyVzYTjL3Vq5HMcdS/F52
         EkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645262; x=1796250062;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRKibpmzTNA+GjiY0JkXP7GhIa2AHFH27weV8F24hYk=;
        b=ByBAvKANvupo4/OqkDelZQULnB9FKB9+qalCJ50Afntq6tvO7hInJfB3lSiqBo16tr
         FPujbWEObiviBmuxaZ8m4l3lm5whQvCvHcYtr1sg+Mky0VXjlFDW7zt8ksMPwv3FeeAP
         qPAe8fZj4znthvmMs3AEZOCzXYD6kY01262wMLVTF9E7nzMplizMDHY28KHfPRf5QfzU
         DQvXe35HgC1OGN37561qFWuulvKtaF6aeM2tDA0RWXAxxbCNqjJQXao2yUO63oqzvLbd
         Kr0WCE4R50ir6ES/5c4P9TZJg5SSKP4Gj1+bKK8PtEeucrZAE/oZ63zLadsjCse3/MfH
         GCDw==
X-Forwarded-Encrypted: i=1; AL+hErH4SW8GXlgrYdJyvABEzshgrnBJBgptz7mTYEtkBRlYqxGKJMwBAYtjgWxBkVoVQMNX7v7N@lists.linux.dev
X-Gm-Message-State: APuU4Z/zZsNJXdQAqIVCWrVH/lXT+fEZyrWdwdpQOZ9q0gCR1WpEEy01
	QBuA2qzYaAzFd3jREKyAsN15Fz2c6/P1eYklykOFo0yVtodIAIHdDLhE1DQ9XxziUJFdHI9Hvaq
	Y9Q==
X-Received: from dya19.prod.google.com ([2002:a05:693c:6213:b0:381:1c8c:a899])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8084:b0:36f:4981:da16
 with SMTP id 5a478bee46e88-3857073f5ebmr18366493eec.25.1795645261942; Wed, 25
 Nov 2026 14:21:01 -0800 (PST)
Date: Wed, 25 Nov 2026 22:20:29 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222029.1429071-1-elkin@google.com>
Subject: [PATCH] scsi: hisi_sas: Avoid synchronize_irq() under task_state_lock
From: Elkin Cruz <elkin@google.com>
To: Xingui Yang <yangxingui@huawei.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In hisi_sas_abort_task(), when SAS_TASK_STATE_DONE is set, the driver
invoked hisi_sas_sync_cq() while holding task->task_state_lock with
interrupts disabled. For interrupt-driven queues, hisi_sas_sync_cq()
calls synchronize_irq(), which may sleep (while for poll queues it
spins on cq->poll_lock in hisi_sas_sync_poll_cq()).

In addition, once SAS_TASK_STATE_DONE is set and task_state_lock is
released by the completion handler, hisi_sas_slot_task_free() clears
task->lldd_task, zeroes slot->dlvry_queue, and frees the slot back to
the pool outside task_state_lock.

Release task->task_state_lock before calling hisi_sas_sync_cqs() on the
SAS_TASK_STATE_DONE path, and read task->lldd_task under
task->task_state_lock when setting SAS_TASK_STATE_ABORTED.

Fixes: 584f53fe5f52 ("scsi: hisi_sas: Fix the race between IO completion and timeout for SMP/internal IO")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/scsi/hisi_sas/hisi_sas_main.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index 06455c7a9e2a..2a5a34eb1b28 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -1730,7 +1730,7 @@ static int hisi_sas_abort_task(struct sas_task *task)
 	struct hisi_sas_internal_abort_data internal_abort_data = { false };
 	struct domain_device *device = task->dev;
 	struct hisi_sas_device *sas_dev = device->lldd_dev;
-	struct hisi_sas_slot *slot = task->lldd_task;
+	struct hisi_sas_slot *slot;
 	struct hisi_hba *hisi_hba;
 	struct device *dev;
 	int rc = TMF_RESP_FUNC_FAILED;
@@ -1744,21 +1744,18 @@ static int hisi_sas_abort_task(struct sas_task *task)
 
 	spin_lock_irqsave(&task->task_state_lock, flags);
 	if (task->task_state_flags & SAS_TASK_STATE_DONE) {
-		struct hisi_sas_cq *cq;
-
-		if (slot) {
-			/*
-			 * sync irq or poll queue to avoid free'ing task
-			 * before using task in IO completion
-			 */
-			cq = &hisi_hba->cq[slot->dlvry_queue];
-			hisi_sas_sync_cq(cq);
-		}
 		spin_unlock_irqrestore(&task->task_state_lock, flags);
+		/*
+		 * Sync all CQs to avoid freeing task before IO completion
+		 * finishes using it; slot and slot->dlvry_queue may already
+		 * be cleared or reallocated once SAS_TASK_STATE_DONE is set.
+		 */
+		hisi_sas_sync_cqs(hisi_hba);
 		rc = TMF_RESP_FUNC_COMPLETE;
 		goto out;
 	}
 	task->task_state_flags |= SAS_TASK_STATE_ABORTED;
+	slot = task->lldd_task;
 	spin_unlock_irqrestore(&task->task_state_lock, flags);
 
 	if (!slot)
-- 
2.56.1.839.g22a8290db9-goog

