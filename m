Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27D31C07;
	Sat,  9 Sep 2023 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694249402; x=1725785402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=co7zfNeb2ZA6oBNeDLRBaucG265UXgfWtx863Pkzhdc=;
  b=SJPafSDISl4TkDgape6gd+IhhQkVAta3y2VMWv0umEjUrWt85UwXMw33
   metFXAHosB33nrkW/ySk4Ehx57mIdbC/cqZyTIOTa0kXi50AB+2/GfnQg
   eiTzu0Ez+/U8thIx5WCL6qLdt9yp6elKQz+lOIxmarP3sep5duo7FSO7c
   DLAkmCyJUrhdDjRf5+Qi0yiVU+sCECa/TaqXUnqm6B1wGwnc3+YBchDuq
   0Rzm7MN3S8PBLOnaSVPqMkSbmkROhK06AdVBr43aYXqDBKn5Uuttc9ODi
   JNu3HFAGX62QaT7Vge8HCdzGPx7SPR491nWO7WFNe1d/tbMtS0jEG80pc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357272010"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357272010"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 01:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736214630"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="736214630"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Sep 2023 01:50:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qetfC-0003BE-0P;
	Sat, 09 Sep 2023 08:49:58 +0000
Date: Sat, 9 Sep 2023 16:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] bpf: Using binary search to improve the performance
 of btf_find_by_name_kind
Message-ID: <202309091645.Le0RojYK-lkp@intel.com>
References: <20230909055202.306518-1-pengdonglin@sangfor.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909055202.306518-1-pengdonglin@sangfor.com.cn>

Hi Donglin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master linus/master v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donglin-Peng/bpf-Using-binary-search-to-improve-the-performance-of-btf_find_by_name_kind/20230909-140210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230909055202.306518-1-pengdonglin%40sangfor.com.cn
patch subject: [RFC PATCH] bpf: Using binary search to improve the performance of btf_find_by_name_kind
config: x86_64-buildonly-randconfig-005-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091645.Le0RojYK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091645.Le0RojYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091645.Le0RojYK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/btf.c:557:5: warning: no previous prototype for function 'btf_type_cnt' [-Wmissing-prototypes]
   u32 btf_type_cnt(const struct btf *btf)
       ^
   kernel/bpf/btf.c:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 btf_type_cnt(const struct btf *btf)
   ^
   static 
   1 warning generated.


vim +/btf_type_cnt +557 kernel/bpf/btf.c

   556	
 > 557	u32 btf_type_cnt(const struct btf *btf)
   558	{
   559		return btf->start_id + btf->nr_types;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
