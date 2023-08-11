Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C51A46;
	Fri, 11 Aug 2023 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691753685; x=1723289685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rr3yebx3W+iRHCnt97A7V9khEv8xZn0/pa9wqV05YE=;
  b=iEVDCR2VGzLIs+friqSLzFSbo/XdzUPQ696wS75+q/BMLVbTPpm6fX5d
   sT6IrYwf+5LHPYVbJVxDtrPKBJhvC2cjbhuKBqu256AU60LgVDvgqbUPs
   Fc3hyweukX1VMz9ivMQXL3DB63AUw3KbqYcH5muBirBD85xD4xrTQ1fUN
   ZXsCwAsC+Juek3r9FVFM1wjr/bc0Yg8YjnrOrnTJEtBmZ87U6R3fDHler
   116bKGjzxtHA/hOyqnCf7IuyeYzd/VDBz/9z+zuZ2PmYm48aYHUidV57j
   fx1nc3nVyyGSxnBnpmVarbrsaHP5+hSQx6VOFgIe5qEFaHw53PtMrwkVz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370553192"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="370553192"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="682505543"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="682505543"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 04:34:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUQPg-0007lE-15;
	Fri, 11 Aug 2023 11:34:40 +0000
Date: Fri, 11 Aug 2023 19:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Dooks <ben-linux@fluff.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Cannot find symbol for section 17: .text.setup_profiling_timer.
Message-ID: <202308111956.QRc8XJVr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25aa0bebba72b318e71fe205bfd1236550cc9534
commit: 787dbea11a5d6843999ff71a3fb9aa1ed6d5d889 profile: setup_profiling_timer() is moslty not implemented
date:   1 year ago
config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111956.QRc8XJVr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111956.QRc8XJVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111956.QRc8XJVr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 17: .text.setup_profiling_timer.
   kernel/profile.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
