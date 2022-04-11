Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9E1FB0
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 23:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649718503; x=1681254503;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1/HOpnwzr/gICYSHqpHt9mcqZoNv0xjvU2F5mjzTvrU=;
  b=mGwC3vei8Vp07lXGoVQ4Qt9lCSgUjWWUpu4bz4DK+felpnt/w2PLV2ns
   mbVK0PYkobnWZ7GBdHtYH5zi8C/Sk6XsA4+bFmftPNOt4g2cF9ql9q70x
   yvbs3vo10W3RH9b3tUT262u0Xs6VcBwqyNNlKt5TWzvzjOcujyDQUTaO7
   EUtuFRMhq0OqUsXhD5AE7kScMIjJjFR3Vmk85L7wtH3P8abmD2Amk2llY
   CHpDbVkJDYbeT1HGa8hXkHk8LZRgi7LakOVWvW5yeWpQVuD+YO3jLh4Gc
   87axxkHpgwSvKzDzb88S3qpL6smx62bFfq4XcICvevAgesnGYsSnsGcC0
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261673511"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="261673511"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 16:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="623020266"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2022 16:08:21 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne38v-0002IW-64;
	Mon, 11 Apr 2022 23:08:21 +0000
Date: Tue, 12 Apr 2022 07:08:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.ibt.ud1 5/5] arch/x86/events/rapl.prelink.o:
 warning: objtool: displacement doesn't fit
Message-ID: <202204120754.VTvizamH-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt.ud1
head:   43d23a873ca41474dcbb490763d1b6b313eaaa52
commit: 43d23a873ca41474dcbb490763d1b6b313eaaa52 [5/5] x86/ibt: Use UD1 poison
config: x86_64-randconfig-r005-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120754.VTvizamH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=43d23a873ca41474dcbb490763d1b6b313eaaa52
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt.ud1
        git checkout 43d23a873ca41474dcbb490763d1b6b313eaaa52
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/events/rapl.prelink.o: warning: objtool: displacement doesn't fit
>> arch/x86/events/rapl.prelink.o: warning: objtool: rapl_pmu_event_del()+0x10: Direct IMM jump to ENDBR; cannot fix

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
