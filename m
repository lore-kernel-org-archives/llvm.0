Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229522F25
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655468265; x=1687004265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tz/jD2Salb21vnVNTIoALhjVotJpZYYZiJs32UY8QMI=;
  b=Zr//+V52MZwB9l2QGq9LpzN5UBFmQDHN4d4pxk7zSmz9F1Ub/E05iVfu
   cgQWa0W/yDKMbniNTcLbKjAMz5MO4cwsu+YpaFzLBluFG6cgNhb31+6qj
   M6jnVQ4mvkGll4AoamXIyqNMljoY5jlMfHpo8DeP5FzpReuz5OD/Y1Yxz
   oobkQgxEQSRqwSpRZ8f64qZaggTAIh5GynA1awzzmbLLQB368iA3FpOKW
   koc4r99yLkd+jQw4uF2jOyxDMgHKbqVP3Ffgtto8rOqmt8Jh0yOdUU8Rt
   sxY8CKv1VN0QRHP92m+SMMj85naia8eAX4F1O5jgSDZayYltQ3/8Xbg9s
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280211320"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280211320"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 05:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="584013616"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jun 2022 05:17:41 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2Auz-000PRE-6l;
	Fri, 17 Jun 2022 12:17:41 +0000
Date: Fri, 17 Jun 2022 20:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, mike.kravetz@oracle.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, songmuchun@bytedance.com,
	akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
	anshuman.khandual@arm.com, baolin.wang@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] arm64/hugetlb: Implement arm64 specific
 hugetlb_mask_last_hp
Message-ID: <202206172000.6Fwmo99P-lkp@intel.com>
References: <7256dbe078d7231f45b0f47c2c52a3bd3aa10da7.1655350193.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7256dbe078d7231f45b0f47c2c52a3bd3aa10da7.1655350193.git.baolin.wang@linux.alibaba.com>

Hi Baolin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/arm64-hugetlb-Implement-arm64-specific-hugetlb_mask_last_hp/20220616-113640
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: arm64-randconfig-r011-20220616 (https://download.01.org/0day-ci/archive/20220617/202206172000.6Fwmo99P-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f1309dfbc2b70ec5dd72ac38e95a49b7be42b9b6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Baolin-Wang/arm64-hugetlb-Implement-arm64-specific-hugetlb_mask_last_hp/20220616-113640
        git checkout f1309dfbc2b70ec5dd72ac38e95a49b7be42b9b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/hugetlbpage.c:371:15: warning: no previous prototype for function 'hugetlb_mask_last_hp' [-Wmissing-prototypes]
   unsigned long hugetlb_mask_last_hp(struct hstate *h)
                 ^
   arch/arm64/mm/hugetlbpage.c:371:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long hugetlb_mask_last_hp(struct hstate *h)
   ^
   static 
   1 warning generated.


vim +/hugetlb_mask_last_hp +371 arch/arm64/mm/hugetlbpage.c

   370	
 > 371	unsigned long hugetlb_mask_last_hp(struct hstate *h)
   372	{
   373		unsigned long hp_size = huge_page_size(h);
   374	
   375		switch (hp_size) {
   376		case PUD_SIZE:
   377			return PGDIR_SIZE - PUD_SIZE;
   378		case CONT_PMD_SIZE:
   379			return PUD_SIZE - CONT_PMD_SIZE;
   380		case PMD_SIZE:
   381			return PUD_SIZE - PMD_SIZE;
   382		case CONT_PTE_SIZE:
   383			return PMD_SIZE - CONT_PTE_SIZE;
   384		default:
   385			break;
   386		}
   387	
   388		return ~0UL;
   389	}
   390	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
