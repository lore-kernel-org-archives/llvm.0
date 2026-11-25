Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645683;
	b=XhcXly/AJBXfeAT4baEtYU/c8jCvczR3H+z+zxkSL7Yrp3wivF4i0bzjP49zU5OQtMJt
	 P22UWI1evwW4XnYBaumoQ9I/mZ2umsRk5LGVykc3/0BRlzs59908OwUMw/WQGekFPXu0e
	 MK7K5HsjUbY28Rsdqto621WBck8W0b/TMq2X/HPkHBHUksHkSJhqaD4Iv72b38uBCOEtV
	 jWV/DzM3WwflfRuYWsdW0/XxY5PTtLHYF7B2LL70cr2pcFfmyKDVNUKGt833U+A2Cmrk1
	 cn+I2Rw8vHUGEbvalAriTGiFuAeJsC9G9gtFjD/vGa7fPIc9v7zL/SACc8Ve2yKduxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pGLqG+R6IwEUEhnoQECM2DID9vMzArkmStKfaJkmTj8=;
	b=GPkdKsWwCtvyej7G8pUaKwZ0ta66FMmC5Ssd94QKE+4T0aHuV8IT7gfckCkSRKuTDy8Y
	 /VzWsNZe8st9DNuToTlCRRV4bDgsMxc13z0KCCcNHyVHmfTltDma2CO6cCIDaBONJxqnG
	 SI4K6ExADg6ZyKj9Vlsv3oJ9UbWzv9LK6G6TN4hxOU1kj9B4zrZx5PlKkwh0nifuGfbhS
	 pM1XpF8KIrLo/uKxwq6CXE9gxB9yB6kd3ievOomPrZNuZQUtHNGwLv8Wih1L/7BCZAZto
	 v0g7ofspKe1PWDUZVk0h9DpBQ76oSlYcKskeckXRarUaFee1YRKjQ8x5Ta9juq6zsxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fiDNHpCm;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4384606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4384606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fiDNHpCm
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so2722836eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645682; x=1796250482; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGLqG+R6IwEUEhnoQECM2DID9vMzArkmStKfaJkmTj8=;
        b=fiDNHpCmPbkjI2hOWg3+KGRRChpmBVU1ohusNJvFY+Y6Be8esv3Ie/CNGurGH7fQDM
         SLNlZ1tpN4vQGDxJpLgpyzs9gi92keLi1TeO+vKaKFou/RG0N0JOyQ0+Eddlhmsz0Zzj
         dLY9Kgj30sAVPVf0vn4jtdk4GlvABJ7tjPJezvMXgqcooU6g5FGXep3atCqe3koytUrS
         vzeajCGTj+vXQGWbuLNh77jQpUPriuThCb+LBugIk55PCJk+hckyjaVrRTmobL77VoMg
         FF8H5FijvrlB22hviruJxnLZkd6+tAtu2XOfi2Y1GsK6rvHU/A2AZzXmgDNueUcueSVm
         sbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645682; x=1796250482;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGLqG+R6IwEUEhnoQECM2DID9vMzArkmStKfaJkmTj8=;
        b=hEGmA+6lSLf1s6rAwO2xwxn/Wo5Z27aNWPSTEBzURPkh+xkpzA9w3RKQIgiq8ztj7p
         RE/1YPL3zmTfym/TEo1tHtWty0ANoIpYKJedERQsAFxeYS4MEQZ+jdfhqmxUS6FoLDSf
         ofKulsnaj6yFAx1S/DlVVM/Ua2sud4axaVmub1O23gp+8AmGNVdgbAnQk03wJlcspmi9
         dzsoVrWk+KE9dbPQAJoJwhgR7rx7wNQsutMnK0X82iRkD9ezqfSn5wqQbi6zoUfFuR9x
         fVmynssX1m4ys/Y6WJjA/3fXROJEpDcF5JNpghUvub2Yx2pGX+kziZkBxwhyCPem0Uqf
         cImg==
X-Forwarded-Encrypted: i=1; AL+hErFABtV8uJpTWZc27UGyagp0oCc5PCn2/ZcBW0GO5SuYpKlaHAIUWtKlqi9eTFbcdpe0O7Bt@lists.linux.dev
X-Gm-Message-State: APuU4Z/HAtH/NAENrW89hz0VcQcOyNnn9bbIDGdu4BGh8bQ8f9kgL+Ao
	icZaZy3Qr5crhB+WLmLZQIMQGRAXaVpclpP+WkhIP75Y6jsllD/bCzQKFiYbQbUrpz/fl7PEGku
	H5Q==
X-Received: from dycmv2.prod.google.com ([2002:a05:693c:2802:b0:386:b5d2:c426])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:dc3:b0:386:ce5a:41aa
 with SMTP id 5a478bee46e88-386ce5a47f9mr3340721eec.13.1795645681576; Wed, 25
 Nov 2026 14:28:01 -0800 (PST)
Date: Wed, 25 Nov 2026 22:27:29 +0000
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
Message-ID: <20261125222729.1450842-1-elkin@google.com>
Subject: [PATCH] sched/core: Avoid atomic cpuset_lock() in __sched_setscheduler()
From: Elkin Cruz <elkin@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When Magic SysRq-N invokes normalize_rt_tasks(), it holds
read_lock(&tasklist_lock) in atomic context and calls
__sched_setscheduler(p, &attr, false, false) with pi == false to reset
real-time and deadline tasks to SCHED_NORMAL.

For a SCHED_DEADLINE task, dl_policy(p->policy) is true, so
__sched_setscheduler() calls cpuset_lock() (mutex_lock(&cpuset_mutex))
while in atomic context under tasklist_lock and then skips
cpuset_unlock() on exit because unlocking is gated on if (pi), leaving
cpuset_mutex permanently locked.

Guard cpuset_lock() with pi (matching the non-atomic caller contract,
where switched_from_dl() releases deadline utilization under rq/dl_bw
spinlocks) and call cpuset_unlock() on exit whenever cpuset_locked is
set.

Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
Signed-off-by: Elkin Cruz <elkin@google.com>
Cc: stable@vger.kernel.org
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 kernel/sched/syscalls.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index a5ff3c47e9ea..f44fc426404c 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -575,7 +575,7 @@ int __sched_setscheduler(struct task_struct *p,
 	 * SCHED_DEADLINE bandwidth accounting relies on stable cpusets
 	 * information.
 	 */
-	if (dl_policy(policy) || dl_policy(p->policy)) {
+	if (pi && (dl_policy(policy) || dl_policy(p->policy))) {
 		cpuset_locked = true;
 		cpuset_lock();
 	}
@@ -724,11 +724,11 @@ int __sched_setscheduler(struct task_struct *p,
 	head = splice_balance_callbacks(rq);
 	task_rq_unlock(rq, p, &rf);
 
-	if (pi) {
-		if (cpuset_locked)
-			cpuset_unlock();
+	if (cpuset_locked)
+		cpuset_unlock();
+
+	if (pi)
 		rt_mutex_adjust_pi(p);
-	}
 
 	/* Run balance callbacks after we've adjusted the PI chain: */
 	balance_callbacks(rq, head);
-- 
2.56.1.839.g22a8290db9-goog

