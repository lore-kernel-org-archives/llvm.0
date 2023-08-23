Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432110E9;
	Wed, 23 Aug 2023 02:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692756059; x=1724292059;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xMXbrgS9s3xWNdVDh8Mby4ZdFZkJbV5JOEnsLRO/xBA=;
  b=MgwaPI9/xY4M0nFrJHVDltv2lOF6TRTn7j5idEltsi2+33STUfWF1z37
   d8q2w06+xF8bRt/CAxqP86vdwFU6aVwXRnQlQcTBke1lg6scKBpt79ilc
   GdDRVqcP+cB3z9QxDGuOmbRcvgF4Xxum9wyMC8zkyOV5ueMCTE/wniSaD
   hFWKLPp4wqHLQod3MvB9HE+njII2bLgnjRC6kaE5jhyLq0Dc+6RmRvRd8
   abo0JLr0/+xHYEiG3FQjfytak2yHFJOsWK/YC1v3Bym/PwSICjpmKxHr4
   cALNu5EqVnIfcmJkpYpARwwix3RVL/PG4jp25a8bwCt/mB76sFGg7Z9Fh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460403847"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="460403847"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 19:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="765956469"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="765956469"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 19:00:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYdAY-0000kA-24;
	Wed, 23 Aug 2023 02:00:26 +0000
Date: Wed, 23 Aug 2023 10:00:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym()
 for data symbol .rodata
Message-ID: <202308230930.cRLiRaJD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89bf6209cad66214d3774dac86b6bbf2aec6a30d
commit: 6342a20efbd8b70d169c325b2c27a8a8f96388d5 objtool: Add elf_create_section_pair()
date:   3 months ago
config: x86_64-randconfig-r033-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230930.cRLiRaJD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230930.cRLiRaJD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230930.cRLiRaJD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x14: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
