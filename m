Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB2F2CB2
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643016577; x=1674552577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qiYa68DZset/+GHU23v7gsmy5RVOLlEdSLnfR9RS/NA=;
  b=UkZd7UW0wmfAzi3sfaTJTBySc3Fse1/94oXDGfzHnDrln1yeGN1P620d
   tCjibmtbqJE1vbdl6Fkhj40XVUgt0zsf81ciOGbU6H/LNDLVkHfweFdLx
   FoMIdi/TSS9Q8Ou46lwoaBcRu60F6xHrjZuhIHbGUZPRGYN3TzOYlwAmx
   rMGjN5mqZ7WuVRZmQHUWzzyWwqpPPs00Ug4ktDKqQTbJKDITgMT1XSmMT
   fB1vcGEzZJLBRTsaaJHfhViyAO8IvWkeoYi4/NtJ74TlB679ZooamToxy
   TDnkEbCtkmpYCTk3r+19Bd/ysndSaOgaKhZ43qjDiKMTuUsKS5UOIWJMe
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="243601148"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="243601148"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="476657671"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2022 01:28:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBveE-000I6R-5k; Mon, 24 Jan 2022 09:28:26 +0000
Date: Mon, 24 Jan 2022 17:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>, Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/23] MM: submit multipage reads for SWP_FS_OPS
 swap-space
Message-ID: <202201241747.X9gXaaeP-lkp@intel.com>
References: <164299611278.26253.14950274629759580371.stgit@noble.brown>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164299611278.26253.14950274629759580371.stgit@noble.brown>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi NeilBrown,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc1 next-20220124]
[cannot apply to trondmy-nfs/linux-next cifs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/Repair-SWAP-over_NFS/20220124-115716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
config: i386-randconfig-a011-20220124 (https://download.01.org/0day-ci/archive/20220124/202201241747.X9gXaaeP-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/63bff668aa0537d7ccef9ed428809fc16c1a6b6c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Repair-SWAP-over_NFS/20220124-115716
        git checkout 63bff668aa0537d7ccef9ed428809fc16c1a6b6c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:61:
   mm/swap.h:66:12: warning: declaration of 'struct swap_iocb' will not be visible outside of this function [-Wvisibility]
                                   struct swap_iocb **plug);
                                          ^
>> mm/swap.h:67:1: error: expected identifier or '('
   {
   ^
   1 warning and 1 error generated.
--
   In file included from mm/shmem.c:41:
   mm/swap.h:66:12: warning: declaration of 'struct swap_iocb' will not be visible outside of this function [-Wvisibility]
                                   struct swap_iocb **plug);
                                          ^
>> mm/swap.h:67:1: error: expected identifier or '('
   {
   ^
   In file included from mm/shmem.c:56:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from mm/page_alloc.c:84:
   mm/swap.h:66:12: warning: declaration of 'struct swap_iocb' will not be visible outside of this function [-Wvisibility]
                                   struct swap_iocb **plug);
                                          ^
>> mm/swap.h:67:1: error: expected identifier or '('
   {
   ^
   mm/page_alloc.c:3821:15: warning: no previous prototype for function 'should_fail_alloc_page' [-Wmissing-prototypes]
   noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
                 ^
   mm/page_alloc.c:3821:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
            ^
            static 
   2 warnings and 1 error generated.


vim +67 mm/swap.h

50dceef273a619 NeilBrown 2022-01-24  45  
50dceef273a619 NeilBrown 2022-01-24  46  struct page *read_swap_cache_async(swp_entry_t, gfp_t,
50dceef273a619 NeilBrown 2022-01-24  47  				   struct vm_area_struct *vma,
50dceef273a619 NeilBrown 2022-01-24  48  				   unsigned long addr,
63bff668aa0537 NeilBrown 2022-01-24  49  				   bool do_poll,
63bff668aa0537 NeilBrown 2022-01-24  50  				   struct swap_iocb **plug);
50dceef273a619 NeilBrown 2022-01-24  51  struct page *__read_swap_cache_async(swp_entry_t, gfp_t,
50dceef273a619 NeilBrown 2022-01-24  52  				     struct vm_area_struct *vma,
50dceef273a619 NeilBrown 2022-01-24  53  				     unsigned long addr,
50dceef273a619 NeilBrown 2022-01-24  54  				     bool *new_page_allocated);
50dceef273a619 NeilBrown 2022-01-24  55  struct page *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
50dceef273a619 NeilBrown 2022-01-24  56  				    struct vm_fault *vmf);
50dceef273a619 NeilBrown 2022-01-24  57  struct page *swapin_readahead(swp_entry_t entry, gfp_t flag,
50dceef273a619 NeilBrown 2022-01-24  58  			      struct vm_fault *vmf);
50dceef273a619 NeilBrown 2022-01-24  59  
12cf545fe71035 NeilBrown 2022-01-24  60  static inline unsigned int page_swap_flags(struct page *page)
12cf545fe71035 NeilBrown 2022-01-24  61  {
12cf545fe71035 NeilBrown 2022-01-24  62  	return page_swap_info(page)->flags;
12cf545fe71035 NeilBrown 2022-01-24  63  }
50dceef273a619 NeilBrown 2022-01-24  64  #else /* CONFIG_SWAP */
63bff668aa0537 NeilBrown 2022-01-24  65  static inline int swap_readpage(struct page *page, bool do_poll,
63bff668aa0537 NeilBrown 2022-01-24 @66  				struct swap_iocb **plug);
50dceef273a619 NeilBrown 2022-01-24 @67  {
50dceef273a619 NeilBrown 2022-01-24  68  	return 0;
50dceef273a619 NeilBrown 2022-01-24  69  }
50dceef273a619 NeilBrown 2022-01-24  70  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
