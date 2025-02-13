Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ABDBA2D;
	Thu, 13 Feb 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433418; cv=none; b=Dkbh7hTiH3aQe7UDHJPejJHse7QLF5KBC8q9/A83LWk/3XxDKsNiSFbs0ZxoB2fpaFJiSF23mBBo2e/Gt4EwdLNG6CHootWJp69rer8XV/FhykAz6rdJwDQhJnN8YGcHPH9/Wc+zv6dYRyXHSF45e0ASRfcbIdimVlzbs0sh6No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433418; c=relaxed/simple;
	bh=Fg8yHSzQlNvTJyPWVmiv06alu35wqhvGab8BUThHMSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JH29Piv1Uv6A+eIoKPwQXrYCGkvlOdY8+SBcYOWbXAfSJbDz1WOlggJiOW74R2+dQiqbdURQdJV5CAHQ03SkYszmY9o3l/tY7If5NZmjQGrnijKDmAAfXU5PJc75biNPqbGM3z4l1BFQ6xnmCWnFbxAN2SmBJOMSfjUmBLwMEXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/8d95Pv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/8d95Pv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD39C4CEE8;
	Thu, 13 Feb 2025 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739433417;
	bh=Fg8yHSzQlNvTJyPWVmiv06alu35wqhvGab8BUThHMSk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=d/8d95PvtmXQ3PFM3wIJloNjYu10tTfcn1EGDAkUSyCP6LHxkTEYkOq7jQBkYiRf3
	 2fjS6Gc/wPlIgAqDiCsy6RpJskpaAVdQS8UovqtL4w7IGULqGRTYEioSWojsrIXetz
	 k22+w0FARyYsCa+a3tgZ2l2OPvaIYoCYMHTQ35c1zlTRiWyOgCKccUIf63k0/bZmGi
	 cdP/SiFSdtydH4sIRlk3zV0+D2LIwaEbmujZBlQ32WlzMamEJ3mDIt/Cx0tVWUX+i7
	 OZ6tIBDBPviDZnVGq+beRkB1yht+kdCwzjrY+fnO/jz2M/bzG3PDbCUvwQhNQrK7fP
	 yzi8JSlQStmAQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 97757CE0485; Wed, 12 Feb 2025 23:56:50 -0800 (PST)
Date: Wed, 12 Feb 2025 23:56:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 82/82] kernel/rcu/rcutorture.c:2453:110:
 warning: format specifies type 'unsigned long' but the argument has type
 'int'
Message-ID: <87b7f793-afd5-44ca-98c4-7765af39a962@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202502112058.rTKa7Z3A-lkp@intel.com>
 <555c789d-5fe8-40d4-9b72-3490baa5c9b3@paulmck-laptop>
 <Z62IdAeMn71eHNqu@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z62IdAeMn71eHNqu@xsang-OptiPlex-9020>

On Thu, Feb 13, 2025 at 01:51:48PM +0800, Oliver Sang wrote:
> hi, Paul,
> 
> On Wed, Feb 12, 2025 at 02:03:27AM -0800, Paul E. McKenney wrote:
> > On Tue, Feb 11, 2025 at 08:37:12PM +0800, kernel test robot wrote:
> > > tree:   https://github.com/paulmckrcu/linux dev
> > > head:   31c00ec5301cf02af354d57007bf0d79d5aef1c5
> > > commit: 31c00ec5301cf02af354d57007bf0d79d5aef1c5 [82/82] rcutorture: Check for ->up_read() without matching ->down_read()
> > > config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/config)
> > > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202502112058.rTKa7Z3A-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    In file included from kernel/rcu/rcutorture.c:47:
> > >    In file included from include/linux/oom.h:10:
> > >    In file included from include/linux/mm.h:2223:
> > >    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> > >      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> > >          |                               ~~~~~~~~~~~ ^ ~~~
> > > >> kernel/rcu/rcutorture.c:2453:110: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
> > >     2453 |         WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
> > >          |                                                                                                  ~~~                ^~~~~~~~~~~~~~~~~~~~~~~
> > >          |                                                                                                  %d
> > 
> > And %d breaks my build.  So this is presumably what %zu was intended
> > to take care of.  So does the diff below fix this for you?  Either way,
> > thank you for your testing!
> 
> yes, diff below fix the new warning we reported. thanks
> 
> Tested-by: kernel test robot <oliver.sang@intel.com>

Thank you very much, and I will apply this on my next rebase.

							Thanx, Paul

> > ------------------------------------------------------------------------
> > 
> > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > index d62f1c787bd6..b4286136a052 100644
> > --- a/kernel/rcu/rcutorture.c
> > +++ b/kernel/rcu/rcutorture.c
> > @@ -2450,7 +2450,7 @@ static enum hrtimer_restart rcu_torture_updown_hrt(struct hrtimer *hrtp)
> >  
> >  	rtorsup = container_of(hrtp, struct rcu_torture_one_read_state_updown, rtorsu_hrt);
> >  	rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
> > -	WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
> > +	WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
> >  	rtorsup->rtorsu_nups++;
> >  	smp_store_release(&rtorsup->rtorsu_inuse, false);
> >  	return HRTIMER_NORESTART;
> > @@ -2498,7 +2498,12 @@ static void rcu_torture_updown_cleanup(void)
> >  		if (!smp_load_acquire(&rtorsup->rtorsu_inuse))
> >  			continue;
> >  		(void)hrtimer_cancel(&rtorsup->rtorsu_hrt);
> > -		WARN_ON_ONCE(rtorsup->rtorsu_inuse);
> > +		if (WARN_ON_ONCE(rtorsup->rtorsu_inuse)) {
> > +			rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
> > +			WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
> > +			rtorsup->rtorsu_nups++;
> > +			smp_store_release(&rtorsup->rtorsu_inuse, false);
> > +		}
> >  
> >  	}
> >  	kfree(updownreaders);
> > @@ -2521,7 +2526,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
> >  	if (!rcu_torture_one_read_start(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1)) {
> >  		cur_ops->up_read(rawidx);
> >  		rtorsup->rtorsu_nups++;
> > -		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
> > +		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
> >  		schedule_timeout_idle(HZ);
> >  		return;
> >  	}
