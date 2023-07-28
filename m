Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BED125D0;
	Fri, 28 Jul 2023 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690543588; x=1722079588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7eOy4EzY9apybAP2qF/S8saGXI8KA1G1jqjMNxbvaPw=;
  b=L1VYJlI58+OivGfmWzVNe8+N7M/7reS2Qx9lBwWA/d+FsfQM8wh72U6i
   nTqITV6A0QFirthd7afXGKSySloW8S1ihBwOQLoiKjMXc9Iuc9E+qwGtg
   ezvHMbfb3HK+DU8aSb+0ss5fQBQGuHBdZKoOzZSsMEQhLoa+YE10bPBYo
   Aw/Lof7FnLET2yElSuIgGllESPbGXDbBLCh0Tk2BU51HXbg/tTu3ezmAa
   vEe8ZJMqHhC7ZGpYZXvyVxDdFydldPba+ggBVMywNVoi+46qMb/ndbjVu
   VhHco0kACpGoQk6RWjv/u6q10WKu09OC9XnFZtJsmT7sK7n8+2ZMqhflZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434854495"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="434854495"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730705902"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="730705902"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 04:26:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPLbx-00037z-09;
	Fri, 28 Jul 2023 11:26:21 +0000
Date: Fri, 28 Jul 2023 19:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>, linux-mm@kvack.org,
	muchun.song@linux.dev, mike.kravetz@oracle.com, rppt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, fam.zheng@bytedance.com,
	liangma@liangbit.com, simon.evans@bytedance.com,
	punit.agrawal@bytedance.com, Usama Arif <usama.arif@bytedance.com>
Subject: Re: [v1 1/6] mm: hugetlb: Skip prep of tail pages when HVO is enabled
Message-ID: <202307281922.cdKbT0tX-lkp@intel.com>
References: <20230727204624.1942372-2-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727204624.1942372-2-usama.arif@bytedance.com>

Hi Usama,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-hugetlb-Skip-prep-of-tail-pages-when-HVO-is-enabled/20230728-044839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230727204624.1942372-2-usama.arif%40bytedance.com
patch subject: [v1 1/6] mm: hugetlb: Skip prep of tail pages when HVO is enabled
config: arm64-randconfig-r032-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281922.cdKbT0tX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281922.cdKbT0tX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281922.cdKbT0tX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/hugetlb.c:49:
>> mm/hugetlb_vmemmap.h:56:6: warning: no previous prototype for function 'vmemmap_should_optimize' [-Wmissing-prototypes]
      56 | bool vmemmap_should_optimize(const struct hstate *h, const struct page *head)
         |      ^
   mm/hugetlb_vmemmap.h:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | bool vmemmap_should_optimize(const struct hstate *h, const struct page *head)
         | ^
         | static 
   1 warning generated.


vim +/vmemmap_should_optimize +56 mm/hugetlb_vmemmap.h

    55	
  > 56	bool vmemmap_should_optimize(const struct hstate *h, const struct page *head)
    57	{
    58		return false;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
