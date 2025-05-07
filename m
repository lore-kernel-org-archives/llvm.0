Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8C2135AC;
	Wed,  7 May 2025 06:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600206; cv=none; b=Zk2EOIfKQck9/3Kl1wenvleDvLHA+SuN2F1ZXJ+3J9ivnrDG6ZuKUIMPYe3BrxL2E3Zo+4MEP/BfinI0hl8Jq0SQX+V94LUMbf+fKc1ashSTCXNucVR/rviC1N0xYUsolIMoHeQ7rCliwnRVIJyogPjILZJbR4+nwKk5jBSO6aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600206; c=relaxed/simple;
	bh=bbLxclBQ005ZY0OU4XQboYEoeZsUBlz0RPC91v8MEw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKD/EInvu+m3TOFXq7D7B/CEKylWBOIhoQOPnWpiuzfmDh9fMk4KsDQsToaXYmZ62ifwlNzNJbTpuvqgRFa0pxQykZcVEEEv8qSEPCElR2sbyBRQPZiR8gjEA1VtwfkiyUHA9CqNrCOHe0qKZm6FKup+T/pp9f95jbdp+uwRsQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNjVxfwo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNjVxfwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746600206; x=1778136206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bbLxclBQ005ZY0OU4XQboYEoeZsUBlz0RPC91v8MEw0=;
  b=HNjVxfwolS+6lVHbBXWXta+lymhIvWJnM725oRmDX/ifREU8XdmWqCFw
   zapeqrpgRNGBANTHqcRxLHwRAiuOKEeUEXQJ4IpXwn9mMXTy6OfJVDlwO
   QDekragOCJhZBtsqVioqNer0/c5Cqgbglnr3I6yyn2eEn7NQ3VO5XVWoL
   WpWhRxN0WofLBU/5t6deC0Np9M5zGqikvbDzziJrl/4f4YY1UYQR8EqN6
   /n5ZgdEG5rXEUKIc3PhYzp/oAbgO7YhNL6Ws0AgjyE1uLBl7/7v+wGkY7
   GK01Gg6Gn12lxcuCBU/xIFFSaasLeK402G0+xe7ORwaMS0wvMaAbYqFSz
   Q==;
X-CSE-ConnectionGUID: LQrJ5fYCSa+V2SM7c3hkwA==
X-CSE-MsgGUID: C+mZ0ry4RfeF7jmeNywCvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48458744"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48458744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:43:17 -0700
X-CSE-ConnectionGUID: KG2x0beSRNSHtZM9vtK12g==
X-CSE-MsgGUID: NEyLoPhKT0+kihv1YFg0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136380765"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2025 23:43:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYUq-0007Df-0K;
	Wed, 07 May 2025 06:43:12 +0000
Date: Wed, 7 May 2025 14:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 07/10] ref_tracker: add a way to create a symlink to
 the ref_tracker_dir debugfs file
Message-ID: <202505071434.YWUTBcYu-lkp@intel.com>
References: <20250505-reftrack-dbgfs-v7-7-f78c5d97bcca@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-reftrack-dbgfs-v7-7-f78c5d97bcca@kernel.org>

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5bc1018675ec28a8a60d83b378d8c3991faa5a27]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/ref_tracker-don-t-use-pK-in-pr_ostream-output/20250506-013822
base:   5bc1018675ec28a8a60d83b378d8c3991faa5a27
patch link:    https://lore.kernel.org/r/20250505-reftrack-dbgfs-v7-7-f78c5d97bcca%40kernel.org
patch subject: [PATCH v7 07/10] ref_tracker: add a way to create a symlink to the ref_tracker_dir debugfs file
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505071434.YWUTBcYu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071434.YWUTBcYu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071434.YWUTBcYu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/proc/namespaces.c:8:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
>> include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   In file included from fs/proc/namespaces.c:8:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/proc/namespaces.c:8:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/proc/namespaces.c:8:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/proc/namespaces.c:8:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
--
   In file included from fs/proc/proc_sysctl.c:17:
   In file included from include/linux/bpf-cgroup.h:11:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
>> include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   1 warning and 1 error generated.


vim +124 include/linux/ref_tracker.h

   123	
 > 124	static inline __ostream_printf
   125	void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
   126	{
   127	}
   128	#endif
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
