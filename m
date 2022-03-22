Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45C7A
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 01:26:21 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2d07ae11467so138851037b3.12
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 18:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Zcfus1hr4rL4+XSk7ZeSMnR2CKTg6P0EKLP3F7c9nb8=;
        b=i8x6bw63C8CnBwNWToBn1ejwhs1I5sT+Qt9rGn8CdzD2q5bI6ajCe3oOQ78/3FZGIs
         qmXDGKtcf8+1xdLslk9ffOSueyPzSySWMSsk5Yq8Ly0Wd5PeXu0lxN1YBt84AS2iny0Q
         A0fzfbjqIHB/yamvOOvVSOO6Nx+KjZdAEe39VS4o1cjeZId+2Y0ZnFkqrcKqcS99Xlrs
         Y79QpCoATrBt4sBO6s619f0NsNV3loVUEwp9wTNb0aPu41sSSH+jhAKIOjE1W9ELy2l3
         Adh+H7EmKMo9H0/LyE/2qeSEKHxHjskBU9fCJeJ1yYdC3WyJDhOm4FnonjpV0MsT/W3m
         vaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Zcfus1hr4rL4+XSk7ZeSMnR2CKTg6P0EKLP3F7c9nb8=;
        b=gJ/1Ex25OqtYO62baKhViO6l1ujiacsPxRe3ZkKur1XZqJ0a5czDhnaR0cQXn6eNov
         rgZCE3oiV4wz21boZjU2TW4lRqXCbF7yaz45K7jbdqvJA4grSMeOgQKJSrbnke9+aZxN
         xY4G+k46Mz1pAydHADWMl3z0sy+S3clumLJoEuuznUK06SU3oCCfoSIyCwa982HmAeAL
         ktuAqotlXxoCC1doORbb+CHNE5j5AELUpCWfG3Cz4dUQX+aw1z/JMxm+3bbdBgsSuu1K
         F56+c088wqfdnvYUx0u0UN19lzaSZMeDsFJ8MkqxrtF8o05EeQ89N2g003wis5S/pgsJ
         JkqQ==
X-Gm-Message-State: AOAM531lcOkSORpF8RpgJ1UhqbLkGoIg8/66M4xA38qNByazW6OrP+B8
	NMSDUXn780ZPTBxQ5WCXPLJEew2G77Xx
X-Google-Smtp-Source: ABdhPJxWQf3SqgA1tT/yCHPjgY7eRo1TW3y0rLfi2WTbwvt3o1LIklSxiCpYdgBDhAGwzIqiHVsde/KU8+bJ
X-Received: from maskray1.svl.corp.google.com ([2620:15c:2ce:200:b489:622a:ba50:950a])
 (user=maskray job=sendgmr) by 2002:a25:dd87:0:b0:628:e822:bd with SMTP id
 u129-20020a25dd87000000b00628e82200bdmr24014508ybg.505.1647912380832; Mon, 21
 Mar 2022 18:26:20 -0700 (PDT)
Date: Mon, 21 Mar 2022 18:26:17 -0700
In-Reply-To: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
Message-Id: <20220322012617.3517297-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
Subject: [PATCH v2] riscv module: remove (NOLOAD)
From: Fangrui Song <maskray@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
inappropriate for .plt, .got, and .got.plt sections which are always
SHT_PROGBITS.

In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
and (NOLOAD) will be essentially ignored. In ld.lld, since
https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
customize the output section type"), ld.lld will report a `section type
mismatch` error (later changed to a warning). Just remove (NOLOAD) to
fix the warning.

[1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
section should be marked as not loadable" on
https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
outdated for ELF.

Link: https://github.com/ClangBuiltLinux/linux/issues/1597
Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/riscv/include/asm/module.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
index 4254ff2ff049..1075beae1ac6 100644
--- a/arch/riscv/include/asm/module.lds.h
+++ b/arch/riscv/include/asm/module.lds.h
@@ -2,8 +2,8 @@
 /* Copyright (C) 2017 Andes Technology Corporation */
 #ifdef CONFIG_MODULE_SECTIONS
 SECTIONS {
-	.plt (NOLOAD) : { BYTE(0) }
-	.got (NOLOAD) : { BYTE(0) }
-	.got.plt (NOLOAD) : { BYTE(0) }
+	.plt : { BYTE(0) }
+	.got : { BYTE(0) }
+	.got.plt : { BYTE(0) }
 }
 #endif
-- 
2.35.1.894.gb6a874cedc-goog

