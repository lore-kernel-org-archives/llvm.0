Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC728FA
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656327404; x=1687863404;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5xUnj2lYgFknTDw5L2qdikCU+ar9cn7RvIwiWEdbsE4=;
  b=ccd4qqsW17F/kupnssGNUoOVvIb1VDK+Wch0RQXLau8EY8zJ2fb4WDUA
   tfSoL/jMZ6Yft3fuxiPhkxcpwth4fIB2+ZzPhsWMFnHtzL2lMZS/h18Fq
   hmWYW2BdT/Nr+Ip2HGRB2s520UR0IkXFV37IAKbT2V/JaebtcNfV/T6b3
   vZGVi3rZpunX4qH/HJU3JzaVYaDSc0CsE5Ldvm1H4l6nH5w8u1L4XzfnC
   WYyAR9xHtwLwe8oy5fglJuAckOZht+Y9F+XRPj0Z1RVNBX105HYsOzwvh
   v0k3sIkMkCCDMFu26LwVe5bdXYLYCqaKbfpjpG0bTY0jBVIOJlvRxRZe1
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="270166640"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="270166640"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 03:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="679534966"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2022 03:56:42 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5mQ6-0008SR-5B;
	Mon, 27 Jun 2022 10:56:42 +0000
Date: Mon, 27 Jun 2022 18:56:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o: warning:
 objtool: csiphy_lanes_enable() falls through to next function
 csiphy_lanes_disable()
Message-ID: <202206271855.WwjemWy7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

Hi Jonathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   03c765b0e3b4cb5063276b086c76f7a612856a9a
commit: 53655d2a0ff295deee5c4b40fe7fc8851bc672e6 media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
date:   5 months ago
config: x86_64-buildonly-randconfig-r001-20220627 (https://download.01.org/0day-ci/archive/20220627/202206271855.WwjemWy7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342e319fd31e41cf5ed16a6140a8ea2de74dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=53655d2a0ff295deee5c4b40fe7fc8851bc672e6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 53655d2a0ff295deee5c4b40fe7fc8851bc672e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o: warning: objtool: csiphy_lanes_enable() falls through to next function csiphy_lanes_disable()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
