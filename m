Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158335;
	b=ABNeqP7ErZwn75pVuUFqxlem3fjNBLiR7P5oVTrT3hgTCXJDIXWcMixCy5iBiXEis5GP
	 6Ntq6Aa+S4/65KPDwJO7uehnIOGYgy75Bna6HeHStRQQb8GUpo87gcGI1jqdoVW2NZm3T
	 fASvJbO+VB9UawDP2lFud9OA/W+VWKFJ4L/zzHoWk7iFHl91sX6kVP1DyKBtBcbKtRTCN
	 wHlAJ6e95mjiGeNFgUHtD9VEvQQcbljbMmsY6nRS+JXeshMYp6dsH4Nfl7bHCf4+kykHq
	 RPts806P+cJubYrzr2BcAij7Zl2T2BDlvxA/WjPKSr+8TFdw8Okv3FtM07GcyuJvr8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
	b=g77CSzLVA37uhGcALzSiRovdmN2EKbm51XL8mbx9JEP5Hzqe+Z7AkJhl/hohXxwmSg+I
	 JIDdUonMde9HCTBe/mJgb8NVzVEMXeRq5uZJ+GQDhkObnDprbuYclu2g35IY1LO/3YuU8
	 3jVwxV8qKpH3WJ4zMWCyiJdGll52OXO/Nlc+2vjNc0Vxf0UFSPRWMyo0SlmGfvk3XhvZc
	 k/b05SY0PQgDWfue0KfmAYnRWlGUQ4V7Yyw1mBderWF8/Lr8yvIkDjOgiVPVoTVHgaeH+
	 USNwAQ5noWmaiJCbm8zAzydd3wvpinWzmplvOS7mw9paiK9OrdBd6wPSZr0NfoCUMcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j+F/VqTB";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4B860A2600
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4B860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+F/VqTB
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d1da913so402076f8f.1
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158333; x=1793763133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=j+F/VqTBnigMrjpZd0u1tGt4rugwBppXWoorWU6fhtTFi7mrAlC8xZIiO3K59nZ6yT
         LeStE0OROd//H2Tj0DLEe+H8RNK7HidSXYqZRQRerutZ81W59svNz4jf0kKguc6vxX2w
         l82JRh3yEMmMwjD4ovubRmzD7Ye7ChOrrcS+9d3a7Fux3gBNlbeXJYe37IuV0Uk1L34P
         OWTlKNAVvkX+EcVjgNFqpH+3gHziuUqiKqPv6gMPv+CAZjl9J8UVykOV1XnSskoEoN0F
         FEc74L0nSewSgMDvjD0x/G6j7lAGlyzvERo0/axydICd/Jr1LXH+uTknLzV2/0lkc+xC
         pw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158333; x=1793763133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=VFJ1Ai+saejL+YFc4KkjOz7qLAgGG2eNmzfTDLybrMmhIwkTiu9jKHCZ0VkbyNIAwd
         dkDGttv01R18BURXxdRwtBQ7ZgbyoeLhAo1hfWbsio2E+AeGRsbPSnmXWGFCYHvrbw/t
         x21WUJ9ltQlDHIEK0LkCPZ7M+cIgc5QdB1gGd7J2iQ1h90C5rbL4KFZJZgd9uvKl6e3R
         SJx87ZScK4op+SyWy7bJ+bLdbjGSEKPupvJyOVcbXSdFIuG6LJ2eMjwEXUQpTPKsJ8im
         BOgPuBUt/MKpUtqVc5XwuHDHrK3fAAasOewbUj1Ztm62UfR2FG/FPHXn8dYiv6lodZdU
         smYQ==
X-Forwarded-Encrypted: i=1; AKwUvBybOlm4K/PtkrtyVbjjk4+bPpvztAvqW/2RwWYj+K6t4ofRsIMeHqN+tPPhjJu1uDAQ0DMb@lists.linux.dev
X-Gm-Message-State: AFq9FYKM6FdJLbPTDJUWA+d+t76LL0YgKrhMA5gY154UxwR0oKUNMfdO
	wqEBTp7EksTBeMBzJOEfqa/ycpasx6GLEWX1B6Oli8pgC/VNJOzY2LLB
