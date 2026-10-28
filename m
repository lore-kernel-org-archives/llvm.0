Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158321;
	b=Kq+OmWUig2x9LLMdSkeJmjUYPheStdRoVqjmYSMR7AD+Bigp6oz0CcRaKtI4NTJzZ8YJ
	 dix7b8TeiqdL0aUl7YtiQ7/9Q3MzgVTyUcEHa5JjMvAcAM9BM+w7xaLUVEw8CIlmtg2Hz
	 8nDXtmeO5DWcpGjr6jemEDGWT8Mxsp5jGn43qVKpmpvdIciLYbQlh7YtwGN+IpevD/UIf
	 JqWqjKuGFGHlQxPADa8XW4q3jc9PBaJFUJr+fuVgipaYlIzqaf63fR1J6JKb+IPFBGaUr
	 iEzd+jKSuhDVlY7ZFIRFQfTfIgQlMbsIqQ6J17R9L4E8Ww/gdGU12K6r4BVZMyTAMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
	b=1A43W9LnfOJmYuR/qvidAlgrpK7PBjdC0RQ5jY3EVHnQ+6woorjvd/cBWDSThhwtKtwg
	 dXY5X95AhovCRHZws7GWBSg+M/JPSSoAOHyxcnnPBHvxwQA/jVFqjbN0LUP5uPca7tREj
	 2Hn/FF/d/6+Xvp/3AuSQmssg3W3SQC0SPqwJySGDkTnmFs+tSgahTkTKa/HZ9yQeoJxoL
	 48PPvPhh2sFCC4lXxwJT8/QjFCgRhMkeZUsiMQ8rg0Tcc1QKCGurW8neUgEvTt5ukkXhF
	 2lGlFGAJ3ngm2YPZ5yWruEW8MDq0Qc1uNYx8PxKdKNfpbUSNx6QgDVmhAuk9MKb999Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ymm2BSUu;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0418606A335
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0418606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ymm2BSUu
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso359580f8f.2
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158319; x=1793763119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=Ymm2BSUupf/3E6ePNGH2ckN8OpKc1/2iROPUm/DvCVZ5bGnQQaAGRjzwHFQNsAfG7y
         /AZWG03X2Yzi5VA3kbmPlenjD4l4VnyZXg3WA1MdGpRBVB9LIVIS2IIAbyue1oW10y5F
         Tc3EAdT/g2Dy/aK9sGyq7IiCiDiriGEYChtAovQBFp4VwFT6UE3FEC9qCwuJ62DlUuA0
         gADEtGeYF7+vRf144DsO1uFYYpm+K4+BVc7O60cF+TnyQ/1wAWMJ8y0Nz7WNz+gytKiz
         sdeujyIY+9indj8eN8J48oOWbHoBXZJ0A7BSCnFQW4smnsW3IDvEUtGAo9/mZ0xX129M
         HPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158319; x=1793763119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=EmGuEluwVWrypL4vE4xFp55pJXgumWyH7nOrBoi7MlraqhOyNZ9Jng6gzHrbhWqKmt
         SP5hxcKnxB54zPUFX94ucPb+kKx66Bug5npOc0Ec87ZtT+Z3Pe9PfjUE4m4HqmuadpJ8
         XbRPZeag3ffYclD0Ra+g6/tBXmdqhk4eZNctKqFZMMUpUZd8NMdwFUOdLzJihRc6/RYT
         Uuq/LboYufS4U88LnH9oHil5FZR92YYuKM78K34m7vZ1tIJsay3d/5tTK9SLv2YQoqOZ
         y8vs2RLGvx/ZS2HtBb88sBlIbirjNv46DZMpcYEYnpY5KLE+BDF1bX6B7v0o2L8xP7TR
         YH/A==
X-Forwarded-Encrypted: i=1; AKwUvByrcd9RLSxeg5T7KyFdlx3I3ZgI7eFo8EcB4rOMepNOh1Jp4IngYnYrijMOpZbsKbgy6XDY@lists.linux.dev
X-Gm-Message-State: AFq9FYIwFc9a7f8+HmPjFqQlAvrhJwa2zaqsS7BqqeaSgXgqBhl1gtiI
	fx5CmyZG78ENj3L2X/WGKZ381lR3XHjDf0AGdLtupqnmTZ6deT00e/K9
X-Gm-Gg: AYBFou1Z4aYop8/fb/g5186eW/ephxO9lKHJaZ44iN8aOv0cgfrKz3tT72r2x7uRNP+
	PGC+1SpsxcoeiqP6UAbu5gR0vZHb+OejYG79D2Xrx9ZV/O5VoN1xNlJMhE6IQl2iHGH50m2gB6I
	v7+s6MTy0P1C80cq62St6Q7AhuC+giYWbhXqXnvbXmxmHJJWm+TJP7QsJ0aQQnsMdcH/BG93Jxz
	lJfo/xEQagG4fvbIUfjH+nWViiQ0mkwXYhuTLqwmZIM8T+gTUSI+/ldTNQx2CAXQBCx4iq7FquR
	28X2cPO9+0zEBX43jGGKaOIbPzTmb3YU+6dkMxiNqCDbdsF3BhJdqZuox4nKyTK/IwMi9Tcr8vf
	Nfl5H0GWEPuLDtTdcUkcnxObUElXSQxgciU1B11YRsM850I4+a8FdV+k6LSJtnEqjB2Xgl7HJTz
	ZwDYDRU9aDTkW2WdogmG/Pcc2jHvn0jW/hrFmB9K85fafrXf7v+oUiXaVJEY3QAUMoJoeU7CULU
	C6cle5A7Okqc+5LaoBVY3VRl+0mSs4e6Kk2X9JYkFLJCcQ92rfyMwLW5b1rqP8megooQAlZX8HP
	6vlbTF2SbNPy2QLrvFVD+pH0k9V7Lzr9GsjjWQ1k7B670br8ZVrtkS02RHZMZ11cOFaV923VMhM
	2fMouondSjaTIsS8fAHvjRGKy7Dt8WDgx/gnViPTFH2xdo4z9ir1QYdgjRJr2OzV/Cs6znMxUl2
	iZeS7DFSld3T5XN+RE1kdmwi7Cx9Na6bEV
X-Received: by 2002:a5d:6f04:0:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e5d2e7526mr2965587f8f.9.1793158319122;
        Tue, 27 Oct 2026 20:31:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:58 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/13] entry: Skip inactive IRQ-return reschedule calls
Date: Wed, 28 Oct 2026 04:31:20 +0100
Message-Id: <20261028033127.82193-7-kmehltretter@gmail.com>
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

irqentry_exit_to_kernel_mode_preempt() calls the reschedule helper when
preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Arm64 invokes this caller from noinstr code. Force its preempt_count()
implementation inline so Clang cannot outline the new check into
instrumentable text.

Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h | 2 +-
 include/linux/irq-entry-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd1936d..3e9bcc6e76625 100644
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
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 289e308d2d46c..e1fd9155410c1 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -503,7 +503,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)

