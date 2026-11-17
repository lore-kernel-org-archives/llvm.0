Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890125;
	b=PGR2HxlaC4287SnQPyXS1L9IBIXde8GGrXTNDV42AQDYWCZw5z1bCEldUcotpANeBMPF
	 7Qy85JIMOttdir1meaMGbtsJnaB4py9KkAh2en3CL0YJFCVoz/+SQr05nf4SbWBYoCgGy
	 Q57vmsLRXhKo0Qi6Nu9YE4h3Z2Lwv++ZoRf5ihIutQBb1Gq4Q+M5nFsnR7Ncc2AJxu2SC
	 gIyb12DCrITIczDtGck1jhODtsnZGjg67pyn/9VqnmojDWmOVSCRkrSvOAzNkCZ4ek7IC
	 9lMxXeAlmUsnfpB4/d1c/ApKrTVCN5hpgxKXVCBHLWK1YzouSRDJM0wBDC+iVy5OJog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=g8r2rmW8mXTC4Y+YUXI9eRvrm7kgFqB9xo4pH3w0HkU=;
	b=yBQlkCyHH0Or9zpgGPrekQaoreDZRm8L/gvbkd0rSHU2lHq2X83QFenKPRHdcTib/Z6i
	 EQNvgEcLJCFDaX8/xVEdlFVwMj/RDGvffyzkXg8qM6GMgaurwj3skml71/tLgDZfZGrpc
	 lOpMWmLCEY4V/0AwYGe7v6ZpWaEQKRRNUrFkkgU6S3Zm//jiF4uvmkmCJ9rWM4nFNxEet
	 5JcoFbfNU5yBErSMnbNEkHj6YI7SlY9xEwxlyjA16DqTgDeK0KZhYl4JdmNecQU/OvI01
	 tLyL1gL6pkZSkmutTWv+IjTNMmPGXQsaRxNt9/xq/oDYoyYZsTML5mJDCWDRKMR3AFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gh8Dq9Nh;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB160A5BC6
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AB160A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gh8Dq9Nh
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3218465a91.2
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 20:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890125; x=1795494925; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8r2rmW8mXTC4Y+YUXI9eRvrm7kgFqB9xo4pH3w0HkU=;
        b=Gh8Dq9NhALElk9h8PF7ATQP3ts0RyFSJasl16mgmzOC1sqwiW2AQ30Fl7FYZsfa6cL
         UdQxqXMxc8a7PMt2dTl5hhn1zbYrgWIP/l0Y5P2sjhm9LzVzEpdfXYh7Ir9+Svp2rBHf
         kFf2Y0KWvz3Yi2cvIniCxFJvmk2l4Q9z01pd0h3/uufDmqbf7Uma8bn/UnDU+wFSM+6B
         DFM8nUfhZ9EiasOuFtY0y1nrHKMd0KUkgx8I1pdD8ARWbyP0ZTNBaMJurFQw9XlIwWka
         qd03XG7EjT8qOs8dr6VgrudFsLu6kPoVZO7+OZ++oM6E4ZknRStGr2NSiYwNb4PRi7kB
         QPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890125; x=1795494925;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8r2rmW8mXTC4Y+YUXI9eRvrm7kgFqB9xo4pH3w0HkU=;
        b=1I4FQF1tYztjN69Pkp6iMLaRF7WLTagVR2+cVxT0YRIHXVLi/eJne7VOa6qsCJSiw9
         8x9XoR/rr1nHoYz1phV0h/ui7cxVYS7deXJtQkf+qmxXkCo4Wt3Ac1TA2Gu0UDwBiJXf
         KHjObFOpa81IwGZzlWhG3dBeQk8qU4g4PJBxBWVI5NpauGeamj0F+8n2X6zQpsk0t95+
         bVGCDolPx391YHuyJJ8H2M+fyJzK52z2vTuHUh1YRQZRqSD6gyrrd1KDQMOMfzfxYlbJ
         er1IpuctRqWisB7khQeTk5vbZOnW5fBeRmRbzE7hmNaDncJymbYWOblIQk5sOCfJ67ms
         s3pA==
