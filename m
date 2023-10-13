Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2BB63A3;
	Fri, 13 Oct 2023 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akKZkq5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697186819; x=1728722819;
  h=date:from:cc:subject:message-id:mime-version;
  bh=D4ijqgRJN/pJXqalMxLYfsJ1HL6pCOn2KSxIzvuBoqU=;
  b=akKZkq5QkpCfG3loPWrn0iteoc0MZn4j2cv8cLrLHA1hkx+ktBbY7lC2
   F5i8FFIB9HKYH7pEcQZdRNAAxtq+QEHei5nGM5rswTzdrAQOoAs4KZqx9
   YqctrK8j9lhJ9YSFaVdDN89m+XNKJMBxDzVkpcO7R2kY8AHMOUDoKxQbf
   /EQwevWJ/8tgCid4WVmMylxotvFLzUxCuV+v79EJFWutuELZ0gn7Wmnpj
   5g8NlfpICcp7VYoaUhHZhusV5MzwUwm21m9O0+OTfyw/HUK8rptREdL0b
   C4fyTCPnyPCbc+6RIeEhTBAwWwJqO9blQ9zMGVddzI+mI8BT8hzX/P859
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387985629"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="387985629"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928335352"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="928335352"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 01:46:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDot-0004X3-2w;
	Fri, 13 Oct 2023 08:46:55 +0000
Date: Fri, 13 Oct 2023 16:46:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_lookup_names: .text+0x184): relocation R_RISCV_PCREL_HI20 out of
 range: -524527 is not in [-524288, 524287]; references kallsyms_markers
Message-ID: <202310131607.rtQjTs9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

Hi Zhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   10a6e5feccb877c3c75ad11d27942ad52c24815f
commit: 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998 kallsyms: Add helper kallsyms_on_each_match_symbol()
date:   11 months ago
config: riscv-randconfig-r021-20230908 (https://download.01.org/0day-ci/archive/20231013/202310131607.rtQjTs9m-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131607.rtQjTs9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131607.rtQjTs9m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x184): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x18c): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x194): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x19c): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
