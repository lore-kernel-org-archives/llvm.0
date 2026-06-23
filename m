Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB14274652;
	Tue, 23 Jun 2026 03:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782184954; cv=none; b=tAhAJrvHh4Hvis2zjKAaYqM/qewqSazve3TuAVqtJdxAebqR33MwtmRn6mVTKmK/O4njIEeB8xQay3j2EYDjc7HqrKqb4u4MpkB4dOc6ZqFOPonKW32T61UPnG82tar567JKgI+2BuctqPB7O44x9l2K2wuy1teeU5liZvA9cSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782184954; c=relaxed/simple;
	bh=ubjt7ZEza6VZJSsVibNKG1g4DblqmCFH5zNy1tPB2T4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NgJ72wh6igpAU+89h7K0MC+SWhhnv/wQtoBOwZ0kqll3WX44EcN+lEAql00r+4NSJqdTx6PYiRhMj8EfwbkPIDP41I4eOXg8cAvlr3P3AE2g+EHHNyVqZ7Q2c9efW3ClLfhyKeujZIl2ihcMqOHpSnWNQiAltYJH2X2ZdIE74vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JELIS5Pi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JELIS5Pi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782184954; x=1813720954;
  h=date:from:to:cc:subject:message-id;
  bh=ubjt7ZEza6VZJSsVibNKG1g4DblqmCFH5zNy1tPB2T4=;
  b=JELIS5PiMx/utzFEebd9MwgebPcIv1Ydoa0diB9E5o+RJRY35cD90bKo
   M+mlsqAyvHNPDPf1i2FmE7jfTnCkbGQ610pvrApwr+pt6DsvKieOIiubV
   zazxw1xQaNO+NfguGTmF//8XWMlYzN8rp0Rw6AWSGaIFhStNqRxUW4SCn
   bKEY2RnRl1uze6lE2yviBDvFkPGxv9TgI6KSLBOsHe3lXtA2tVS5tytQR
   osK+y4wCd38ce5vKIWt+41IGUZjWgBBNHxNukgxr/oit/xJwdk8O/nekn
   xHudV4k9lEae4ousrJC5WZ7f1xdTLrkInwJReRDGj6kITCYmhuINgV/Dm
   g==;
X-CSE-ConnectionGUID: JxnOLGS+QwW6bAn+oNOjQQ==
X-CSE-MsgGUID: 3sWBbo5UTXmhzPyx9TJVww==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108464854"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="108464854"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 20:22:33 -0700
X-CSE-ConnectionGUID: ZYu/TRA0QnSuG7OTF3FXAw==
X-CSE-MsgGUID: orVAVjq0TYaJyXDqosGQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249527394"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Jun 2026 20:22:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbriX-000000002Cb-1RVh;
	Tue, 23 Jun 2026 03:22:29 +0000
Date: Tue, 23 Jun 2026 11:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 1/36] arch/x86/lib/msr.c:128:2: error:
 call to undeclared function 'rdmsr_on_cpu'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606231113.jm9RyenS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: 9fabca1c1950dd3416833e171d8106ce9c1d6cca [1/36] x86: Cleanup include recursion hell
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260623/202606231113.jm9RyenS-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231113.jm9RyenS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231113.jm9RyenS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/lib/msr.c:128:2: error: call to undeclared function 'rdmsr_on_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     128 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |         ^
>> arch/x86/lib/msr.c:134:2: error: call to undeclared function 'wrmsr_on_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |         wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
         |         ^
   2 errors generated.


vim +/rdmsr_on_cpu +128 arch/x86/lib/msr.c

   124	
   125	#ifndef CONFIG_SMP
   126	void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no, struct msr __percpu *msrs)
   127	{
 > 128		rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
   129	}
   130	EXPORT_SYMBOL(rdmsr_on_cpus);
   131	
   132	void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no, struct msr __percpu *msrs)
   133	{
 > 134		wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
   135	}
   136	EXPORT_SYMBOL(wrmsr_on_cpus);
   137	#endif
   138	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