X-Forwarded-Encrypted: i=1; AL+hErH4EOzsXGLslir+wwoALQMpK163s4htnkJ5uC4Se1W7vRHZX+Wp/qbFAdeeDmOiXFPYNoAz@lists.linux.dev
X-Gm-Message-State: APuU4Z+9eQz/5LyWsvQs7CXMEwzkIUv4lzM8HliH/6WyX2IhzeH0jLFd
	nF9a/nyirGombUWO+V3HUvooELDHEjLZVPeGLKVIfiQQqV4EqZeQ7zjPXx8U/gG4KsdNmRy36PA
	+xJekpKRlwvJRjUNNs2ztn0A/ng==
X-Received: from pjto7.prod.google.com ([2002:a17:90a:c707:b0:3b3:b6df:b0be])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3f50:b0:3b0:a1af:e4fc with SMTP id 98e67ed59e1d1-3b1b0d984bcmr13134201a91.63.1794890124572;
 Mon, 16 Nov 2026 20:35:24 -0800 (PST)
Date: Tue, 17 Nov 2026 04:35:04 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-13-dylanbhatch@google.com>
Subject: [RFC PATCH 12/12] unwind: arm64: use .lr_unwind to unwind interrupt frames
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Add kunwind_next_regs_lr_unwind() to unwind across pt_regs exception
boundaries using .lr_unwind mode and SP-offset metadata (live x30, [x29]
frame record, or [sp + sp_off] frame record), falling back to
frame-pointer unwinding and marking the stacktrace unreliable on
failure.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/stacktrace.c | 85 ++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 3ebcf8c53fb04..842555a4a3fe2 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -10,6 +10,7 @@
 #include <linux/filter.h>
 #include <linux/ftrace.h>
 #include <linux/kprobes.h>
+#include <linux/overflow.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
@@ -17,6 +18,7 @@
 
 #include <asm/efi.h>
 #include <asm/irq.h>
+#include <asm/lr_unwind.h>
 #include <asm/stack_pointer.h>
 #include <asm/stacktrace.h>
 
