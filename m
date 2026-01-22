Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78622223DC6;
	Thu, 22 Jan 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073430; cv=none; b=BUbjecXPVP+ltEYRKGtts4uDB465Mv4O/VSYtcoMW6Wxju1GsUaGz8EUlSYrsTeKAq6BwcsSGnDf5RI/0VaMOZ9QM6+c5jsDSGKB1aSejQ864L0f+ZBDFIf4WU5s9ge7rc3edvcwAaVFJap5nkILWnTShADIhh4RQ4PM6hrWflc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073430; c=relaxed/simple;
	bh=q2esC2zJX3g7e6ZMhgi/ddREdTJyIkx9wRyA+rvR/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H72ta55e9aftqY2lXQcCasE4KPS0e+7HWsy/NBTLt8H7n6XsejHqH6lsUGVyZRU85meP2lYV8wjCnWM+2cE3entDn3aUkeZIEjWKX2B8+l1Mz5E56WbdNX4jLHF9OgdEBH5T0tpJSeG06+mwN1RasFzMSfK+U74pOFLYdu5ehSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wxyb+X9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wxyb+X9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4463DC16AAE;
	Thu, 22 Jan 2026 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769073427;
	bh=q2esC2zJX3g7e6ZMhgi/ddREdTJyIkx9wRyA+rvR/0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wxyb+X9a6SwDrQ00TSl3QEYtmzje5bQ/rb5gr53KVZyRwYscc8Od7sYDuECCyba5y
	 PGPITHKtj6D0C1Tx/Qc8AMJrzyrMFN3/Wwypia2ZIznxFIm/4LQzhwSuXKHinjQbkQ
	 DbUyUiwMyF5q/rfng0TZmo2c5EWgCnIM4DKCl0UHhAwzsmCvd7e+lsZoeHhZHiYwo3
	 yJJBa4NXPA9XVdNtIRuxA09RuS7H8p6CYjdIWQD6UNiuvUT7+l+spEOaNwTIP12/hP
	 OSg1KQvV7IJSwLhEqS+72Wtu3HeOR/HeO6RPuDeLI8VTleiqKcvSn3eQnocE/RJs16
	 uEwY5iOVzjtZw==
Date: Thu, 22 Jan 2026 11:17:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [rppt:zero-page/v0 1/1] ERROR: modpost: vmlinux:
 'empty_zero_page' exported twice. Previous export was in vmlinux
Message-ID: <aXHrDsAjeoT_8-vr@kernel.org>
References: <202601221150.JsPp145b-lkp@intel.com>
 <20260122051722.GC3770486@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122051722.GC3770486@ax162>

On Wed, Jan 21, 2026 at 10:17:22PM -0700, Nathan Chancellor wrote:
> On Thu, Jan 22, 2026 at 11:14:04AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git zero-page/v0
> > head:   53d07913878ea27d6fe4224e8581729185291278
> > commit: 53d07913878ea27d6fe4224e8581729185291278 [1/1] dev: arch, mm: consolidate empty_zero_page
> > config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601221150.JsPp145b-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221150.JsPp145b-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221150.JsPp145b-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> ERROR: modpost: vmlinux: 'empty_zero_page' exported twice. Previous export was in vmlinux
> 
> Seems like the following should fix that?
> 
> diff --git a/arch/hexagon/kernel/hexagon_ksyms.c b/arch/hexagon/kernel/hexagon_ksyms.c
> index 36a80e31d187..81bc6f81e200 100644
> --- a/arch/hexagon/kernel/hexagon_ksyms.c
> +++ b/arch/hexagon/kernel/hexagon_ksyms.c
> @@ -17,7 +17,6 @@ EXPORT_SYMBOL(raw_copy_to_user);
>  EXPORT_SYMBOL(__vmgetie);
>  EXPORT_SYMBOL(__vmsetie);
>  EXPORT_SYMBOL(__vmyield);
> -EXPORT_SYMBOL(empty_zero_page);
>  EXPORT_SYMBOL(memcpy);
>  EXPORT_SYMBOL(memset);

Yes, it should :)  
Thanks!

-- 
Sincerely yours,
Mike.
