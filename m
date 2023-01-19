Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C06615A3;
	Thu, 19 Jan 2023 00:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674089787; x=1705625787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJCizNWOGOaPMJbPH65X7PJl5zBJyJuiFNiFFXhBuHk=;
  b=DTuL+g8hIShxk6Q1VmxbEbZltz4GgiWmSrDMD/Wj/pCEaWndEftkUdIZ
   3sUG0rXf0bJmpgGMn1NfL1SCZNjhAwh2NZHZef+T5YePUPe7e0jWTGpk3
   fCqCleBKRS+f3ZRWgEmrIMGElQkn/AuRDV63gM0EwG8X3aryclIGzLMo3
   NXT+9nRTsyWYbSoU968UMXhPEUH+Qfusx26Jpp+qBZ+96hpHoaMzQakym
   js/IJ0XKbUmxv0vXnz/w79DzxPh0u7WPRE3b5WnnLA4GXXa7IVav+AoSL
   O81aFGe7QRLvkF5G9TBWWAF8v8udsxCtbtVCwBqsa53c+kkX99tgppVYT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323836547"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323836547"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661942530"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661942530"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 16:56:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJE6-0000tk-2V;
	Thu, 19 Jan 2023 00:56:22 +0000
Date: Thu, 19 Jan 2023 08:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] mm/hugetlb: convert get_hwpoison_huge_page() to folios
Message-ID: <202301190833.olO4HOkZ-lkp@intel.com>
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
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230119/202301190833.olO4HOkZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6704f4eff6775ce3ccc4156b41b9d1c4d091eb14
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sidhartha-Kumar/mm-hugetlb-convert-get_hwpoison_huge_page-to-folios/20230119-014337
        git checkout 6704f4eff6775ce3ccc4156b41b9d1c4d091eb14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/memory-failure.c:1335:8: error: implicit declaration of function 'get_hwpoison_hugetlb_folio' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = get_hwpoison_hugetlb_folio(folio, &hugetlb, false);
                 ^
   mm/memory-failure.c:1335:8: note: did you mean 'get_hwpoison_huge_page'?
   include/linux/hugetlb.h:420:19: note: 'get_hwpoison_huge_page' declared here
   static inline int get_hwpoison_huge_page(struct page *page, bool *hugetlb, bool unpoison)
                     ^
   mm/memory-failure.c:1425:8: error: implicit declaration of function 'get_hwpoison_hugetlb_folio' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
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
