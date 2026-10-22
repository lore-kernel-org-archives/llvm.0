Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646241;
	b=VSVppOphHUqtxFlFU5ic9jaFfFmTobWmrb/j2zPlNHjWNnI+N0tJ0xNVKeT/1eDSdTYK
	 6jYcp6xLMk36MZIfcj+iMG/TBjHpoJCiNItyjzrwIV9tQW0iLjZPrRnGp09w6E4adOYQp
	 CB+Ljn0TOqX2gseG4JPcHT4EfLbkUHQknJVOESXHH0oKhmEkb8INegyF897PPwIH4BSNz
	 KzD2+gnWZMCTvdmwbILdWZ1KaW2EIt3jpZrMss0twh6U6oNRR8K1Vgf/FnZYYBMhEjZGc
	 0y2VBXLBTYmYpjt9b1YJ22A9Phcgv7EblD/k1ede+PR39WDA/yrp+PvMyPg2INPbHwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
	b=jhkHzotqUNW4/Ew3ejgJFBwCK/oXW+HTVy7Nye8dpoznCWSxyaPeTsAisPXRxFv0Yldv
	 4RzqZa9ZhPXPVQK1+4017MLi7Up1FI+LhTgif4qmAUezqueqPF9J7xQHVFQ6nAplTOOXJ
	 DXwewulstcTwsIgutVXCa8knZrjWLlpU7RJuMRQF4zNkKYZZIxCglJRqumdpDy9EktqZS
	 6heftVVWQeSm31Kpz3z36NDt2QPy5B1AC1ZL2z8rYhwyPvH6GiYJ/rGSnoa1W/HIP8wR4
	 fYH0s/c3hL5IWModtooxGl+sC4Ndc4L8pZZmh768QWY7exb4/AVTdCnZONLa3CThZjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TkzokhiI;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16D60A2606
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA16D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TkzokhiI
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so5311235e9.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646239; x=1793251039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=TkzokhiIiKW8elL8wTqoTQXc2wsOTA4iobUnIDPrbeicmU2j9s7id4geGLKXTTITgb
         jsi3MkisROX1sO9UMBloghPFgyrlgZ6CMEMm7Uf24QmgTxil3wAIx5jGYiFHvNjz0ltK
         w4I6CjQs1XxW2DRKa+F3kWA6curxUn/e7sh6EQ8y6PkYNs+S/yy7kMT2DOeUuap2TD1Q
         2hfcnqYJchf7+LPpMgXQ/LNedHaQZX62BFa7Gzsm3xxU5gCc5fE/XIGtG1iNCurodc1n
         sxlYULBOM2lWTYWFckUdq8J199V2TbLgxIU5WwnD11KwrVCTUnAuosrq1LMlDV+wnBhc
         aLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646239; x=1793251039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=uYOCBKk2r22Bzg4hGvXs5TXLs1KGlgnUd+5MNsPc0s90Q4auuYWg9GN857D6z81w+g
         d1X9BB3vzHAsHXgmbt9/cQDc3R0U2Q1AwADshVjj8gklFyXdgMs/LEkagQM/KTRXEE7w
         6Ojabqlipz0hYrO94Zu2A4vek9GDOW5BhPoa23RGUmLt7Z5Z+iWfcZSwAs2RGam2KyMm
         4agfMssmdhf2ZibSflcKBGe8apQR6pwIKTf54EOn5MzU3HvtCn8/dxIXuKhDODZzs+fE
         QuDez+6wEBmjfqnEevzqNZeD3swTc9OAIBpG48AaU6kjPjStYKAhSdPyUHqn6lrkmSWa
         EfDg==
X-Forwarded-Encrypted: i=1; AKwUvBzwHYbwZm2gPc8ORMkJM815Eq75OcDP7mD3SJiF1BIZ88UusyF+gaVWUoNfeSq6Q4no10vN@lists.linux.dev
X-Gm-Message-State: AFq9FYI4FjCpQGTWM7JA2qviknaaDm+89qcyhaH1h5kT/RETCY1xHtyU
	QeUlVBBNNFwwco/6/QpGKvGJpvKyDlGTVpnn5MU3Lg6lNbaDLMaA3Alh
