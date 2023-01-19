Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652515A3;
	Thu, 19 Jan 2023 00:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674088523; x=1705624523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xjRXErpsWtrESSjYJ82K1NT4DtrXmkuFUOnxx6YjNSg=;
  b=n46c7XQM/8yamgDwLahbklq/V6sdp49Zysm2XUWK6lenQafuj437X3i2
   u3KIXckGw92JtVa5wXho8Xj0p9qOGdtXcJ5SJUTca7jvV6FYAmk6yDKWV
   AWaI+zK0chPs+UdH8SNkvDpzJ9dwWOUXlcR3M0CN3Vz04cLtLcD0rtfLi
   BQ1AeqS8ivnhXPfy4Xu3Q+o8FMxzzkEC/p6wX1ZKy/E/GzFHJliiDDdll
   Tkw+GdCxp22cPOQsiCi/ht/VZaWlszyXRcbeyi6k1MC5SW0NbKODPCo52
   yXuCHLmxD2T+94i3IE+EMYepj8of7LISwsxvijKW4S8xAlRllV5sUciiq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389646539"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="389646539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:35:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748687006"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="748687006"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 16:35:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIItl-0000sI-1q;
	Thu, 19 Jan 2023 00:35:21 +0000
Date: Thu, 19 Jan 2023 08:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] mm/hugetlb: convert get_hwpoison_huge_page() to folios
Message-ID: <202301190837.bTrbAr7a-lkp@intel.com>
References: <20230118174039.14247-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118174039.14247-1-sidhartha.kumar@oracle.com>

Hi Sidhartha,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidhartha-Kumar/mm-hugetlb-convert-get_hwpoison_huge_page-to-folios/20230119-014337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230118174039.14247-1-sidhartha.kumar%40oracle.com
patch subject: [PATCH v2] mm/hugetlb: convert get_hwpoison_huge_page() to folios
config: arm64-buildonly-randconfig-r006-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190837.bTrbAr7a-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6704f4eff6775ce3ccc4156b41b9d1c4d091eb14
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sidhartha-Kumar/mm-hugetlb-convert-get_hwpoison_huge_page-to-folios/20230119-014337
        git checkout 6704f4eff6775ce3ccc4156b41b9d1c4d091eb14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/memory-failure.c:1335:8: error: call to undeclared function 'get_hwpoison_hugetlb_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = get_hwpoison_hugetlb_folio(folio, &hugetlb, false);
                 ^
   mm/memory-failure.c:1335:8: note: did you mean 'get_hwpoison_huge_page'?
   include/linux/hugetlb.h:420:19: note: 'get_hwpoison_huge_page' declared here
   static inline int get_hwpoison_huge_page(struct page *page, bool *hugetlb, bool unpoison)
                     ^
   mm/memory-failure.c:1425:8: error: call to undeclared function 'get_hwpoison_hugetlb_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = get_hwpoison_hugetlb_folio(folio, &hugetlb, true);
                 ^
   2 errors generated.


vim +/get_hwpoison_hugetlb_folio +1335 mm/memory-failure.c

  1328	
  1329	static int __get_hwpoison_page(struct page *page, unsigned long flags)
  1330	{
  1331		struct folio *folio = page_folio(page);
  1332		int ret = 0;
  1333		bool hugetlb = false;
  1334	
> 1335		ret = get_hwpoison_hugetlb_folio(folio, &hugetlb, false);
  1336		if (hugetlb)
  1337			return ret;
  1338	
  1339		/*
  1340		 * This check prevents from calling folio_try_get() for any
  1341		 * unsupported type of folio in order to reduce the risk of unexpected
  1342		 * races caused by taking a folio refcount.
  1343		 */
  1344		if (!HWPoisonHandlable(&folio->page, flags))
  1345			return -EBUSY;
  1346	
  1347		if (folio_try_get(folio)) {
  1348			if (folio == page_folio(page))
  1349				return 1;
  1350	
  1351			pr_info("%#lx cannot catch tail\n", page_to_pfn(page));
  1352			folio_put(folio);
  1353		}
  1354	
  1355		return 0;
  1356	}
  1357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
