Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3307403B0C
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499178; cv=none; b=AJcPwfvVRUpNZaM5ppFCVJPHmNUpbey5cb8j3fX8NeJ54SoxoR9vnZ4VcG5pCklIyzMV3Rqp4Di6SnUc0bcpQ7TitIIm+jWF88RF/radpfVs4u04x1E/LCuTSzXAwQoxOp7Sn6V/aCX0aUdz0QClg4kFe4i1RsbVZ2NiBSa/m38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499178; c=relaxed/simple;
	bh=LjMlqvMgecGPg8wVROveeAGR3+uXyQO2X21W2PUKid8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgPXb52TzA7zTTYle1kq3Tu/JWXZ42InYkJ/IiP2nKA2baDSzZPaN5geOAL/eTPCkRXciK9/1ECyknP6BYRUs7tl64YljsZAV5BI4/Grc3sFKgevK7A2QuJyVGtWt2GHcHm0/eH5aAoqYDT4FUvX876J+5Pu8OFvod9Ikdr5kaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVtFU4vh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVtFU4vh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so227303a12.3
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499174; x=1784103974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXAgQLPERGwooEzHznzvpg6SzocRRloWRn0CUVpxEzA=;
        b=rVtFU4vhv7oU2keiBMX6CEADVWyYrVnBlPg3QlFObe/p5Pm7hMIJUxSoLFcihlwvCi
         7o2CtcL/+AClpbQrXxxK6ktdP4mL1424ACLzMUJ/Kj3vSAIdhwK0hWJcZXsKiElql1FA
         oXsvy1m8tF53GKy8MYMSwrhIfKBJa0ykR45CeEc8ucnk510OqMFDLHDzVI69dlmcy2/5
         jzas2fHBJyqgEIaORLv29Jz3nAaA59/yBRn2M2HxnBri4IiREmMn9U4JTkst3X1dl0Kf
         w3tovVfFgAUxh/rlSFjTbS8JSDfEBDDTt0eS16KFdGl7qGo2HTWkKp5EQ165E0BY4FJ0
         1DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499174; x=1784103974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXAgQLPERGwooEzHznzvpg6SzocRRloWRn0CUVpxEzA=;
        b=IpYAWk3PVyne3oY4CxXnKmZQZ2A160pVfcjDKhlQAW+GmYsXC1UeOJcXBN83etx1RJ
         KjNWMZd0gyzcRCHqZFqZNMXxG514Ez97p4VKFAmO++a6yvo6iQ7dvhxOTX7qHly/1LVO
         um0JrYL5hfipnoKFW6svLz6usTdf1FdaPHR1IGIsORwhWqHl694UWKWMUL7//V4GJk+b
         aJEMWXpn9Fr6z1sheG2mOYddrQUhRTFWy70LUvqsDi3rq1HqjRkBRhxYUNEhrPA/7ARX
         CjnTdLOrMOCWROD65MY1piLWs/Ehr5nJ5TeToVAMkUpqkPL1RdUSx1W/YglNPdUxP0jV
         Gjiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8kkcJzAGEFosUbhZ8XfqM8OvVodWCx9T7qzj1c3xNPGhRUW+ieme4TEzacG3oZz73bdHZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzMqmRs3cWQHzgucLwGQDtRATjJgexOxV1k8wd9GF5DvFTMsfWs
	TZcpeqfSPmnZizjiCCjE8VyNwZjQSFW1qe61QijkdJepl31emvh74V+9
X-Gm-Gg: AfdE7cly0zI/QD5GSRxoLLjtL8pXVPZjhSO5cINvI1BCEE7IC5jbFbBtK2OU9mWm3mO
	GkrBANMyEgun5UmTcZbz/z8kGfO6hGUDh2GHugqlTHE3Jswc12YtHZpdSnKVolmpKKj4ohedmeD
	iVKh2jNprHFS5LYAfsU4KvYrsAs0JQdypfsNwYbXDjkwrRkwjigrYKENpeeeqXpHy9su1s5h0eF
	jw08Oy9IdZMiS7GjJOrfqnRsGQ9uHi9GBtf4HmmfbpdOyv6U3Cuoz6LC4RBPWM51rjr/76KCHsq
	yGqT3XF38Fi8o6n4VGnv+ze+wwPqGqHWZRd/uctQyA1E86v4/9K1xYFMu1vao1vf80Odl7vspuU
	mj+Wjq15a3Nq7r8qSliJm+2GDHwGGrcw/leph46BAXWC6HipDgKwZ6dfVchSjVCpqMuKtlASrmR
	98zKnQ4ZnxrnQIbhiKBQJxReLHtq/onkcfj3dJ26IAGz5dv/ELSDdHvusw8MfKMvAshg==
X-Received: by 2002:a05:6a21:9148:b0:3b3:f46:1eea with SMTP id adf61e73a8af0-3c0bcbe9c3fmr1852518637.7.1783499173930;
        Wed, 08 Jul 2026 01:26:13 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:26:13 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V17 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Wed,  8 Jul 2026 13:54:52 +0530
Message-ID: <20260708082454.1254320-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
build on PPC32.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile             | 4 ++++
 rust/compiler_builtins.rs | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 17b2f329c13d..7aa8fcad4c43 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -677,6 +677,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashrti3 \
 		__ashlti3 __lshrti3
 endif
+ifdef CONFIG_PPC32
+	redirect-intrinsics += \
+		__udivdi3 __umoddi3
+endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index dd16c1dc899c..fc6b54636dd5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
     __aeabi_uldivmod,
 });
 
+#[cfg(target_arch = "powerpc")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __udivdi3,
+    __umoddi3,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
-- 
2.55.0

