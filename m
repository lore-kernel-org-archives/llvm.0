Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951428DC1;
	Mon,  6 Nov 2023 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khBBXC7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699283267; x=1730819267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xM62sERwcbfDNq6YRmtOMW5R7PfvUZJuCGb0L+v17+M=;
  b=khBBXC7S/Phe7Ax9/7lhHO3aMmbYW0JXuFxQaAh/sVy7NPEEuFdtxz7s
   exChGgraXNFonk/UsDqYnxJWKFQPRoy5Edk2nGQY8UzMvXlH+IGm0IObR
   5yAI861quUXQ7lOYipFWGEm8/8TMFUmk0c7xRNr7oWPiPA4DMKWDAvGcU
   nC8Sg61bWuoCw5G7vDgYy/lpGX8azw1JG4CrWEpy5MEQF+1VIENQjgfBq
   CtTKIzaBzvp2c3UwlzHdTwalHdWKdFaFbyDBPAr53jOQ4uu+8r9xCLwLv
   PeBIe2qJyRA9bKWigmNG9ZEBMX2N48c77BdCWzCxvObaH8Yl76SYQEsVD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="388172700"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="388172700"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 07:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1093805690"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="1093805690"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2023 07:06:44 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r01Ba-0006Up-2D;
	Mon, 06 Nov 2023 15:06:42 +0000
Date: Mon, 6 Nov 2023 23:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/3] pmpool: Mark reserved range as "kernel
 reserved" in kexec e820 table
Message-ID: <202311062223.Dqaf29S5-lkp@intel.com>
References: <169645820784.11424.922048380402402210.stgit@skinsburskii.>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169645820784.11424.922048380402402210.stgit@skinsburskii.>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master tip/auto-latest v6.6 next-20231106]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/x86-boot-e820-Expose-kexec-range-update-remove-and-table-update-functions/20231005-062443
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/169645820784.11424.922048380402402210.stgit%40skinsburskii.
patch subject: [RFC PATCH v3 3/3] pmpool: Mark reserved range as "kernel reserved" in kexec e820 table
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311062223.Dqaf29S5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311062223.Dqaf29S5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311062223.Dqaf29S5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pmpool.c:14:10: fatal error: 'asm/e820/api.h' file not found
      14 | #include <asm/e820/api.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.


vim +14 mm/pmpool.c

    13	
  > 14	#include <asm/e820/api.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
