Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75713C9D4;
	Fri, 19 Apr 2024 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713558381; cv=none; b=pC/oQ8lYhlrbXH0HBqfqLYLg/75m/OykY6xQJouP8ZdH53gRfGhiGWD+B5QalceAlJR6REo0NvpmXTv87WZRPC1LXE/H1hloddfSG4YkjVW1awCVC/8Z/ZEp9qL2ypdMWniKzb9vvao56AggvtcvFHbMPvNzKqjNlfd6Kd1chl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713558381; c=relaxed/simple;
	bh=hJHiYlh6RgmCtT1SWtYdTDepC+QfgangQ3WVqVBf3GU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSvPHX/Dq8uypgxGmsTCiCZtqiUzWL77Z2MlulbeW+/XoQ4Gmq+uHuJ2MX88rYWB0Y8bPAZj/K384e8FqT+ky8Chu7omrnKiw18SKXqZzPCilnAOMYcF83Klmi1JFdj0fY7vqmRQjLoOBWQiPF6bpQTF+EOO9tS8yMddNn9aR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5+C8KWj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5+C8KWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713558379; x=1745094379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hJHiYlh6RgmCtT1SWtYdTDepC+QfgangQ3WVqVBf3GU=;
  b=h5+C8KWjl3Y3ajx01nDz8FetAjbcUUsVjoV3eTy+U866lZKsJsnVjLiq
   fIZJ9/RVkX8y0r0Ib5KutppZUTno1TtYH9KTqjxXg8LUZ5mkGMqWoqDoN
   8aya+vHtnGO///D6h+Z9GoHn7lnukwD9eGNfjRWnTTetj3szHtfvr+idd
   sDjMHtJiMtJKY64+AEjc1op9LTS5h7TMnThcX15YQoRIw65pHAsifhKcC
   bnKC8kouLL86U7PZfqTRnGS4FbJGJEZApqK1a7JM5TUGvtRLfqKDjQ4Bz
   69Dzvs8J0GJXxUvLgNVa3060Nkg4pLzo736XD9Qa1iwwIqw1YJNcMIHIo
   g==;
X-CSE-ConnectionGUID: pzkhdaApSXWaS+Mj+4hKFQ==
X-CSE-MsgGUID: VKH2dIIHT2STQqJsWtBr/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20318722"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="20318722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 13:26:18 -0700
X-CSE-ConnectionGUID: 0SM63I7GT0yNb52t7BVZyg==
X-CSE-MsgGUID: kKcSAKdOQSyEeozL+jhdRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="28085618"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Apr 2024 13:26:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxuoH-000ARY-2V;
	Fri, 19 Apr 2024 20:26:13 +0000
Date: Sat, 20 Apr 2024 04:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tdx-fixes 23/23] drivers/char/tpm/tpm2-cmd.c:780:6:
 error: expected identifier or '('
Message-ID: <202404200452.shcukBfQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tdx-fixes
head:   c4646a88b2e25d777404d7f29fe093031e75456d
commit: c4646a88b2e25d777404d7f29fe093031e75456d [23/23] x86/tdx: Preserve shared bit on mprotect()
config: i386-buildonly-randconfig-002-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200452.shcukBfQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200452.shcukBfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200452.shcukBfQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-cmd.c:14:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-cmd.c:780:6: error: expected identifier or '('
     780 |         u32 cc_mask;
         |             ^
   arch/x86/include/asm/coco.h:28:17: note: expanded from macro 'cc_mask'
      28 | #define cc_mask 0
         |                 ^
>> drivers/char/tpm/tpm2-cmd.c:783:10: error: expression is not assignable
     783 |         cc_mask = 1 << TPM2_CC_ATTR_VENDOR | GENMASK(15, 0);
         |         ~~~~~~~ ^
   1 warning and 2 errors generated.


vim +780 drivers/char/tpm/tpm2-cmd.c

58472f5cd4f6ff Jarkko Sakkinen 2016-11-10  777  
58472f5cd4f6ff Jarkko Sakkinen 2016-11-10  778  int tpm2_find_cc(struct tpm_chip *chip, u32 cc)
58472f5cd4f6ff Jarkko Sakkinen 2016-11-10  779  {
85b93bbd1c9768 Julien Gomes    2023-02-08 @780  	u32 cc_mask;
58472f5cd4f6ff Jarkko Sakkinen 2016-11-10  781  	int i;
58472f5cd4f6ff Jarkko Sakkinen 2016-11-10  782  
85b93bbd1c9768 Julien Gomes    2023-02-08 @783  	cc_mask = 1 << TPM2_CC_ATTR_VENDOR | GENMASK(15, 0);

:::::: The code at line 780 was first introduced by commit
:::::: 85b93bbd1c9768d09adebbe9f33bab0d4ec94404 tpm: add vendor flag to command code validation

:::::: TO: Julien Gomes <julien@arista.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
