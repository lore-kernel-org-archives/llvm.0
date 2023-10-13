Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3714A90;
	Fri, 13 Oct 2023 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTFu2oIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697201898; x=1728737898;
  h=date:from:cc:subject:message-id:mime-version;
  bh=D7wUDKUDIy2B4ZGCW26mPlGFE5VHnUCGaW4QKD2I7ok=;
  b=DTFu2oIU1P2WziVVnfubvBrviHf72KmBH3fdRcPETo4OJWK9liNmLszB
   TUFwD+MtxVGUQrhUi9M9f9DwABJWGJgXevNlvNhkWgDC/7D3fD2bi5UKo
   Fltc75GVblWhiRSco0BNM8pU8N5YX9ddezfEV2GPdf3+58WjPBtu2lWLB
   jKlMZvhGBSf5GYxaRHkml7LwbZxCSBFzR4a/Bb0CNXKMXAECumBWkEszO
   y7Fm8os/WZCi7u2h5ILeIV0Y1Nf4FCrdzZ8+eOqsgjSgIwt9dzboF+4GX
   YinS2mgsL5+ylDZQhILyGf1efLj1HVWmpu/x75lLKtR/TR30E9wdG6Hkf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370239420"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370239420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784149957"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="784149957"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2023 05:58:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrHk3-0004mn-2t;
	Fri, 13 Oct 2023 12:58:11 +0000
Date: Fri, 13 Oct 2023 20:58:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_lookup_name: .text+0x7c): relocation R_RISCV_PCREL_HI20 out of
 range: -524527 is not in [-524288, 524287]; references
 kallsyms_seqs_of_names
Message-ID: <202310132047.Z9Z33LIa-lkp@intel.com>
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
commit: 60443c88f3a89fd303a9e8c0e84895910675c316 kallsyms: Improve the performance of kallsyms_lookup_name()
date:   11 months ago
config: riscv-randconfig-r021-20230908 (https://download.01.org/0day-ci/archive/20231013/202310132047.Z9Z33LIa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132047.Z9Z33LIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132047.Z9Z33LIa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_name: .text+0x7c): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
