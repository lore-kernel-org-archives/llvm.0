Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185601F16B
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201257; cv=none; b=LOVzhb/NIS0jiFS+A7IkR5T5yFH+TILw9Ae40IfJjxPn8itz/nK5JICXEAJMzBl9Mv7N0FPBAbfSWsvS3jBnAffg/W8bS5PCdu6APxPuGOw0fJJv75QhiUk7cT8DCwrNO/cA8BjNWa4Wk6wV+93n330rAOVW0vexKQPzi8OIcZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201257; c=relaxed/simple;
	bh=bZp8zfSf0+0j2MuhSlyeDxaKsIo8xAezFmdEdikJQpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AKoqZ9skPi0yRQNBKSc6ZZvSzbSMcDwaf0QytBGao083pdLyDZwI2/wwcux5CgKPrEuJLNWoWZsrSIHPOIVFW/V7fHYIZ/GHyeHCSUz4c9l0o9Z9cIocmhTZ8UbPpoPI+vzBBBbnjjinq09A8zmjttlaZRV35sRR/GIzBKpOFIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sv+VgYH1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sv+VgYH1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad617d5b80so54130435ad.1
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201255; x=1777806055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edTE4+K3AUC8N+XPcCOjDXD3S338RUHsqJvIH7+h8+A=;
        b=sv+VgYH1WdJ5fvmnFZT1ROEMvxShYQoV03KwkLs6YvwKOhS6TiK4O25yYuVjoUCUD6
         yLAUlfS+5UVSjmhOZLd/FGaUNtBpfPCSigJryDz/YTjJQwcnmrDVSeXd2EtmHS8+5uoF
         wvd96tPAjL5UIXOkQK2fl3u0vahroE7G8UTAiQSqsFYqd/1m8SZfRG4W+WMftBfdFbMX
         WiujRnx2VJJ+eDO7dIU+tlHcnVcKnJVzln8xjffzoLIDMxZk2ZJovIJzFIepmwWqFRqe
         whax6Q5EHSWunjPxKaRVrw6mzL1Okf2fZq4fUxD0wi9UzL6q1GiVMxfgvNSvtcAXvoAt
         RwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201255; x=1777806055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edTE4+K3AUC8N+XPcCOjDXD3S338RUHsqJvIH7+h8+A=;
        b=LhEocEv1EKNrEM53OhU6x9LJcy6ORv1+G9JB9IdXeUeJRCt+HgyNbHheVi9SNPsQw3
         iuo5TcynuKLM+pqXy2C0Sf4z7pcB3UizC/8fS5+qDljFop/wvcna7uQffxmEilW65wgC
         mf1usFZhRhWta++d+11Y/XDSakhBFaSXK5ji4tH4Aw4hHVRM66Xkr2ZswKkc9rMeJLwg
         OmIosDyU9d/5l9sZ0jAS6GpYiLrpmTknFzkNlkZL75GaHio26+C5ptt37CTTBsGmkNnc
         tcsP8OYRSv4NCpsq85LpFhfY4GbBybrjhVb7Dz4dPEUKLPbeH7FYBX4JJapR4doFT+T9
         iTtw==
X-Forwarded-Encrypted: i=1; AFNElJ+YgKM3nm9Gkhytd6qr/uie9NfAd/Pmw+7/IWzDldLU0dT7EIcszBwakCNqumn8M2P2Ig1z@lists.linux.dev
X-Gm-Message-State: AOJu0YxVqAvUu+jx3fpBeujAbUUsgBsQXVb9WR9um/BQhLnPXauXHaa3
	ZV1FSVq/QaYtf//NG+l6bLZhYQ+VTppS7QEZ2xCvX8wsVwjrr8//3xGK
X-Gm-Gg: AeBDieuJ2Z1LfgvnrDS4zfJbYBv03pAplbSwU6JYdY14wf46JPndcuALvQNMrNwWUG8
	UKqkLyzeroiSH36IUJyhJ2X1nV6xaXhnizm5FDPw5C5EFdEaSHuSx7vH7aSRMXfNVVeXRZc7ZG5
	6IuT21SLTzHH0bodqcWyz/Sm/AUyNh3TEMld9S28/iP6fmeO9n0D7p3in1scb8L7CgbvJo6tYOz
	lThpDVbz7c8kf5cUyOySYrfH2LtT3gFcjJV+E354VgmMzYpRTa7prRSGrugx61woP04C0BupQeF
	KOhqNcN6g5ycOvBAC3uRjk94CxDgjwqk1+7AMI7jvy3Lm8bYdrSFUl8jwhIb2VQfq+PiGvQt1ex
	ACmrVA5FN86LV/KNbuOxXvorw9FdJ6y54L3FYmTiS3XhIxEPf3sSaMqZObA1nJCrmVVDYoSbj0G
	rUUME5fSBkfDWjt3Y0hsy77pFdOniPTqJxnv4i4N7C5Kp0Zn8bVT3AfHrH2ohMmclPzuXPURnSQ
	mMUW1CH6/kcf94=
X-Received: by 2002:a17:903:2284:b0:2b2:5822:7a70 with SMTP id d9443c01a7336-2b5f9fcfc2dmr396373895ad.38.1777201254932;
        Sun, 26 Apr 2026 04:00:54 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:54 -0700 (PDT)
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
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V15 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Sun, 26 Apr 2026 16:29:30 +0530
Message-ID: <20260426105932.2270364-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
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
index 44ec1634714a..d70fb186cae9 100644
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

