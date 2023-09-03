Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12307F;
	Sun,  3 Sep 2023 02:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693708782; x=1725244782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWNrfbmSyetGOGOCGAak89UpOo8RCW54E69hKorpA48=;
  b=E1nc6rGW1yzJtimzkW+Vic46IBq5HgfzPsUpexwqb/Wt3MpwhUvqtFtK
   C7tzB6xSDUf1+fgyPxkZ6ohMKB+gInwArsD5lAkVvs4SC/c6CRbm2CEF/
   0YPoE0DUb3qvmCGmrQcifRjh4yEtUOHvQ078MM+mt82AyQmNoQy5AAqCG
   9z24b6tJ+wtt0cUdx+8SScRkYdBfaIbNoohRfjYtKZ2QlnOaTyIDBUOAe
   h1kvuc6YhHtEkczv9fFugjrE8moHX3m4fgg0KR8VXu2gC30HeHeZNtElx
   P+aedlQNOqGyFs5r3VqWnj6UVG7vnAMyamj4It6G3BKGQrlQZ2uSUqCLd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="442819271"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="442819271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 19:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="733936999"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="733936999"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Sep 2023 19:39:39 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcd1V-0002oh-0V;
	Sun, 03 Sep 2023 02:39:37 +0000
Date: Sun, 3 Sep 2023 10:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Thompson <davthompson@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Shravan Kumar Ramani <shravankr@nvidia.com>
Subject: ld.lld: error: undefined symbol: sysfs_format_mac
Message-ID: <202309031058.JvwNDBKt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92901222f83d988617aee37680cb29e1a743b5e4
commit: 7e38a7422f128e7d7ba24b444e957d585dbb272f mlxbf-bootctl: Support sysfs entries for MFG fields
date:   10 days ago
config: arm64-randconfig-r024-20230902 (https://download.01.org/0day-ci/archive/20230903/202309031058.JvwNDBKt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031058.JvwNDBKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031058.JvwNDBKt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sysfs_format_mac
   >>> referenced by xarray.c
   >>>               vmlinux.o:(oob_mac_show)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
