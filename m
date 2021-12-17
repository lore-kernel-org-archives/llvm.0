Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A62C9D
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 10:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639735393; x=1671271393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=difKERNCUGT+yNj8Ji0RjwMEgrFy7uvw5aDaT8WIo6c=;
  b=MB77aajMyH8ZkEdzzku9+I7TOMK4vteh/MBTYj7sqcsYiZrxVoGSN2Nn
   7PGyfvSmonARHPQFV3i/RvibZU2dYJldwmhrhPMwUyVap5xczkNs5r/hS
   UT14/TG33/UE1Qe7jmUnhYUh0rboZwgKywBorujeHdV5SqqqHoN6lRf7i
   BLbO6TYbkX8ShN9IAkKpYAoXDsZSsVqhstBsumGRZolNYPZgOUUL6xxSy
   SsLbY+GydGwkii029rBZA6VFpRPIIq4Y5SK5fYwci/Au1IJZ2ovPIKkXV
   +ReJIXsvnZZhniVl+1JuDRm6tC6QOu6sGHVDRKWdcPD/70XR36yL0Fc3y
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239674589"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="239674589"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 02:03:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="615512643"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2021 02:03:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myA4y-0004Yr-EB; Fri, 17 Dec 2021 10:03:08 +0000
Date: Fri, 17 Dec 2021 18:03:02 +0800
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
Subject: Re: [PATCH 02/18] MM: create new mm/swap.h header file.
Message-ID: <202112171739.uSeLyZ1M-lkp@intel.com>
References: <163969850279.20885.7172996032577523902.stgit@noble.brown>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163969850279.20885.7172996032577523902.stgit@noble.brown>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi NeilBrown,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on cifs/for-next]
[also build test ERROR on axboe-block/for-next rostedt-trace/for-next linus/master v5.16-rc5]
[cannot apply to trondmy-nfs/linux-next hnaz-mm/master next-20211216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/Repair-SWAP-over-NFS/20211217-075659
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
config: hexagon-randconfig-r045-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171739.uSeLyZ1M-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3dd9e64650d0340fd6469ba4f8abc183bb2eea15
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Repair-SWAP-over-NFS/20211217-075659
        git checkout 3dd9e64650d0340fd6469ba4f8abc183bb2eea15
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> mm/memcontrol.c:5532:9: error: implicit declaration of function 'find_get_incore_page' [-Werror,-Wimplicit-function-declaration]
           return find_get_incore_page(vma->vm_file->f_mapping,
                  ^
>> mm/memcontrol.c:5532:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct page *' [-Wint-conversion]
           return find_get_incore_page(vma->vm_file->f_mapping,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/find_get_incore_page +5532 mm/memcontrol.c

90254a65833b67 Daisuke Nishimura       2010-05-26  5521  
87946a72283be3 Daisuke Nishimura       2010-05-26  5522  static struct page *mc_handle_file_pte(struct vm_area_struct *vma,
48384b0b76f366 Peter Xu                2021-11-05  5523  			unsigned long addr, pte_t ptent)
87946a72283be3 Daisuke Nishimura       2010-05-26  5524  {
87946a72283be3 Daisuke Nishimura       2010-05-26  5525  	if (!vma->vm_file) /* anonymous vma */
87946a72283be3 Daisuke Nishimura       2010-05-26  5526  		return NULL;
1dfab5abcdd404 Johannes Weiner         2015-02-11  5527  	if (!(mc.flags & MOVE_FILE))
87946a72283be3 Daisuke Nishimura       2010-05-26  5528  		return NULL;
87946a72283be3 Daisuke Nishimura       2010-05-26  5529  
87946a72283be3 Daisuke Nishimura       2010-05-26  5530  	/* page is moved even if it's not RSS of this task(page-faulted). */
aa3b189551ad8e Hugh Dickins            2011-08-03  5531  	/* shmem/tmpfs may report page out on swap: account for that too. */
f5df8635c5a3c9 Matthew Wilcox (Oracle  2020-10-13 @5532) 	return find_get_incore_page(vma->vm_file->f_mapping,
f5df8635c5a3c9 Matthew Wilcox (Oracle  2020-10-13  5533) 			linear_page_index(vma, addr));
87946a72283be3 Daisuke Nishimura       2010-05-26  5534  }
87946a72283be3 Daisuke Nishimura       2010-05-26  5535  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
