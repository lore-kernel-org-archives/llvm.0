Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3E523BD
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 03:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649819071; x=1681355071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dK7udxG6bgxJt7xKd4ClWjZpEriOEAWgaIkIvydR0Sg=;
  b=jkA38qdnXH/JQuFVMKYrQq1z+A7u6QxrrspETb36upskaxHr8JAFfKuA
   UDolTk+0JR2OtAgtaqgs2MPLU/kKZBbUQsuZ8xAviMz+wAiH9SM+jqpI4
   iUpyPRocvqRRpuEaujUXaWzBjZNVJ4/J4BMbOeMKrIHByrBI+huGnnFfw
   VoP59fkOZlZj65gJ1iNJ1YJGVrCze39RJSNQHDj+x1QXwOH9CWC5vx//0
   i5FL1KuTe67f6fkZLkCBZcUWccbNXaHgULGAGpeKMFeh15q58spkTze7f
   RG9c3XM4gqGvXTxpQPxy1Qi7yT7pG7Dyb8znxh0PUrBgxtjlQ+HZdltA4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261405502"
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; 
   d="scan'208";a="261405502"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 20:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; 
   d="scan'208";a="700081100"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2022 20:04:29 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neTIz-0003OI-6u;
	Wed, 13 Apr 2022 03:04:29 +0000
Date: Wed, 13 Apr 2022 11:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mark:stacktrace/testing 1/1] ERROR: modpost:
 "kallsyms_lookup_size_offset" [lib/test_stacktrace/test_stacktrace.ko]
 undefined!
Message-ID: <202204131029.GIdIxZ9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/testing
head:   a8e8825116626f8c3e8be3bb889b6442a7465cb8
commit: a8e8825116626f8c3e8be3bb889b6442a7465cb8 [1/1] WIP: stacktrace tests
config: hexagon-randconfig-r041-20220412 (https://download.01.org/0day-ci/archive/20220413/202204131029.GIdIxZ9E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=a8e8825116626f8c3e8be3bb889b6442a7465cb8
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/testing
        git checkout a8e8825116626f8c3e8be3bb889b6442a7465cb8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kallsyms_lookup_size_offset" [lib/test_stacktrace/test_stacktrace.ko] undefined!
--
>> lib/test_stacktrace/kunit.c:54:5: warning: no previous prototype for function 'st_find_func_idx' [-Wmissing-prototypes]
   int st_find_func_idx(struct st_data *st, void *func, int start)
       ^
   lib/test_stacktrace/kunit.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int st_find_func_idx(struct st_data *st, void *func, int start)
   ^
   static 
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
