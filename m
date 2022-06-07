Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556EE7C
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 07:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654586466; x=1686122466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yu8t4z26qsJ8fD2huo7C0fLOmXT/T0TqYTOz2Lye/5w=;
  b=I5SFRycV26Zc7+geh6odShFxB3GkFGbxO8n51PbD/WZNfVxjYetQAgN2
   6AH3z2vUX0oqOpG6UF0PUSq4BH4i4TveLuxRsTqmMxt40jnUYqpP5pWNS
   vp/U63xMMjgCxNBdjmD1+tx8yhRJCiHuxDbqR+V4aKXRVbCQPil7mSMoX
   T9GSM93EHqcRaXln3t+QUc/xX5Q5oWGs/4H/xjX7NHpwBIGNAMqRaRxEF
   sI/WB3TZad8Y92rPSqnN5knL0Zwc5UnII+SSh/VCpW9iX5IAMRThc0Y+5
   P2W0z/95y9KOdjBMgAhATg3/4ET/NU/ZCHTUGcgYHykrv5gDxoNuJ3Iot
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="259371448"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="259371448"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 00:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="826234951"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2022 00:19:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyTVB-000DT7-Sp;
	Tue, 07 Jun 2022 07:19:45 +0000
Date: Tue, 7 Jun 2022 15:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [djwong-xfs:vectorized-scrub 115/367] fs/xfs/xfs_inode.c:956:1:
 warning: declaration does not declare anything
Message-ID: <202206071526.Y2P1K7gT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   879e09570c469d3320e25aa7f625ded1a2f5c24e
commit: 070c22c92d6f738172c822e7bf509633c37d3d31 [115/367] xfs: track file link count updates during live nlinks fsck
config: hexagon-buildonly-randconfig-r008-20220605 (https://download.01.org/0day-ci/archive/20220607/202206071526.Y2P1K7gT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=070c22c92d6f738172c822e7bf509633c37d3d31
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 070c22c92d6f738172c822e7bf509633c37d3d31
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_inode.c:956:1: warning: declaration does not declare anything [-Wmissing-declarations]
   static XFS_HOOKS_SWITCH_DEFINE(xfs_nlinks_hooks_switch);
   ^~~~~~
   1 warning generated.


vim +956 fs/xfs/xfs_inode.c

   954	
   955	#ifdef CONFIG_XFS_LIVE_HOOKS
 > 956	static XFS_HOOKS_SWITCH_DEFINE(xfs_nlinks_hooks_switch);
   957	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
