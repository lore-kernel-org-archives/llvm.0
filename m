Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D32C80
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 08:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE90C34607
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639470009;
	bh=ZPX5WOauPLBFAA7/nm7d89PTpA2MGv0mdjmSsflDJtU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jRcALEu97XSjviU9ZS7Klgy0jDfbdAeQCRRXyR8pperYbUNaJUJq8hm97ERfFDVB6
	 q+FPOfNADSAWjxWooIIfA5u2I//GjfbqgfL7/89L73rcrv+Cdtl2gZHq5/4Re/P3Ay
	 QAqgr5jcccOpILDk9r0Iv4EJFHw8cxcenpe/5LWSLZNzCreGN7K6mFcvMTBu+H/swF
	 gSo9Bjtm1RH+E35GyBE9rV9IvY2kwl/zkU9qgfXnI8amfZKA0Eb8/WWq0fYplQ1SAe
	 XtwkAPyAEOz5LGkESZErIxnr/hB2kcl+NMXW3YACtbYUL+yP1PFwOlKLt4P5Bh9XDG
	 wX82RMnY+CFYg==
Received: by mail-oi1-f173.google.com with SMTP id q25so26521355oiw.0
        for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 00:20:09 -0800 (PST)
X-Gm-Message-State: AOAM531gRrn14/BeWBqp4PYu4mv1SMWyEQ3JVusYZQb+1nyLxpB9UnjE
	6uqm5hjW0AniygD6hQi8i1JOxAiIVaKPFchFoOM=
X-Google-Smtp-Source: ABdhPJz4o8XqXrzGvXt6FC/1tFVAYz2c2UxuBJZib/SgH1TVMox0vQG+VfvOmaY6qm0cBDymgWdpyZk3kLkQCYLI7hY=
X-Received: by 2002:a05:6808:1919:: with SMTP id bf25mr3353729oib.33.1639470008950;
 Tue, 14 Dec 2021 00:20:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213140252.2856053-1-ardb@kernel.org> <YbgDR461O9gCEi+Q@archlinux-ax161>
In-Reply-To: <YbgDR461O9gCEi+Q@archlinux-ax161>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Dec 2021 09:19:57 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFKuHuzsrDBcUjbaVO6-NQkj8J+vMty_qU3Y0pDwT905w@mail.gmail.com>
Message-ID: <CAMj1kXFKuHuzsrDBcUjbaVO6-NQkj8J+vMty_qU3Y0pDwT905w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/xor: use EOR3 instructions when available
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

+ Arnd

On Tue, 14 Dec 2021 at 03:37, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Ard,
>
> On Mon, Dec 13, 2021 at 03:02:52PM +0100, Ard Biesheuvel wrote:
> > Use the EOR3 instruction to implement xor_blocks() if the instruction is
> > available, which is the case if the CPU implements the SHA-3 extension.
> > This is about 20% faster on Apple M1 when using the 5-way version.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Our CI reported that this patch as commit ce9ba49a2460 ("arm64/xor: use
> EOR3 instructions when available") in the arm64 tree breaks
> allyesconfig:
>
> https://github.com/ClangBuiltLinux/continuous-integration2/runs/4514540083?check_suite_focus=true
>
> I also see this when building with GCC 11.2.0:
>
> WARNING: modpost: EXPORT symbol "xor_block_inner_neon" [vmlinux] version ...
> Is "xor_block_inner_neon" prototyped in <asm/asm-prototypes.h>?
> aarch64-linux-gnu-ld: arch/arm64/lib/xor-neon.o: relocation R_AARCH64_ABS32 against `__crc_xor_block_inner_neon' can not be used when making a shared object

I suspect this is another genksyms crash, preventing the
__crc_xor_block_inner_neon symbol from ever being emitted.

This is a recurring annoyance and I am not sure how to address this
properly. Arnd might have some thoughts on the matter as well.


> arch/arm64/lib/xor-neon.o:(.data+0x0): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.data+0x18): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.data+0x20): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x0): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x8): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x10): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x18): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x20): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x28): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x30): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x38): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x40): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x48): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.fini_array+0x0): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.init_array+0x0): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x8): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x18): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x20): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x28): dangerous relocation: unsupported relocation
> arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x30): dangerous relocation: unsupported relocation
>
> Cheers,
> Nathan
