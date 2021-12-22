Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967D2CA0
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 00:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640131702; x=1671667702;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1sxNC+xHww683zGiRSuwRHNAW0GCXTCz6BDX61qQxVM=;
  b=LbYkB2qiS4gi0E33QRv4PADlq5zt6Qv3OKFOw8HSzVM3an1by4PTesvT
   z2c+Gx97pJe69VutgucmmJCJNTGfhOq4AsVR5dTTI66Pr9xv+fPk8ApPI
   UDjeFJnmrb69He3qdntit0HQSbDayGwXkTmvWQ54IF5UYl58VWJNHDGwB
   BjxlSi+v6me5zfzq5cVo3NFTDLMDU2xA9mDUUsxh1BX/0vQSt/GqBcq0g
   8fnNMCUv1JV9kmL8jtn5+mzZTYc7NrH6ee8d4qD7SgATWC5ZpHxFUBNIc
   EOVuR2aiIUVWiPLQjGooeqUnLsr4HNC7Jj6n08H5wKiPV69ESbg/DPGoN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227809713"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="227809713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 16:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="508274833"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Dec 2021 16:08:21 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzpB6-0009gE-F2; Wed, 22 Dec 2021 00:08:20 +0000
Date: Wed, 22 Dec 2021 08:07:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 274/8895]
 drivers/gpu/drm/i915/display/intel_dp.o: warning: objtool:
 intel_dp_max_lane_count()+0x5e: unreachable instruction
Message-ID: <202112220852.K3nf0jRa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Imre Deak <imre.deak@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2850c2311ef4bf30ae8dd8927f0f66b026ff08fb
commit: bedcaddadd22da82fc2590569ff81a31045176b1 [274/8895] drm/i915/dp: Ensure sink/link max lane count values are always valid
config: x86_64-randconfig-r026-20211220 (https://download.01.org/0day-ci/archive/20211222/202112220852.K3nf0jRa-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bedcaddadd22da82fc2590569ff81a31045176b1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bedcaddadd22da82fc2590569ff81a31045176b1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/ fs// mm//

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.o: warning: objtool: intel_dp_max_lane_count()+0x5e: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
