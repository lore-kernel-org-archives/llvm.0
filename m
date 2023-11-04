Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589711728;
	Sat,  4 Nov 2023 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvYpykR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699091962; x=1730627962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DLZ8ZXyz8sBfD/UPfMI4HuJcoQDCm0tThNoioNwWtOc=;
  b=TvYpykR5bS/T16jq1sK8Kb1Bz1Ubur9GwkqQ360K58lnoSSkMblJs7qC
   +DTWC0Lst3J7f/S4jidjnUxPXzSJ5Lgc2cu1DDFUxoPsg+1pRkh3WsdsD
   oDzJ2GzqUqL1qf/YnXfB0y4wYtgmf/Y9V+XII14xfaN0GnQ0McBC8RGiZ
   pl4Ib2wERiD8fFp8eRWf7Cn9sF/jguiOPbtm9l118WuoWqaSauymtfcSE
   dW0JHoQO1yMkuGR7nXHiwsAKoHuC+gWO5R8KuF9iwp0jIUlkH4yKfAp72
   S9kqsZPX2NoQy/bPJPyl0z12HhUcvxc5WQotSFnck74JlzqH9b7ivOejh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420190984"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="420190984"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 02:59:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905594965"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="905594965"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2023 02:59:18 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzDQy-0003kw-0y;
	Sat, 04 Nov 2023 09:59:16 +0000
Date: Sat, 4 Nov 2023 17:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 3/6] drivers/usb/storage/usual-tables.c:18:10:
 fatal error: 'usb-ids.c' file not found
Message-ID: <202311041756.gPpLdnta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git opal-test
head:   6c5f27462ce89488c748a3a456b9656058396c9d
commit: 739034f7a933dcd8689721e5996b05d78ae6f256 [3/6] usb-storage,uas: use host helper to generate driver info
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20231104/202311041756.gPpLdnta-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041756.gPpLdnta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041756.gPpLdnta-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/storage/usual-tables.c:18:10: fatal error: 'usb-ids.c' file not found
      18 | #include "usb-ids.c"
         |          ^~~~~~~~~~~
   1 error generated.


vim +18 drivers/usb/storage/usual-tables.c

    13	
    14	
    15	/*
    16	 * The table of devices is pre-generated in usb-ids.c
    17	 */
  > 18	#include "usb-ids.c"
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
