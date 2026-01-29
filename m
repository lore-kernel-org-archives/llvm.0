Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09295302149
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 00:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648227; cv=none; b=KvwhwPq9zpfEqz/QyWhPprv+HhiNTIUmNfjyXHz+bmqTiegbB8f+pvs5vfGrzM/FwQv88Ov5krDGVRo0xYueyjTajhYaDCwW5aBoL769IcPczlWSAZWsSNM0ulG44kXfNgURML7N1VuaozrzQ3mumv98/QgUgz5HSwUiP/TINn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648227; c=relaxed/simple;
	bh=MvUOKLho2jKBfdgvboP27mM4IneJRcgFSHwRZj4mPlY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WSWASXPIv4thD/n4dHalTH8B0jnR3KNQZGW1g8PEzBOuxfTOk5Bh9ia2xDJ73t1ay1rlxsUXx8Ae2TkYesH9iQvw1+Zq2kh6TuO/iwJ5msA8cin3rIKHMvWWnOy4RhyqVvo776vUDBbER5UTCkXMlbeefgv4107uiC8JCXTX6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Alf/soHp; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Alf/soHp"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d4029340aso3867335e9.3
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 16:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648224; x=1770253024; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=39tQtLJhBsKv56fU5nhbcwIq1x9fDO/7QHDSaFgeP0Q=;
        b=Alf/soHpLmY5oTRcda2E+0hyyxqngBz0ymUmQAttYDuBHqPDFM+nIXQmKKkQexaY+5
         BaJAHNYiXXlqh62moXkht22bUMaeETd88yBnOSDgUw0wkIEMXk75CJelZoZlyuatcbYf
         2jVu+JH0fRSgW6ibPtTjtkin+i9yksyHjje13RlVzpP4OgZqgoslKCP1/JkEhBY48tbY
         Tv9VhRN/JtEpLQ8lNnxqr2L2SUIMIA2Phe+fnajYWLBoImomXr6yKRS0H8nxQ+JNaZyk
         pAM+JYYrEh8gYePapCYYRgjuSczHMP3s1ybiL3rE4T3UJkKiFo+AN0zVsWWQMfvuvMVP
         RjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648224; x=1770253024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39tQtLJhBsKv56fU5nhbcwIq1x9fDO/7QHDSaFgeP0Q=;
        b=xDLXVb6Td81cTsjW+Cyyu8DZzzY8+r3DF8eko2EM/aNif6nr0u8qFvJt4Nl1vopG47
         zyubgZbHb4YO/XYok5kVSWIm5E1CVXwEW6/Oif6eIbl56FbUe2WkOwnHKXM6Y1Ov1B7P
         CnPzKfI+h4Wvx2H/2DKHZCshnjSGzZUnTtBgeeHTcXu3/oxmyGt2D8HT/gKXfjlYwhZm
         6SWfOew0LshQNq0cxLB+oGlKRHegixoD+UZoyir/FkLAD3KN93M0mr1TQ35tYeXOJYD7
         RzTaGsBEx6ViqbjWlTpYS3y9oP4mZhPcz/pBJBccJlLt2zp3MjpbBGiwLDGdRPdSM19g
         9mcg==
X-Forwarded-Encrypted: i=1; AJvYcCVkvZU7Q8Ky5cEln0DclXM4nglZ9I9OIibJcB9kfF/OVIST77YkyB7KBgzi0CLxiQfkscrT@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4/gw1g0iiTr4La2rUSLpc5fWYLKiJ9b3Nb3QLG7olThpG0KbQ
	0vORuiloJizxctIkQBB8VYf/hD7OaBBvtji15iCSm6xkLq0uzAd8KPedYP7HbtOXq8UhGNHQjAp
	kOA==
X-Received: from wmor21.prod.google.com ([2002:a05:600c:4595:b0:480:6ccb:80fd])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8217:b0:47e:de9c:92ec
 with SMTP id 5b1f17b1804b1-48069c21045mr85583175e9.14.1769648224306; Wed, 28
 Jan 2026 16:57:04 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:33 +0100
In-Reply-To: <20260129005645.747680-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129005645.747680-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-3-elver@google.com>
Subject: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.
---
 arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..712de3238f9a 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,23 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+#ifdef USE_TYPEOF_UNQUAL
+#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
+#else
+/*
+ * Fallback for older compilers to infer an unqualified type.
+ *
+ * Uses the fact that auto is supposed to drop qualifiers. Unlike
+ * typeof_unqual(), the type must be complete (defines an unevaluated local
+ * variable); this must trivially hold because __READ_ONCE() returns a value.
+ *
+ * Another caveat is that because of array-to-pointer decay, an array is
+ * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
+ * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.
+ */
+#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
+#endif
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +49,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +72,9 @@
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
2.53.0.rc1.217.geba53bf80e-goog

