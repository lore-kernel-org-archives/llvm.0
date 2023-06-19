Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B811C8B;
	Mon, 19 Jun 2023 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687183494; x=1718719494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8uXsforMl0XmVyX4A+J/yhtIhNXcSqm5wuH/WP1qXk=;
  b=KEmlF1u+kOfRxqifSDMDrhvojyjByp1AqJC2cdSo9WcKb+VudCRPFhBC
   mTtUdW96GXXGK5Q36QPo+q0WQU4Z47ZdWyszntLqFrkv3U2tk5G+rjLAz
   bsk0SBb8pkKpkaWbiqubB2pDTULIu4UD0HU0A4SnYjHmP7gr5jcE0sXg1
   mtVQUV/zRShsrruvxXaB1uZmBTRwZii17Fngi+SNAgfnOBA+SNNs0rxsU
   11RD3b/S7andfLUJM7ZQlgySzHcEds0K8l1ua+FgdHylqmpEuGtrbkmTp
   5obwlYK/fPjUwgAWbitxQZM6zEApPntQ/E7+UVpyC3dCox8HtLTzKZpyJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="357125352"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="357125352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 07:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="743471583"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="743471583"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jun 2023 07:04:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBFUc-0004lO-1c;
	Mon, 19 Jun 2023 14:04:30 +0000
Date: Mon, 19 Jun 2023 22:03:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [stable:linux-6.3.y 1775/1937] ld.lld: error: section: .got is not
 contiguous with other relro sections
Message-ID: <202306192231.DJmWr6BX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.3.y
head:   f2427f9a3730e9a1a11b69f6b767f7f2fad87523
commit: e6d1562dd4e9cf8da89edd21c4453893bfe0d4ac [1775/1937] riscv: vmlinux.lds.S: Explicitly handle '.got' section
config: riscv-randconfig-r023-20230619 (https://download.01.org/0day-ci/archive/20230619/202306192231.DJmWr6BX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306192231.DJmWr6BX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306192231.DJmWr6BX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: section: .got is not contiguous with other relro sections

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
