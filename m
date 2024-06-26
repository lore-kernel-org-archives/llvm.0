Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C6218F2FB;
	Wed, 26 Jun 2024 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719419904; cv=none; b=dOZei8UQ0Ji5pXnULx8JM+pE+hyESI6GkPOeGxlayqtJseLFtOKFf2zLX3+D6VLCgSHJqN0DpjIfDX9wo0puMhBcswY3Lo5GUKW7QqVrp4czepcfc85jcTu4MGC2wTyD/xTSnwL4F+8cceP1UXiG8kHDy4X6M8R/MiP6595qPsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719419904; c=relaxed/simple;
	bh=kNGz1ZD9C84KIUd6Vhg4//CwpXuzsVswOYB5t+XyDx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjaJ/tizjeP2JlaRM37fAIa4zMvD9X74lFwMEd3JQb5QTiusiWCl9AvmzuxlSm8WmWYKgpjmC0EyB6aY3mMZeXdR7MjM7Bi9cKeiXh+1KjCvuM5nCaR04Om0f5cLBLg3xG3lEQXB6tJ7bWAmEH6QefUaHWmMUrt1aFz8klVtYOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m94bDWEL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m94bDWEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719419903; x=1750955903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNGz1ZD9C84KIUd6Vhg4//CwpXuzsVswOYB5t+XyDx8=;
  b=m94bDWELWO6Jkqf8kubUhEw/Fyb5Prxb1wFgLGNXIY+vKAeMlXGyVW3f
   duNYhQNLj3y2e3Q8bNXDvTqJZwoYYm1V9px5wllV+Q6RcVkCcm3n8cu9z
   oXmimm6QHAD1SuA7A0lDxn8jWcT3YpEsU/IDKmZ3wNcLwtMEsbit48ZKq
   QlLPyL1LbWGZgIF8YeXC5aM/Eqy+ExUmIB9lxK0Wf6YF53gogQ/2YN8St
   h3QkJUABi7BR6bKrYnBdN0vACYq7OmLtImQQPHYGLWdzF63Z3p9eopmFl
   qe4RvMEFm/r5a28prMv3yK6yB2jzcF5jtgcwWW6g3cogwzFpeBJQYiYO6
   g==;
X-CSE-ConnectionGUID: yndLVLBuRZyHH7SrkTShaw==
X-CSE-MsgGUID: cRMD9zTVSTurMF0TvLXRbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16730929"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="16730929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 09:38:22 -0700
X-CSE-ConnectionGUID: TwNrv5gbQ1GBl6iJYVJFrA==
X-CSE-MsgGUID: yCgtTno7QjC+Ryisvj5rgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="44778322"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2024 09:38:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMVf0-000FOQ-0Z;
	Wed, 26 Jun 2024 16:38:18 +0000
Date: Thu, 27 Jun 2024 00:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 43/43]
 arch/powerpc/kernel/nvram_64.c:79:10: error: incompatible function pointer
 types initializing 'void (*)(struct kmsg_dumper *, enum kmsg_dump_reason,
 const char *)' with an expression of type 'void (struct kmsg_dumper *, enum
 kmsg_dump_reason)'
Message-ID: <202406270010.IIwJCerE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   7e72bb7504d1192ab89809f6192dba1b06f4fa51
commit: 7e72bb7504d1192ab89809f6192dba1b06f4fa51 [43/43] printk: add a short description string to kmsg_dump()
config: powerpc64-randconfig-002-20240626 (https://download.01.org/0day-ci/archive/20240627/202406270010.IIwJCerE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270010.IIwJCerE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270010.IIwJCerE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/nvram_64.c:79:10: error: incompatible function pointer types initializing 'void (*)(struct kmsg_dumper *, enum kmsg_dump_reason, const char *)' with an expression of type 'void (struct kmsg_dumper *, enum kmsg_dump_reason)' [-Werror,-Wincompatible-function-pointer-types]
           .dump = oops_to_nvram
                   ^~~~~~~~~~~~~
>> arch/powerpc/kernel/nvram_64.c:645:13: error: conflicting types for 'oops_to_nvram'
   static void oops_to_nvram(struct kmsg_dumper *dumper,
               ^
   arch/powerpc/kernel/nvram_64.c:75:13: note: previous declaration is here
   static void oops_to_nvram(struct kmsg_dumper *dumper,
               ^
   2 errors generated.


vim +79 arch/powerpc/kernel/nvram_64.c

78989f0a559218 Hari Bathini 2015-02-06  74  
78989f0a559218 Hari Bathini 2015-02-06  75  static void oops_to_nvram(struct kmsg_dumper *dumper,
78989f0a559218 Hari Bathini 2015-02-06  76  			  enum kmsg_dump_reason reason);
78989f0a559218 Hari Bathini 2015-02-06  77  
78989f0a559218 Hari Bathini 2015-02-06  78  static struct kmsg_dumper nvram_kmsg_dumper = {
78989f0a559218 Hari Bathini 2015-02-06 @79  	.dump = oops_to_nvram
78989f0a559218 Hari Bathini 2015-02-06  80  };
78989f0a559218 Hari Bathini 2015-02-06  81  

:::::: The code at line 79 was first introduced by commit
:::::: 78989f0a5592182a3d45d869ddaafc71c8f673af powerpc/nvram: Move generic code for nvram and pstore

:::::: TO: Hari Bathini <hbathini@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
