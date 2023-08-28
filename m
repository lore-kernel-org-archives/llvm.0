Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B11362;
	Mon, 28 Aug 2023 00:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693181049; x=1724717049;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RG6oZRwVkUvvXTy3leuL+atVGsDnv3UMBys1noAAWjE=;
  b=ZDyzc7qXU2B5lDWrKzmMvWwIFfwrxcgcX5LtF+qV5eZNC0YpuvhYMahY
   tw46dOE75m+fiOndKN/vdl1euMAtepMHW9+9IF8agq6iHD12LONj7Tv+l
   ksMTO6N12DSCtVsN6kzMldBYADHN5yvBYCGFyVZOsAIzOzDT4TYwStwGF
   k7wyD7g0g/WW5Pg9vp+tRY6pMnP/Ygk7l/GLVsbZrGc5XPBQn2fZBNJfp
   032w68xrzHbW2aXHXKPVDWyaDXIpgcaCNDaPFH8Zr/ukYGk5Ie6+qnaAT
   csvofgRFccDVt4srd0QglRN7hEygk3E6KrPLyP4/pWFCptqFjTfx9gzYU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="355312038"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="355312038"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 17:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="687902253"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="687902253"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Aug 2023 17:04:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaPji-0006Kx-1I;
	Mon, 28 Aug 2023 00:04:06 +0000
Date: Mon, 28 Aug 2023 08:03:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: .text.bmi160_setup_irq: unexpected end
 of section
Message-ID: <202308280723.b3I6a9tB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Christoph Lameter <cl@linux-foundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   85eb043618bb17124050197d71c453d4a1f556e5
commit: e240e53ae0abb0896e0f399bdfef41c69cec3123 mm, slub: add CONFIG_SLUB_TINY
date:   9 months ago
config: x86_64-randconfig-006-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280723.b3I6a9tB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280723.b3I6a9tB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280723.b3I6a9tB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x32: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: .text.bmi160_setup_irq: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
