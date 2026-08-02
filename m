Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861C2F7F1B
	for <llvm@lists.linux.dev>; Sun,  2 Aug 2026 17:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785692628; cv=none; b=UJvRJt0VSoAsREgj5qVbM5SSaUgq/2Y/RoGm4zMfR8750PlXMQBAAnTgkKtLed6Xe2roTQfGcOakZllm+SpzC/UKEHHxuY+/FJfvGBXu8wuFMfxWZg4veV2QXNytGyuS7DF0qd3Lj6vcQG2glKVc6yy6FSxI+EibTa3LO2hlKMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785692628; c=relaxed/simple;
	bh=2PdofMD4taq71C6oaKIJKrYG+dAb9Plu331zoDvQ0os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HaCCC0po3CEJ55VMPcJ3fjH4vqp4VUuJGk5SmOsfMb9XZVYIr9kZbG4stS3jmburWeSJZA/kV8vJ01XOwEBG/IGuie1pvhQlwWuIu4UvxEWz02162S2NuTYQeJwjYbwMcvc2yYim4A7N0P/vwrYG8SisP6UI/Cm33jdt02u8F1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maskray.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maskray.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso26991935ad.1
        for <llvm@lists.linux.dev>; Sun, 02 Aug 2026 10:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785692627; x=1786297427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFKIp+dilVhwH1i5aZzLKKk+gBZw8/UsY/+UeYQbT7Y=;
        b=N66Kxk0tDVOHV0gGqrv5tVMyhD1nQRmd6GK7q5cm4lYIS4NcENBMy4zCMdNoDYqzi9
         86TEEUrLeoxQ/Et5i6u5Xtx7LopWkbq8bFa2gLder6cyMq4DWwc/D8PpVV7QlSYhiBTX
         NLXdrgqKF+ISX7WOLUNHrCFiRz1n2I5htKF5ubNh+lRY76IxMNBGMk2Vc8KDQ7cmlw6a
         2CJvxzhkbGe/ISrPL0e+p0mOmDBfRmp+dKS+EwE/rHSr3dHJBq9LLbNKJh4CN6xoF1QP
         Vf5unCC9muCh5WH4o+w6Wk3xNESZWs9yVn2DCrU4SGS4o8dhwvHVu5BK8O8HMd6TOluM
         oaNA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu3Tlq8aKYo1Si52MK3RprVPwRYp6b/FYxTyz47OhktoS1qMztTLyX0lFdRspxfNAVRKo/@lists.linux.dev
X-Gm-Message-State: AOJu0YyN7cblq2ohi92pG8LeXgHDxg/dJuxsOtDOHO9APqhO3dSOcevB
	kwZqgbBY9udurb+myw04hPo1K3O8TwzZJE5pYrZjwQ9eR9hiCY2woUs3
X-Gm-Gg: AR+sD13++g8A3YEH8+gSuOyNLdBdTPeObXnYym5j3UCeMK/p0cVh9QoGmIWYrbiZi29
	KRLL6YLS6pgjd52pP9R/adWxMi64rLAfO4Rxu6A2J0ujUtyLHN+a+LRkktZXyNkqDY1jO51Ow4P
	9qZys7+nDpMRR5muXBouUIhYkW4co1ZrsWW/t/EN3kYy7eR4ba6D9xVSBU5eRIDecKF/9RqmuxF
	z8Y8i9HAVEyjrMkSn6nTklucr+mvfYnbh8NhkFBAoT6OGnSYh8U1OkdikXJFaTcXiuRw9oXgfn/
	5+H/GrMkB7GvWF1UHaMmZc+XlVubINGB47nW7jHsjqdeCSsVgOODnCAWNX28IAvXve/MCJbS1z2
	d7xJo1XoaH1XAZ62s9dYghkfW//9lkRwQzwcIXvPo2Hu52GUTzdXy2pijEusTSfMPVtkvb92R3b
	KrqWmn2c2naLcFe2NapUbw+HxGrA+PuLFH2csxKoAfeof0lw30m93sBvI072HlBSf7l2xBtmGlc
	geVpbgLPUG8IklOiiUE0JTvjgxCZ9uxHJvPzyFTiInbOFka
X-Received: by 2002:a17:903:390b:b0:2cf:bfbb:61e2 with SMTP id d9443c01a7336-2d0524723b8mr69480925ad.39.1785692626770;
        Sun, 02 Aug 2026 10:43:46 -0700 (PDT)
Received: from localhost (37-72-172-174.static.hvvc.us. [37.72.172.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm28231366eec.20.2026.08.02.10.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 10:43:46 -0700 (PDT)
From: Fangrui Song <i@maskray.me>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Fangrui Song <i@maskray.me>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] riscv/runtime-const: Disable linker relaxation for RUNTIME_MAGIC
Date: Sun,  2 Aug 2026 10:43:42 -0700
Message-ID: <20260802174342.597092-1-i@maskray.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ee10b1028129 ("riscv/runtime-const: Replace open-coded
placeholder with RUNTIME_MAGIC") switched the lui + addi[w] placeholder
from hand-encoded immediates to %hi()/%lo() of RUNTIME_MAGIC.

GNU Assembler folds %hi()/%lo() of an absolute expression at assembly
time. LLVM's integrated assembler since 21.1 defers it to the linker
instead, which range checks it: on riscv64 R_RISCV_HI20 must fit a
signed 20-bit field, and RUNTIME_MAGIC (0x89ABCDEF) is a positive 64-bit
value rather than a sign-extended 32-bit one, so it does not:

    ld.lld: error: relocation R_RISCV_HI20 out of range: 563901 is not in
    [-524288, 524287]

The sequence is patched at runtime and its instruction offsets are
recorded via ".long 1b - .", so the linker must not touch it in the
first place. Add ".option norelax", as is already done for
ALTERNATIVE() and static keys; the integrated assembler then resolves
%hi()/%lo() itself and emits no relocation, restoring the exact
encoding the open-coded placeholder produced.

Fixes: ee10b1028129 ("riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2179
Signed-off-by: Fangrui Song <i@maskray.me>
---
Applies to tip/locking/core; the RISC-V tree (riscv/linux.git) does not
carry ee10b1028129.

 arch/riscv/include/asm/runtime-const.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index a472ebbf0971..ce2008bb5227 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -23,6 +23,7 @@
 	typeof(sym) __ret;						\
 	asm_inline(".option push\n\t"					\
 		".option norvc\n\t"					\
+		".option norelax\n\t"					\
 		"1:\t"							\
 		"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
 		"addi	%[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t"	\
@@ -47,6 +48,7 @@
 #define RISCV_RUNTIME_CONST_64_PREAMBLE				\
 	".option push\n\t"					\
 	".option norvc\n\t"					\
+	".option norelax\n\t"					\
 	"1:\t"							\
 	"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
 	"lui	%[__tmp], %%hi(" RUNTIME_MAGIC ")\n\t"		\

base-commit: 5e601ab3615c86be7c4068ce992f94654693a032
-- 
2.43.0

