Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893544;
	b=CEVzwdCRv04Rpjwj6fFrkbifQ6XhjbTeSwf3IrySGUqX6Or+n2QXQ/lkfaTNjiE9jkdM
	 /lBqP8N5NVzXJJNAQeHcfatI0Hmln5cCQROBDs8H0dgQk/ZMlJn/5sLu/Jh1lDoPIEAyM
	 ltmhxHbqk3Jozm6PkAmS9L9scrl2/HdvIyWRDjHs/jHAHAptRVcnwUjn6TeWUAlxISDm4
	 kR28/0XOz19YSanXuDrCG4kEkATWfqfoReU1epcFQzyZhUhp0KfN+AW5wzPTXR3HdhmKG
	 Rzaeazg4txnTQkomnrw9CA01mzDwcZVBDCG4iuxHxwAP6XOkHBP0qMZp/sCBVxctI2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893544;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GVHNrdryi/sJD46YeZLt7AdRQrcbfvfhDSsM1Un3HaY=;
	b=d+02olmoEAzHnNfxGuWsyyfZ2kfH4ia6sr9oTHbhgH16iu4OOBYHlXIH0bmt7SRSxCkM
	 qJTrMpsV9Y86M5JWwcbXn9n7o5kEr5FS3FKsTZaugJJeQO2YPzR5CeqP6p9Wo0/jT50qi
	 05RBU1V+mRKHgh64bN1kqkdWvpzvsfz7WQfI4F9uwWAVyPwoydhOVPslrYC5Aou9HdV+i
	 MUycOZ3aaZbWh7ntYRfzjLQvpa22GL3mshV8RNYpN0n63joYK8BjpYqI5AUhQ5bhBYndI
	 f/MBUPQ1sKwnqpXukh6iiVKwwyDWCYVqMT8GiaFOFtwBtYwq+80UU2mM/BXrzVZiPgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C985606A333;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C985606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeg-00071U-00; Thu, 05 Nov 2026 16:45:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 8ADC9C0558; Thu,  5 Nov 2026 16:24:21 +0100 (CET)
Date: Thu, 5 Nov 2026 16:24:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] MIPS: boot: compressed: place .rodata.* and discard
 .MIPS.abiflags
Message-ID: <auyfpUxm9KPmBXO8@alpha.franken.de>
References: <20261009232857.655265-1-rosenp@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009232857.655265-1-rosenp@gmail.com>

On Fri, Oct 09, 2026 at 04:28:57PM -0700, Rosen Penev wrote:
> The decompressor linker script only collects .rodata. Clang emits the
> decompressor's strings in .rodata.str1.1 and also produces a
> .MIPS.abiflags section. GNU ld places such orphans next to similar
> sections, but ld.lld puts them after .bss:
> 
>   [ 5] .bss            NOBITS   809246c0 5346b8 402010
>   [ 6] .MIPS.abiflags  ...      80d266d0 9366d0 000018
>   [ 7] .rodata.str1.1  PROGBITS 80d266e8 9366e8 000164
> 
> This pulls the 4 MB of .bss (mostly the boot heap) into the file and
> leaves the strings beyond _end. For BCM47XX vmlinuz grows from 5.4 MB
> to 9.6 MB.
> 
> Collect .rodata.* with .rodata, and discard .MIPS.abiflags and
> .gnu.attributes as arch/mips/kernel/vmlinux.lds.S does.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/boot/compressed/ld.script | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/ld.script
> index 0ebb667274d6..c45be18c6f0d 100644
> --- a/arch/mips/boot/compressed/ld.script
> +++ b/arch/mips/boot/compressed/ld.script
> @@ -17,7 +17,7 @@ SECTIONS
>  	/* . = VMLINUZ_LOAD_ADDRESS; */
>  	.text : {
>  		*(.text)
> -		*(.rodata)
> +		*(.rodata .rodata.*)
>  	}: text
>  	/* End of text section */
>  
> @@ -50,7 +50,9 @@ SECTIONS
>  
>  	/* Sections to be discarded */
>  	/DISCARD/ : {
> +		*(.MIPS.abiflags)
>  		*(.MIPS.options)
> +		*(.gnu.attributes)
>  		*(.options)
>  		*(.pdr)
>  		*(.reginfo)
> -- 
> 2.56.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
