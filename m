Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0720CA8;
	Thu, 10 Aug 2023 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691698101; x=1723234101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bg3xogSxtU/nagQmvH34qkEPpcNfmAXYADW0CtBun5k=;
  b=PydubZobjz1DfLH/9u/UGUK8x0O0ziV3chVWpJ9CudgvUchKVJ09mqlo
   +x9LY2rMRsZHZ9yIAHdcY6ZC2uQSFca4ckGKFws9FpW3cQZfR31ZfLku7
   vkH30tJ0LU7nDT63BqBNW1gcT/sBNBumqGI9dVq+Ih9H87VxJEZxasJcC
   mFeHTQJ2TpO0xoSyNAitHYL3vomgcf6rFxpT4oUAzMWB2uqvMUW2PTKx1
   No7ubs7cevGMko8PcEQAcSvpCVIx1XdWHol8VBboDhP4s94f2rldzEQMf
   3eA5RxzLMjH+wSoo9Yd0ib+0zTtF6f0XUW2TddeTRzrGZ4mZWpAMdRHma
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361649005"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="361649005"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 13:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875868782"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2023 13:08:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUBxC-0007Do-0T;
	Thu, 10 Aug 2023 20:08:18 +0000
Date: Fri, 11 Aug 2023 04:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Krishnanand Prabhu <krishnanand.prabhu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: ld.lld: error: undefined symbol: ptp_clock_register
Message-ID: <202308110447.4QSJHmFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   374a7f47bf401441edff0a64465e61326bf70a82
commit: 1595ecce1cf32688760281f40b58b7a1d4a69aa9 wifi: iwlwifi: mvm: add support for PTP HW clock (PHC)
date:   5 months ago
config: arm64-randconfig-r011-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110447.4QSJHmFH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110447.4QSJHmFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110447.4QSJHmFH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_clock_register
   >>> referenced by ptp.c:99 (drivers/net/wireless/intel/iwlwifi/mvm/ptp.c:99)
   >>>               drivers/net/wireless/intel/iwlwifi/mvm/ptp.o:(iwl_mvm_ptp_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ptp_clock_index
   >>> referenced by ptp.c:106 (drivers/net/wireless/intel/iwlwifi/mvm/ptp.c:106)
   >>>               drivers/net/wireless/intel/iwlwifi/mvm/ptp.o:(iwl_mvm_ptp_init) in archive vmlinux.a
   >>> referenced by ptp.c:120 (drivers/net/wireless/intel/iwlwifi/mvm/ptp.c:120)
   >>>               drivers/net/wireless/intel/iwlwifi/mvm/ptp.o:(iwl_mvm_ptp_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ptp_clock_unregister
   >>> referenced by ptp.c:124 (drivers/net/wireless/intel/iwlwifi/mvm/ptp.c:124)
   >>>               drivers/net/wireless/intel/iwlwifi/mvm/ptp.o:(iwl_mvm_ptp_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
