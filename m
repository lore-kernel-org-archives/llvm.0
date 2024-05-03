Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50098B656;
	Fri,  3 May 2024 00:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714697352; cv=none; b=QRTMlWaSf2ZJ6nYKoPAFKXgJKAL9HS3BsVK8zssgzLyLASNBN4pFL1yIcMDibSQQr26ffcj1SjcOwZIm57YT1JL5OvNwWutKFzISSU2ULIIy+GUXKsJ51XtYCWXabmRGjFjhFdSgMsPb+g8Rpt7McWkP9sjIZiAfWN2ib9vAEAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714697352; c=relaxed/simple;
	bh=xIJrpLhYVzVLy7koJhNM0WQcnsAS4kz9c5+mymRr/0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIkby+yobUkT6YWxcssVgPzeQfjBKKQxzjWhFPdIBTxTG91rRpHS14gt+eooymlds3QyrPfySSk0CmrIOkLOpK/9ckmM0MO8Quj13/nvT6qtqkOaG/rYA0QHygN98IDvDHo/yxOrXgkHgoi96Cp0jMFuitp0RTsr140fRluewL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ml+JIsnI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ml+JIsnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714697351; x=1746233351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xIJrpLhYVzVLy7koJhNM0WQcnsAS4kz9c5+mymRr/0Q=;
  b=ml+JIsnIjo2j8evP0ZSVD3o3SIUvowHlktQ9PxPQdeJCbHLdbkFilLdf
   B8uoF5Iy1cYRQrATGh378tNsquyTfo0yfHL7BY9+46kPhF70sKvM78c2X
   XwgrXjSDUbytOpxPKmMFGz+SKfL9fsEnxTx9u/Hd+Mb1TFlbWkYyLyc7R
   SfCiwK1tXE8sIQwnFNCMYI1Sb3T1k52ppNNvfKGNgdrCXrJmLHBu0ka7l
   gcwFz0Ruyo1++vVbUV1EaiuaX2W8tJqhGE+N/iV/Cb9+FQaSdlmblmJ/R
   TqT866zhkYv4gOYWA7XCNjb2hvg7EHOrP0nHRFmbks5x+/3YlviWeJ/Vy
   A==;
X-CSE-ConnectionGUID: GcSML9rxRleCIV+3ldkUbQ==
X-CSE-MsgGUID: 7jTWJyQWT9GmlIky3F1m7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="13446937"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="13446937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 17:49:10 -0700
X-CSE-ConnectionGUID: ZUnm+jTOSPaINwTWKsj/Gg==
X-CSE-MsgGUID: ZJsVZBHWTYKONUoAMCPBSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="32112565"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2024 17:49:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2h6n-000BBc-0r;
	Fri, 03 May 2024 00:49:05 +0000
Date: Fri, 3 May 2024 08:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
Message-ID: <202405030808.UsoMKFNP-lkp@intel.com>
References: <20240502092443.6845-2-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502092443.6845-2-visitorckw@gmail.com>

Hi Kuan-Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.9-rc6 next-20240502]
[cannot apply to akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/lib-test_bitops-Add-benchmark-test-for-fns/20240502-172638
base:   linus/master
patch link:    https://lore.kernel.org/r/20240502092443.6845-2-visitorckw%40gmail.com
patch subject: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405030808.UsoMKFNP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bitops.c:56:39: error: variable 'tmp' set but not used [-Werror,-Wunused-but-set-variable]
      56 |         static volatile __used unsigned long tmp __initdata;
         |                                              ^
   1 error generated.


vim +/tmp +56 lib/test_bitops.c

    52	
    53	static int __init test_fns(void)
    54	{
    55		static unsigned long buf[10000] __initdata;
  > 56		static volatile __used unsigned long tmp __initdata;
    57		unsigned int i, n;
    58		ktime_t time;
    59	
    60		get_random_bytes(buf, sizeof(buf));
    61		time = ktime_get();
    62	
    63		for (n = 0; n < BITS_PER_LONG; n++)
    64			for (i = 0; i < 10000; i++)
    65				tmp = fns(buf[i], n);
    66	
    67		time = ktime_get() - time;
    68		pr_err("fns:  %18llu ns\n", time);
    69	
    70		return 0;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
