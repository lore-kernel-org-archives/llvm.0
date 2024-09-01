Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD42A1B8;
	Sun,  1 Sep 2024 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725230422; cv=none; b=F0I94Rr+O6J0b5VUiwCKaL5of8Od3A4guIJqugL38p/nm5yvX9n20lhL/kx24IVFyUKYgPb02IEHprK1BzQT9kngNR4QB5r78BYW65sLOMIkuncSTkT7jZ/q7PQ3zEjkkF/+V+ovAmpsQQQfN+AwYe1cBE9CvNrfHPdnTATtdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725230422; c=relaxed/simple;
	bh=RY49do6+rIDTb0706hBaOkTkcv71uj8ElHwJ4hwLXdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEBLEez1q7uYwh/ILFT85ZOwZzufKu+Rw4/Z3XL6QWZtrctwkNo8B+/iYlMb+hsEs+EsIOEOboN3h3OBCXQsKtI8w0xsk7hn/ACerjsULzMiFnkanZBGvxUFbdeSo/0UOuBzvwqhbMmIpOR+op4iTw9ZsTOUWlhtusClPYnCMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDk5i6l2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDk5i6l2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725230420; x=1756766420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RY49do6+rIDTb0706hBaOkTkcv71uj8ElHwJ4hwLXdo=;
  b=hDk5i6l2IXg4MW/dKezZau08SastM3ec1GfNoll/STUobY/cvEfIk8jZ
   J9Wtp7PE1IeaTR48Wqs9kjwA7X4yJTpK+cWEp8kNU/2z6YBGh4Z9nJOLp
   64AAIOuld5ZZnzWWjlJWf87QbpUBlBWZTytlySk6eL7/x6iwodjGmppZx
   6E9ty1xdv/ma+OwVgy+6JI93SORdPn8eHn8twID1p3qlEKKsbls9acpqn
   yTWYkyrgH1x6fp6DCyylD95oHDRrr8hG0h6ZfHM4xM4VpUrDUN1y1eICx
   rcdapqU4+eGeekDIJDliRfUhRBjdOWtB6F7wARK+Jcb1qXYEDkNwpxB5j
   A==;
X-CSE-ConnectionGUID: OW/dDlwsTuy16jy0+9Wyhg==
X-CSE-MsgGUID: IJZ21h5RRXaZidhNrM0NBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23984259"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23984259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 15:40:19 -0700
X-CSE-ConnectionGUID: h6MbXMPxTxi5Qn02B+f5Zg==
X-CSE-MsgGUID: HUC3ReZPRd6KxZkaeY0Vwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="65159903"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Sep 2024 15:40:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sktF1-0004xG-14;
	Sun, 01 Sep 2024 22:40:15 +0000
Date: Mon, 2 Sep 2024 06:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <202409020603.tc9e1ATi-lkp@intel.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829171238.609481-1-boris.brezillon@collabora.com>

Hi Boris,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-sched-Fix-a-UAF-on-drm_sched_fence-sched/20240830-012038
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240829171238.609481-1-boris.brezillon%40collabora.com
patch subject: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
config: i386-buildonly-randconfig-003-20240902 (https://download.01.org/0day-ci/archive/20240902/202409020603.tc9e1ATi-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020603.tc9e1ATi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409020603.tc9e1ATi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/lima/lima_dlbu.c:7:
   In file included from drivers/gpu/drm/lima/lima_device.h:12:
   In file included from drivers/gpu/drm/lima/lima_sched.h:7:
>> include/drm/gpu_scheduler.h:290:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     290 |         kfree(tl->name);
         |         ^
   1 error generated.
--
   In file included from drivers/gpu/drm/lima/lima_trace.c:4:
   In file included from drivers/gpu/drm/lima/lima_sched.h:7:
>> include/drm/gpu_scheduler.h:290:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     290 |         kfree(tl->name);
         |         ^
   In file included from drivers/gpu/drm/lima/lima_trace.c:7:
   In file included from drivers/gpu/drm/lima/lima_trace.h:50:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:33:
   include/linux/slab.h:278:6: error: conflicting types for 'kfree'
     278 | void kfree(const void *objp);
         |      ^
   include/drm/gpu_scheduler.h:290:2: note: previous implicit declaration is here
     290 |         kfree(tl->name);
         |         ^
   In file included from drivers/gpu/drm/lima/lima_trace.c:7:
   In file included from drivers/gpu/drm/lima/lima_trace.h:50:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/lima/lima_trace.c:7:
   In file included from drivers/gpu/drm/lima/lima_trace.h:50:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/lima/lima_trace.c:7:
   In file included from drivers/gpu/drm/lima/lima_trace.h:50:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/lima/lima_trace.c:7:
   In file included from drivers/gpu/drm/lima/lima_trace.h:50:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/lima/lima_trace.c:7:
   In file included from drivers/gpu/drm/lima/lima_trace.h:50:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]


vim +/kfree +290 include/drm/gpu_scheduler.h

   283	
   284	static inline void
   285	drm_sched_fence_timeline_release(struct kref *kref)
   286	{
   287		struct drm_sched_fence_timeline *tl =
   288			container_of(kref, struct drm_sched_fence_timeline, kref);
   289	
 > 290		kfree(tl->name);
   291		kfree(tl);
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