X-Gm-Gg: AYBFou14BPs5PldnAU4itjQba7Pr6OY2C2ZyQOfDW9z9+cj1TjpaXBtfREJlUXAtLX/
	nQR8f8uMUR13oLNdMudwaDV0mALeyEeF56LnCgS4GP4o01PezegZR+CwL7nVPewYz85ipmeSFlV
	2bnBScq2wGC9y/roqyWiTIr+52P7bhLaBn9WuyAdmgBdbzEVregPYKSONKueJBUtcsiJMCdGcdf
	B8BeSuF3SeX8sPo+S3h4ufN0XQidSnlczN+zrLo/ZVZYAqQTRPoXtKNImq5if8xvTzm8Oie8R9S
	KG5NSPlMUVVmnIyd3y35RFQThKWuxaOl1TRapVcGmnZvx7/YBNpelmL/+6o1zr6WP+MVYMdg3rO
	LcGdydbXFX5PHko9dOO9HajcUfuHL4kjgePWPujpH6M2TBqjEhEeG5j/YgEmAcOiuj571Xu59jG
	BulmbRds6iP717w7KlCBfkcxfnsLa40a/2YE7SQC7HfHjqH59KZOMP1w0JMscTKTIlDSga+zh8M
	kytHHFOkfdyokPHQ65qdofCFsT9FC7MYRVL5P+NiQKylwMm1/KQluc+yI1XD1s1jxTe4HWjjoO/
	oV7FEEiXMz+t5z5USz8GqBJ7SgY6OlJu/m2BVrIRtp6p2P31CVav7XobpQZZ9xqUxBOY31iSSd7
	JgsfB4NSffzgaP3JDgKma2rpsQDcVk7wpLfaYtc9xAZzFUVPOoLyxnSDlK0Y=
X-Received: by 2002:a05:600c:4fc9:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a204b2032cmr26718835e9.12.1792646239093;
        Wed, 21 Oct 2026 22:17:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 02/12] lockdep: Use raw access for pinned hardirq state
Date: Thu, 22 Oct 2026 07:16:44 +0200
Message-Id: <20261022051654.79224-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irqentry_nmi_enter() reads lockdep's hardirq state before __nmi_enter()
establishes NMI context. Arm64 does the same for its NMI-like EL1 debug
entry. Both paths run with interrupts disabled and cannot migrate.

lockdep_hardirqs_enabled() uses this_cpu_read(), whose preemption checks
are unnecessary for these callers. Add a raw accessor and use it in the
two entry paths and in lockdep_hardirqs_off(). Keep the existing accessor
for callers which are not already pinned.

Check the interrupt state before accessing per-CPU state in
lockdep_hardirqs_off(), independently of warning suppression.

On arm64, this change does not by itself make the call chain noinstr-safe:
__kern_my_cpu_offset() must also be forced inline. That prerequisite is
listed in the cover letter.

Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 2 +-
 include/linux/irqflags.h         | 3 +++
 kernel/entry/common.c            | 2 +-
 kernel/locking/lockdep.c         | 6 ++++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59fe..93056a766fb20 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -141,7 +141,7 @@ static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
 	irqentry_state_t state;
 
-	state.lockdep = lockdep_hardirqs_enabled();
+	state.lockdep = lockdep_hardirqs_enabled_raw();
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	ct_nmi_enter();
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbbb..5bc179a88e513 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -52,6 +52,8 @@ extern void trace_hardirqs_off(void);
 # define lockdep_hardirq_context()	(raw_cpu_read(hardirq_context))
 # define lockdep_softirq_context(p)	((p)->softirq_context)
 # define lockdep_hardirqs_enabled()	(this_cpu_read(hardirqs_enabled))
+/* The caller must already be pinned to the current CPU. */
+# define lockdep_hardirqs_enabled_raw()	(raw_cpu_read(hardirqs_enabled))
 # define lockdep_softirqs_enabled(p)	((p)->softirqs_enabled)
 # define lockdep_hardirq_enter()			\
 do {							\
@@ -113,6 +115,7 @@ do {						\
 # define lockdep_hardirq_context()		0
 # define lockdep_softirq_context(p)		0
 # define lockdep_hardirqs_enabled()		0
+# define lockdep_hardirqs_enabled_raw()		0
 # define lockdep_softirqs_enabled(p)		0
 # define lockdep_hardirq_enter()		do { } while (0)
 # define lockdep_hardirq_threaded()		do { } while (0)
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d251..28399c41ebfb1 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,7 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
 	irqentry_state_t irq_state;
 
-	irq_state.lockdep = lockdep_hardirqs_enabled();
+	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
 	__nmi_enter();
 	lockdep_hardirqs_off(CALLER_ADDR0);
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26..01dba8fb32a90 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4543,10 +4543,12 @@ void noinstr lockdep_hardirqs_off(unsigned long ip)
 	 * So we're supposed to get called after you mask local IRQs, but for
 	 * some reason the hardware doesn't quite think you did a proper job.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
+	if (unlikely(!irqs_disabled())) {
+		DEBUG_LOCKS_WARN_ON(1);
 		return;
+	}
 
-	if (lockdep_hardirqs_enabled()) {
+	if (lockdep_hardirqs_enabled_raw()) {
 		struct irqtrace_events *trace = &current->irqtrace;
 
 		/*
-- 
2.39.5 (Apple Git-154)

