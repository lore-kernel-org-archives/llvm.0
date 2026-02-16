Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF329E11A
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253439; cv=none; b=qWgP1Dkvk6z/fHn1SJihH0hbyepWxylccsnH6nZSt/u2HSVduYz4K8RzO7zihv2dKZj7VN/I/rnuUKySNH8G6HxcATMXnqZTXT74QzrOd0xNqwoaQhWk386RGYn3slWI4kSHPYy3LSpGXP+BaxwWQGmouHPnaOMqTvoExcJGmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253439; c=relaxed/simple;
	bh=ZUPsEyOe5JsqQojpLzkrHOX340UlsnpEJtleUHPh+3Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CA2Db+TH9tdx1yOAxKq6THgfNHCPkd8XzAX8XyC9JxtWHqFXv2eWiDS3TgI/v6ST8VFGSVpm5MtofhyZd8Cq8CC7ZRUdXpvCJVEa5XBxseSLwGbDRlV0FUcRs1/a/QL+69v6SRAfV454Y7a0x8a9HbDqgkIVEtovwgfwOf9ifu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ydp3D9na; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ydp3D9na"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-483101623e9so28970315e9.3
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771253436; x=1771858236; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9bx2SVNA6p6zRS/D5nNjpug9N+EIaRo9Qayx0T8s/E=;
        b=Ydp3D9na52XnpuNOQz4q0hlluG9wB7plCaPiLpo9ahkKOrok1BgEV/UAPuIg8P/ziE
         60oHP16lSSSgQZg1uW4qzJ0D0PQ2KL8OPUDgxQq7obdoQ07nGVw3itx53xyGu055yEgp
         6JJhFjPbAiE5R3tiZTW7S04L2Ivs/JCRxA6xOp1OtV8ZmKqnDYFNAp2+5QLP+JhqI3WD
         T3kqz5gvNORLOPUaMUWnoHTyQPe/DrWKYRz7Jrl/43EN2EK+rybdLn7WBru5RjiTXOhe
         ZdsM6z2BZx84AeeLaGISw9wRN7gHsyVcWpweSz+7G+lFg0aGRZcr39rA0ENgEO3q9Kug
         QSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253436; x=1771858236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9bx2SVNA6p6zRS/D5nNjpug9N+EIaRo9Qayx0T8s/E=;
        b=tP5apweDMgM4Tc9SY6WlLK4kDfwhLyYv7hzblHK2/iXpsHYX01omjhXfwqMbyJ41Ni
         zDV6WvIoYt5Np/HC3OXSYg4xcgP8ZT4iHQOioB+jEL64RD749g2XVlz1vaH2Bb1HW9Ux
         qxCsISctYHvZIjKFx/IlqJU3CF9dSZaU3hzbhlOgv8vXJVl9UoC86a3wpfKQdPH7JS3i
         JvzNKKUZNbh7PfSURYd55ekafqS4CPKNXnX1ZcoR+bfDiIWGzON4wMyX3ZBTgzo62hKo
         5g+YX7ogwScwNIlfTv10e7mYRe6n3bkUR/WaYpoW1I2kY+nuCKPqsNWlJfRkE+5/cZC8
         EYbw==
X-Forwarded-Encrypted: i=1; AJvYcCVscvThrVoI1ezl56XSpREygIDKHTgrIPS+T7EmpyP5lrvczqV8Fq3N0g1M/vWDpPTt3FT2@lists.linux.dev
X-Gm-Message-State: AOJu0YzWyOHnE/fweACTfdTweU9pPJO0LyrNRG1TFwhmT/9SIGXPv8Uw
	16ibTMHor0QQrzA0VkBasXo7U/MVms0UovnrDDWKiTx2VXxFBSBdw67x250Q6eocy64g41QlMKF
	dQw==
X-Received: from wmbfj12.prod.google.com ([2002:a05:600c:c8c:b0:480:69c2:3949])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f8d:b0:47e:e87b:af8
 with SMTP id 5b1f17b1804b1-48373a5ba01mr192805505e9.21.1771253436108; Mon, 16
 Feb 2026 06:50:36 -0800 (PST)
