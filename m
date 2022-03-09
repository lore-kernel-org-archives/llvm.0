Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA795107
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 19:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2929C340E8;
	Wed,  9 Mar 2022 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646853608;
	bh=8GG5k+aRyvEM7ZRAADPAKqbxwXD95Kna8A+kMz3JX40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTmS/5MYRMuZXRKc24SHA1hdwWMOWx76Sf+Sp3OGW0NRtnl95dw+FjSDYYSwsfmai
	 /3xCmDGqEzJ+retkKCKiBq0CrkPBVwAidp/JS/EezOFm9YBkHdguzMXNwX0jhDWV8g
	 KHgGSGNtBGvZ9QPjQXzpPq9waUS8h5bqqlg+T8ZnzenvS51Tx0MvDoKk6UeFba60q8
	 Z5gSkVYI3thKlBGQsHj6Pi05blb3taZjzNlqbnWZjMG2Oeedq4Tgs695YsZku6GU0F
	 6jSYZ4ueF7V1lHHjDhBjUGJdwqB+21Pj4qCXrTXyc60mr/yEsZ4RMEJoIwTYXgobSt
	 ztEzR6A3AhuDg==
Date: Wed, 9 Mar 2022 12:20:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kernel-team@android.com, James Morse <james.morse@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] arm64: Paper over ARM_SMCCC_ARCH_WORKAROUND_3 Clang issue
Message-ID: <Yij94ZY5fOaqlkki@dev-arch.thelio-3990X>
References: <20220309155716.3988480-1-maz@kernel.org>
 <YijftpaApSJWuZ3m@dev-arch.thelio-3990X>
 <Yijo7Nmt3AiP1uLH@dev-arch.thelio-3990X>
 <Yij1uUwvnsxjbvR+@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yij1uUwvnsxjbvR+@arm.com>

On Wed, Mar 09, 2022 at 06:45:13PM +0000, Catalin Marinas wrote:
> On Wed, Mar 09, 2022 at 10:50:36AM -0700, Nathan Chancellor wrote:
> > This diff seems like a somewhat proper solution, as __READ_ONCE() cannot
> > be used in assembly, but I am open to other suggestions.
> > 
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index 1bce62fa908a..56f7b1d4d54b 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -5,7 +5,7 @@
> >  #ifndef __ASM_RWONCE_H
> >  #define __ASM_RWONCE_H
> >  
> > -#ifdef CONFIG_LTO
> > +#if defined(CONFIG_LTO) && !defined(__ASSEMBLY__)
> >  
> >  #include <linux/compiler_types.h>
> >  #include <asm/alternative-macros.h>
> > @@ -66,7 +66,7 @@
> >  })
> >  
> >  #endif	/* !BUILD_VDSO */
> > -#endif	/* CONFIG_LTO */
> > +#endif	/* CONFIG_LTO && !__ASSEMBLY__ */
> 
> Thanks Nathan. Would you please send a proper patch for this? I'd go
> with your proposal as it seems more related to LTO than Marc's patch ;).

Done, thanks Catalin and James for your input!

https://lore.kernel.org/r/20220309191633.2307110-1-nathan@kernel.org/

Cheers,
Nathan
