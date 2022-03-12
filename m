Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF344296
	for <llvm@lists.linux.dev>; Sat, 12 Mar 2022 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647091711; x=1678627711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lN2zXVmtYoxNKXB19+1YdjQmuTD84Gfz+wwuT706X30=;
  b=jnk/NubPRkfIAohpYv7U7ZkavIZxbXcGe73d/RBECKmNWtLsO5cglGin
   +FNyxwjxlm2E7L4E9xWI0w+K1SwduGeR4AJdfdkQCNkpHyXubyaUO2b4+
   9+tC9qRyiUztehcuk5kJARbrhcaRTlq3cL5cWBTnj8pxbLuxeoVW+hLtz
   HWLa69jVQSpAPgKkFK6JIVjKNlasExULKYpLhoQRl0HrPJTioOXTDt4DM
   O5L9omRmuPulRowWeHSDFvqtbX1dbBmzlLV4lRfD8/EIBqp+beJA6B6V7
   bHk7p27cwyJMWCfCf+eHq6PCqB6UuWrk+WO89wRmiJ8H1Awdiqj+IAvrb
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="280541467"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="280541467"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2022 05:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="597413002"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2022 05:28:29 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nT1nI-0007u3-Oo; Sat, 12 Mar 2022 13:28:28 +0000
Date: Sat, 12 Mar 2022 21:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Youghandhar Chintala <youghand@codeaurora.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [ammarfaizi2-block:netdev/net-next/master 41/77] ERROR: modpost:
 "ieee80211_sta_restart" [net/mac80211/mac80211.ko] undefined!
Message-ID: <202203122147.Q0VtHIf0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block netdev/net-next/master
head:   625788b5844511cf4c30cffa7fa0bc3a69cebc82
commit: 7d352ccf1e9935b5222ca84e8baeb07a0c8f94b9 [41/77] mac80211: Add support to trigger sta disconnect on hardware restart
config: mips-malta_defconfig (https://download.01.org/0day-ci/archive/20220312/202203122147.Q0VtHIf0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 43f668b98e8d87290fc6bbf5ed13c3ab542e3497)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/7d352ccf1e9935b5222ca84e8baeb07a0c8f94b9
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block netdev/net-next/master
        git checkout 7d352ccf1e9935b5222ca84e8baeb07a0c8f94b9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ieee80211_sta_restart" [net/mac80211/mac80211.ko] undefined!

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
