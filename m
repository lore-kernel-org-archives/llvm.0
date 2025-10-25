Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE669246BCD;
	Sat, 25 Oct 2025 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761376470; cv=none; b=MbGrOdjOod+ESZri7g0n8tPL4Qhy4SXrpzCnUIFuICbia4yY1K7pgBNV4p4w4QZdpo40zf6E5E0grYHH151kYolvZwZ7Dl/pzqcPV6n12C8HcysmUy7W2bQR3Px8JAcFAMvmUOavEep8a1S41XunnTWPhI9Pg5BvdxynTcDguCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761376470; c=relaxed/simple;
	bh=AyUgepfktzp1wJZD1q1pD1rzx8Gq9MNvCmVh5e0vsik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhQ17r8ojc/tbZ9nGMP2kU6RY5st7twGvs/IdD4D9S6EU5ZtYkGtgUHGqVzgJHK3olE8dx5TVgXazhV2tXWUPM4k55NuAagKNv8JvOdqH6QQIuSUucCxsSIE2h6EHwVHibm5gheI+4BM+ET7vzEcO13EPyL7/xCJD8swI8p4Pws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQB9kUmv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQB9kUmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761376468; x=1792912468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AyUgepfktzp1wJZD1q1pD1rzx8Gq9MNvCmVh5e0vsik=;
  b=CQB9kUmv9PJukt98v3bMl3NS7ikTWVJOVDb757XauIo09uafDiIJGqxv
   +d0xgHq4IMDoXDAfWIru9+XUHXVk7Ggx3O6KZnmBCcuHx/pGJztCUplfI
   ZX1X4Z+n6LvLQduVnbg0WeS1OUHjLrUrdMHRkAOCy2jsYJyfgHGYzQ1x/
   /D0VGtQiqfvo1KvKJNVVUsE7pEkTZiGeO/vSMmlmDW59m31VBdbbZDJDw
   c+sKPVRazETkJvU6KBeHmxkp/ZJ43pyDMUVJLBbnkP9K7/Dk8EPHqURh1
   JmaaqjqNy5krzj+SVdrKP6gaHe2ucF+0Z5gf5M7coR9MSqtaE2BuExojC
   w==;
X-CSE-ConnectionGUID: 0x5xUtYiRga1rUnlacWXBA==
X-CSE-MsgGUID: LKZE/xDITFOoHlzLjmkwBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62574485"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="62574485"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 00:14:28 -0700
X-CSE-ConnectionGUID: EMhiLWf+S92+V2bQGK49Aw==
X-CSE-MsgGUID: 258aGUe3QqmZ6/MAVfpxgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="185084314"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2025 00:14:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCYTp-000FAX-0E;
	Sat, 25 Oct 2025 07:14:25 +0000
Date: Sat, 25 Oct 2025 15:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] ceph: Add BLOG debugfs support
Message-ID: <202510251449.dXsrM1va-lkp@intel.com>
References: <20251024084259.2359693-5-amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024084259.2359693-5-amarkuze@redhat.com>

Hi Alex,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on tip/sched/core linus/master v6.18-rc2 next-20251024]
[cannot apply to ceph-client/testing ceph-client/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Markuze/sched-fork-Wire-BLOG-contexts-into-task-lifecycle/20251024-164832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20251024084259.2359693-5-amarkuze%40redhat.com
patch subject: [RFC PATCH 4/5] ceph: Add BLOG debugfs support
config: i386-buildonly-randconfig-005-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251449.dXsrM1va-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251449.dXsrM1va-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251449.dXsrM1va-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ceph/debugfs.c:23:
   In file included from include/linux/ceph/ceph_blog.h:10:
   In file included from include/linux/blog/blog.h:17:
>> include/linux/blog/blog_ser.h:120:16: error: static assertion failed due to requirement 'sizeof (null_str.str) == sizeof(unsigned long)': null_str.str size must match unsigned long for proper alignment
     120 |         static_assert(sizeof(null_str.str) == sizeof(unsigned long),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/blog/blog_ser.h:120:37: note: expression evaluates to '8 == 4'
     120 |         static_assert(sizeof(null_str.str) == sizeof(unsigned long),
         |                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/ceph/debugfs.c:407:2: error: call to undeclared function 'boutc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |         boutc(fsc->client, "begin\n");
         |         ^
   fs/ceph/debugfs.c:429:2: error: call to undeclared function 'boutc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     429 |         boutc(fsc->client, "begin\n");
         |         ^
   3 errors generated.
--
   In file included from debugfs.c:23:
   In file included from include/linux/ceph/ceph_blog.h:10:
   In file included from include/linux/blog/blog.h:17:
>> include/linux/blog/blog_ser.h:120:16: error: static assertion failed due to requirement 'sizeof (null_str.str) == sizeof(unsigned long)': null_str.str size must match unsigned long for proper alignment
     120 |         static_assert(sizeof(null_str.str) == sizeof(unsigned long),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/blog/blog_ser.h:120:37: note: expression evaluates to '8 == 4'
     120 |         static_assert(sizeof(null_str.str) == sizeof(unsigned long),
         |                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   debugfs.c:407:2: error: call to undeclared function 'boutc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |         boutc(fsc->client, "begin\n");
         |         ^
   debugfs.c:429:2: error: call to undeclared function 'boutc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     429 |         boutc(fsc->client, "begin\n");
         |         ^
   3 errors generated.


vim +120 include/linux/blog/blog_ser.h

8ffa1efe9718cb Alex Markuze 2025-10-24  116  
8ffa1efe9718cb Alex Markuze 2025-10-24  117  static inline size_t write_null_str(char *dst)
8ffa1efe9718cb Alex Markuze 2025-10-24  118  {
8ffa1efe9718cb Alex Markuze 2025-10-24  119  	*(union null_str_u *)dst = null_str;
8ffa1efe9718cb Alex Markuze 2025-10-24 @120  	static_assert(sizeof(null_str.str) == sizeof(unsigned long),
8ffa1efe9718cb Alex Markuze 2025-10-24  121  		     "null_str.str size must match unsigned long for proper alignment");
8ffa1efe9718cb Alex Markuze 2025-10-24  122  	return __builtin_strlen(null_str.str);
8ffa1efe9718cb Alex Markuze 2025-10-24  123  }
8ffa1efe9718cb Alex Markuze 2025-10-24  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
