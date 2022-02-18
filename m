Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EAD4610
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:26:16 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id j17-20020a25ec11000000b0061dabf74012so12732219ybh.15
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 00:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=RZAu1RopNW0ZnAhNX12nSJphTGjmyvccd/3qHZblYXY=;
        b=rCB+yv0t3K2artQviTbyk/s1ERydB/bk4ZSc8CtHBGWDb960G5TEmbF7KVd59dToSl
         fbSTCa3ux/7+xckpeHEGWrupiuQ26paV6JUm7AiZ695TBD8MwKRpOXr1aAyblZxp4f5z
         wI6qmLnLkEgVobo9GzyV8cgaoN+kiaMeSqzgzciQz0swVMXroFwjHuW8iSJsYMwGUJ7T
         QwFy6SnNz0o9fQrZopD2msec3ba4QSNiuewF7551R5Uc+CXwz/pBlVURbYaCatjKNFW+
         bVQIrlRO0drjc0DgrBs7NvA4cOLJLuyjnwhsN0Xe0nzTTlWeeZ/5uVnQvZsO1Ej2Aijn
         1ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=RZAu1RopNW0ZnAhNX12nSJphTGjmyvccd/3qHZblYXY=;
        b=Ew3Bq+c8rF+XbIel/Hmw9wxg5F6AlMP48bl2JeBySUcGtSJRftydRrmpWC1qicO5NO
         CsXX9JXR1aQQWrspn1WJYMM0FA9s9CwVgaTYOmuIEAe1cicc4SyUKAb5eKq64Bdz+PQu
         e72+DvAADjXKT1T2IQ0Dibes1iCi8fAZEz17pwm5F9ovaKLYp/sCOQ9jEx5JRaXnTwvc
         6CSZG8Prsf+KEkXvkdj6JG/ymW5EzSVhrdRPbZtVunwMhoURvQy1OxLfmCmM4XiJ9o/l
         y8ZtaPuL6raPJiYqzZwpcPSNSWy9HglF5CPXwWqmdiDg4zHvslHI4SD/1n5yTmyCKcQR
         EFOQ==
X-Gm-Message-State: AOAM531IkHZP1OV8p+/KPomamVgJaByy4mKHVnfEHv1laHPSE7FCr+1p
	5k8LEvzfm8oJk66DBiU/JaMYQ8D2rfm/
X-Google-Smtp-Source: ABdhPJxrlB+xqNTDUqw0l54UMAh7wnOLcJJX8wTR1FqNzyU2jkIXBNFKEJYtk1JqNQPyLFtrWMgHYrCO8QR6
X-Received: from maskray1.svl.corp.google.com ([2620:15c:2ce:200:bdb7:3728:9760:87c])
 (user=maskray job=sendgmr) by 2002:a25:d6d3:0:b0:61d:aa5c:7e82 with SMTP id
 n202-20020a25d6d3000000b0061daa5c7e82mr6379447ybg.404.1645172775391; Fri, 18
 Feb 2022 00:26:15 -0800 (PST)
Date: Fri, 18 Feb 2022 00:26:11 -0800
Message-Id: <20220218082611.396353-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: [PATCH] riscv module: remove (NOLOAD)
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
mismatch` error. Just remove (NOLOAD) to fix the error.

[1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
section should be marked as not loadable" on
https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
outdated for ELF.
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
2.35.1.265.g69c8d7142f-goog

