Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F611363
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 00:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649723467; x=1681259467;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XLjLObLLIagsTVgZ1lb3KzDwD6P8L3uhRDg8giAi+v8=;
  b=OegP+wnvMNwwwpDH9No68op7/X3kbhSfeTjZmRgSclzK2tg6V2Oi+WfC
   eLyTKPObrp90aQ4msJxtrZOT5ghDtSVgshFI3sN90L/prnL8ahD1IiHPC
   LF8RrgIPLsTs49zZZcvNFoCs4AiKXU8Klc5d/cpwPS1s/hJzBwShYsMWK
   7iJRbyPcxW/6ibb+8g2OpHZw+h0kbZKovPlZJ5yrzH275yBwwi7jOpAjq
   jihQanfjyY9RygKOEwFBpzbR7l/4SV37omHbPg3gYmNXebBeyY5376Jrx
   4K5imlDx3eKAzHoyKB8CExGJfpYqGXB86WV4Ri/uI17vw+KzGu3FQTi30
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322690315"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="322690315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 17:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="854136181"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2022 17:31:06 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne4Qz-0002Mh-Hj;
	Tue, 12 Apr 2022 00:31:05 +0000
Date: Tue, 12 Apr 2022 08:30:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: drivers/iio/imu/bmi160/bmi160_core.prelink.o: warning: objtool:
 bmi160_setup_irq() falls through to next function
 bmi160_data_rdy_trigger_set_state()
Message-ID: <202204120846.Su7b6mEO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: d31ed5d767c0452b4f49846d80a0bfeafa3a4ded kbuild: Fixup the IBT kbuild changes
date:   3 weeks ago
config: x86_64-randconfig-a006-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120846.Su7b6mEO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d31ed5d767c0452b4f49846d80a0bfeafa3a4ded
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d31ed5d767c0452b4f49846d80a0bfeafa3a4ded
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/imu/bmi160/bmi160_core.prelink.o: warning: objtool: bmi160_setup_irq() falls through to next function bmi160_data_rdy_trigger_set_state()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
