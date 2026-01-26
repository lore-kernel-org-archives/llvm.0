Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2118FDDE
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 00:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769387593; cv=none; b=s/8voxQsHGUlwinrfjjfGctfIsB1TnuozAjo4dF3l9GlEuEb2WUuuQxtdhXP0syJXtefkiQJO9/fMMe2DZ1sZFC79mI+zr8N205121K6eumhvvpQA7xTJlr3+GLBx1aoQ9+Yjpl3gZf3EOkRX1wObgBKGmKpAWnyoReJOmpSWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769387593; c=relaxed/simple;
	bh=CL1Mshu87ynwu8kNu8sWz+pKSZGzdgDZHPjtAF+6ga4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WwSUkb5TAJGSDLyjV014dLIJ2QioaCdGr4Viv4D1GqJxOzldNlGygiBMnHSWsq6XTOiYsAAwce4sHbzp7XrWh9Iy6Ogi7ekNK/dy2j5mM8MDnbCwbHGfoHgV2hftKnFGsqSbBy1+hEebagLFDEQ683dLsOIjiRcU05JRnWKb37k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hWAMGfML; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hWAMGfML"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47ee8808ffbso29378275e9.2
        for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 16:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387590; x=1769992390; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=26BDCJEdJLp7RpCdQh1+Gie1UpBf3nEsfBaL4sC4xLw=;
        b=hWAMGfMLLDVw4EEXrfmExFq52kYAHBeVXipwW9LYXdRXrKmQrztXnkau1jsA4eRuUi
         5eGkfzRD6R4rmdEggTuhJYA0VQv9R4Cgk6mfYvWO0AGRUcQdK9KNW4i3TiPtxtOS9fGR
         tqXwETx5nDqJRoazpfI/Cs7SlQE6HCqVgSoF3tg5CkkfNNydMXnmExwuPgb3B599RUq8
         AaLQh9scUdw+f5ZD3LlN42r75Rx407rjKU/Q23/VGzaVEqhtXqNOWrTJvNnT/VdWokeK
         rYs2JbCKmxiZCcsOQ3eegq0wk0trEGdje91AfWRigLExdoV1XIek+eBiWC8ygxLR9Oqj
         8JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387590; x=1769992390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26BDCJEdJLp7RpCdQh1+Gie1UpBf3nEsfBaL4sC4xLw=;
        b=nk5Ia1aEj46hE4ZlfzPwn7oyk7PGz1u7FR5zEKNKo3z9etmsgw3k4iQsSDG17HFVdL
         WjrEjd10mp44/aegCWoQgwwlluXITqCsWn13Pp3D5Q4S3uvi6j5MO6GGaoLuGofRvfbn
         9GobqwM5rb1OJMi6z52bQwWeXs6C+6KvW0Q3sCdI3ZqiTVR+DRxC0Ir8/H1wPoX67jFG
         HQy4xUi79WibZSc7vuqkwhOSZ7Yr1cXu2IhZ5/VK1i3NNLUHaqSmn2FfXJqfvoFjWnks
         nM7xqGhMNyLZ3rZjuToestTBxGSDOH2QN4TnWXveY44QZK5rhSlt+sX9r01cU+wmZyyW
         m4lA==
X-Forwarded-Encrypted: i=1; AJvYcCW5DqKzMl1ag79RcFUsWzcybpPsvsxhyQnw7hPzHYS6o8AlT9gBrJbwh/7oEkv3U0dh6euF@lists.linux.dev
X-Gm-Message-State: AOJu0YwVivQvZF6agC1w0sWlNuKmH9RqPaTb0J8th2Te0wk+NxUP6Sib
	e62ofD4FH2suJ/Nc3mR2W1JJJ7YqMZX+Odn6SiFfAwkqiE26rirz6d8L+/ZwCVE8MqttED731CQ
	6Rg==
X-Received: from wmbjw5.prod.google.com ([2002:a05:600c:5745:b0:47e:e4f5:36ca])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190c:b0:477:9dc1:b706
 with SMTP id 5b1f17b1804b1-4805ce67eb4mr48399755e9.19.1769387590378; Sun, 25
 Jan 2026 16:33:10 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:11 +0100
In-Reply-To: <20260126002936.2676435-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-3-elver@google.com>
Subject: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rework arm64 LTO __READ_ONCE() to improve code generation as follows:

1. Replace the _Generic-based __unqual_scalar_typeof() with the builtin
   typeof_unqual(). This strips qualifiers from all types, not just
   integer types, which is required to be able to assign (must be
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

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/rwonce.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..9963948f4b44 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -32,8 +32,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +55,9 @@
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
2.52.0.457.g6b5491de43-goog

