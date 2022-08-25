Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D5C2F2D
	for <llvm@lists.linux.dev>; Thu, 25 Aug 2022 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661467976; x=1693003976;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CiWIJAX37cJ/ps1kXOkzQZwmOZRRjF2z/87Db8WNd+s=;
  b=EHV2BCueZA2U+9HpyslDt0oMERL4Gf1q7tkJt1oRzFDvT680YlY0sJbN
   ipSvu5/yuCh4oRyCumtPd3ZQkPINB8u0bgAeIn3PjYyqPAocGX88IHMf/
   rKZl9/+kPtMVq/Mq0Uh4jFDgEJUcBOBGfoPZWl9o4ZB6GiygrDyjoFItr
   XOSjoQ9/Prj8RJZzxDtx86EF8mjM+9b/5B7RrNno/5AGIGQEIr0DAqxEe
   dVDlYKySllmmtcS3hQ5fKbNMeNDGjahqUDJAi2LVngEifIAr1iEeT4jb3
   XjxMWR9I/Bv3gbVquOsyfkP/cD/KeBrNBPKcWemv0vSHFnA7RnxG4SEvx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="358341939"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="358341939"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 15:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="938518278"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2022 15:52:54 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRLiX-00030c-2P;
	Thu, 25 Aug 2022 22:52:53 +0000
Date: Fri, 26 Aug 2022 06:52:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 942/9999] ld.lld: error: net/built-in.a(sctp/socket.o):(.text.fixup+0x150):
 relocation R_ARM_THM_JUMP24 out of range: 16777528 is not in
Message-ID: <202208260648.LJ88iD91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: 372b24bad2a8e7994d0360c870f6e981e3f4bb8f [942/9999] ANDROID: GKI: Add OEM data to mutex/rwsem
config: arm-randconfig-r014-20220824 (https://download.01.org/0day-ci/archive/20220826/202208260648.LJ88iD91-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5653884e34e05ee7aad099cc7f729688d92a002f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/372b24bad2a8e7994d0360c870f6e981e3f4bb8f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout 372b24bad2a8e7994d0360c870f6e981e3f4bb8f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the ammarfaizi2-block/google/android/kernel/common/android13-5.10 HEAD aadf7ad9db2f7d93ecfb34d0e4f328519460c94e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: net/built-in.a(sctp/socket.o):(.text.fixup+0x150): relocation R_ARM_THM_JUMP24 out of range: 16777528 is not in [-16777216, 16777215]
   >>> referenced by socket.c

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
