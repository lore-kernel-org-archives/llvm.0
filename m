Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7B2CA2
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639585028; x=1671121028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=keHPlyhZHuTy0SXERggTrBkiiqsKZ7pJ9O8ne/b9Gow=;
  b=j4mIhTci630jXotLznkZIKXp7AdGpKRjKBZkKZq4YpBxHLDKWVuZfGDV
   XfwHa5CoQiB2L8XKKImfk5NTM8DhVO0ta53b31Dunq1QHzG89SognVOmb
   isdtIna+FjtdqYtRES+brJLJ+ybfyknpOaiHvL/MBl6J09Vm1FTUfLDye
   pnRDdFNkluw+rmFtAV6PqR9PBnHZ8V7ye2G91AObXapynORaXCxgaSG5i
   vT7mVEezAzCHajleL4QYYm+fyOHfmeTyiFkQCWSAdFIXiLhWvmr/vI0n6
   gmsN1dIOMDARq67nvUt5bcxgdoqtqdqiWw64RPgQMGY7APUuIyETS07Ku
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226119574"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226119574"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 08:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="682555217"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2021 08:17:06 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxWxm-00021Z-0e; Wed, 15 Dec 2021 16:17:06 +0000
Date: Thu, 16 Dec 2021 00:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yue Hu <huyue2@yulong.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2] erofs: support tail-packing inline compressed data
Message-ID: <202112160025.qGQJemAr-lkp@intel.com>
References: <20211215094449.15162-1-huyue2@yulong.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215094449.15162-1-huyue2@yulong.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Yue,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on next-20211214]
[cannot apply to v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yue-Hu/erofs-support-tail-packing-inline-compressed-data/20211215-174814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
config: arm64-randconfig-r024-20211214 (https://download.01.org/0day-ci/archive/20211216/202112160025.qGQJemAr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/669be7ff96dfecf5377f5717882b8e958eb16f0b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yue-Hu/erofs-support-tail-packing-inline-compressed-data/20211215-174814
        git checkout 669be7ff96dfecf5377f5717882b8e958eb16f0b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash fs/erofs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/erofs/zmap.c:114:45: warning: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Wtautological-constant-out-of-range-compare]
                   if (!vi->z_idata_size || vi->z_idata_size > EROFS_BLKSIZ) {
                                            ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   1 warning generated.


vim +114 fs/erofs/zmap.c

    31	
    32	static int z_erofs_fill_inode_lazy(struct inode *inode)
    33	{
    34		struct erofs_inode *const vi = EROFS_I(inode);
    35		struct super_block *const sb = inode->i_sb;
    36		int err, headnr;
    37		erofs_off_t pos;
    38		struct page *page;
    39		void *kaddr;
    40		struct z_erofs_map_header *h;
    41	
    42		if (test_bit(EROFS_I_Z_INITED_BIT, &vi->flags)) {
    43			/*
    44			 * paired with smp_mb() at the end of the function to ensure
    45			 * fields will only be observed after the bit is set.
    46			 */
    47			smp_mb();
    48			return 0;
    49		}
    50	
    51		if (wait_on_bit_lock(&vi->flags, EROFS_I_BL_Z_BIT, TASK_KILLABLE))
    52			return -ERESTARTSYS;
    53	
    54		err = 0;
    55		if (test_bit(EROFS_I_Z_INITED_BIT, &vi->flags))
    56			goto out_unlock;
    57	
    58		DBG_BUGON(!erofs_sb_has_big_pcluster(EROFS_SB(sb)) &&
    59			  !erofs_sb_has_ztailpacking(EROFS_SB(sb)) &&
    60			  vi->datalayout == EROFS_INODE_FLAT_COMPRESSION_LEGACY);
    61	
    62		pos = ALIGN(iloc(EROFS_SB(sb), vi->nid) + vi->inode_isize +
    63			    vi->xattr_isize, 8);
    64		page = erofs_get_meta_page(sb, erofs_blknr(pos));
    65		if (IS_ERR(page)) {
    66			err = PTR_ERR(page);
    67			goto out_unlock;
    68		}
    69	
    70		kaddr = kmap_atomic(page);
    71	
    72		h = kaddr + erofs_blkoff(pos);
    73		vi->z_advise = le16_to_cpu(h->h_advise);
    74		vi->z_idata_size = le16_to_cpu(h->h_idata_size);
    75		vi->z_algorithmtype[0] = h->h_algorithmtype & 15;
    76		vi->z_algorithmtype[1] = h->h_algorithmtype >> 4;
    77	
    78		headnr = 0;
    79		if (vi->z_algorithmtype[0] >= Z_EROFS_COMPRESSION_MAX ||
    80		    vi->z_algorithmtype[++headnr] >= Z_EROFS_COMPRESSION_MAX) {
    81			erofs_err(sb, "unknown HEAD%u format %u for nid %llu, please upgrade kernel",
    82				  headnr + 1, vi->z_algorithmtype[headnr], vi->nid);
    83			err = -EOPNOTSUPP;
    84			goto unmap_done;
    85		}
    86	
    87		vi->z_logical_clusterbits = LOG_BLOCK_SIZE + (h->h_clusterbits & 7);
    88		if (!erofs_sb_has_big_pcluster(EROFS_SB(sb)) &&
    89		    vi->z_advise & (Z_EROFS_ADVISE_BIG_PCLUSTER_1 |
    90				    Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {
    91			erofs_err(sb, "per-inode big pcluster without sb feature for nid %llu",
    92				  vi->nid);
    93			err = -EFSCORRUPTED;
    94			goto unmap_done;
    95		}
    96		if (vi->datalayout == EROFS_INODE_FLAT_COMPRESSION &&
    97		    !(vi->z_advise & Z_EROFS_ADVISE_BIG_PCLUSTER_1) ^
    98		    !(vi->z_advise & Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {
    99			erofs_err(sb, "big pcluster head1/2 of compact indexes should be consistent for nid %llu",
   100				  vi->nid);
   101			err = -EFSCORRUPTED;
   102			goto unmap_done;
   103		}
   104	unmap_done:
   105		kunmap_atomic(kaddr);
   106		unlock_page(page);
   107		put_page(page);
   108		if (err)
   109			goto out_unlock;
   110	
   111		if (vi->z_advise & Z_EROFS_ADVISE_INLINE_PCLUSTER) {
   112			struct erofs_map_blocks map = { .m_la = inode->i_size - 1 };
   113	
 > 114			if (!vi->z_idata_size || vi->z_idata_size > EROFS_BLKSIZ) {
   115				erofs_err(sb, "invalid tail-packing pclustersize %u",
   116					  vi->z_idata_size);
   117				return -EFSCORRUPTED;
   118			}
   119			err = z_erofs_do_map_blocks(inode, &map,
   120						    EROFS_GET_BLOCKS_FINDTAIL);
   121			if (map.mpage)
   122				put_page(map.mpage);
   123			if (err < 0)
   124				goto out_unlock;
   125		}
   126	
   127		/* paired with smp_mb() at the beginning of the function */
   128		smp_mb();
   129		set_bit(EROFS_I_Z_INITED_BIT, &vi->flags);
   130	out_unlock:
   131		clear_and_wake_up_bit(EROFS_I_BL_Z_BIT, &vi->flags);
   132		return err;
   133	}
   134	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
