Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09B4160;
	Fri, 25 Aug 2023 00:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692922365; x=1724458365;
  h=date:from:cc:subject:message-id:mime-version;
  bh=R1j1PkhS8G7mh9MMB5t2wOq0yXqRfXWvz/4dLesK1bU=;
  b=GL2v9BYq3M30PpHp+ZuEcDbXcYLWzuELl0lqdZRXwSqSf45+xXVsCyzw
   YXqsG0EFSMXgZO6Z9BHquUu6SOpoWhMVeNo/ve4SM9vX6g40YrYaYDTip
   P8koqgLBk4nx+6WiShUtvU04ijs9v4QD46Qg4vMc84MTCPlfhtf8OicxN
   p3QH59N3+G2/+7DT8BbhCMwOwm24PU2k9Y68jiPTLRxq104qYiQV1nD6o
   gg0APLvdH2VB8mbGG53o9yUNbLdaLCb/iqjwOlFHzcrrkjHgYLgom6NNZ
   ytD4GTZiTg0/10oVG232dYmhgbdK51EIkCgOeAkxoS+cFSKY/Uv24T//7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364783937"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364783937"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766757355"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766757355"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 17:12:29 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZKQd-000348-17;
	Fri, 25 Aug 2023 00:12:05 +0000
Date: Fri, 25 Aug 2023 08:11:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 127/9999] test_set_error_stamp: rm
 /kbuild/obj/consumer/x86_64-randconfig-013-20230825/.reduce_errors/arch-x86-crypto-crc32c-pcl-intel-asm_64.o:warning:objtool:crc_pcl:missing-int3-after-indirect-jump
Message-ID: <202308250800.d2y2XHxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 370d33da35e31c1544eb77bcf2539f09b1064b9c [127/9999] x86: Add straight-line-speculation mitigation
config: x86_64-randconfig-013-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250800.d2y2XHxT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250800.d2y2XHxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250800.d2y2XHxT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/crc32c-pcl-intel-asm_64.o: warning: objtool: crc_pcl()+0x78: missing int3 after indirect jump

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
