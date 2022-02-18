Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7B323F
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:12:20 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 2-20020a251302000000b006118f867dadso12684850ybt.12
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 00:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=LY6LzpHZdIBxY444vO4HWJP1kgYlpz84LA6VZYt38hY=;
        b=lEuSn3l5pcezU1xInfoD249SjcfV6GaVFory27iWzbW7ZT7zmkar496VK30MXNJk7x
         789tElCsrFcMjN6iW4M0SbGSgFcN94e5GteBtfV6rt/GjbUNjQsnptSi3adn0kHyWwoj
         /AjelhWScjsbeOMhC+fHS+cHCVwAdMgloltoS9zdXhtqrQTvBapwSHCxhl3DjTB5fy38
         HNolxKHOxT0fBft8mmI3ZP4/+GjGdm9TltWJ4MhKH6Wm/utyS3p3X3HyKNiAAViTAbaZ
         GocNFUTq6VjrdohFHC8YgLDjm6I7O87roTjWj+vI+igE4vicWRZLPvIBkEazW6m5GkH5
         jb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=LY6LzpHZdIBxY444vO4HWJP1kgYlpz84LA6VZYt38hY=;
        b=j8JVt11AQorD8G8DdHre01pZ8H/pq9naP2mRr2fspMuQ0n6ik07dqQ31LZY/Qn6VmH
         GG0S0KLVCA2ryyZgq+tyZf55Wn/aN2iaf2KwzETuiZLOI4E7cCRPogDqH07aZQBjNt/3
         9DyrDIRo9P2A5e+m86VSifYj1O0M0HaDCKOGef+H1MUZZONBcPdnSft+PGuekT80dH7J
         jlqqfsSvjqq1jh5Zuun+vISwhCwFU1pk3k0LfWwbkmKGB+LZEVcqdyETTzlC2pGTjLfV
         QhW9C3gM13eto7DHwrmVadATLuzWnd+YatEf0sx8pneGWpiUzNrL/6QABiD1ndmhrIZl
         cACw==
X-Gm-Message-State: AOAM533Qpnu8hztjuD4k9/4G/6akuxRKp5dTzXLaFaFG8mpYPku+4lK7
	sV6CY4z5IIfsIrqvvMVKezMOwGQaF7l7
X-Google-Smtp-Source: ABdhPJyUH15xOgfJE/7Eoy6tw1EPASMqd2Dis3ZnH3C2ddCvFItgcrZSngmFaM+Jm6gD5vKMDevc9gHUk2Xe
X-Received: from maskray1.svl.corp.google.com ([2620:15c:2ce:200:bdb7:3728:9760:87c])
 (user=maskray job=sendgmr) by 2002:a81:364b:0:b0:2cf:5d3f:d256 with SMTP id
 d72-20020a81364b000000b002cf5d3fd256mr6356301ywa.458.1645171939884; Fri, 18
 Feb 2022 00:12:19 -0800 (PST)
Date: Fri, 18 Feb 2022 00:12:09 -0800
Message-Id: <20220218081209.354383-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: [PATCH] arm64 module: remove (NOLOAD)
From: Fangrui Song <maskray@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
inappropriate for .plt and .text.* sections which are always
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
 arch/arm64/include/asm/module.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index a11ccadd47d2..094701ec5500 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -1,8 +1,8 @@
 SECTIONS {
 #ifdef CONFIG_ARM64_MODULE_PLTS
-	.plt 0 (NOLOAD) : { BYTE(0) }
-	.init.plt 0 (NOLOAD) : { BYTE(0) }
-	.text.ftrace_trampoline 0 (NOLOAD) : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.init.plt 0 : { BYTE(0) }
+	.text.ftrace_trampoline 0 : { BYTE(0) }
 #endif
 
 #ifdef CONFIG_KASAN_SW_TAGS
-- 
2.35.1.265.g69c8d7142f-goog

