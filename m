Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA1192D9A;
	Thu,  6 Feb 2025 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864438; cv=none; b=GrScEOfeFA5cReuxXDJS5wSUasLIPBDuooVAqY56RxGhsKgRunxP7RDot4oQ6af9+coGdzLK72vCI70DDEnf0cQlGdr3nT4UXNi54sZCl+Co9neiNQnCDY5/2/cRfM30XomxTtb+kYxt7M+P6CuCikTeZGdSq2eLIgRKKTJ37hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864438; c=relaxed/simple;
	bh=/XyzWKrIcjCUdK0TUsQ85fpOZFIWJPQ730jigla+1xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fpj8kfdy+UocTWaKPsDVTDIY0+cCD9VQT1Tf7uIdeW7qj4z3yyyT6pdLufSesu+l7UAJwgdMGch2lsUrBAfStw6um7i3LUPrGw0Nc30iU4AI+B4q2AK1rZPXP1u+UniYKOmal1bY1JVekMNO1gROwUDzUmdSMR583Yt9THI7cEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO+mlmkZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO+mlmkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738864436; x=1770400436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/XyzWKrIcjCUdK0TUsQ85fpOZFIWJPQ730jigla+1xk=;
  b=EO+mlmkZ7ZhHV2NCVhM/0hGuNo73wOJifcEIO5NBU8Uglud8g19pRtwO
   DbhCzFjFbCu8FD31ifaqnIuit2yhK2TNHRabIFPnw29+3jCQ3Nqegg0Lm
   wtvdBNeXz5HaZu3GVXZxqdV5eT8dJmX1jS/z1+13uZhxylHwOECWQOT09
   6f3nqQ2rdE3GNmS8PiPHk5743Dz/LUMozNznWT3SH5BORfn8fyA+ZNQmS
   FBgg2ovqBE/LlA2btIK8Qg/22FtLZNwpS/BfEvWjYgbqPFvMSrwucjAmJ
   SPPmPsLcIstL8sU4/HRkwc/tF1Kv5QbR2qW0DnjGDta/qrWGkjy+RlRz4
   w==;
X-CSE-ConnectionGUID: lGNhz5VbQNa/QTIa/MpMlA==
X-CSE-MsgGUID: ZiQoERz8ShSiuzFUTlbhtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39754178"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39754178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 09:53:55 -0800
X-CSE-ConnectionGUID: RE7LTLtaT5G/syEzWSvk/g==
X-CSE-MsgGUID: 5x6TtNKvRS+IO9xucUfCjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111135663"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Feb 2025 09:53:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg64W-000xAB-0H;
	Thu, 06 Feb 2025 17:53:52 +0000
Date: Fri, 7 Feb 2025 01:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 7/9] kernel/trace/bpf_trace.c:1043:6: error:
 call to undeclared function 'is_endbr'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202502070111.MUfxOmQO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   57750f0464beab3927ad570e0c1b5e78c91dd1b6
commit: c5a15175c3560f7ec5cacfca9fd72655b7f55742 [7/9] x86/ibt: Clean up is_endbr()
config: riscv-randconfig-002-20250206 (https://download.01.org/0day-ci/archive/20250207/202502070111.MUfxOmQO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070111.MUfxOmQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070111.MUfxOmQO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:1043:6: error: call to undeclared function 'is_endbr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1043 |         if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
         |             ^
>> kernel/trace/bpf_trace.c:1043:36: error: use of undeclared identifier 'ENDBR_INSN_SIZE'
    1043 |         if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
         |                                           ^
   kernel/trace/bpf_trace.c:1044:16: error: use of undeclared identifier 'ENDBR_INSN_SIZE'
    1044 |                 fentry_ip -= ENDBR_INSN_SIZE;
         |                              ^
   3 errors generated.


vim +/is_endbr +1043 kernel/trace/bpf_trace.c

  1040	
  1041	static inline unsigned long get_entry_ip(unsigned long fentry_ip)
  1042	{
> 1043		if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
  1044			fentry_ip -= ENDBR_INSN_SIZE;
  1045	
  1046		return fentry_ip;
  1047	}
  1048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
