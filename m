Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAA56AB4
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 20:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69938C34114;
	Wed, 29 Jun 2022 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656533412;
	bh=lJWsVrDNk1KsypoK6LDHs1HKY6OBI6806PEcTBF+j4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjbdLuk+9+LJj9qj01bEsxCf7mWWwMUZycPpSpVWZETvgiNP4xw3XkPQy+o6hgjCa
	 6XHpTlygi1k+FLOuQDP1lWrJMU1fvz/jTVE8uPY5/8H6Hu2m/i72pGEQ1cOq6/VRZm
	 2csvOiHupPFTGPJ5Qt6sSUUs7qMqQZ5N33iWOoxzqPzuyeGsal+sp+v3bKyw59e8y4
	 mnfTgrdLDfj93xyI6qWPl+eHp6tDO5mq9CbjGWpbVx8qKkBkHAnfJuISWr+14q0ED5
	 JR0Tm1Wfmm324DWkDk3/Sfe1iNtH+FHIwoHwhNu5kik7kCDip/P0XOxC7Kfcts3QHp
	 W6hag6Fg1tdtw==
Date: Wed, 29 Jun 2022 13:10:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
	Will Deacon <will@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v1 1/2] arm64: vdso32: add ARM.exidx* sections
Message-ID: <YryxouOYOJLM+DDK@dev-arch.thelio-3990X>
References: <20220628151307.35561-1-joey.gouly@arm.com>
 <20220628151307.35561-2-joey.gouly@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628151307.35561-2-joey.gouly@arm.com>

Hi Joey,

On Tue, Jun 28, 2022 at 04:13:06PM +0100, Joey Gouly wrote:
> These show up when building with clang+lld.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  arch/arm64/kernel/vdso32/vdso.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
> index 120cf422036f..e2f8ced571d6 100644
> --- a/arch/arm64/kernel/vdso32/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso32/vdso.lds.S
> @@ -60,6 +60,7 @@ SECTIONS
>  	}
>  
>  	ELF_DETAILS
> +	.ARM.exidx : { *(.ARM.exidx*) }
>  	.ARM.attributes 0 : { *(.ARM.attributes) }
>  
>  	/DISCARD/	: {
> -- 
> 2.17.1
> 

This patch is now in -next as commit 5c4fb60816ea ("arm64: vdso32: add
ARM.exidx* sections"), which causes the following errors with ld.lld 11:

  ld.lld: error: could not allocate headers
  ld.lld: error: unable to place section .text at file offset [0x2A0, 0xBB1]; check your linker script for overflows
  ld.lld: error: unable to place section .comment at file offset [0xBB2, 0xC8A]; check your linker script for overflows
  ld.lld: error: unable to place section .symtab at file offset [0xC8C, 0xE0B]; check your linker script for overflows
  ld.lld: error: unable to place section .strtab at file offset [0xE0C, 0xF1C]; check your linker script for overflows
  ld.lld: error: unable to place section .shstrtab at file offset [0xF1D, 0xFAA]; check your linker script for overflows
  ld.lld: error: section .ARM.exidx file range overlaps with .hash
  >>> .ARM.exidx range is [0x90, 0xCF]
  >>> .hash range is [0xB4, 0xE3]

  ld.lld: error: section .hash file range overlaps with .ARM.attributes
  >>> .hash range is [0xB4, 0xE3]
  >>> .ARM.attributes range is [0xD0, 0x10B]

  ld.lld: error: section .ARM.attributes file range overlaps with .dynsym
  >>> .ARM.attributes range is [0xD0, 0x10B]
  >>> .dynsym range is [0xE4, 0x133]

  ld.lld: error: section .ARM.exidx virtual address range overlaps with .hash
  >>> .ARM.exidx range is [0x90, 0xCF]
  >>> .hash range is [0xB4, 0xE3]

  ld.lld: error: section .ARM.exidx load address range overlaps with .hash
  >>> .ARM.exidx range is [0x90, 0xCF]
  >>> .hash range is [0xB4, 0xE3]

I bisected LLVM to see what fixed this in ld.lld 12 and I landed on
commit ec29538af2e0 ("[ELF] Assign file offsets of non-SHF_ALLOC after
SHF_ALLOC and set sh_addr=0 to non-SHF_ALLOC") [1].

We could bump the minimum version of LLVM to 12 over this but the
following diff appears to resolve it for me, although I am not sure as
to why.

diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index 6e67a6524d58..c25bed8e6df1 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -56,8 +56,8 @@ SECTIONS
 
 	.rel.dyn	: { *(.rel*) }
 
-	ELF_DETAILS
 	.ARM.exidx : { *(.ARM.exidx*) }
+	ELF_DETAILS
 	.ARM.attributes 0 : { *(.ARM.attributes) }
 
 	/DISCARD/	: {

I just noticed that the .ARM.exidx section (ARM_UNWIND_SECTIONS)
is placed before the sections the error mentions (ARM_DETAILS) in
arch/arm/kernel/vmlinux.lds.S, where we do not see any errors with LLVM
11. Looking at the section headers, it seems like it should be okay?

With LLVM 15 (current git) at 4274929c7ee6f442:

  arch/arm64/kernel/vdso32/vdso.so:        file format elf32-littlearm

  Sections:
  Idx Name            Size     VMA      Type
    0                 00000000 00000000
    1 .hash           00000030 000000b4
    2 .dynsym         00000050 000000e4
    3 .dynstr         0000006f 00000134
    4 .gnu.version    0000000a 000001a4
    5 .gnu.version_d  00000038 000001b0
    6 .note           00000054 000001e8
    7 .dynamic        00000058 0000023c
    8 .text           0000092a 00000294 TEXT
    9 .shstrtab       0000006d 00000000
   10 .ARM.exidx      00000040 00000bc0
   11 .ARM.attributes 0000003c 00000000

With LLVM 11 at 4274929c7ee6f442 + above diff:

  arch/arm64/kernel/vdso32/vdso.so:        file format elf32-littlearm

  Sections:
  Idx Name            Size     VMA      Type
    0                 00000000 00000000
    1 .hash           00000030 000000b4
    2 .dynsym         00000050 000000e4
    3 .dynstr         0000006f 00000134
    4 .gnu.version    0000000a 000001a4
    5 .gnu.version_d  00000038 000001b0
    6 .note           00000054 000001e8
    7 .dynamic        00000058 0000023c
    8 .rodata         00000000 000002a0 TEXT
    9 .text           00000912 000002a0 TEXT
   10 .ARM.exidx      00000040 00000bb4
   11 .shstrtab       00000075 00000000
   12 .ARM.attributes 0000003c 00000000

With LLVM 15 at 4274929c7ee6f442 + above diff:

  arch/arm64/kernel/vdso32/vdso.so:        file format elf32-littlearm

  Sections:
  Idx Name            Size     VMA      Type
    0                 00000000 00000000
    1 .hash           00000030 000000b4
    2 .dynsym         00000050 000000e4
    3 .dynstr         0000006f 00000134
    4 .gnu.version    0000000a 000001a4
    5 .gnu.version_d  00000038 000001b0
    6 .note           00000054 000001e8
    7 .dynamic        00000058 0000023c
    8 .rodata         00000000 000002a0 TEXT
    9 .text           00000912 000002a0 TEXT
   10 .ARM.exidx      00000040 00000bb4
   11 .shstrtab       00000075 00000000
   12 .ARM.attributes 0000003c 00000000

[1]: https://github.com/llvm/llvm-project/commit/ec29538af2e0886a65f479d6a533956a1c478132

Cheers,
Nathan
