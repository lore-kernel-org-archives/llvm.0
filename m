Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C7341AB8
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855528; cv=none; b=n8ZcOdv16RO9rm8CB8+F5FMR2vLuIEdzqRhhKjK5CeSLdiPI5Np2QTYQzdvCox3PZqkvjwBF2oUl2PM4dSeK0OZozKKcXtOxztIAxhRK+pHXPU8H8m+DH18xKDazqFiDJG4Bx8fxrCBvhIqHrIDMSLiFWv1bQyBEtuWvxuMd8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855528; c=relaxed/simple;
	bh=+ZehjEOR+fRk7uYMCXqZliw7qQqeltA0K+ETEE0pMdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDpbPCl9I3dzAg+lzqaeycWb/Jszf99MHnM3fN+z52tgMsRyCUqFNQ5EY2x68DlITIqTmVrRDMNFiWRfMqcX2imjE7tMd9NgL0Bc6xbks+CAkfrBh43aEVhickHhQ819L/2YcgNEysiiY/YYmR9tKbW9QyQ/a1g8wWD7k/C+HcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vq52rQro; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vq52rQro"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so8617375e9.2
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 05:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764855525; x=1765460325; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4YCKnZkbYPllJg8tAyg8KkLXrCsah/wRtrAT01nAWx8=;
        b=Vq52rQroqp8bLhKUaum31Mo3tzu8SQE7C7UZSymtUc2QtpxDNf9LjRTSUtvyy5JFvV
         6k14S2niAh6VDQGWrK7ekYnRlQ+eeRsv78cYEJQDHnlaelA6blcVwNrSgJtlujSyltuu
         MGVImwItZ7Avwmw+7WSPlDesDypBJo8QTpDuZBIUzA9TVppvZyk3YHpJDJ6wc8WT1WeW
         7Rw8p1lg2jY8NUnp6ba0hCpTmKLOs2pUJZpAgpBbFH1U8pOg562LYZt0zD9zcYa/CBTF
         rO3qTvp/JyHM05o5iyxrV5veU0hznPOIWQFGv6Hv+GhI/J7Ld3UoEZykfRZIAw/oWMxk
         As6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855525; x=1765460325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YCKnZkbYPllJg8tAyg8KkLXrCsah/wRtrAT01nAWx8=;
        b=LnzyzL2Ozl9949JUR4+Hdf/G7coRC2837vFutn5TpXSnrgoLlW1+gqKAi7a1XIK0XI
         706FQjAs17E5E9GW9z97R+xJOvwSDrBIZAa/Lcq/B82Fqw0b9Jro9QLyK0jnCgl+YT5T
         qcs0bbr9T6aoGIcB1CxGmkNcYi8WD5woTTScnUabQR5CaKdLc0zyjg/jL3byP/SveG4I
         Lf9Lli1HPTpbrwZSyfnDdBpTCZzt6XAZIxlRMBeX+JexDD+YKN4G6l4X19ct5m7nXQdW
         fB7dLnAtVbP2Z6q7rz4rnKW50OhT7KHBP23SOQV6oJU0khgkW4eCF0pT8dik/RQxbBiX
         9myQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxVgA0jYG/90PJiVS7xc9C/1wmeI4b7mBZi1YO1o4RLB32Xiq8bBj0fgQ1HoU0gXgCZ+P+@lists.linux.dev
X-Gm-Message-State: AOJu0YzuMt+Yuc2pwgpfapCTXsqMJTpRGq0lQSj9WBp2IwQwN+l5An25
	jFLCxaPAE3ZVHCg5f3VR2TnWOiAyg3B/pXBjwRN2ykO81nWMYGUbKOSOLTTZtJoNcJU=
X-Gm-Gg: ASbGncsaaOzJVB/JA51K9MjhGQbE/NszWhv1d3bmAzyb6Il+m5BycBlpaGNoG7lM4I+
	dIDBvw7wjlla4/WE9Wc79uq3YPDPIjTpOF8Y4h3sZX/yOF5xWPz/MGsUPjP545bkLGANbiXBqWA
	r0afH9HMAmIUDtf4gUmGe29xvgQaw3mcrMy4la+xeKYaMCv9ium/SIHATggMcv/NWuRSRY5CuIC
	msIXNwvMkszRA9d+lRvaNg4JHJcAxNXp/vvON/eHvKU+1UwaJ7Ix8dJ8wSlYIP20jEdmtqkcMMg
	BMaruIwF66VzzpsaeFJ3mnsYVdZDA/Rprj4OmNPqerwA6HIpjqBoomdqngfV0JZgqOAVlaSN7C5
	hA4gZVQsPvYRkY/H1m7vhu8mj5OgB+NVnx98e1/bfJ3O3yLT1nLxrzL4uAAh6way0Hxt26KUaSD
	2aBE7oWnVK5sXA0g==
X-Google-Smtp-Source: AGHT+IH9J0bYH9Ls3TTcq6OjNzMt1GmD0xmnELYMfVYz4mP7/YBZ3MocmABVO9zMqGrsr3mVB9H00A==
X-Received: by 2002:a05:600c:4fce:b0:477:7658:572a with SMTP id 5b1f17b1804b1-4792f3861fbmr34011995e9.20.1764855524636;
        Thu, 04 Dec 2025 05:38:44 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930c7473bsm53396255e9.10.2025.12.04.05.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:38:44 -0800 (PST)
