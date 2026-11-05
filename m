Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893544;
	b=dl+xZlZMc8/hsynItOYf8sITyGxN8HDpdPbUK/EDCY06IGRiZV0Pp2+514DsGcBUzJL7
	 BGMSTFz+RKebIi8bilNwCsb1NxxtLcjjbuDT3Avv/zbtgmwuv9tRjD+i2PKQpKVnle7c6
	 vOox2A4nTr2WLZKxQksG3ksUbhzb37jrMBuuUep2aj3fYdWl3nufd58barEXRHq98D/Xb
	 ICgzZ1FWjbob4mDJPFb5YBFJDgt+I5I4IWL0UqiRTrpo5cyc1mU1O6QgyqA9ihprOH5pY
	 evOyKB74b/FtLZ7AyJ3C8dlmS9YRbJtq8dmhK0fHLkpJV3b7PdpRepMOuJquPz6pjyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893544;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6YFoX5de+hruXUUztmqp3UZ3AJBFoXNDZECu3TU1iTg=;
	b=Y7ixdWDXKOx80eqqjvDJkWUqn0x7TgT/Hjkb4Ioip0Oi6ZiHuH906Ef9lHod+YJ5NHh7
	 3glsB0QcOqA6v5iqANnA+ewINGvKi1uAMZEsn6ZIfY9MSjskqeyL9F8cq70+p3Di+srKf
	 01Ij0tIVAVU+vUmkqB7bJQoAfd4f1pALu7RW/bmzKjoxOO2Zerox5rccqoJSeCuzjDxlE
	 cNbyNC1Y4YuetNQIdSb+EmMhwgr1qsxdwo/mMHhMI6z/4Ie8BZctC+PR+wpq9NqYhlvjM
	 BwFUdHaxXcEMKsd3O7aMoBd3x2W/3dgv9Hazv+9LMIpECTiFJ59dXxVHB4I96YfAb7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C964606A332;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C964606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeg-00071S-00; Thu, 05 Nov 2026 16:45:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CD93EC052E; Thu,  5 Nov 2026 16:23:59 +0100 (CET)
Date: Thu, 5 Nov 2026 16:23:59 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Burton <paulburton@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] MIPS: Avoid dead code/data elimination when using
 recordmcount
Message-ID: <auyfj9MyvQFX-VGf@alpha.franken.de>
References: <20261004234826.541468-1-rosenp@gmail.com>
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
In-Reply-To: <20261004234826.541468-1-rosenp@gmail.com>

On Sun, Oct 04, 2026 at 04:48:26PM -0700, Rosen Penev wrote:
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION builds with -ffunction-sections,
> placing every function in its own section. recordmcount refuses to use
> weak symbols as section bases, as a strong definition could override
> them, so a weak function alone in its section, such as the generic
> pcibios_fixup_bus() stub, breaks the build:
> 
>   Cannot find symbol for section 88: .text.pcibios_fixup_bus.
>   drivers/pci/probe.o: failed
> 
> MIPS always records mcount locations with recordmcount, so this hits
> any config with the function tracer and dead code elimination enabled,
> e.g. malta_defconfig built with LLVM=1.
> 
> Only offer dead code elimination when recordmcount is not used, as
> powerpc does since commit f8b2336f15f3 ("powerpc: Avoid dead code/data
> elimination when using recordmcount"). In practice this makes it
> unavailable together with the function tracer on MIPS.
> 
> Fixes: c0436b503591 ("MIPS: Enable dead code elimination")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ddabe25d6bf7..f4f82bd75b66 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -79,7 +79,7 @@ config MIPS
>  	select HAVE_IRQ_TIME_ACCOUNTING
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> -	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !FTRACE_MCOUNT_USE_RECORDMCOUNT
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_NMI
>  	select HAVE_PAGE_SIZE_4KB if !CPU_LOONGSON2EF && !CPU_LOONGSON64
> -- 
> 2.56.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
