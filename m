Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FC3137F
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648837716; x=1680373716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCXhvLj/rZeuTgz+OK7rFnFpMayJa+RLG2mvzZ6RhRo=;
  b=YL3AxC9ucgELFJk/gAeZ7lRHKrFKq+34xzYMwG189prL2jR2UzFG/1B+
   jzbvL96UstA1tNenowJzP8rBDPiU6UNzGZUzqfErdHKgH9cSHUkOUzkOE
   heUdmmZo55Q1mq9Cm7VhLGORX2zOl5WvZrx9VypdLWqHynBqU5fbLv1La
   yYviJy0wPosfUBfRQIyRCcv7iXTJtQ4c+WBB1A5Bjj6wjOq2ROWKfyYxC
   ofu1jCLkHhN1WBM5K9lVj/07qrqcW37GSoOFxFqxHpdiqyEFsfJ47SIZn
   pAV+buiRdoQOKUwI8E6xWWw9oi3NOEbKTTOz3UPkzzl9b5Zyo/DXLtehE
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="260385201"
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="260385201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 11:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="655924746"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Apr 2022 11:28:33 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1naM0e-0001SW-Vl;
	Fri, 01 Apr 2022 18:28:32 +0000
Date: Sat, 2 Apr 2022 02:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 14920/15002] ld.lld: error: undefined symbol:
 arch_stack_walk_shadow
Message-ID: <202204020202.BdSj29hd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
commit: e63b15ad51960e4e7970612849391859be30d63f [14920/15002] arm64: implement stack_trace_save_shadow
config: arm64-randconfig-r025-20220331 (https://download.01.org/0day-ci/archive/20220402/202204020202.BdSj29hd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project cc2e2b80a1f36a28fa7c96c38c2674b10868f09f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e63b15ad51960e4e7970612849391859be30d63f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e63b15ad51960e4e7970612849391859be30d63f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_stack_walk_shadow
   >>> referenced by stacktrace.c:257 (kernel/stacktrace.c:257)
   >>>               stacktrace.o:(stack_trace_save_shadow) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
