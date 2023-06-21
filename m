Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAEDC8E2;
	Wed, 21 Jun 2023 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687340706; x=1718876706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0KnqTDNj3EkXmgS8QfrgW5loyaa3u6mZyf4tFEoQsIE=;
  b=CVvp7+41AGPVnF15fMVpM9GDC8Y4U1uGR8EkXYAvXcwFropJJI2KmxvN
   xqMarkRMoJyTVlhAzSCYtDylZWDakQ9ay/LbMDI6rvPOXVHi/RZ7Qo/k8
   ifreMms+OQWtE4MVA3a/gxHyk1UWsK3rjobZM1Zjv8KduaUzE9U7a1YYE
   gl9bMblf69s1U71Vl1NsRzBmIZGeyDjAmZTNHCDhs8OP/uSZR1WQkbsO0
   D6jlRaNQSOYEOVMFrJbF968oOIL/3CszryKPu3rFv7IPweO8NnQMAvC/U
   YM48lHqHD80Rm2yTnX/ZdPM6fGXTZoHeEcjRMhlGbYDz3/47bvVVsha83
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="344859637"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="344859637"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 02:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="827373369"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="827373369"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2023 02:45:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBuOd-0006kV-1u;
	Wed, 21 Jun 2023 09:45:03 +0000
Date: Wed, 21 Jun 2023 17:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9707/11436] lcs.c:undefined reference to
 `fddi_type_trans'
Message-ID: <202306211734.nx6uUSBS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e71592dbae49a674429c618a10401d7f992ac3
commit: 1282723361209d06fb1466ffb90e63b1161320b6 [9707/11436] s390/net: lcs: use IS_ENABLED() for kconfig detection
config: s390-randconfig-r036-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211734.nx6uUSBS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211734.nx6uUSBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211734.nx6uUSBS-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/net/ethernet/sfc/ef100_netdev.o: in function `ef100_netdev_event':
   ef100_netdev.c:(.text+0x134): undefined reference to `efx_tc_netdev_event'
   s390x-linux-ld: drivers/net/ethernet/sfc/ef100_netdev.o: in function `ef100_netevent_event':
   ef100_netdev.c:(.text+0x89a): undefined reference to `efx_tc_netevent_event'
   s390x-linux-ld: drivers/s390/net/lcs.o: in function `lcs_new_device':
>> lcs.c:(.text+0xe26): undefined reference to `fddi_type_trans'
>> s390x-linux-ld: lcs.c:(.text+0xe36): undefined reference to `alloc_fddidev'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
