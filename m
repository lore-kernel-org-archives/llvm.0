Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611237F
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653670246; x=1685206246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpWiG3NiBbmtu2hD6PE0bR9/x5uj6GZCYEk7d1gVS50=;
  b=cdywtrIn6tU/1dFq9rse9BACf3C1iATzC8xtFVh44pusPglIPASgj1rW
   lGpnHaV0mVrmHY7+hzoGWHO02LB8EoGX8iMAKtc8jwsROmSMP83gFYbbc
   RalFfnCRWCw35bzudeG3jolJXXHuKk+NBbOPB86Tm95ZdwzKgjoms1QO/
   SR253mIhMpSMrBN1pVeP4o9k7qnhD90ynqgh5IY7KZRYnKSwLFdzo1Xo8
   94BDm/tgf6WcDQHeRRx6sJukExnt/zJpupO9EZxtiek+mQVlicNMARrLA
   1n8nHjwUA9CU3+p/Eg/reuGU1gyhODymZb3t816Dgxgj3ofl6Qq0+L7uz
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="272096860"
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="272096860"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 09:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="643467034"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 May 2022 09:50:43 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nudAh-0004wJ-83;
	Fri, 27 May 2022 16:50:43 +0000
Date: Sat, 28 May 2022 00:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.10.y 2383/5950] ld.lld: error: assignment
 to symbol __pecoff_data_size does not converge
Message-ID: <202205280026.wqsKvLJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   d318333bd3dbc483b4d566521dc6486ef9f6ba04
commit: e3509feb46fa15680a9c8afbcb760e962349c1e2 [2383/5950] tls: fix replacing proto_ops
config: arm64-randconfig-r023-20220527 (https://download.01.org/0day-ci/archive/20220528/202205280026.wqsKvLJI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=e3509feb46fa15680a9c8afbcb760e962349c1e2
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout e3509feb46fa15680a9c8afbcb760e962349c1e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __pecoff_data_size does not converge

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
