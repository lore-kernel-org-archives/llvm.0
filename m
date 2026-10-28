Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158315;
	b=1N9tXZlxtKTyetwF40VPBuBLzgGfU2Vfft7VQowkTBI8JNXVqgg3aBOGvYLFjNNsdeR+
	 5H3CDVIrUikrf1zkYujqwSCBTHG/rMxs8fudsrNtOrAzRcNZZMouw0P1TjLq2i/BsUYRo
	 wkZHnn0DCKtnnJ4q2w13Ci8/TfO3yEc8QMwXdh1u7QuT1E7zKxlXXRA39iA37G/UnZORb
	 v0CAm1vVhSGNq21yfV9Ld/FtXjuexZXu1ffLhssv8Zzy6VXHCw+afIPJDS3wTpT5yQQH1
	 5FD/+Y4DlaWnGU/UuHyPgV5L0yJnlnMkCMc/9qUpkbwtkyd0H9/je8OD0YdXBiErQHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
	b=rqKSLExl8Md3Dm9jWCJZZsvDX3VqgXycRXVRzueZ//jpzuxOOvWMYV4p7+R+7UU8c6rZ
	 HD9rSIfKk9iN+q69iiqBJ8KVIDivpYIAxDOGiupbTP6DQhSD1uf61ThyxkMQa1NTvtizl
	 4L6wfjVRASlfC483uivqdjmh4yFNi5vdaKk66mUGLt6yosR5AwFvCxwNlEV5YK6rMXT50
	 Y1954LbGEIvDU7/tLz97gwwfB3SA1JiB96Cbe1q1D6UKpBZOqWI0VkN116qfmYZ3vqWtx
	 EsQ3eg2bpk2cLw5OiY82d1d4HpaX82PaFLla944pqee/+F4d4tz85ZsfQcytVDWb8Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNqhJnVB;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18DF606A321
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18DF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNqhJnVB
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b042c0759so229895f8f.2
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158313; x=1793763113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
        b=YNqhJnVBWiDO6zCopdQCVsf1BicPKtHktguLxAOodaOAEsCGOM/5S6SNsEW4bH3IzM
         p0yqpOI3noKNFiReF+Wtej4xMIAqI0QT2g9WUhjZiwCQfYZN4fTIjtnlcdTmlGKHDHGY
         e7llKi4t2nP23tbG4CAtcQob+IEMVY0UeqauEL+tTBEgpKvPqZfhGdwSq/nPVs6Ozh+9
         8WkpU1cuyKrGcH33vS15oDFzGCWFC+2J7lzmILCNtKcEGxvexhVbvgCt/u5gVky4diA0
         YIbASWpmXW0Rjo00TIVnrohqK7KkYhFi2BPlS0ua3vNQqCYYw6o7oynVkKSRLMUKOJV8
         trDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158313; x=1793763113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
        b=W8gy7hWHhRYN3JpojT1NBgjz64MJvwNXtb+tus8AX/j5imCu2MPAkk0N0zYQEIB0Oh
         3JwR3OllSxceIE4Awdu+bTk74uulAv3TwHR3DMFi1qcboJgsscRqfe8VEcMg3CVNDRTv
         h8G8FUbuPu5JRes5uolbKGDTbHmsWnG5r03ugdrrDvDxbtkJii8SLFnsjTYMaNqxlP/A
         LVHcuMgfoqlZMJ1q/BXCnj0NZ4blTQVW3Xq0bkz0dbG3G/dgJvv2IB6ZiemmkJKe2GXN
         Q5fpBHNQEuXfGr03bTE9Xvh2cYSvSL1KMtr6Cetxf3ZjFFUZMUSs3OsDSlwDJHfJN/UK
         knpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHZYqTBOwEI4ayjuc6VTa6ICmpUew0BjW0LNbXfYUynsbnivvScpCWcX3idKv/ddPd5HqL@lists.linux.dev
X-Gm-Message-State: AFq9FYIoEfGQFMn1ulIZf6/D2X8MwrlJorgYsoqZS8JQiqYnEokIfQEA
	ZtDHksWKJoD9/7UrDG51CQ9h5Hyshj4plSNb6kgCirsJ6KLrIXTc6MjZ
X-Gm-Gg: AYBFou0wIAwY1buP/8P3+ycDwRrooD1H2jpPCsiLO3wRR+0yzrdCAZ6mlFoUTJ+tDBK
	SbGjV0L5jqFzJHRdsxAeitDC0bn/NV/vTwmni4amjvzLF6VZaLrFYhQ22ihAJCBhTSKEWsYt0Lv
	QJHczOd8i1sxupx4wMO+GyzRJ6OmYHlwQHt8B5bL06NVQraNaWHdMqMJ/dIxxPW9WmuMP1901c4
	kGCpDbA2omQD3+Jt5Ij99cvm1LKr74zwDZtZ6p4KbIfLdbiabgpQGOa4YrhHO3YruiTlUn/RAzp
	CmRycuVbnKKKtoDa8085cuAOMLp92/+2hbsGQD16yDwMexO60AsMQJF8ZeHUul7PEGDtVw27QNT
	jdW/6zmXlqeOPHKNpv+5UAJ7/WybAoHmAjPCHfona/uwg6iVEidvjDiR4MI0aNBoNesH/ZnPj2h
	MLnhZvCafMEQjatSSxTEi2mHszcdD0Sjc8RBZvJsPV0CYh9hGsNLPWu7AfULO59N+StOw6mOp18
	3fGiV1ALUgpnvzpxMCoFYr1eqEot4a0n4SHCiMpsqj8Qc2Era88/GNGxon0AYZZVzbsLJBP1d+U
	ZdDMjIF4s2/rBClSidNVhWEHWoUfSJTZnwQWjhZn/foabiqiZAMVisRsvlLNUKGD9iJoymCtwRy
	3+4a+wzNejvxhnIBRF6jlM+r9PEFK+kXeu64flJ5h5G2x0+ycimmR66mnjerV0ZiKeZ77hPF5aD
	p6wG7PPyDd4Zr//BcMGwuuYW0q6ZfLzvF0
X-Received: by 2002:a05:6000:1862:b0:48b:d9:cb52 with SMTP id ffacd0b85a97d-48e5d2f0870mr3087140f8f.27.1793158313112;
        Tue, 27 Oct 2026 20:31:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
Subject: [RFC PATCH v2 04/13] lockdep: Use raw access for pinned hardirq state
Date: Wed, 28 Oct 2026 04:31:18 +0100
Message-Id: <20261028033127.82193-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

On arm64, this change relies on __kern_my_cpu_offset() being forced inline
by the earlier prerequisite patch so the call chain remains noinstr-safe.

Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 6 +++---
 include/linux/irqflags.h         | 3 +++
 kernel/entry/common.c            | 2 +-
 kernel/locking/lockdep.c         | 6 ++++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 11d3f888fcd87..003f84109a913 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -177,9 +177,9 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
  */
 static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
-	irqentry_state_t state;
-
-	state.lockdep = lockdep_hardirqs_enabled();
+	irqentry_state_t state = {
+		.lockdep = lockdep_hardirqs_enabled_raw(),
+	};
 
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
index e234b04373fea..2f5229132466c 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -158,7 +158,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
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

