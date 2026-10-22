Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646255;
	b=m9vIBpmGsNey22kZgOxS4OPutvYlU2O/OWHQ+cfCyUcNk46yhjzZnfVsHGbI6Yn+EKd4
	 y/3X8BRyhtFoCXd85hjdejf3IZCaytuDHrU3/0md2nHG8kbmclKdWx6MY4JTMJ8U5zABB
	 eEzszbY0hQ4dpnAa0PGQxl4Cc0D7cqZbrfxe+PRl/nRdHFRXP+NkcIDldQyZSkPYv+CZ6
	 m9nLeKO1LVQRO4M71lCLWWpLcK0FLe/m5PxNq/NeHSlZYYseTNniDu1WAPT36QV2bgC/M
	 g5PiuyI4sKMEIMUQLJ8SGjYfFlhAyBOO7vQEBj/AsTX4d0awjn7UYh8h6rGUHrMwR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
	b=kayz5PBb05OSVrqlZtLNFHpd2A0l5Q0tMdht37LtW0mgkA5AHw1V5aBzK1VT9aZ4H1tc
	 fwzNE6m3UofK++z4w43XD7k+0+P5TeDv//DnIDEwCeSwD2CH0ynX8Bf+sQ7Vt3O5eCGhF
	 3tUYTDPKI7jiEFXKG1Aj1rRtf2A+uEwyH8c0pONE74uuWhlU+jZDlYyDQJBvczwq5Bm4/
	 1UgISTymyU4W1Y4Cq/s/bxuS9fqcjNichCd5cVuQ5/QYfMwerVuo5nafcjs5GiGVWELCQ
	 eko0bRAJqdMyh4NaDhCyNwNNh4ufuvbOH7f5KZ+fOI0X0P+Zk39nrlJrj0Lm7mci6xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RB6r5HHZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375460A2615
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7375460A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RB6r5HHZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so9649055e9.3
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646254; x=1793251054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=RB6r5HHZr5iKJfOheN04qcXcOZL7XVnogvvgoQ1Y/+0va17M5w2lT9fIiuaeDPVFaX
         VauSlIZVhUnjkiN9q9hEax/rJOxGLwYQPhZduPWsPn2Vuapw0keMZqd2M/T8el2pQFrm
         /YQtzvhAl9masaX7zLkgeA4gugbvR25u5q/ldguAB1xjKSuNoior05Rl+g4xrDPohfSA
         LMh87vakMBzeMbWADIUN5g1RRI8tGr0HXjTGAKxbRgZo4vVlCvfpyQ47G68Gn9NpQgDh
         n6D6nDuvR9bFxQ2IZ4KezJuREZ0RsC7QEY7FWVaxSk3E/Dcfl51Cc6dKldhl6OR1DW/p
         yx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646254; x=1793251054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=B+soLQEps5rLTnElyaqBKC7DLmiXdqqa9de4uP5fpnWSP1QdKtjGhfWa365GUruHEY
         w7k+i76ARMJEM/KHyM20XUfdlGUYMHDoZ16mgcsSDYmzTxqh+qIYWVTYF6PK/o3OMoCe
         HMgtPhgYjRQu1Ke4sC2k6q+ABYRwIMPESwCOvIp9yEEZ7VKBjQJllHea4jip4+tMSpue
         FdCgw8pMki2MbTNFyBQL1uBzIjSHqp6gvq93qtdPRQeoW4Vz1gmYsk2tfFJ4z7bw++hk
         Gz6iGCdv4txLLQnMqpsal7KAuEXNZt/KdXbpaGQSKNdy7RpwbtWt9Wr2C5CY60qDwLPA
         90qw==
X-Forwarded-Encrypted: i=1; AKwUvBxTg4oTGiNZTcDO76X+ySXaxDbhVlQ7nOcqFx6uv3KENuKqUxye5QKP/X7kaYC04IjJZzLi@lists.linux.dev
X-Gm-Message-State: AFq9FYI3R86X6S1hkeX1wcghQB0667uMamtUTmubqsRgUE0oaORdRoJF
	1yr7cMnpCVJmrdsJvRdr480ZZCMkZaqKOmjylb0svK88f3lXiJTKWBaE
