Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033AC30C608
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779813; cv=none; b=Dio+iEqsMDQ6FXSphciK4gXrAyS8N7xVBTFR/aFcFcfQqSQVjWLjIyKbw3gDWa3jYwYzySvuwlZx9w5fY3oxUGXvCzlsFMoKmVhj9eqZJ9YMMpeS1Bhxhagk5xj2mezYbr1qhjic1bzvBwXQtZQtvPwXrZva5FjfjnoLdblQsfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779813; c=relaxed/simple;
	bh=N+0RvBUJ08uz7gY4C8XhNnF6MHXEg5OROSx72CVegc8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y5x0Kz6PfkIaSVHjIVhR4wiiaee2sGUQk2yQmgs6JNopUHQN/BfkVfw7h0iZvl234tsMgqrx24eghc148Bi+/UQCI6x2Ft1tWnjDmeXLAk9sysfMF703C/Gm3GSa8nqwnYG+u3chCkRIXDZIVEEqTWNw9o0SLLdQTu+tv9pSUOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bywu8sqz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bywu8sqz"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47ee432070aso18185475e9.1
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 05:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769779810; x=1770384610; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=scSVMH9or2TMfZesMIFkbkxALtorvxefZYfnvMnEqKA=;
        b=Bywu8sqzOw80fkSriobmdlRjmsFUBYCD9rmqY42Mu02h7q2f+V5m71E62VUzbtaVJ2
         8H3VFBgYru2gb9GzzS3vXajsjis4jy8ex2dumD9A/eya+N+XNShjhfVl+82MiQPaET08
         qU+09HwieZz3pIvzEj4aaX0RDRkDgJ6I9w1Nojg4ZRuXf7Lsv7eGaSAJCb86+gBm07u4
         bG786UvCPrvXdPxg9OgI99eIrSqS2/ViTE5JvSaiC/9OdLUeP4PLQnjOQhaHnSSyOwII
         MrqIh9P2YfOGFmcA7W6vPDATIt+xFNzrshiSJdeUxMKMXE3bSsMvdNbPgkvuFtxTlWH/
         O+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779810; x=1770384610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scSVMH9or2TMfZesMIFkbkxALtorvxefZYfnvMnEqKA=;
        b=jzbfi9EffRCB4iyr6tyRYZ3Bw8fzSTLCbnBYeh8TvOxZS36+0/bVBzdEnzF/+BHsRO
         XTiQeEPVPkXJZDFS2cOQCichoQTNVxo4pGBUH8fBlxX3dJ5Yl2CrEs67oEb2rdCrPoV+
         9jpLRhr9JPxOHI5iVWLTy78zsNmAgEzaA8Dj2ycL1CwBwLrGWZOgH6wGdZSCXoT34zWr
         d+tT8WTMttJZW6qS/2Lj4Y+jTAq5kdEHRLl6fI+nP5EMtK0sCQOUDa6NTvpzyGSw+wy2
         7ctNcl36ccN6SaT9hlWT6OtAwyg85E9P77RX05CjuihMC1xQstJm4BoKnHhssB5AATbL
         QxFw==
X-Forwarded-Encrypted: i=1; AJvYcCWO2RpOUB/ubYnIydNWqFih6F29QBtnl1l+XJBM8rdhTBieDf2ZRYmXDTiWgFi3hbfOu/Vf@lists.linux.dev
X-Gm-Message-State: AOJu0YwLJgyJpazdsbUCByXFZXAATWWRxruFbGTT8zjIK+oX9nfFuZJY
	KuEGBmwdYEPF3Nu0urYEqv3U77ALHCGdw8Sg5Xq72V+2T6EE2ltboTD4tki3hxqLmF9lZ/EJVEb
	FuQ==
X-Received: from wmpx5.prod.google.com ([2002:a05:600c:1885:b0:480:4a03:7b7f])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4507:b0:475:dcbb:7903
 with SMTP id 5b1f17b1804b1-482db45ea8emr33261705e9.9.1769779810315; Fri, 30
 Jan 2026 05:30:10 -0800 (PST)
Date: Fri, 30 Jan 2026 14:28:25 +0100
In-Reply-To: <20260130132951.2714396-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260130132951.2714396-3-elver@google.com>
Subject: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rework arm64 LTO __READ_ONCE() to improve code generation as follows:

1. Replace _Generic-based __unqual_scalar_typeof() with more complete
   __rwonce_typeof_unqual(). This strips qualifiers from all types, not
   just integer types, which is required to be able to assign (must be
   non-const) to __u.__val in the non-atomic case (required for #2).

Once our minimum compiler versions are bumped, this just becomes
TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
be used as a general TYPEOF_UNQUAL() fallback (see code comments).

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

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Comment.

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.
---
 arch/arm64/include/asm/rwonce.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..42c9e8429274 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,20 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+#ifdef USE_TYPEOF_UNQUAL
+#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
+#else
+/*
+ * Fallback for older compilers (Clang < 19).
+ *
+ * Uses the fact that, for all supported Clang versions, 'auto' correctly drops
+ * qualifiers. Unlike typeof_unqual(), the type must be completely defined, i.e.
+ * no forward-declared struct pointer dereferences.  The array-to-pointer decay
+ * case does not matter for usage in READ_ONCE() either.
+ */
+#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
+#endif
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +46,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +69,9 @@
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
2.53.0.rc1.225.gd81095ad13-goog

