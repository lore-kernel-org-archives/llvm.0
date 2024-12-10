Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287A237A29;
	Tue, 10 Dec 2024 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733866669; cv=none; b=TKURml+2WDS0Wn6qoMMJd6b8Elh3yXB63picpSwGtxqsngz7mhFjLQG5NHsluQE/fTxryzp4oHV6cpVjevQFO0Pux/ZW2t3M6dMm6XNkbOAaAoosV1+YEd+jwArQ0K8OvZbfcJiWeJrF2V1UdqTWTjE9WsRKL7NVZlDojDMpfT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733866669; c=relaxed/simple;
	bh=Ieqhmsjxw7YRYMKcQHzJXp8hAMCdVpdlHNKB8x5SiXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y04PSNcFi5RDL+01fCvyhz2LNE5DsfMsWIzn7v9BCUapDvDnOy7zLJuneaBaiDOgwIe9vDzmXMkOShhoAQk38+dEaNVjnMXioaipK8YwqUcof44LMWnQND2IGqlh39ot1Yzh2LvdJeCAsFRHz0aUz5OT4/ERvVOeHVJ8tCdrxRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZizVxTw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZizVxTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A56C4CED6;
	Tue, 10 Dec 2024 21:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733866669;
	bh=Ieqhmsjxw7YRYMKcQHzJXp8hAMCdVpdlHNKB8x5SiXQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gZizVxTwisq8Sxw3OTaJJZHY5+bpz3Jzy32O/ToE+VVTMz0N8G/RIFmBwEvEVLLrD
	 YsDn/oyuQD5tI34OSgfaiq5cINox4evl46zUEhysOWyvfgCGnPLrKJARpBUQFoCSsL
	 JMSD1zwRHWvCFCnJHVV2CGXbA/qu8d0VllFYQuTM6/Yjort7sKOcfGMcPv6xC32kxk
	 WD0Lls7Z6DKLjF24b+4Tiv1/Of4Uo7FvRCe4NoLLqzVVKSOkx8ncaHIMQfSs7eVlNA
	 /hfICbs2ua8y6bsOhlPBu9CLJjQ5euxyqkG0wnz9Kkr6yCXP+mIYR1SHhfYkJcxa8A
	 etIVEnfryGVBg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9B603CE0DFC; Tue, 10 Dec 2024 13:37:48 -0800 (PST)
Date: Tue, 10 Dec 2024 13:37:48 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 47/49] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <2d1f4904-68ae-49d7-a8b6-b37558ec4aa8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202412041204.ys3dSglL-lkp@intel.com>
 <41482ec9-5048-46ea-9c8b-9d33a05ea2a6@paulmck-laptop>
 <20241210203552.GA4141507@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210203552.GA4141507@ax162>

On Tue, Dec 10, 2024 at 01:35:52PM -0700, Nathan Chancellor wrote:
> On Tue, Dec 10, 2024 at 10:47:22AM -0800, Paul E. McKenney wrote:
> > On Wed, Dec 04, 2024 at 12:04:15PM +0800, kernel test robot wrote:
> > > tree:   https://github.com/paulmckrcu/linux dev
> > > head:   48ca997e8632db65609dcc6a715207a1b6dded57
> > > commit: 13e3224fa73ec6c7dfeda04b2741c95787196588 [47/49] rcutorture: Include grace-period sequence numbers in failure/close-call
> > > config: arm-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/config)
> > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202412041204.ys3dSglL-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > > >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > 
> > This commit has EXPORT_SYMBOL_GPL() for both the Tree and Tiny definitions
> > of both of these functions.  What am I missing here?
> 
> This configuration has CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m,
> so the definition and export do not work correctly because the define is
> CONFIG_RCU_TORTURE_TEST_MODULE in that case. I think you should be using
> IS_ENABLED(), which will handle =y and =m. This resolves the error for
> me.

Thank you for the analysis and the fix!

If this fixes things in the kernel test robot run, may I have your
Signed-off-by?

							Thanx, Paul

> Cheers,
> Nathan
> 
> diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
> index f068bd9dc037..773944257e79 100644
> --- a/kernel/rcu/tiny.c
> +++ b/kernel/rcu/tiny.c
> @@ -257,7 +257,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
>  EXPORT_SYMBOL_GPL(kvfree_call_rcu);
>  #endif
>  
> -#ifdef CONFIG_RCU_TORTURE_TEST
> +#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
>  unsigned long rcutorture_gather_gp_seqs(void)
>  {
>  	return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xff;