X-Gm-Gg: AYBFou0YD6W4NzqCX/QjuiVqzyF7dYljiRjI6s1zgGxaJ+q/2iHKMIKo+lwJDSsPnsP
	nvmlB15GvF51m5N0ANGhRjqwW4/7NEkdptZWHniZOyE0Ff31q1KBiqQNYezgBtCpNnkmV7q4mH8
	+CaRJazMum0gTVvCMQbyxRsNOZoK0vAp6IHYz9vIurg2jlO1DkYy2C4H3dwShEMJFvi+QOMpUHM
	8ghwFzLdtnnaQUHv6RVIEgFgufe+oe3sDez9b7BeG/1i4WtCT3K9vzBqKxXeYkgJMFj28oJQGID
	FDjcWEsmu0mrxoPzM3YsPPczTkR1tRzGMbRkx4bNfO7i/CZKRF7EfV8yYGDBQ2eP6AIYJMzWFHa
	hiuWwZank+t5WU5ibLbTS/P3ivRMBHCUkcofljMIc9ctQZjh51x0jCd2uFacgeunZBhsob1xInI
	ArOkwE87hz6d5rO/pml8KoLKt54A6+uhOKMUjVvF40n5FmYhiVzTNzP30EkQXS2xJ3qsqgdC7K4
	TvaePl0N9srLn+uth4VXkfdTzkL9b3ymsfdiqVP6cocVaamDCmmG/KHvAnLJoV8qoIFNYwhLIJj
	uJpoPhJVoix5fmKIpiua2Kjgbj3F2H6czPvydo1bBHxnuJ3UZAMIz1G/i9iadvNOkvyMOq7iniM
	Bu/RW3yPRBbep02o2U+Sv9gFliwTrnjRY+Q/5+uXKiMNV1k84knVCsRHJf8c=
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr75350095e9.12.1792646253837;
        Wed, 21 Oct 2026 22:17:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:32 -0700 (PDT)
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
Subject: [RFC PATCH 07/12] entry: Carry ordinary-hardirq provenance through kernel return
Date: Thu, 22 Oct 2026 07:16:49 +0200
Message-Id: <20261022051654.79224-8-kmehltretter@gmail.com>
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

The entry state can cross hardirq teardown and a possible reschedule before
the architecture completes its return tail. At that point preempt_count()
no longer identifies whether the original entry was an ordinary hardirq, a
synchronous exception, or an NMI-like event.

Record ordinary-hardirq provenance in irqentry_state_t and initialize it
in every entry path. A later return tail can restore hardirq classification
only for entries which established the pre-counted hardirq lifecycle.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 4 ++++
 kernel/entry/common.c            | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 24c2b9fdff4f4..2ed637cf66b0c 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -333,6 +333,8 @@ static __always_inline void irqentry_exit_to_user_mode(struct pt_regs *regs)
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
+ * @hardirq: Records that irqentry_hardirq_enter() established this state for
+ *           an ordinary hard interrupt.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -347,6 +349,7 @@ typedef struct irqentry_state {
 		bool	exit_rcu;
 		bool	lockdep;
 	};
+	bool		hardirq;
 } irqentry_state_t;
 #endif
 
@@ -396,6 +399,7 @@ __irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
+		.hardirq = hardirq,
 	};
 
 	/*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 36c43d3c76eae..ba5959a84bc4a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -112,6 +112,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = false,
 		};
 
 		irqentry_enter_from_user_mode(regs);
@@ -140,6 +141,7 @@ noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = true,
 		};
 
 		__enter_from_user_mode(regs, true);
@@ -199,7 +201,9 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
-	irqentry_state_t irq_state;
+	irqentry_state_t irq_state = {
+		.hardirq = false,
+	};
 
 	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
-- 
2.39.5 (Apple Git-154)

