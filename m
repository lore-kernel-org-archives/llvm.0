Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AD29B4;
	Thu,  7 Sep 2023 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694101092; x=1725637092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LnWIygINc1UYCSklnDtTMzykbRTqvvfKJuHP3vvGzIg=;
  b=g/Yhsc6wOhniErM6aTFtiXRboTfMghDrQqiId0yBeCYPHmtrLYBsT3Wk
   T5zirkn8CJ0XAx5ny+uddyY73hvX8iCsOYirz6VbBrFiK9LvJ6M4uZZxh
   cSpmmOUM1exbKrB4/l5WXWYylUx/nRy3UZRsuZqnH8l0PpFHfo9B3whmW
   Wl/cG6uFqHY4vAknGU8eQGoH0v5Cu5GV91kB0F2C/dc0/AodSW7GOskLn
   NEtm56X4LaJwg55ZF2vJ5egKvyV+RtVPsYOMWBWrEM8mIumXcM17z+LAq
   WlD4hiarumNpa2gYBNhD9ew21aPiFUi4+BW44ryfta12H/GJE7TY9C3he
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357699247"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357699247"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="691834746"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="691834746"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2023 08:38:08 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeH54-0001Kd-1k;
	Thu, 07 Sep 2023 15:38:06 +0000
Date: Thu, 7 Sep 2023 23:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pfcp 8/8] lib/test_bitmap.c:1338:8: error: macro name
 missing
Message-ID: <202309072308.M6dIWWio-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pfcp
head:   6f8d41d95df8ebab344c5c6ec0e364a30860068f
commit: 6f8d41d95df8ebab344c5c6ec0e364a30860068f [8/8] lib/bitmap: add tests for IP tunnel flags conversion helpers
config: arm64-randconfig-r005-20230907 (https://download.01.org/0day-ci/archive/20230907/202309072308.M6dIWWio-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072308.M6dIWWio-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072308.M6dIWWio-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bitmap.c:1338:8: error: macro name missing
    1338 | #define
         |        ^
   1 error generated.


vim +1338 lib/test_bitmap.c

  1328	
  1329	/*
  1330	 * Due to the previous flags design limitation, setting either
  1331	 * ``IP_TUNNEL_CSUM_BIT`` (on Big Endian) or ``IP_TUNNEL_DONT_FRAGMENT_BIT``
  1332	 * (on Little) also sets VTI/ISATAP bit. In the bitmap implementation, they
  1333	 * correspond to ``BIT(16)``, which is bigger than ``U16_MAX``, but still is
  1334	 * backward-compatible.
  1335	 */
  1336	#ifdef __BIG_ENDIAN
  1337	#define IP_TUNNEL_CONFLICT_BIT	IP_TUNNEL_CSUM_BIT
> 1338	#define
  1339	#else
  1340	#define IP_TUNNEL_CONFLICT_BIT	IP_TUNNEL_DONT_FRAGMENT_BIT
  1341	#endif
  1342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
