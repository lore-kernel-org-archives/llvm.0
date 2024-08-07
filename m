Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC684DF1;
	Wed,  7 Aug 2024 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723050929; cv=none; b=Y9YJpKhv9rUwwwKdAp1CDH8Fx7lCD/l49phbdMOTqWXWppoemIUGr7KIIR5tqGaec8toRIwtOxIvcl+/NtK+i0jC48+PpVcPabuJVRwoGgayQ2bFoBAkiLl++glF1G0UxLZ1B4zGWmSKLTSjddLpcApE1VZ449DguCNU7XpJbk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723050929; c=relaxed/simple;
	bh=fszI7QlepLjFNPIgYHFreWQ7b6Io6yQMNhn5Ot41fDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prCs+pu04MtpDXZJUc6qAnLt6F5RAjAzTqaNDnIIM0XLe/XCFqUNxnEIKZ17IYMLduONclSUoq6WogZUQ/xCqIqEzqGj1kDRMzQNLrnOhb+sKrDe/q/4/jHNxRh6EnQBSlDaHp77Pxfm/XgKp0UrCEWMlW1e1JUanwaxs2Q6Hww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lr3HtVu9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lr3HtVu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723050927; x=1754586927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fszI7QlepLjFNPIgYHFreWQ7b6Io6yQMNhn5Ot41fDQ=;
  b=Lr3HtVu9LqCzWcMnEINYebfTSWvieQ/kgjYhvWn8p0OY3rxYEUNoLzGM
   NbAsZXUMYHW6BegrmK0NhXFDM09tDGyAnGX2ueDw38NhzwPL+iMJpyvWF
   B6F/NjF4oOEPIokTU6AIFM3kiwKhyIjhnjYLP0pVAZxG+jGLHUxstT6Uz
   s7whCmQIOIyubb6zHwPmFy5dDfs7DTMcw880n6NC6Dzlsxuy9SO8JqMeM
   tkBNJWBcP1ystOmYz2eipw8cCCVfOGnY7D7PBthQra4xrKOzmQmJIJq6O
   SGmpO4RVAv1lgx2qvTqzSOL24OtK291g4V/bGMIgN5C6elRQsDAF9JlSM
   A==;
X-CSE-ConnectionGUID: XjPi4hsSSjCFbQj3+dZ7mg==
X-CSE-MsgGUID: L+23wk3xQNiyUion3cImIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21016435"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="21016435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 10:12:08 -0700
X-CSE-ConnectionGUID: kbnkBJCJQqq3NsK0MoCekg==
X-CSE-MsgGUID: C0PFM1jUSGy8/z4nUgK1Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61034732"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2024 10:12:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbkCh-0005as-0H;
	Wed, 07 Aug 2024 17:12:03 +0000
Date: Thu, 8 Aug 2024 01:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>, peterz@infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	Menglong Dong <dongml2@chinatelecom.cn>,
	Bin Lai <laib2@chinatelecom.cn>
Subject: Re: [PATCH next] sched: make printk safe when rq lock is held
Message-ID: <202408080033.hGD8Z1m1-lkp@intel.com>
References: <20240806074131.36007-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806074131.36007-1-dongml2@chinatelecom.cn>

Hi Menglong,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240806]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/sched-make-printk-safe-when-rq-lock-is-held/20240806-155153
base:   next-20240806
patch link:    https://lore.kernel.org/r/20240806074131.36007-1-dongml2%40chinatelecom.cn
patch subject: [PATCH next] sched: make printk safe when rq lock is held
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240808/202408080033.hGD8Z1m1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080033.hGD8Z1m1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080033.hGD8Z1m1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from kernel/sched/core.c:88:
>> kernel/sched/sched.h:1705:2: error: call to undeclared function '__printk_safe_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1705 |         __printk_safe_enter();
         |         ^
   kernel/sched/sched.h:1705:2: note: did you mean '__printk_deferred_enter'?
   include/linux/printk.h:166:13: note: '__printk_deferred_enter' declared here
     166 | extern void __printk_deferred_enter(void);
         |             ^
   In file included from kernel/sched/core.c:88:
>> kernel/sched/sched.h:1722:2: error: call to undeclared function '__printk_safe_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1722 |         __printk_safe_exit();
         |         ^
   kernel/sched/sched.h:1722:2: note: did you mean '__printk_ratelimit'?
   include/linux/printk.h:182:12: note: '__printk_ratelimit' declared here
     182 | extern int __printk_ratelimit(const char *func);
         |            ^
   12 warnings and 2 errors generated.


vim +/__printk_safe_enter +1705 kernel/sched/sched.h

  1690	
  1691	/*
  1692	 * Lockdep annotation that avoids accidental unlocks; it's like a
  1693	 * sticky/continuous lockdep_assert_held().
  1694	 *
  1695	 * This avoids code that has access to 'struct rq *rq' (basically everything in
  1696	 * the scheduler) from accidentally unlocking the rq if they do not also have a
  1697	 * copy of the (on-stack) 'struct rq_flags rf'.
  1698	 *
  1699	 * Also see Documentation/locking/lockdep-design.rst.
  1700	 */
  1701	static inline void rq_pin_lock(struct rq *rq, struct rq_flags *rf)
  1702	{
  1703		rf->cookie = lockdep_pin_lock(__rq_lockp(rq));
  1704	
> 1705		__printk_safe_enter();
  1706	#ifdef CONFIG_SCHED_DEBUG
  1707		rq->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
  1708		rf->clock_update_flags = 0;
  1709	# ifdef CONFIG_SMP
  1710		SCHED_WARN_ON(rq->balance_callback && rq->balance_callback != &balance_push_callback);
  1711	# endif
  1712	#endif
  1713	}
  1714	
  1715	static inline void rq_unpin_lock(struct rq *rq, struct rq_flags *rf)
  1716	{
  1717	#ifdef CONFIG_SCHED_DEBUG
  1718		if (rq->clock_update_flags > RQCF_ACT_SKIP)
  1719			rf->clock_update_flags = RQCF_UPDATED;
  1720	#endif
  1721	
> 1722		__printk_safe_exit();
  1723		lockdep_unpin_lock(__rq_lockp(rq), rf->cookie);
  1724	}
  1725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