X-Gm-Gg: AYBFou02DUlHg6bS6rtiOjWTrDO3ia7tWB/ruIsgDbtBtzkop1YYSFGlcTQI1jmWS7U
	na1GISPM0Q5odRELjfyX46AjNaqMi/FY+LT8D1i06b8BoMtxZkW+x/W28TrrRKUD2TP2OeyRSsi
	vqw8AlMvINdPtc1Di+t0e9Z61Diihnlfe5qybiWfjxRpGY852bmBl5tBvdm9kb+PAPe98xXQOUE
	LC8RSqKmbMk5COBgEUJxlcKk9yXnBTX4ofpJ/utnkELa+DBMypGizrKktF0v9vu9MPSXPGHHZAq
	I6N1bHuKWWQ+anhJEhVPCnXeVNynTXXgcegFqd/jcMp6YWIfPNunWQgfvH/Wrb0Cgr1zKu/dggh
	ePPZcbMfiSdJm3YlimwL7ZuoQxiKEaqmDKgBp46ct0fiCt3wscrBrIgbSHiKCc/Y2shjoOmnCXm
	gl5P9/QwATcsXSqeiCXWgt1eW8Y/LiFIqiuvHWpq1B53t6Sqlne+e52tlLV26NbbKMow3Z4DL+N
	mfN9lDFXEArFBrSlw5tKBg9Q15bqZ1cgMCz7AmzYuiujeeW4Du2mlJjyhxVhjaFH7Q2iwfiQD90
	8pcHY2qUQ3dMNphAYu2/Bo148SBSJ4Hnqt3kR0sCn9aWCPVM2PV/Cp0WmvorI9G4G3+ibkef5rZ
	NrKb6IXZ+qqbGxHcb1THli6ETLDuY51DHD+/xI4SRyli2UNauT66JR8GVLIF9sjNyXOBkUNDd1z
	qmTKI4TYUXKVx+iD5z99rjCTe8dESEGy2N
X-Received: by 2002:a5d:5d88:0:b0:48e:5c9b:f12c with SMTP id ffacd0b85a97d-48e60212fb8mr338598f8f.16.1793158333537;
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
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
Subject: [RFC PATCH v2 11/13] arm64: Use the pre-counted hardirq lifecycle
Date: Wed, 28 Oct 2026 04:31:25 +0100
Message-Id: <20261028033127.82193-12-kmehltretter@gmail.com>
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

Ordinary EL0 and EL1 interrupt paths establish generic entry state before
irq_enter_rcu() adds HARDIRQ_OFFSET and lockdep nesting. Callbacks in that
early window are therefore not classified as hardirq work. Their exit paths
also drop the classification before function-graph return callbacks and the
kernel return tail have completed.

After the EL1 pseudo-NMI decision, enter ordinary interrupts through
irqentry_hardirq_enter(). Finish the staged count update and delayed timer
and accounting work with irq_enter_rcu_preempt_counted(). Use the retained
exit preparation followed immediately by conditional raw count and lockdep
teardown.

For kernel returns, preserve the existing per-CPU register adjustment, then
stage hardirq return-tail classification before MTE exit tracing. Keep the
pseudo-NMI lifecycle unchanged.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining prerequisites earlier in this series.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 003f84109a913..d70cffffe71c6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -94,6 +94,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 {
 	local_daif_mask();
 	irqentry_exit_pcpu_adjust(regs);
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(&state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -560,13 +562,19 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
+	struct irqentry_hardirq_cookie cookie;
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -877,16 +885,24 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	struct irqentry_hardirq_cookie cookie;
+	irqentry_state_t state;
+	bool do_sub;
+
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)