@@ -26,6 +28,7 @@ enum kunwind_source {
 	KUNWIND_SOURCE_CALLER,
 	KUNWIND_SOURCE_TASK,
 	KUNWIND_SOURCE_REGS_PC,
+	KUNWIND_SOURCE_REGS_LR,
 };
 
 union unwind_flags {
@@ -45,6 +48,7 @@ union unwind_flags {
  * @kr_cur:      When KRETPROBES is selected, holds the kretprobe instance
  *               associated with the most recently encountered replacement lr
  *               value.
+ * @unreliable:  Stacktrace is unreliable.
  */
 struct kunwind_state {
 	struct unwind_state common;
@@ -56,6 +60,7 @@ struct kunwind_state {
 	enum kunwind_source source;
 	union unwind_flags flags;
 	struct pt_regs *regs;
+	bool unreliable;
 };
 
 static __always_inline void
@@ -67,6 +72,7 @@ kunwind_init(struct kunwind_state *state,
 	state->source = KUNWIND_SOURCE_UNKNOWN;
 	state->flags.all = 0;
 	state->regs = NULL;
+	state->unreliable = false;
 }
 
 /*
@@ -181,7 +187,6 @@ int kunwind_next_regs_pc(struct kunwind_state *state)
 	state->regs = regs;
 	state->common.pc = regs->pc;
 	state->common.fp = regs->regs[29];
-	state->regs = NULL;
 	state->source = KUNWIND_SOURCE_REGS_PC;
 	return 0;
 }
@@ -244,6 +249,65 @@ kunwind_next_frame_record(struct kunwind_state *state)
 	return 0;
 }
 
+#ifdef CONFIG_ARM64_LR_UNWIND
+
+/*
+ * Unwind from a pt_regs according to .lr_unwind info.
+ */
+static __always_inline int
+kunwind_next_regs_lr_unwind(struct kunwind_state *state)
+{
+	struct pt_regs *regs = state->regs;
+	enum lr_unwind_mode mode;
+	unsigned int sp_off;
+	unsigned long fp;
+	int err;
+
+	if (WARN_ON_ONCE(state->source != KUNWIND_SOURCE_REGS_PC))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!regs))
+		return -EINVAL;
+
+	state->regs = NULL;
+
+	err = lr_unwind_find(state->common.pc, &mode, &sp_off);
+	if (err) {
+		/* Fallback to FP based unwinder */
+		state->unreliable = true;
+		return kunwind_next_frame_record(state);
+	}
+
+	switch (mode) {
+	case LR_UNWIND_LIVE:
+		if (state->common.fp & 0x7)
+			return -EINVAL;
+		state->common.pc = regs->regs[30];
+		state->source = KUNWIND_SOURCE_REGS_LR;
+		return 0;
+	case LR_UNWIND_FP:
+		return kunwind_next_frame_record(state);
+	case LR_UNWIND_SP:
+		if (check_add_overflow(regs->sp, (unsigned long)sp_off, &fp))
+			return -EINVAL;
+		state->common.fp = fp;
+		return kunwind_next_frame_record(state);
+	default:
+		return -EINVAL;
+	}
+}
+
+#else /* !CONFIG_ARM64_LR_UNWIND */
+
+static __always_inline int
+kunwind_next_regs_lr_unwind(struct kunwind_state *state)
+{
+	state->regs = NULL;
+	state->unreliable = true;
+	return kunwind_next_frame_record(state);
+}
+
+#endif /* CONFIG_ARM64_LR_UNWIND */
+
 /*
  * Unwind from one frame record (A) to the next frame record (B).
  *
@@ -259,10 +323,13 @@ kunwind_next(struct kunwind_state *state)
 	state->flags.all = 0;
 
 	switch (state->source) {
+	case KUNWIND_SOURCE_REGS_PC:
+		err = kunwind_next_regs_lr_unwind(state);
+		break;
 	case KUNWIND_SOURCE_FRAME:
 	case KUNWIND_SOURCE_CALLER:
 	case KUNWIND_SOURCE_TASK:
-	case KUNWIND_SOURCE_REGS_PC:
+	case KUNWIND_SOURCE_REGS_LR:
 		err = kunwind_next_frame_record(state);
 		break;
 	default:
@@ -294,7 +361,7 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 			return -EINVAL;
 		ret = kunwind_next(state);
 		if (ret == -ENOENT)
-			return 0;
+			return state->unreliable ? -EINVAL : 0;
 		if (ret < 0)
 			return ret;
 	}
@@ -394,14 +461,11 @@ static __always_inline bool
 arch_reliable_kunwind_consume_entry(const struct kunwind_state *state, void *cookie)
 {
 	/*
-	 * At an exception boundary we can reliably consume the saved PC. We do
-	 * not know whether the LR was live when the exception was taken, and
-	 * so we cannot perform the next unwind step reliably.
-	 *
-	 * All that matters is whether the *entire* unwind is reliable, so give
-	 * up as soon as we hit an exception boundary.
+	 * If unwinding across an exception boundary fell back to frame-pointer
+	 * unwinding without a valid .lr_unwind entry, the caller frame may
+	 * have been skipped or duplicated. Abort reliable stack walks.
 	 */
-	if (state->source == KUNWIND_SOURCE_REGS_PC)
+	if (state->unreliable)
 		return false;
 
 	return arch_kunwind_consume_entry(state, cookie);
@@ -452,6 +516,7 @@ static const char *state_source_string(const struct kunwind_state *state)
 	case KUNWIND_SOURCE_CALLER:	return "C";
 	case KUNWIND_SOURCE_TASK:	return "T";
 	case KUNWIND_SOURCE_REGS_PC:	return "P";
+	case KUNWIND_SOURCE_REGS_LR:	return "L";
 	default:			return "U";
 	}
 }
-- 
2.56.0.679.gc527c65306-goog

