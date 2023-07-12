Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1816920E3;
	Wed, 12 Jul 2023 05:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689141165; x=1720677165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JAtYXj53kiUNxzKMKeWAEQAxtQK9wsQi/yooOSfojHU=;
  b=Yr9L1kt5S2r83hJmKgPcZmKvHehqGY3GV5SFYvfMBNCIyI54izYdo6eg
   0Hpy/8VY6tPhz6jDMb9bKyOz+LADvfm23zp0iK22EO3VRRrOb/qT1+1+p
   e8d7T1fJwqvymfkZgrPBGUSC+BKKUoKYHxiJVsyM45NcxHvlIPZUVhHII
   vJ+EK1NKi6j6glhiyafK7MqSbPcvAlitAGJb0rLalLToK4LaQzUdIbDmx
   ClI1k91B7ZhLrF5ztaPcqkUbH7hgI2JmLD/s6RjUQlvLL6hL7VlCa115O
   X1Mrugbs4D+UfqDCy6ODrIWq9sjQwAE5ZKbysQo41juRctBIjCFflNh2m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354713490"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="354713490"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 22:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1052049227"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="1052049227"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2023 22:52:42 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJSmH-0005RN-0o;
	Wed, 12 Jul 2023 05:52:41 +0000
Date: Wed, 12 Jul 2023 13:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.14.y 4459/9999] drivers/block/pktcdvd.c:2548:37:
 warning: unused variable 'pkt_proc_fops'
Message-ID: <202307121352.OZQqe1YC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 71749b1181eca12af96654a781cabcd058c37c8f [4459/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r031-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121352.OZQqe1YC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121352.OZQqe1YC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121352.OZQqe1YC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/pktcdvd.c:2548:37: warning: unused variable 'pkt_proc_fops' [-Wunused-const-variable]
    2548 | static const struct file_operations pkt_proc_fops = {
         |                                     ^
   1 warning generated.


vim +/pkt_proc_fops +2548 drivers/block/pktcdvd.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  2547  
2b8693c0617e97 Arjan van de Ven 2007-02-12 @2548  static const struct file_operations pkt_proc_fops = {
^1da177e4c3f41 Linus Torvalds   2005-04-16  2549  	.open	= pkt_seq_open,
^1da177e4c3f41 Linus Torvalds   2005-04-16  2550  	.read	= seq_read,
^1da177e4c3f41 Linus Torvalds   2005-04-16  2551  	.llseek	= seq_lseek,
^1da177e4c3f41 Linus Torvalds   2005-04-16  2552  	.release = single_release
^1da177e4c3f41 Linus Torvalds   2005-04-16  2553  };
^1da177e4c3f41 Linus Torvalds   2005-04-16  2554  

:::::: The code at line 2548 was first introduced by commit
:::::: 2b8693c0617e972fc0b2fd1ebf8de97e15b656c3 [PATCH] mark struct file_operations const 3

:::::: TO: Arjan van de Ven <arjan@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
