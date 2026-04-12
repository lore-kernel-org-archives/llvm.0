Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE539378D64;
	Sun, 12 Apr 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775992425; cv=none; b=iUF8KdYncNsoZ+DdYHYhYRdWry1J6Qhyts1GAAPlqJ3KlYTGNfI65+deTCSb3Bqyo+IFKKG3gAzwPvCIqrp0SboO0wiKeM/9pexRgHnPRK48zDjHNF5Sfieloqdz43D0YDXw8oWGSU7Rvwo7EJKhiT/6SWFFOOA6VfLq5FUmQWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775992425; c=relaxed/simple;
	bh=adQvX5EnnVLF2WhDxNMV1vQXqa+ScJgF6sUr6aJic8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgkJ1IpSMr1P4Xew9Tfjd+KapIC1ZTlbMAaLZFNk3VCiB7135HvTcTqjQQYEfUtoTw5u0iw17UlFPfcBulDSqTH8BxcBtJoaxiNXfVLzsFsEs7Lg7ClcZCFoRCiZ/Py6mNSCdSnKMjJ0jOXyW+m5v4kY0mAbxjG+z/an/Ue/mv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzOUq5yh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzOUq5yh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775992422; x=1807528422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=adQvX5EnnVLF2WhDxNMV1vQXqa+ScJgF6sUr6aJic8M=;
  b=EzOUq5yhZSi5/MAxIffdIVdOt78EqEYyym1FmNiP7HLPXepUYMyE9Apl
   J5VV3UGsWzkW1dX9PHNB0to3toQjQvH+C3OeUwGjP8MgMlDgfNuEZdodt
   laTmHe736YsVC8Z9uKomdlT2X7i1MYn3qfiZHaA9qNJ4hcFYzMPc3vk6P
   weuDreRPO9mNSVWAUj0tYmPebfXYh5VgBU6edtNBg+DazRjFjyBlYeAbz
   WtvnkRU8hPeip82ujGHnqjgvTuksTE7h96as9idhxj0SV0jK3KWBtR+cx
   xd3BzVmrp1BpEvgIvGTanBOXsq/QXw0Amcqh9+RGk21yc4iAjpGoKYq4z
   Q==;
X-CSE-ConnectionGUID: hjg5txIVRg66aJDDfrh53Q==
X-CSE-MsgGUID: S+JGcYakRcySMcxqao/AnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87241579"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="87241579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 04:13:41 -0700
X-CSE-ConnectionGUID: k2HGwcSNTyq6SmFb5gkSxQ==
X-CSE-MsgGUID: RZg9PAt4RNusbd9Ucd45dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="225242527"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Apr 2026 04:13:38 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBskx-0000000028r-08nv;
	Sun, 12 Apr 2026 11:13:35 +0000
Date: Sun, 12 Apr 2026 19:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, francesco@valla.it,
	geert@linux-m68k.org, tglx@kernel.org, shashankbalaji02@gmail.com,
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <202604121907.nsngvl5u-lkp@intel.com>
References: <20260410203741.997410-2-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410203741.997410-2-tim.bird@sony.com>

Hi Tim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/printk-fix-zero-valued-printk-timestamps-in-early-boot/20260412-134726
base:   linus/master
patch link:    https://lore.kernel.org/r/20260410203741.997410-2-tim.bird%40sony.com
patch subject: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
config: um-defconfig (https://download.01.org/0day-ci/archive/20260412/202604121907.nsngvl5u-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121907.nsngvl5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121907.nsngvl5u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:49:
   include/linux/early_times.h:20:9: error: call to undeclared function 'rdtsc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      20 |         return rdtsc();
         |                ^
>> include/linux/early_times.h:45:47: warning: division by zero is undefined [-Wdivision-by-zero]
      45 |                 return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
         |                                                             ^ ~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +45 include/linux/early_times.h

    34	
    35	/* returns a nanosecond value based on early cycles */
    36	static inline u64 early_times_ns(void)
    37	{
    38		if (CONFIG_EARLY_CYCLES_KHZ)
    39			/*
    40			 * Note: the multiply must precede the division to avoid
    41			 * truncation and loss of resolution
    42			 * Don't use fancier MULT/SHIFT math here.  Since this is
    43			 * static, the compiler can optimize the math operations.
    44			 */
  > 45			return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
    46		return 0;
    47	}
    48	#else
    49	static inline u64 early_times_ns(void)
    50	{
    51		return 0;
    52	}
    53	#endif
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
