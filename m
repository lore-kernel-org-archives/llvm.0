Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646263;
	b=y1bvDjJAguCmDLi+Ai+Y5njJRmVWv87KOvjG1WIgGHDHI8P8E0tXO77xu3ET7oWaLs6q
	 fF15fURzq8hcgRFauf2c4HR87g9MVypaDHQdu0nC85JHzlhqgEL4594bgbGV/p8/f5Ewo
	 ttDfs72YXnOvNZEbS4Xm+QXz8Ekd9vye0U1EbstZAhhjlOw1UFmfTGib13qTxig/uSf+t
	 3Vsd7i3f+OrQKfBqJD3KbyO1OatOp8bRQwo9KIcnPdUKIajMuW4nWI7zcLizsoGYAHebl
	 LcBRrUF6CL+UGa8KFXZ41NS9RDk0cLn9ggjXuMzgQaBRWYIyqEzaW+4CD1Sg5l48ZMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
	b=OxP+Ey8BvRUj0G7MSNLuleaF9T6uHMVAYOiJ5jiXC71xL6rHshE7sviyAlVueiPchtSb
	 wRTqtwqq6n46gAfznqoWurmcJF+vjG3maWukNxdBbvjKNbN19Ai56Iu9BAsLr4LCJoEr6
	 KyairZUt7E1z9aKtpw3hqkqJiAWE++d3SYPPdrSedB0cPFpXPsaLKu104UdKMecW6DGFG
	 7ML+nkYE1hwkwuDrLz9kndXKLJ+tCnb28N9U+pacpyj4Cvtwvdl+/RFjLM6Tvc6mrAHRN
	 laSvL5Le8vd/zMRgp7svI7BodaRagS6MWQK+h41WXBxFd/Llmm0h/9K956EgQC5kyaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MlhAtDfO;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EF60A261D
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396EF60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MlhAtDfO
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so14050435e9.3
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646262; x=1793251062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=MlhAtDfOBCzx1ZUtLG5Kh5yWTo/gxgTnJ6vGHySc3vtEfdESM60HLinKjmF4NWWi3D
         7QncRHVKx9z8mMJSDFkBeVinbgP90dG1oYjOaf3idbpfNs7QKgh2jIBuE6FeXPZeb4Ov
         Mtx0KSXzphkLcKJrxRm7jbtZJMz/cmBF1wlCkTLQsAaFUx6mVGrJteBAsBsJtYh6H84l
         zxqw+jBB1bNDJ7l3aFWdbRorXqJfDP3Jgpty+k+2iKeTwukY992raqj2Zyjnpr7trdLI
         o8/jhGHH1vN5d4uUNn4QLXDyWE5ee0Mp4VGgDrvsBruygg6uq2uYVbOQO+tbLlvxALFE
         9F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646262; x=1793251062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=ZGuclxEH6Bv8M4NMAe+T8w/jlpwiomhbuvmTH+D8OdePC0rcF0MkWE9HXQmFGL172A
         AgkXvCAfqsiqRg2QQzvDUeJSjJlE2nZS6xCK28VY+vUyJqYMGfYy70yxZvh8P0SgtUGY
         MkzUm7qkqJ3IEFGNbs3MkAyGw8lQBETc7IICWZhg7w15UCHKwp4bmH22Gpoton+w6U37
         0IjSHUF5RnFCzMQwpf63Om2Q82SVdrwqw0lq7Sib/zBgTqrPbEKaEfQWFSL9gMtdySoT
         U1X12S6cGCpuCzapVWk9x+WuwLYYfl4Dn4v9fJuUGajUy6LrduzgnkYTjz7OWRTFKHlY
         NVPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPN8xTqUMysyZkJ01dbUVDU1ezJi8J3Uy+J+zWFIdfQW3QE8LWxsX/eKSnkQ2GLfrd+Ee7@lists.linux.dev
X-Gm-Message-State: AFq9FYIYb19lgqLtpA80Zk7kPpQj00fn9sBkKZiaYv5w01RLZNNYsro6
	rezgiUeNn15IpIXRCgVVjFOc87kRPy/cwxboL0xHjNHaYkucjLgmdqlj
X-Gm-Gg: AYBFou3JxJhjphOB0TUaTraWEciI7WcMoPYrOY4SiaKDsNasIRzQwOEyokRFTWTbBY3
	wPzJ4jfBeHUMCNNTsmEpPVA4knE3kKCG+IJ3dCIvlVYkdL6Y4LFty2iPWgLqQDIidKN8lx8z5Xc
	70tHb1KASpC5yqc5Zk2omuKNBZoSCxkP09IHCodNYTSmqXgkmzULfLZml9EpEaUMF8HrVyB0i3U
	MLCdnHVIRXGjp1btjGeN3WICYBioIduVc6uYZQzUEsPBiz1LPcosA57hiFEMJWD1NbNIfAbfz2g
	ifVBEsiKbfzT25w/cun7arkP6MARd/abNgnpeP58xVXeEkvMchsfFthHZj1mvbSqTkKhClHt1jy
	ql88rpIA71Djt4BFZlQPEVBCMIFMki3ADu2Ef2SPz9hUvy1+I8jUgBFHXG3efSrlTzFdtqruJHG
	dlqiSgq1xccpEvSgAUfKkTluavAt+h9nbjBMp4KsDGT9tAoaCpFz70KBC/e/YtTjuG+abw2iLum
	ZGXp23MHfyOq1e7RObPzz2BJZbNyso/joqPq15AM8HsCJjCJxVcAkny/5lBwOeaOub2L7JMAo5z
	NGTq8Y6wn4TYhoNrXSHNkMWQ3muZzRxMjgD3AI5/i0e8dhgxPdFOACB3+as9KrotQZU+mkn0qk1
	HkkURJTwTbV5XPhSd3tSSPJwOuDKOW41h/DjhFyat5/H1ADOkbfLxv9eH/EfnC/1UqAlFxIZ1kF
	eknDXldA==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr16486165e9.8.1792646261504;
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
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
Subject: [RFC PATCH 09/12] arm64: Use the pre-counted hardirq lifecycle
Date: Thu, 22 Oct 2026 07:16:51 +0200
Message-Id: <20261022051654.79224-10-kmehltretter@gmail.com>
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

Ordinary EL0 and EL1 interrupt paths establish generic entry state before
irq_enter_rcu() adds HARDIRQ_OFFSET and lockdep nesting. Callbacks in that
early window are therefore not classified as hardirq work. Their exit paths
also drop the classification before function-graph return callbacks and the
kernel return tail have completed.

After the EL1 pseudo-NMI decision, enter ordinary interrupts through
irqentry_hardirq_enter(). Complete delayed timer and accounting work with
irq_enter_rcu_preempt_counted(). Use the retained exit preparation followed
immediately by raw count and lockdep teardown.

For kernel returns, restore return-tail classification after masking DAIF
and before MTE exit tracing. Keep the pseudo-NMI lifecycle unchanged. Force
arm64 preempt_count() inline so noinstr callers cannot be outlined into
instrumentable text.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining changes carried as patches 1 and 2. Keep
them separate because they are externally authored fixes.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h |  2 +-
 arch/arm64/kernel/entry-common.c | 23 +++++++++++++++++------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 4f917596f387d..3d61be0f825fb 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 93056a766fb20..fda807c61ff27 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -56,6 +56,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 						irqentry_state_t state)
 {
 	local_daif_mask();
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -523,12 +525,16 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -839,16 +845,21 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	bool do_sub;
+
+	(void)irqentry_hardirq_enter(regs);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)

