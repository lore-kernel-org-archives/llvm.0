Received: from hop.stappers.nl (hop.stappers.nl [141.105.120.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1112819A280
	for <llvm@lists.linux.dev>; Wed,  4 Sep 2024 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442227; cv=none; b=n6PrTQYDwPWi48WegbLJq1bePxJzjMG0uIIczggu5l8tzaSUl5vXthyYUD9PKsc6vnWplJYGO0LShNZ5loNy8JfW8zkgD6XuVake1LrLlq/MkDBE59WNf5Pj9k4CMxgKzAYlDSaMG1x+UbLi24RJqE9SbCHPkro5x+iOuuY401Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442227; c=relaxed/simple;
	bh=RMPZvHEVaim0EYA6xxt6Zc8BCCA+ksqED4910RkhiLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmBlq9Wh2WFFKYZiktqmxAfiITCfljrjBj0E4JHeCAan27du++v4xd+FKBWTkRQRVZjvNV/Z0oGvSSgJitf5kcDfSF9b888EoJFd5x5xQk1udC4TZrwL+31C8axfCDz3a40ia/szwn2T/+QJ9QbW4FaaywJlvsaf/Brnd/Is4/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stappers.nl; spf=pass smtp.mailfrom=stappers.nl; arc=none smtp.client-ip=141.105.120.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stappers.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stappers.nl
Received: from gpm.stappers.nl (gpm.stappers.nl [82.168.249.201])
	by hop.stappers.nl (Postfix) with ESMTP id 9137C20203;
	Wed,  4 Sep 2024 09:30:14 +0000 (UTC)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
	id 7470E30417C; Wed,  4 Sep 2024 11:30:13 +0200 (CEST)
Date: Wed, 4 Sep 2024 11:30:12 +0200
From: Geert Stappers <stappers@stappers.nl>
To: Zigit Zo <zig@iorw.io>
Cc: ojeda@kernel.org, bjorn3_gh@protonmail.com, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	tglx@linutronix.de, mingo@redhat.com, nathan@kernel.org,
	ndesaulniers@google.com, gary@garyguo.net,
	rust-for-linux@vger.kernel.org, linux-um@lists.infradead.org,
	llvm@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: arch/um: use 'static' relocation model for uml
 modules
Message-ID: <ZtgopAHp+I2+xCIz@gpm.stappers.nl>
References: <20240903130606.292935-1-zig@iorw.io>
 <FD7D773099A0C7EC+20240903130606.292935-2-zig@iorw.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FD7D773099A0C7EC+20240903130606.292935-2-zig@iorw.io>

On Tue, Sep 03, 2024 at 09:06:05PM +0800, Zigit Zo wrote:
> In the x86_64 UML, kernel modules compiled with Rust will currently
> generate some R_X86_64_GOTPCREL relocations, which will then be rejected
> by the kernel.
> 
> And because of the kernel modules of UML are only got handled by the UML
> itself, relocation model 'static' can work as expected other than 'pie'.
> ---
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 00b63bac5eff..b04b1d4d6dfe 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -63,7 +63,7 @@ KBUILD_CFLAGS += $(CFLAGS) $(CFLAGS-y) -D__arch_um__ \
>  	-Din6addr_loopback=kernel_in6addr_loopback \
>  	-Din6addr_any=kernel_in6addr_any -Dstrrchr=kernel_strrchr
>  
> -KBUILD_RUSTFLAGS += -Crelocation-model=pie
> +KBUILD_RUSTFLAGS_KERNEL += -Crelocation-model=pie
>  
>  KBUILD_AFLAGS += $(ARCH_INCLUDE)
>  
> -- 

I failed to match the actual change with the commit message.  Consider
that ignorance on my side.

I see a problem in just renaming a variable, might be my problem.  Thing
is that removal of 'KBUILD_RUSTFLAG += ' feels wrong, hence this posting.



Groeten
Geert Stappers
-- 
Silence is hard to parse
