Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174733F580
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009733; cv=none; b=FvPtgFQ1xhD+eioD1SfQCIRhnTFTPpbnatnjRf1TSYfwqik3da6PCsCdXAlTqiC0TCJGpcCQ3GuAoGtnSFdObLbNEwQmJHu/6pBmWX0Zn5oyEx8ftDE77MlYb+IyXSqHg+e2G+V1N2l9gmCjRQPaj6fIHfvrcyLaURTlixQd2lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009733; c=relaxed/simple;
	bh=8uYxXlCsfJ2qoRnT3JSJJZBu6F4nxjWNt9la1fSIEJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjT2ag6eU2qC8fIN4R4/QAFHJeA8duFxZLrOGqzehWFye0ws/MZ2XwK3Mv5kzkCrruQm3scEC0hnHdTGupAEYF2DtxrzX53KBF2B7TbwlK3x8KK4RL2vLrobCio8/jBowT43JC6nVkgGWrS11BK7CgqsaKg6lOCBSaR86Ych0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqWxQMCA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqWxQMCA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso5954060a91.1
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009732; x=1777614532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jOMf9sHPOP+Fk6bUCc/tdd0deN6bifNBcXjhksEyrM=;
        b=PqWxQMCAnPSf7Oib9fn7CGcEacnUwFFv7x8k18myPkcMe8pwaeM3vCYGOZbSiFNoS9
         L19tbTqbO3zV4eDZ7rj9dpckuS4qYZ1ZJ26z0iLTsAldYOcQgcNuZUXww5TUQw8QmemR
         oAqs5sEQcV+z6JrVdAZs0vTXHTxhqeVSpGRXQpmBg62zbFNP/9+ij9bAOnAzWUjqM0q3
         1dKJeHMIYwRJSdeia3F18BwcMEYDn4UDnIgAd/eIMp8jiv94jS+8lgx9DX41cO8ZSroP
         sKT4NwJ0NdwO4i0Wd0QVMuGs5DXOtYxwGRAmQwY+8aP8ysi9mHMp0nvESdkm0zVG/ISJ
         jbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009732; x=1777614532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jOMf9sHPOP+Fk6bUCc/tdd0deN6bifNBcXjhksEyrM=;
        b=BERqGA4T2RSREgqrTcVa/3csiTL8iHsrhCqx9n4ZURzSS6rK+BtTRiy6BCWUr/qWMn
         6zf/+7VNDxDb31j+Ka3o4vJRjH029Z3poU6QpU71yiQ3a+vq9+z13yBx5Hc+2YhD9ql+
         Ty+yo3IIBbrmwXLWeLo0ZY1myAbYOAstT4F1UMW65W6klss1xGCU7MIYPhi5FfZbmZxq
         PLlVlQ3Y0EKTLrKI53lPNQWnNjer61M1LJpA46ZZzpYrwVDgZVRZ3PwTzYDi780OdOHS
         lXI9GNZgPirYYnGiehKI4GQSRdih57qYt4Q2TeJjSNoi2zm2VGyXrQQFxpqfqxkh5Yz0
         pINA==
X-Forwarded-Encrypted: i=1; AFNElJ9gx5aW0aW9SuTe3uuNcwGTArKAnB1vHKjB6f9QFYwppVOMcd1d6BtKV534luSUsovUef6E@lists.linux.dev
X-Gm-Message-State: AOJu0YyugbUKqfR3S5DhAOH6DhzWhhkSh9L6Q0l5M0He7ib9IdY08pIa
	EyK3fRkbKCOZlyid0ymmWYKcKhoBamM4//31qhfthV1EGx5ZU9AYn5K/
X-Gm-Gg: AeBDievTmKQb4fA93YalSONUi4o+jajQKzqQW1CrY52bM8+c9WXUGcOI7PQ4nwDRerK
	kLszExxKy4RKvon+8V7IbkD3yNtSUId4M3VfsOw1nXmEczbjzg696EUky7hOdPxE5RWiPH2nPrk
	JFOP1zMc9bgg79SV/26pMFPV/wEYhW+w+3pIQMkziGUlQWv3Zsr3HNmx+sbRko5WroPsiLmFbc6
	BKEXj0ZPBH0R5hRhFTqhrTjCml4l5jWJvndpJfLzZ226NbLU/z+AeyiSIt8Q60n1lfDcclzV7dW
	Nel/ouRbUyXeZcvkJauAv7zctUFxmNslbrEpmZTRTrWm3wdiIbjeJu8J07oyMy2xqdy2vNDeKkJ
	X3pR3eVmUw52q+CyiwSo9w6ElA4gc3fne36ez9h50rcwlIV+xiVcrv8p3oCIpoioODFj5u92H0Y
	A0znNANAVXvnpQU9EOhVWk0AyqTB/BO81USEhhnZ7gAIsb7CknpXtqbni2sr3b+Z2wcl5rs1+CX
	5ifVsnPhUn9+lo=
X-Received: by 2002:a17:90b:5185:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-361403d5988mr33141482a91.5.1777009732009;
        Thu, 23 Apr 2026 22:48:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:51 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Fri, 24 Apr 2026 11:17:40 +0530
Message-ID: <20260424054742.45832-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
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
index 2a5428a5503d..ee11fba7a03d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
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
2.53.0

