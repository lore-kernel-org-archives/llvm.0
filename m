Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFD527F00F;
	Tue, 29 Jul 2025 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753777561; cv=none; b=hzIFHaHupuJoY7bStiMDm2PVbVATHbwc8ZcmMoJ2/dirvuRTHawR+4hPe7tPojYkOdGs5gBKso5cOWxMLG/Nd8DKQ8W4m0Q8lG/AomRAbUtjDtjJmxO/uK0sAldcMThvDfllhE7SeSSDwyj+8iNaf5i+k7LM40cHvmJ3pn668Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753777561; c=relaxed/simple;
	bh=9m8Ap2l1w0cOWaDHEP8oGWuLE3we6/wdOD2nYafm0lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ek5PlZHCom9z9sVbkYWpZvxWaKnbMJT4n3m/0vUo91UaGgbUMWHoFpFK+WQXwQHAjkXzxCh+LRxFTNASwbamdN/kdqLpWir7bk9CfSHoHexLxVB6hJfVrMVm3Yrb0EIW//6NxExMCSsXbgOp9QmZIZXhVcHZ2ZzQdRyoH9goyJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDGfwLa7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDGfwLa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753777560; x=1785313560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9m8Ap2l1w0cOWaDHEP8oGWuLE3we6/wdOD2nYafm0lw=;
  b=ZDGfwLa7T/Q1BdJosT/pJ4owmkZj3nWa3bLyzJYqTL7JJEpQxzZQ7fKV
   7KlCbbXig1wp3PUkG20+W2eXeOdNmcifWAoDnvGuBEKS4fHcAR8RULORJ
   pXEXSRnJ/VX+VTrqBaC/j25Tc8LeC1mB7ClmTQKzAWhwB4lwUG51fScye
   +/l6jD4KLcuGYH2nIiVQAfuSD2GfX/LFvbi/3ctJtBTakuJGTUBXaoays
   fNRPa8UjflwkOcrLDdwDfM9yZu1r6R52Th1wi1EU5Hu96zYZXegp2W4or
   n+Qfp7bls1zVkLKIYa+2TZd6PrSkIciRA6i5qEYdWZtCaPw2WG/dS4ICq
   A==;
X-CSE-ConnectionGUID: /0C+JSt5RPe5UG+h3q7vaQ==
X-CSE-MsgGUID: L5/1roH9R/Wa1dHpiwtXuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55738912"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55738912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 01:25:56 -0700
X-CSE-ConnectionGUID: fNkDENy6Rneg5T1/VrpHMw==
X-CSE-MsgGUID: 3/GRPDWNSI+nRmJUf2/ExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162212250"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2025 01:25:55 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugfei-00017j-1s;
	Tue, 29 Jul 2025 08:25:52 +0000
Date: Tue, 29 Jul 2025 16:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next v2 1/4] fprobe: use rhltable for
 fprobe_ip_table
Message-ID: <202507291603.zTR0kmTf-lkp@intel.com>
References: <20250728072637.1035818-2-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728072637.1035818-2-dongml2@chinatelecom.cn>

Hi Menglong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/fprobe-use-rhltable-for-fprobe_ip_table/20250728-152930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250728072637.1035818-2-dongml2%40chinatelecom.cn
patch subject: [PATCH RFC bpf-next v2 1/4] fprobe: use rhltable for fprobe_ip_table
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250729/202507291603.zTR0kmTf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291603.zTR0kmTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291603.zTR0kmTf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/fprobe.c:8:
>> include/linux/fprobe.h:29:21: error: field has incomplete type 'struct rhlist_head'
      29 |         struct rhlist_head      hlist;
         |                                 ^
   include/linux/fprobe.h:29:9: note: forward declaration of 'struct rhlist_head'
      29 |         struct rhlist_head      hlist;
         |                ^
   kernel/trace/fprobe.c:71:17: error: initializer element is not a compile-time constant
      71 |         .key_offset             = offsetof(struct fprobe_hlist_node, addr),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from kernel/trace/trace_fprobe.c:9:
>> include/linux/fprobe.h:29:21: error: field has incomplete type 'struct rhlist_head'
      29 |         struct rhlist_head      hlist;
         |                                 ^
   include/linux/fprobe.h:29:9: note: forward declaration of 'struct rhlist_head'
      29 |         struct rhlist_head      hlist;
         |                ^
   1 error generated.


vim +29 include/linux/fprobe.h

    11	
    12	struct fprobe;
    13	typedef int (*fprobe_entry_cb)(struct fprobe *fp, unsigned long entry_ip,
    14				       unsigned long ret_ip, struct ftrace_regs *regs,
    15				       void *entry_data);
    16	
    17	typedef void (*fprobe_exit_cb)(struct fprobe *fp, unsigned long entry_ip,
    18				       unsigned long ret_ip, struct ftrace_regs *regs,
    19				       void *entry_data);
    20	
    21	/**
    22	 * struct fprobe_hlist_node - address based hash list node for fprobe.
    23	 *
    24	 * @hlist: The hlist node for address search hash table.
    25	 * @addr: One of the probing address of @fp.
    26	 * @fp: The fprobe which owns this.
    27	 */
    28	struct fprobe_hlist_node {
  > 29		struct rhlist_head	hlist;
    30		unsigned long		addr;
    31		struct fprobe		*fp;
    32	};
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
