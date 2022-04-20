Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93810F0
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650436901; x=1681972901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vxykZxzH8oZ0y8aC/wNv+t6K1cQ/j1YSAfUR65oTco4=;
  b=IlRSGs6+ii+w2mD8dX0uILIdj8IvF3KNNHTRkBORcRj9PUYVlrTAyZGR
   P7XB9UeiZkVGqgzctSBoJE7irmaxi/VaxwfIeOKvZuZwqASxWR9qQb87B
   RVlodB4tlLsd0h3S/wd63UpPnlXg5uArNgiOXH0PcmEhwtvNXipAaZDg8
   d9A4EOFqBvNSGqyyfuSXU4l4R/1hg1tafbv1tHTj9+xSxYEN9Wxmbaf5p
   UNv+A1Mn1xBdYAQvGzoja5PzDc1RhT7g/2vwPAKnlWgkRoYKxnuDXJbWe
   x3s/5InT/AroYeo0Heguj9IAt4vZ6KxycgruL1ZjfK02XYzXEVb9y2kul
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="324395277"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="324395277"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 23:41:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="576448341"
Received: from rli9-dbox.sh.intel.com (HELO rli9-dbox) ([10.239.159.142])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 23:41:35 -0700
Date: Wed, 20 Apr 2022 14:39:38 +0800
From: Philip Li <philip.li@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: kernel test robot <lkp@intel.com>, Peter Xu <peterx@redhat.com>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	akpm@linux-foundation.org, willy@infradead.org, vbabka@suse.cz,
	dhowells@redhat.com, neilb@suse.de, david@redhat.com,
	apopple@nvidia.com, surenb@google.com, minchan@kernel.org,
	sfr@canb.auug.org.au, rcampbell@nvidia.com, naoya.horiguchi@nec.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [kbuild-all] Re: [PATCH] mm/swap: Fix lost swap bits in
 unuse_pte()
Message-ID: <Yl+qqmH19VxwgK4C@rli9-dbox>
References: <Yl8rZkhU/B0iE2ob@xz-m1.local>
 <202204201313.QYiDBRbL-lkp@intel.com>
 <c14c0865-867c-ca14-8b2c-7e6e94ee7c85@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c14c0865-867c-ca14-8b2c-7e6e94ee7c85@huawei.com>

On Wed, Apr 20, 2022 at 02:23:27PM +0800, Miaohe Lin wrote:
> On 2022/4/20 13:56, kernel test robot wrote:
> > Hi Peter,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on hnaz-mm/master]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-swap-Fix-lost-swap-bits-in-unuse_pte/20220420-053845
> > base:   https://github.com/hnaz/linux-mm master
> > config: s390-randconfig-r023-20220420 (https://download.01.org/0day-ci/archive/20220420/202204201313.QYiDBRbL-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install s390 cross compiling tool for clang build
> >         # apt-get install binutils-s390x-linux-gnu
> >         # https://github.com/intel-lab-lkp/linux/commit/355ac3eb45402f7aab25b76af029d4390af05238
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Peter-Xu/mm-swap-Fix-lost-swap-bits-in-unuse_pte/20220420-053845
> >         git checkout 355ac3eb45402f7aab25b76af029d4390af05238
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> 
> The variable name is newpte. But it's written as new_pte latter. Many thanks for report!
> 
> BTW: Since this is not a formal patch (no compile tested). Is Reported-by tag still needed?

thanks, this is not needed. It mostly needed for already upstreamed one
and actually not mandatory from 0-day ci perspective.

> 
> Thanks!
> 
> > All errors (new ones prefixed by >>):
> > 
> >>> mm/swapfile.c:1824:2: error: use of undeclared identifier 'new_pte'; did you mean 'newpte'?
> >            new_pte = pte_mkold(mk_pte(page, vma->vm_page_prot));
> >            ^~~~~~~
> >            newpte
> >    mm/swapfile.c:1786:14: note: 'newpte' declared here
> >            pte_t *pte, newpte;
> >                        ^
> >    mm/swapfile.c:1826:26: error: use of undeclared identifier 'new_pte'
> >                    pte = pte_mksoft_dirty(new_pte);
> >                                           ^
> >    mm/swapfile.c:1828:23: error: use of undeclared identifier 'new_pte'
> >                    pte = pte_mkuffd_wp(new_pte);
> >                                        ^
> >    mm/swapfile.c:1829:36: error: use of undeclared identifier 'new_pte'; did you mean 'newpte'?
> >            set_pte_at(vma->vm_mm, addr, pte, new_pte);
> >                                              ^~~~~~~
> >                                              newpte
> >    mm/swapfile.c:1786:14: note: 'newpte' declared here
> >            pte_t *pte, newpte;
> >                        ^
> >    4 errors generated.
> ...
> >   1839	
> > 
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
