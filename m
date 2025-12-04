Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D16922541C;
	Thu,  4 Dec 2025 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764857568; cv=none; b=SuSKvSwpjQEzCX01yPRoHtr49Fo5zg1e4cUrMW6cwv813Uqc6ASbECqYO4MFNoQ2nKTjQT6Pskvq+gYQrDg11bO/C/zN09zBsorCW/vf3dBeVANLo/ujPtTxp9Rz+xIdY3Xrd1YgAiZep41LRAMDRQdgayXYW8oP38I6meukXZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764857568; c=relaxed/simple;
	bh=evS1YQU839e9PihuX9HEldpEh1kHUGEMPFd7XrGgOHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbgZfBilftdcPX7gW7/X+B4JN5u3M7jBE6pquxnnEVFcD2aXF1qVrOVRdezEEKB1LF60Cl4EKVFw7ntuxxqvGMAojCj3JevDEfNS47wogfnmAccowjZPpi0R/8gNY/AOLu809HX7bjy68OHVEIt6mcq+vT9vtAoyn4EhOI26/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=c3eRuugH; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="c3eRuugH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764857556; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=dkYSy/gbe5jT4GPBC3gX5tdFW8sy5n6ioyBwECgSNdo=;
	b=c3eRuugHgBxaK8JmyAk36M6Y4GPQ3D+2QCA2SzUG7h/xt+YNCrHZE8ECTIaT7p3NEGN/QjYfXtX6LxWzgCD13U98ea7V1ZSZ54jS7EejzBpVncp1jWG9OIxY8e5ZvBTmByIaI/L6ZgMdlhOpT2a2p+m87n2S934mLzLSLdt0FFo=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wu4cLfq_1764857555 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 04 Dec 2025 22:12:35 +0800
Date: Thu, 4 Dec 2025 22:12:32 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 9966/13055] kernel/watchdog.c:74:22: warning:
 unused variable 'hardlockup_si_mask'
Message-ID: <aTGW0AQJfQPKe0ao@U-2FWC9VHC-2323.local>
References: <202512030920.NFKtekA7-lkp@intel.com>
 <20251203144453.be34d189c5e6668ce2da06b3@linux-foundation.org>
 <aTGO4iLrQnd4l6fO@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aTGO4iLrQnd4l6fO@pathway.suse.cz>

On Thu, Dec 04, 2025 at 02:38:42PM +0100, Petr Mladek wrote:
> On Wed 2025-12-03 14:44:53, Andrew Morton wrote:
> > On Wed, 3 Dec 2025 09:05:30 +0800 kernel test robot <lkp@intel.com> wrote:
> > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   47b7b5e32bb7264b51b89186043e1ada4090b558
> > > commit: a9af76a78760717361cccc884dc649e30db61c8b [9966/13055] watchdog: add sys_info sysctls to dump sys info on system lockup
> > > config: powerpc64-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> kernel/watchdog.c:74:22: warning: unused variable 'hardlockup_si_mask' [-Wunused-variable]
> > >       74 | static unsigned long hardlockup_si_mask;
> > >          |                      ^~~~~~~~~~~~~~~~~~
> > >    1 warning generated.
> > 
> > I'm testing the appended patch but it needs checking please.
> > 
> > The comment for hardlockup_si_mask says
> > 
> >  * bitmask to control what kinds of system info to be printed when
> >  * hard lockup is detected, it could be task, memory, lock etc.
> >  * Refer include/linux/sys_info.h for detailed bit definition.
> > 
> > but the variable depends on "COUNTS_HRTIMER".  The comment doesn't
> > mention hrtimers and I don't see why it should.  Not sure what's going
> > on here.
> 
> Good point! It took me some time to understand it.
> 
> So, powerpc implements its own watchog, see arch/powerpc/kernel/watchdog.c.
> The watchdog is supported only by some powerpc platforms, see the
>    following line in arch/powerpc/Kconfig:
> 
> 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
> 
> As a result, the test system could have the following in the config,
> see https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/config
> 
> 	CONFIG_HARDLOCKUP_DETECTOR=y
> 	# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
> 	# CONFIG_HARDLOCKUP_DETECTOR_BUDDY is not set
> 	CONFIG_HARDLOCKUP_DETECTOR_ARCH=y
> 
> And "COUNTS_HRTIMER" is not defined.

Thanks for the check!

Was working on a reply at the same time :)

> > @@ -1250,6 +1250,7 @@ static const struct ctl_table watchdog_s
> >  		.extra1		= SYSCTL_ZERO,
> >  		.extra2		= SYSCTL_ONE,
> >  	},
> > +#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
> >  	{
> >  		.procname	= "hardlockup_sys_info",
> >  		.data		= &hardlockup_si_mask,
> > @@ -1257,6 +1258,7 @@ static const struct ctl_table watchdog_s
> >  		.mode		= 0644,
> >  		.proc_handler	= sysctl_sys_info_handler,
> >  	},
> > +#endif
> >  #ifdef CONFIG_SMP
> >  	{
> >  		.procname	= "hardlockup_all_cpu_backtrace",
> > _
> 
> This patch makes some sense because the arch-specific watchdog does
> not support the sys_info interface. And it is better than nothing.
> definitely.
> 
> A better solution would be export the variable and handle it
> in arch/powerpc/kernel/watchdog.c.

Yep!

> It seems that powerpc is the only architecture which could define
> HAVE_HARDLOCKUP_DETECTOR_ARCH.
> 
> Feng, would you have time to look at it?

Sure.

Thanks,
Feng
