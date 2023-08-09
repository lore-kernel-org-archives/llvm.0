Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE491B7EA;
	Wed,  9 Aug 2023 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691567067; x=1723103067;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tctWKCpq59L9BOs5P7jDXh4fWnrBE27aAbNNVRN38gk=;
  b=djZWdYyGEuN+ZCQX4s7ADAFWvESkCp9ambfg0xL82ixVlM0Ef6zkVCyk
   LwcsepmXNL5DNdJ6a5PL4NlZVebK+Ip1OepbSMpUG5VZO0okeFmvQfCnt
   7DG9g4B6K4NbxiJVihYMx5Bu5wTFdqdv+ibM2FHJEk2T5B9ey6Unl7U2J
   cDysL3oN9xp+GHVM/lLu7/XBy6QM4W/x1J1edJcflAVMlw+teEMDYC/Uw
   PLppqFNh1fQgXzEeW/Sp2ydM8Uc6Db1+qgcXSCs6Ii6WXEzRG3Wf71lvP
   XSPlOAchfASZRMl/qPkyFbHZk1y6oUj5KhTw9MzJreSZsYOBUpzy4OGW4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373833794"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="373833794"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 00:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855423534"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="855423534"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Aug 2023 00:44:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTdrl-0005vY-27;
	Wed, 09 Aug 2023 07:44:25 +0000
Date: Wed, 9 Aug 2023 15:44:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH net v2 06/17] selftests: forwarding: Add a helper to skip
 test when using veth pairs
Message-ID: <202308091512.SuOL2n62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230808141503.4060661-7-idosch@nvidia.com>
References: <20230808141503.4060661-7-idosch@nvidia.com>
TO: Ido Schimmel <idosch@nvidia.com>

Hi Ido,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ido-Schimmel/selftests-forwarding-Skip-test-when-no-interfaces-are-specified/20230809-000303
base:   net/main
patch link:    https://lore.kernel.org/r/20230808141503.4060661-7-idosch%40nvidia.com
patch subject: [PATCH net v2 06/17] selftests: forwarding: Add a helper to skip test when using veth pairs
config: riscv-randconfig-r031-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091512.SuOL2n62-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091512.SuOL2n62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091512.SuOL2n62-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x4c0): relocation R_RISCV_HI20 out of range: 527723 is not in [-524288, 524287]; references 'trace_initcall_start.______f'
   >>> referenced by rcupdate.h:777 (include/linux/rcupdate.h:777)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x518): relocation R_RISCV_HI20 out of range: 527723 is not in [-524288, 524287]; references 'trace_initcall_start.______f.82'
   >>> referenced by rcupdate.h:777 (include/linux/rcupdate.h:777)
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