Date: Mon, 16 Feb 2026 15:16:22 +0100
In-Reply-To: <20260216142436.2207937-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260216142436.2207937-2-elver@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260216142436.2207937-3-elver@google.com>
Subject: [PATCH v4 1/2] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rework arm64 LTO __READ_ONCE() to improve code generation as follows:

1. Replace _Generic-based __unqual_scalar_typeof() with more complete
   __rwonce_typeof_unqual(). This strips qualifiers from all types, not
   just integer types, which is required to be able to assign (must be
   non-const) to __u.__val in the non-atomic case (required for #2).

One subtle point here is that non-integer types of __val could be const
or volatile within the union with the old __unqual_scalar_typeof(), if
the passed variable is const or volatile. This would then result in a
forced load from the stack if __u.__val is volatile; in the case of
const, it does look odd if the underlying storage changes, but the
compiler is told said member is "const" -- it smells like UB.

2. Eliminate the atomic flag and ternary conditional expression. Move
   the fallback volatile load into the default case of the switch,
   ensuring __u is unconditionally initialized across all paths.
   The statement expression now unconditionally returns __u.__val.

This refactoring appears to help the compiler improve (or fix) code
generation.

With a defconfig + LTO + debug options builds, we observe different
codegen for the following functions:

	btrfs_reclaim_sweep (708 -> 1032 bytes)
	btrfs_sinfo_bg_reclaim_threshold_store (200 -> 204 bytes)
	check_mem_access (3652 -> 3692 bytes) [inlined bpf_map_is_rdonly]
	console_flush_all (1268 -> 1264 bytes)
	console_lock_spinning_disable_and_check (180 -> 176 bytes)
	igb_add_filter (640 -> 636 bytes)
	igb_config_tx_modes (2404 -> 2400 bytes)
	kvm_vcpu_on_spin (480 -> 476 bytes)
	map_freeze (376 -> 380 bytes)
	netlink_bind (1664 -> 1656 bytes)
	nmi_cpu_backtrace (404 -> 400 bytes)
	set_rps_cpu (516 -> 520 bytes)
	swap_cluster_readahead (944 -> 932 bytes)
	tcp_accecn_third_ack (328 -> 336 bytes)
	tcp_create_openreq_child (1764 -> 1772 bytes)
	tcp_data_queue (5784 -> 5892 bytes)
	tcp_ecn_rcv_synack (620 -> 628 bytes)
	xen_manage_runstate_time (944 -> 896 bytes)
	xen_steal_clock (340 -> 296 bytes)

Increase of some functions are due to more aggressive inlining due to
better codegen (in this build, e.g. bpf_map_is_rdonly is no longer
present due to being inlined completely).

NOTE: The return-value-of-function-drops-qualifiers hack was first
suggested by Al Viro in [1], which notes some of its limitations which
make it unsuitable for a general __unqual_scalar_typeof() replacement.
Notably, array types are not supported, and GCC 8.1-8.3 still fail. Why
should we use it here? READ_ONCE() does not support reading whole
arrays, and the GCC version problem only affects 3 minor releases of a
very ancient still-supported GCC version; not only that, this arm64
READ_ONCE() version is currently only activated by LTO builds, which
to-date are *only supported by Clang*!

Link: https://lore.kernel.org/all/20260111182010.GH3634291@ZenIV/ [1]
Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Use the return-value-of-function-drops-qualifiers hack to paint the
  bikeshed.

v3:
* Comment.

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.
---
 arch/arm64/include/asm/rwonce.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..9fd24cef3376 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,17 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+/*
+ * Replace this with typeof_unqual() when minimum compiler versions are
+ * increased to GCC 14 and Clang 19. For the time being, we need this
+ * workaround, which relies on function return values dropping qualifiers.
+ */
+#define __rwonce_typeof_unqual(x) typeof(({				\
+	__diag_push()							\
+	__diag_ignore_all("-Wignored-qualifiers", "")			\
+	((typeof(x)(*)(void))0)();					\
+	__diag_pop() }))
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +43,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +66,9 @@
 			: "Q" (*__x) : "memory");			\
 		break;							\
 	default:							\
-		atomic = 0;						\
+		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
+	__u.__val;							\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.335.g19a08e0c02-goog

