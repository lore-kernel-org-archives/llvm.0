Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1A433E374;
	Mon, 15 Jun 2026 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520214; cv=none; b=BkKnnEmUAsd5c47/UE/K+9sngXmOtqu8nwKTsTokZwfLDgyg6BFdEo+KhAt3yOky+1ywP+fp0hQjmKj2pDdxcy3iOnTVMRLrtghY4UzXcTtrqgToGAR4warM0TrD7U+sTWv/uMEtM+T2wsQVRYeneAuO3rF03rAYlhmeaxQ4EuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520214; c=relaxed/simple;
	bh=xw9utTOjDUcr0TCQNvAPiO1BWcImQ2mOwQNb8FsiTmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6czLtRsoxB2O0PG+hsNU9kC9Pg2Uazzc7RSGV3NDnwM/HtyDoYpem5wt0Uf806OSHYkRefO+Qlmsddr8ZXzuFhGlyt87a9JfjO9CooNTYx8B5FHSROdGmEMPJDzg04BE0N7dVdTktia95pT0sokFott/fuB0eFBstgePTE5i6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JP-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3089BC045A; Mon, 15 Jun 2026 12:27:18 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:27:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Avoid including .got in dynamic segment
Message-ID: <ai_ThiB1SwJuIvcS@alpha.franken.de>
References: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>

On Tue, Jun 09, 2026 at 06:31:21PM -0700, Nathan Chancellor wrote:
> After commit 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
> MIPS_GENERIC_GETTIMEOFDAY"), building ARCH=mips allnoconfig with LLVM=1
> shows some warnings from llvm-readelf while checking the VDSO for
> dynamic relocations:
> 
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': invalid PT_DYNAMIC size (0xa4)
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used
> 
> The blamed commit alters the link order of objects into vdso.so.raw,
> placing vgettimeofday.o after sigreturn.o. This ultimately results in
> the .text section shrinking slightly in size, which in turn changes the
> offset of the .dynamic section.
> 
>   -  [ 9] .text             PROGBITS        000002f0 0002f0 000930 00  AX  0   0 16
>   -  [10] .dynamic          DYNAMIC         00000c20 000c20 000090 08   A  5   0  4
>   +  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   +  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
> 
> Changing the offset of the .dynamic section causes the dynamic segment
> size to grow by the same amount, which triggers a warning in
> llvm-readelf because PT_DYNAMIC's p_filesz (0xa4) is no longer a
> multiple of its sh_entsize (8):
> 
>   -  DYNAMIC        0x000c20 0x00000c20 0x00000c20 0x00098 0x00098 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
> 
> The size of the dynamic segment was already incorrect before the blamed
> comment, as it should be 0x90 like the .dynamic section above (18
> entries at 8 bytes per entry); it just so happens that 0x98 % 8 is 0,
> whereas 0xa4 % 8 is 4, so there was no warning.
> 
> Looking at the section to segment mapping of the dynamic segment reveals
> that it includes the .got section, as it is implicitly placed after
> .dynamic by ld.lld's orphan section heuristics and inherits its segments
> from the linker script.
> 
>   [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
>   [11] .got              PROGBITS        00000cb0 000cb0 000008 00 WAp  0   0 16
> 
>   Section to Segment mapping:
>    Segment Sections...
>     00     .mips_abiflags
>     01     .reginfo
>     02     .mips_abiflags .reginfo .hash .dynsym .dynstr .gnu.version .gnu.version_d .note .text .dynamic .got
>     03     .dynamic .got
>     04     .note
> 
> Explicitly describe the .got section in the MIPS VDSO linker script
> after .rodata, which switches back to the default text segment,
> resulting in a dynamic segment that is the exact size of the .dynamic
> section as expected with no other layout changes.
> 
>   -  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x00090 0x00090 R   0x4
> 
>   -   03     .dynamic .got
>   +   03     .dynamic
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2166
> Fixes: 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> The fixes tag feels a little strong since it seems like it has just been
> luck up until this point that there has been no warning but I decided to
> be conservative and include it regardless. Feel free to remove it if you
> see fit.
> 
> I think this should go via timers/vdso with the blamed commit. I plan to
> send a follow up series for 7.3 to add '--orphan-handling' to the MIPS
> VDSO to avoid issues like this in the future but that can go via the
> MIPS tree, as it is not really a fix and I will need to properly test
> it.
> ---
>  arch/mips/vdso/vdso.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> index 05badf3ae0ff..278ab6444e98 100644
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -56,6 +56,7 @@ SECTIONS
>  	.dynamic	: { *(.dynamic) }		:text :dynamic
>  
>  	.rodata		: { *(.rodata*) }		:text
> +	.got		: { *(.got) }
>  
>  	_end = .;
>  	PROVIDE(end = .);
> 
> ---
> base-commit: 13f6218e6fe79dc64aed76d738b765b45f62492b
> change-id: 20260608-mips-vdso-fix-section-layout-262bc18d0c29

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
