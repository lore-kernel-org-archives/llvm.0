Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA751E1D2;
	Thu, 10 Aug 2023 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691683216; x=1723219216;
  h=date:from:cc:subject:message-id:mime-version;
  bh=k/MPJp1u9TphAcYX0hucr/4Bs5tpP3S2KWUOObFclVU=;
  b=f4db0kbQLYygEZ68ZzV6kObmEGGvHGTIOS3AcGaP+4fEu1J08L/z/iR7
   XgdHO+M+hBlYN3yeNcbAFm06ymluaCRTjNUBFncFFXdPTLni4JvqxyBxL
   rtZ5Wa8kB/9DxCelELtszhl89WchNQnk35Ldl1GrJvjVgQaDWPV0YvPUg
   4sS34E2fS/trmUAuLDoay4mMl/0Ohdvj0lSbDWCQAsUnGPJL8c8pOjLZD
   9oUJEjgrSdRjvqKz9w1UpC8/pDD5ab6pIElXfSsaQ9J08QfrzE33DwCtl
   +LFjNqjEkauI2ozeV18fyn9towqo4YOwE8AB4GUQgQ7PcnZiOhDRYSmwg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351761385"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="351761385"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 09:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="732316459"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="732316459"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Aug 2023 09:00:13 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU856-00075s-2m;
	Thu, 10 Aug 2023 16:00:12 +0000
Date: Fri, 11 Aug 2023 00:00:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:x86/misc 3/3] ld.lld: error:
 vmlinux.a(crypto/sm3_generic.o):(function sm3_base_init: .text+0x8):
 relocation R_RISCV_HI20 out of range: 531264 is not in [-524288, 524287];
 references '.LCPI2_0'
Message-ID: <202308102305.SCqhsrps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Avadhut Naik <Avadhut.Naik@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/misc
head:   c4d07c371283cb0453c8ce187551e4d064cc407e
commit: c4d07c371283cb0453c8ce187551e4d064cc407e [3/3] EDAC/amd64: Add support for AMD family 1Ah models 00h-1Fh and 40h-4Fh
config: riscv-randconfig-r024-20230810 (https://download.01.org/0day-ci/archive/20230810/202308102305.SCqhsrps-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308102305.SCqhsrps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308102305.SCqhsrps-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(crypto/sm3_generic.o):(function sm3_base_init: .text+0x8): relocation R_RISCV_HI20 out of range: 531264 is not in [-524288, 524287]; references '.LCPI2_0'
   >>> referenced by sm3_base.h:0 (include/crypto/sm3_base.h:0)
   >>> defined in vmlinux.a(crypto/sm3_generic.o)
--
>> ld.lld: error: vmlinux.a(crypto/sm3_generic.o):(function sm3_base_init: .text+0x20): relocation R_RISCV_HI20 out of range: 531264 is not in [-524288, 524287]; references '.LCPI2_3'
   >>> referenced by sm3_base.h:0 (include/crypto/sm3_base.h:0)
   >>> defined in vmlinux.a(crypto/sm3_generic.o)
--
>> ld.lld: error: vmlinux.a(crypto/sm3_generic.o):(function sm3_base_init: .text+0x10): relocation R_RISCV_HI20 out of range: 531264 is not in [-524288, 524287]; references '.LCPI2_1'
   >>> referenced by sm3_base.h:0 (include/crypto/sm3_base.h:0)
   >>> defined in vmlinux.a(crypto/sm3_generic.o)
--
>> ld.lld: error: vmlinux.a(crypto/sm3_generic.o):(function sm3_base_init: .text+0x18): relocation R_RISCV_HI20 out of range: 531264 is not in [-524288, 524287]; references '.LCPI2_2'
   >>> referenced by sm3_base.h:0 (include/crypto/sm3_base.h:0)
   >>> defined in vmlinux.a(crypto/sm3_generic.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
