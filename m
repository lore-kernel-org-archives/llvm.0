Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C6566A;
	Tue, 24 Oct 2023 01:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ci3WbMjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698110558; x=1729646558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDTslLenkizcRrHJKivdjS1LbaTiffk2Cypje6raSv4=;
  b=Ci3WbMjPeQkAG/mwfn00aQwoVAe3hGEuvrjcvHbNKGfN+gsHveFbzlhv
   34N5rY/aPVt5KmoffaY7bxnDcOjr15sWPRbMfAHqTstn18IJtIzIOUUYe
   ckG38eDnqVlCKwrDQG2mvD2B151w5y840TmiZULvlGKKjw+lcTyPscI0V
   GhDU+bLJxFMLbaNddgDmyrmLcK6X5ZM4yb9490ySi0H3UNt5Y/MPW+mfh
   NjHK/G+oo1zjZ7z76dtkhVNDXShY1i/ETWimx3pW4MwGdGSIi7EsdQxuG
   /q7lUuGVeC7HJu7q8bGJEshosWEXpWaH/qZbUahcS3/xFLjRJ3FJa6SqZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366306519"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366306519"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 18:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1005511042"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1005511042"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2023 18:22:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv67r-0007RR-12;
	Tue, 24 Oct 2023 01:22:31 +0000
Date: Tue, 24 Oct 2023 09:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmck-rcu:mmap_sem.2023.10.18a 31/31] ld.lld: error: undefined
 symbol: __bad_udelay
Message-ID: <202310240930.H14JVILQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git mmap_sem.2023.10.18a
head:   4015256f2bc734d4175381762282784597f41cfa
commit: 4015256f2bc734d4175381762282784597f41cfa [31/31] EXP TESTING: introduce delay between getting a VMA and using it in show_map
config: arm-ixp4xx_defconfig (https://download.01.org/0day-ci/archive/20231024/202310240930.H14JVILQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240930.H14JVILQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240930.H14JVILQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __bad_udelay
   >>> referenced by task_mmu.c
   >>>               fs/proc/task_mmu.o:(show_map) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
