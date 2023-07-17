Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091BA23;
	Mon, 17 Jul 2023 02:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689561654; x=1721097654;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1dE5eG/1Ymk8sF6hpLfvsGRBaisFZdXNY2VLgKe2tyI=;
  b=VHYsMqJeqSaC0iVgy321H+OFryq5NNoGQAIQKr8PYMN03iokvDizisLj
   Y8tQ7D+gr35Uxm9yBXBgrPIN+gPf52DirfgEP/1svXcnX1/NS3NOnzmZP
   nY30bRA3E+TlGLnbN42j4PEnXpijB1uRqxuFvYDhRQZgVLVzlYWPsAh6Y
   i7xKN/fQWayNPc6PvLtRzIiZoA6paUM4fwrxEJZ5GSMBH4FrtH2ouAekO
   7MjaHYPT37rM0Vljh1HXcoJaUXi9fSAjsdHySGRQBAvH3YFt+ziOyAisw
   /adVRpjmh1IHfmU8L+jS/0USB4cVkZ5Nr5mMm/vwMzLr0BM2J2F4hoKmI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="368468320"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="368468320"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 19:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="1053734421"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="1053734421"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2023 19:40:39 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLEAA-00099I-1S;
	Mon, 17 Jul 2023 02:40:38 +0000
Date: Mon, 17 Jul 2023 10:40:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/reiserfs/ibalance.o: warning: objtool:
 internal_delete_pointers_items+0x5ea: stack state mismatch: cfa1=4+152
 cfa2=4+160
Message-ID: <202307171058.3SwaCwzO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fdf0eaf11452d72945af31804e2a1048ee1b574c
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   10 months ago
config: x86_64-randconfig-x011-20230717 (https://download.01.org/0day-ci/archive/20230717/202307171058.3SwaCwzO-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307171058.3SwaCwzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307171058.3SwaCwzO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/reiserfs/ibalance.o: warning: objtool: balance_internal+0x569c: stack state mismatch: cfa1=4+328 cfa2=4+336
   fs/reiserfs/ibalance.o: warning: objtool: internal_move_pointers_items+0x87a: stack state mismatch: cfa1=4+224 cfa2=4+216
>> fs/reiserfs/ibalance.o: warning: objtool: internal_delete_pointers_items+0x5ea: stack state mismatch: cfa1=4+152 cfa2=4+160
>> fs/reiserfs/ibalance.o: warning: objtool: internal_insert_key+0x5ca: stack state mismatch: cfa1=4+128 cfa2=4+120


objdump-func vmlinux.o internal_delete_pointers_items:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
