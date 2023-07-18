Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28437EA;
	Tue, 18 Jul 2023 00:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689639484; x=1721175484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fwjDA/RN+Yu5t00ahAHrN2Q+MuWTDPP0dJo5S1sEpY=;
  b=GSU/aZzm3ILGQu+cG5eBKTdCCREDkoIdl6c1bsQHV/wj3EsYfw74FLMX
   MWy1mVavhTageT0/q+myTvjh6dw7i69o0tfJGL3VdD5WDhoPEHAIkkdgt
   ppdcG/HsxZh9imBVcbmrAhqBVOQ8D+pC0LJ9em6H6RFveQtNpPQtGQVn+
   41bmlLyGXi3JhTNUE2F4e2h4D2fHkM9QISO4qBoY3yGSwaWo5pz6uxKQ/
   NvaGm/tBOwChIcuYYQVBwIyWBp2UKtHSNUPV0Qej6hqeQ/XaLyfLs3OMV
   5WGQy7dl5ctanTXXs1BSpMUF0hIdkVIJbmyMW6HefHTe5hZlElyx12aLc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363534977"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="363534977"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 17:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673711627"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673711627"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2023 17:17:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLYOu-000A0m-2d;
	Tue, 18 Jul 2023 00:17:12 +0000
Date: Tue, 18 Jul 2023 08:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rw-misc:embedded_go_prog 1/1] /bin/bash: line 1: go: command not
 found
Message-ID: <202307180840.vIHBvc7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git embedded_go_prog
head:   58a51666e0ed2b23253048b0616ee5879361cc4a
commit: 58a51666e0ed2b23253048b0616ee5879361cc4a [1/1] misc: Add demo driver for user mode driver usage
config: x86_64-buildonly-randconfig-r001-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180840.vIHBvc7q-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180840.vIHBvc7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180840.vIHBvc7q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: go: command not found

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
