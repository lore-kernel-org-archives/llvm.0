Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A32E3E4;
	Tue, 17 Oct 2023 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XR+yU5Hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697572884; x=1729108884;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XNa67o/INi282OnSB0/IbLa6Lwlzd3NgopowbZSEkWc=;
  b=XR+yU5Hr61s0B0gvvFTd9NcHzoRLO6kk6YgJrLQgWF4XtAu5l3kYYPrs
   Ai7QquqL4Ofmjm/06LV7o9U1yPuAwvhBwStG8NqG8K/RML1A9g6A0W+Sn
   iAIrnRcqO2pBZfqHjpyaXCN6AZ6YCBnpq8+xpSJrWqaedIDoJbGm8n3Hb
   N5UylRB/vv/sBKcl0j9LgDZ6xEUNz4ru9HlFsbjUP4mA9jtUu7UJ+C0no
   9xu6UYSA94LLiZxDt/U2KKsSXfqsyiKFRtwEkj50SsyBiIfdeFR0cBs9y
   Fe84tOfhr89euXZ0fILLApQ+M8hJeFK/gtJWhd8i8gL8zSUg7n4258CGX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="4468478"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="4468478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 13:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="706151629"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="706151629"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 13:01:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsqFW-000A1S-1O;
	Tue, 17 Oct 2023 20:01:06 +0000
Date: Wed, 18 Oct 2023 04:00:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [djwong-xfs:xfs-merge-6.7 47/51] clang: error: unknown argument:
 '-femit-struct-debug-detailed=any'
Message-ID: <202310180355.WJvjRDzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-merge-6.7
head:   eee9645e1bf5f060c24ab0f52b2fc55a3ff68ec6
commit: 5ae98786123bf094d32671f561362d74160288a5 [47/51] fs: turn on more warnings for the filesystem code we modify most
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231018/202310180355.WJvjRDzm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180355.WJvjRDzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180355.WJvjRDzm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-femit-struct-debug-detailed=any'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
