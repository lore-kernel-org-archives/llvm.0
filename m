Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F21844
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644973281; x=1676509281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0FCXywQavSXv/9ImP7xI1EkXXeqrd+iE5j6182icVg=;
  b=eNb3tM0wG5n4qFSsjnBIf1jF/uIU+ARlRFUB7F9inOrjZbZwJQ5Y6YsY
   0oVTUs7PN4xK92Af/5HueoZOZ3r/VuHS5RoVHmFXZQ/9sQQWOHKZmIldP
   SZk2SwwJUKuWk14gvOwrAw75RWOsMOGTbbKerQZjlZLOxAAVgn31JoB3u
   CHF1WCHzXtbfDIuF6nQF3/cd1sAHaNYNymqpSzoqJTR553TsCY6QFEVBb
   /nj11n3pcX+Fx2KxiRbNNkvHRvV0b/J3uNKM4n2g8hCtZzFjviubVkD4+
   rJTjNp9328PZRESLnizwikWDGl6ZCUJTTB6/XocsdoquXhjwPkg9v+CK9
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248092690"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="248092690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 17:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="704046197"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2022 17:01:17 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nK8h3-000AEc-8b; Wed, 16 Feb 2022 01:01:17 +0000
Date: Wed, 16 Feb 2022 09:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 36/43]
 fs/netfs/crypto.c:76:10: warning: comparison of distinct pointer types
 ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) -
 offset) *' (aka 'unsigned long *'))
Message-ID: <202202160859.rLKL6wYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-maple
head:   d40df0841e9f8de3713a19dd3f0ba283c860cb93
commit: dcba644aa7bbb5bfb44d4a5c3abd187c51544bcd [36/43] netfs: Perform content encryption
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220216/202202160859.rLKL6wYG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/dcba644aa7bbb5bfb44d4a5c3abd187c51544bcd
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout dcba644aa7bbb5bfb44d4a5c3abd187c51544bcd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/netfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/netfs/crypto.c:76:10: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - offset) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           seg = min(len, PAGE_SIZE - offset);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +76 fs/netfs/crypto.c

    45	
    46	/*
    47	 * Populate a scatterlist from folios in an xarray.
    48	 */
    49	static int netfs_xarray_to_sglist(struct xarray *xa, loff_t pos, size_t len,
    50					  struct scatterlist *sg, unsigned int n_sg)
    51	{
    52		struct scatterlist *p = sg;
    53		struct folio *folio = NULL;
    54		size_t seg, offset, skip = 0;
    55		loff_t start = pos;
    56		pgoff_t index = start >> PAGE_SHIFT;
    57		int j;
    58	
    59		XA_STATE(xas, xa, index);
    60	
    61		sg_init_table(sg, n_sg);
    62	
    63		rcu_read_lock();
    64	
    65		xas_for_each(&xas, folio, ULONG_MAX) {
    66			if (xas_retry(&xas, folio))
    67				continue;
    68			if (WARN_ON(xa_is_value(folio)) || WARN_ON(folio_test_hugetlb(folio)))
    69				break;
    70			for (j = (folio_index(folio) < index) ? index - folio_index(folio) : 0;
    71			     j < folio_nr_pages(folio); j++
    72			     ) {
    73				struct page *subpage = folio_file_page(folio, j);
    74	
    75				offset = (pos + skip) & ~PAGE_MASK;
  > 76				seg = min(len, PAGE_SIZE - offset);
    77	
    78				sg_set_page(p++, subpage, seg, offset);
    79	
    80				len -= seg;
    81				skip += seg;
    82				if (len == 0)
    83					break;
    84			}
    85			if (len == 0)
    86				break;
    87		}
    88	
    89		rcu_read_unlock();
    90		if (len > 0) {
    91			kdebug("*** Insufficient source (%zx)", len);
    92			//WARN_ON(len > 0);
    93			return -EIO;
    94		}
    95	
    96		sg_mark_end(p - 1);
    97		return p - sg;
    98	}
    99	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