Date: Thu, 4 Dec 2025 14:38:42 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 9966/13055] kernel/watchdog.c:74:22: warning:
 unused variable 'hardlockup_si_mask'
Message-ID: <aTGO4iLrQnd4l6fO@pathway.suse.cz>
References: <202512030920.NFKtekA7-lkp@intel.com>
 <20251203144453.be34d189c5e6668ce2da06b3@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203144453.be34d189c5e6668ce2da06b3@linux-foundation.org>

On Wed 2025-12-03 14:44:53, Andrew Morton wrote:
> On Wed, 3 Dec 2025 09:05:30 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   47b7b5e32bb7264b51b89186043e1ada4090b558
> > commit: a9af76a78760717361cccc884dc649e30db61c8b [9966/13055] watchdog: add sys_info sysctls to dump sys info on system lockup
> > config: powerpc64-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> kernel/watchdog.c:74:22: warning: unused variable 'hardlockup_si_mask' [-Wunused-variable]
> >       74 | static unsigned long hardlockup_si_mask;
> >          |                      ^~~~~~~~~~~~~~~~~~
> >    1 warning generated.
> 
> I'm testing the appended patch but it needs checking please.
> 
> The comment for hardlockup_si_mask says
> 
>  * bitmask to control what kinds of system info to be printed when
>  * hard lockup is detected, it could be task, memory, lock etc.
>  * Refer include/linux/sys_info.h for detailed bit definition.
> 
> but the variable depends on "COUNTS_HRTIMER".  The comment doesn't
> mention hrtimers and I don't see why it should.  Not sure what's going
> on here.

Good point! It took me some time to understand it.

So, powerpc implements its own watchog, see arch/powerpc/kernel/watchdog.c.
The watchdog is supported only by some powerpc platforms, see the
   following line in arch/powerpc/Kconfig:

	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP

As a result, the test system could have the following in the config,
see https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/config

	CONFIG_HARDLOCKUP_DETECTOR=y
	# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
	# CONFIG_HARDLOCKUP_DETECTOR_BUDDY is not set
	CONFIG_HARDLOCKUP_DETECTOR_ARCH=y

And "COUNTS_HRTIMER" is not defined.


> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: kernel/watchdog.c: fix unused var warning
> Date: Wed Dec  3 02:34:40 PM PST 2025
> 
> >> kernel/watchdog.c:74:22: warning: unused variable 'hardlockup_si_mask' [-Wunused-variable]
>       74 | static unsigned long hardlockup_si_mask;
>          |                      ^~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 
> Fixes: a9af76a78760 ("watchdog: add sys_info sysctls to dump sys info on system lockup")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
> Link: https://lkml.kernel.org/r/202512030920.NFKtekA7-lkp@intel.com
> Cc: Feng Tang <feng.tang@linux.alibaba.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  kernel/watchdog.c |   16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> --- a/kernel/watchdog.c~kernel-watchdogc-fix-unused-var-warning
> +++ a/kernel/watchdog.c
> @@ -66,13 +66,6 @@ int __read_mostly sysctl_hardlockup_all_
>  unsigned int __read_mostly hardlockup_panic =
>  			IS_ENABLED(CONFIG_BOOTPARAM_HARDLOCKUP_PANIC);
>  
> -/*
> - * bitmasks to control what kinds of system info to be printed when
> - * hard lockup is detected, it could be task, memory, lock etc.
> - * Refer include/linux/sys_info.h for detailed bit definition.
> - */
> -static unsigned long hardlockup_si_mask;
> -
>  #ifdef CONFIG_SYSFS
>  
>  static unsigned int hardlockup_count;
> @@ -135,6 +128,13 @@ __setup("nmi_watchdog=", hardlockup_pani
>  
>  #if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
>  
> +/*
> + * bitmask to control what kinds of system info to be printed when
> + * hard lockup is detected, it could be task, memory, lock etc.
> + * Refer include/linux/sys_info.h for detailed bit definition.
> + */
> +static unsigned long hardlockup_si_mask;
> +
>  static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
>  static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
>  static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
> @@ -1250,6 +1250,7 @@ static const struct ctl_table watchdog_s
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE,
>  	},
> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
>  	{
>  		.procname	= "hardlockup_sys_info",
>  		.data		= &hardlockup_si_mask,
> @@ -1257,6 +1258,7 @@ static const struct ctl_table watchdog_s
>  		.mode		= 0644,
>  		.proc_handler	= sysctl_sys_info_handler,
>  	},
> +#endif
>  #ifdef CONFIG_SMP
>  	{
>  		.procname	= "hardlockup_all_cpu_backtrace",
> _

This patch makes some sense because the arch-specific watchdog does
not support the sys_info interface. And it is better than nothing.
definitely.

A better solution would be export the variable and handle it
in arch/powerpc/kernel/watchdog.c.

It seems that powerpc is the only architecture which could define
HAVE_HARDLOCKUP_DETECTOR_ARCH.

Feng, would you have time to look at it?

Best Regards,
Petr
