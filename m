Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1238173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 11:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F33CC34607
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639479946;
	bh=LS6ukPn73nYGhW7oHvAxO0eyMwA69AtGWOW3qvBCcaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZX3WrYNVyVapVzoI9iygt/Fj1pqkPDWMqTZ/FMbJ6vYdkkp9tHR0CVXtyqpdthgas
	 MY2hiiV2Qt4bZbbxlj04WO7rYQc5DpQv2Kul4aoumcA9+ak/6wQOks7VbVqptLorH9
	 On+5urN6PEjbEloiWyo9TLAu9DUM6EjgxlkSw2ZLuyoKXJ0gZk/fvzsJ3kvOexHl4A
	 YGbuhdBbp3oXZYf0taivlLq6Hu3lghS/8gpKnY6r6Qt0kqYl1pS9+lH2ROvsgchPgE
	 j8Hfy4hroTGWg3CRASJUaQ0YYx1L9YFMIpQBuxc7g30oJ2y3P9LIwelLCIwF0rGt8V
	 5CehaGtnemweg==
Received: by mail-oi1-f180.google.com with SMTP id bk14so26799373oib.7
        for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 03:05:46 -0800 (PST)
X-Gm-Message-State: AOAM5335Zk0M9BVITLBop4kHLRB5T1LpU39Ed6VJaWioP/KCu7uq1psc
	QBH0NrI2an0ZoxX5qGh/XlkCVqyclIuvEWNvj2k=
X-Google-Smtp-Source: ABdhPJzM0f99Waf5tZI/4HBLSb3S6BX5djeyoICvHu7DSsVqE0LIQEDn7tBazuzICXPpkUrrXgHakUWxrEa7Af0UjV4=
X-Received: by 2002:a05:6808:1919:: with SMTP id bf25mr3892104oib.33.1639479945765;
 Tue, 14 Dec 2021 03:05:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213140252.2856053-1-ardb@kernel.org> <YbgDR461O9gCEi+Q@archlinux-ax161>
 <CAMj1kXFKuHuzsrDBcUjbaVO6-NQkj8J+vMty_qU3Y0pDwT905w@mail.gmail.com>
In-Reply-To: <CAMj1kXFKuHuzsrDBcUjbaVO6-NQkj8J+vMty_qU3Y0pDwT905w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Dec 2021 12:05:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGadU-_dM9OtXzy6OqKqReYyzEB-F6NVwDOEodpzwtemw@mail.gmail.com>
Message-ID: <CAMj1kXGadU-_dM9OtXzy6OqKqReYyzEB-F6NVwDOEodpzwtemw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/xor: use EOR3 instructions when available
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Dec 2021 at 09:19, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> + Arnd
>
> On Tue, 14 Dec 2021 at 03:37, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Ard,
> >
> > On Mon, Dec 13, 2021 at 03:02:52PM +0100, Ard Biesheuvel wrote:
> > > Use the EOR3 instruction to implement xor_blocks() if the instruction is
> > > available, which is the case if the CPU implements the SHA-3 extension.
> > > This is about 20% faster on Apple M1 when using the 5-way version.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Our CI reported that this patch as commit ce9ba49a2460 ("arm64/xor: use
> > EOR3 instructions when available") in the arm64 tree breaks
> > allyesconfig:
> >
> > https://github.com/ClangBuiltLinux/continuous-integration2/runs/4514540083?check_suite_focus=true
> >
> > I also see this when building with GCC 11.2.0:
> >
> > WARNING: modpost: EXPORT symbol "xor_block_inner_neon" [vmlinux] version ...
> > Is "xor_block_inner_neon" prototyped in <asm/asm-prototypes.h>?
> > aarch64-linux-gnu-ld: arch/arm64/lib/xor-neon.o: relocation R_AARCH64_ABS32 against `__crc_xor_block_inner_neon' can not be used when making a shared object
>
> I suspect this is another genksyms crash, preventing the
> __crc_xor_block_inner_neon symbol from ever being emitted.
>
> This is a recurring annoyance and I am not sure how to address this
> properly. Arnd might have some thoughts on the matter as well.
>
>

I managed to reproduce this: it's not a crash but definitely a bug in
genksyms, as it simply fails to produce the output containing the
assignment of __crc_xor_block_inner_neon.

Moving the definition of xor_block_inner_neon as below works around the issue.

Catalin: would you like me to spin a v3? Or do your prefer to just
fold this into the existing one?

diff --git a/arch/arm64/lib/xor-neon.c b/arch/arm64/lib/xor-neon.c
index 5c8688700f63..d189cf4e70ea 100644
--- a/arch/arm64/lib/xor-neon.c
+++ b/arch/arm64/lib/xor-neon.c
@@ -167,6 +167,15 @@ void xor_arm64_neon_5(unsigned long bytes,
unsigned long *p1,
        } while (--lines > 0);
 }

+struct xor_block_template xor_block_inner_neon __ro_after_init = {
+       .name   = "__inner_neon__",
+       .do_2   = xor_arm64_neon_2,
+       .do_3   = xor_arm64_neon_3,
+       .do_4   = xor_arm64_neon_4,
+       .do_5   = xor_arm64_neon_5,
+};
+EXPORT_SYMBOL(xor_block_inner_neon);
+
 static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 {
        uint64x2_t res;
@@ -296,15 +305,6 @@ static void xor_arm64_eor3_5(unsigned long bytes,
unsigned long *p1,
        } while (--lines > 0);
 }

-struct xor_block_template xor_block_inner_neon __ro_after_init = {
-       .name   = "__inner_neon__",
-       .do_2   = xor_arm64_neon_2,
-       .do_3   = xor_arm64_neon_3,
-       .do_4   = xor_arm64_neon_4,
-       .do_5   = xor_arm64_neon_5,
-};
-EXPORT_SYMBOL(xor_block_inner_neon);
-
 static int __init xor_neon_init(void)
 {
        if (IS_ENABLED(CONFIG_AS_HAS_SHA3) && cpu_have_named_feature(SHA3)) {
