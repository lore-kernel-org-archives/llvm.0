Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C4A36C
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 04:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652502083; x=1684038083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=foeZf0AUzYAEV4pRcRQiybWTbSdzFEZUJrOd+rIC80M=;
  b=GPwz168O78KF15OdDMqLQjJtUkP492kKaKuRXng/UpuXY7UbCJNPynbc
   JeycMNIasn8qCg3vBY9A9ghTkecWg4Ua9paW/ti6RAfImghBeDO8WXART
   nP4QHLh5HGDu0enUsyneDUaWlYd6pBieA/MZqLDIKsvL3+RCB+ee+6puV
   20NaIvBFMfrQ4cC8lun0uj4EePGu5je41K6JTFnh7cKs2gdh0LYonPWnB
   azbOAjaS9FTcb4m1HaGohHKV3bl39ZeI1tNEB3XbxsfIKU7BqbanXRGpQ
   GI7+8l0oonAuFjShLZ9gny9pTQvj6K6WwcFSOpJFFAaab06aex0Qd01UX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270402251"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="270402251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 21:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="896492815"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2022 21:21:18 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npjHJ-0000CL-Br;
	Sat, 14 May 2022 04:21:17 +0000
Date: Sat, 14 May 2022 12:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
	Max Staudt <max@enpas.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [PATCH v2 1/2] can: skb:: move can_dropped_invalid_skb and
 can_skb_headroom_valid to skb.c
Message-ID: <202205141221.H0aZXRak-lkp@intel.com>
References: <20220513153606.302464-2-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513153606.302464-2-mailhol.vincent@wanadoo.fr>

Hi Vincent,

I love your patch! Yet something to improve:

[auto build test ERROR on mkl-can-next/testing]
[also build test ERROR on v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/can-skb-move-can_dropped_invalid_skb-and-can_skb_headroom_valid-to-skb-c/20220514-003707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
config: arm-randconfig-r021-20220512 (https://download.01.org/0day-ci/archive/20220514/202205141221.H0aZXRak-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/8f56e6b1b9945ea47c9f410d1254451df9d6fe22
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Mailhol/can-skb-move-can_dropped_invalid_skb-and-can_skb_headroom_valid-to-skb-c/20220514-003707
        git checkout 8f56e6b1b9945ea47c9f410d1254451df9d6fe22
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
>> ld.lld: error: undefined symbol: can_dropped_invalid_skb
   >>> referenced by vxcan.c:45 (drivers/net/can/vxcan.c:45)
   >>>               net/can/vxcan.o:(vxcan_xmit) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
