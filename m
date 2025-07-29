Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9061220F4C;
	Tue, 29 Jul 2025 03:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753760605; cv=none; b=rmzBA2U/XJ6B9/9PtxoQFIRh0EKWePWMGIPRsqUKQLxtd4Z2BCoEWzqxg885mOUYs198DY2aueRBdXcTD+/SQE2Api1El5/7izJOSAH2rO8a8PmXa9uG8FuT8QFiUWB5UD3dItD/iCiOvO+wnKCC/m0KZf5lh7TIQfl2CV7rit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753760605; c=relaxed/simple;
	bh=lfow2nKo483GnK8aqGoaa98ibrQ0nshuY2+yq7pc0F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yp0Z0Vi2XB8IhjAZDEIADZNmSeczEdsE+c3qdcm/hjr2mU+/RvWK4KMAHHgYU73vryXO9yTQdJJ4vRIDEaNR7i0XF+Q7pErk/ZZ112moxmrJoaZT5UgHxfv9Iq6MlDqNoj2UIqphkbeC2Z+vSlE5NhedxF6ui3+1EzkHD4to9Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSec8DAG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSec8DAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753760604; x=1785296604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lfow2nKo483GnK8aqGoaa98ibrQ0nshuY2+yq7pc0F4=;
  b=MSec8DAGZ5RxxmlV9LY+bhJr01i1iTa7EBvchY6p4pl+xx0gz8UBpH7z
   Z4jf9cLf2wCPnPvS1ZtgRGigfczPqyo/lvWVYOw5ORtJA9BMIo5SMI1qs
   kaop8uRRpZ5/Uw24L1S5m303bvsIITgFI2kZwIMt9FVCE6qKIHu5vqJWj
   BRGPy0cX7yoJjP/2hY2mhDe0PVf5WwBSfvhJfHJrfGYN5U6wdBrEIBmDY
   4BIWe+cfjy8lnkwVNxe2SCV9+2BrMivTkTDYF3PCyvTuGac66YJsOODXN
   m7peksJ8XGZ2wVhX1tqycLI3+VjLQ6FQ8Z6yYq5jwm+g5zgIUaiRUMOir
   g==;
X-CSE-ConnectionGUID: FYkIdhrzQPe5WSHqRGTRgg==
X-CSE-MsgGUID: gFezAl9HQuugqdj2G7jAqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56169090"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="56169090"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 20:43:23 -0700
X-CSE-ConnectionGUID: kZXigimBSFmJAashtomMKQ==
X-CSE-MsgGUID: aQBrMxHFSjaEr5ba4k2S5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="186235765"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2025 20:43:21 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugbFH-0000xN-2t;
	Tue, 29 Jul 2025 03:43:19 +0000
Date: Tue, 29 Jul 2025 11:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/5] bpf: Extend bpf syscall with common
 attributes support
Message-ID: <202507291146.0df0CQq9-lkp@intel.com>
References: <20250728142346.95681-2-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728142346.95681-2-leon.hwang@linux.dev>

Hi Leon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Extend-bpf-syscall-with-common-attributes-support/20250728-222848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250728142346.95681-2-leon.hwang%40linux.dev
patch subject: [RFC PATCH bpf-next 1/5] bpf: Extend bpf syscall with common attributes support
config: arm-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291146.0df0CQq9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291146.0df0CQq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291146.0df0CQq9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:6140:1: error: conflicting types for 'sys_bpf'
    6140 | SYSCALL_DEFINE5(bpf, int, cmd, union bpf_attr __user *, uattr, unsigned int, size,
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFINE5'
     228 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:235:2: note: expanded from macro 'SYSCALL_DEFINEx'
     235 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:249:18: note: expanded from macro '__SYSCALL_DEFINEx'
     249 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^
   <scratch space>:50:1: note: expanded from here
      50 | sys_bpf
         | ^
   include/linux/syscalls.h:929:17: note: previous declaration is here
     929 | asmlinkage long sys_bpf(int cmd, union bpf_attr __user *attr, unsigned int size);
         |                 ^
   1 error generated.


vim +/sys_bpf +6140 kernel/bpf/syscall.c

  6139	
> 6140	SYSCALL_DEFINE5(bpf, int, cmd, union bpf_attr __user *, uattr, unsigned int, size,
  6141			struct bpf_common_attr __user *, uattr_common, unsigned int, size_common)
  6142	{
  6143		return __sys_bpf(cmd, USER_BPFPTR(uattr), size, USER_BPFPTR(uattr_common), size_common);
  6144	}
  6145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
