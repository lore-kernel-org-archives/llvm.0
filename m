Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A833C26
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663088691; x=1694624691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDGEdPRUO4pjuYTDmN44JCQv1/d4wy53GyTaUg9S7sk=;
  b=UAGUeIyKm2sqEhoPJiFwab8pcFKNkNsYdLVY1R/OFYvU8bvfw4YSRb3i
   QXVfFVJ1Jthtng3ykzjG0n+L6VGHbGnRrbpSaRBIVi4X4tWv2qNJSxrER
   Sq5FMkWimpcJFBWz4242e/2ZOb8s5rj2srsKpJbATjaML6Kc2oIiw5FW1
   VnEVI2fCA3R67CdNaqQdD660Y1rfy9/h8XFupeCxVclIcIbsHFs+imBVK
   wYJrMP7BzZQX/X9B5a7x99fMPFHqIWzhLCGjDEdb6tvUZjorZHFtCkS4L
   LDcZj9FRY5MO9pQW1tr6LnJm3GDo4lR6btsKSaynatyD45M/HnPYRQm7+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="281211777"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="281211777"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 10:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="945143192"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Sep 2022 10:04:42 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oY9Kz-0003n3-2F;
	Tue, 13 Sep 2022 17:04:41 +0000
Date: Wed, 14 Sep 2022 01:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] f2fs: fix to do sanity check on summary info
Message-ID: <202209140010.CjzPrtP4-lkp@intel.com>
References: <20220913022513.2162885-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913022513.2162885-1-chao@kernel.org>

Hi Chao,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on linus/master v6.0-rc5 next-20220913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-fix-to-do-sanity-check-on-summary-info/20220913-102758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
config: s390-randconfig-r026-20220912 (https://download.01.org/0day-ci/archive/20220914/202209140010.CjzPrtP4-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1f931953416c73680c5315b083e0519499ce43f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chao-Yu/f2fs-fix-to-do-sanity-check-on-summary-info/20220913-102758
        git checkout 1f931953416c73680c5315b083e0519499ce43f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/f2fs/recovery.c:509:17: warning: variable 'ino' is uninitialized when used here [-Wuninitialized]
                           ofs_in_node, ino, nid, max_addrs);
                                        ^~~
   fs/f2fs/f2fs.h:2376:35: note: expanded from macro 'f2fs_err'
           f2fs_printk(sbi, KERN_ERR fmt, ##__VA_ARGS__)
                                            ^~~~~~~~~~~
   fs/f2fs/recovery.c:475:11: note: initialize the variable 'ino' to silence this warning
           nid_t ino, nid;
                    ^
                     = 0
   1 warning generated.


vim +/ino +509 fs/f2fs/recovery.c

   464	
   465	static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
   466				block_t blkaddr, struct dnode_of_data *dn)
   467	{
   468		struct seg_entry *sentry;
   469		unsigned int segno = GET_SEGNO(sbi, blkaddr);
   470		unsigned short blkoff = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
   471		struct f2fs_summary_block *sum_node;
   472		struct f2fs_summary sum;
   473		struct page *sum_page, *node_page;
   474		struct dnode_of_data tdn = *dn;
   475		nid_t ino, nid;
   476		struct inode *inode;
   477		unsigned int offset, ofs_in_node, max_addrs;
   478		block_t bidx;
   479		int i;
   480	
   481		sentry = get_seg_entry(sbi, segno);
   482		if (!f2fs_test_bit(blkoff, sentry->cur_valid_map))
   483			return 0;
   484	
   485		/* Get the previous summary */
   486		for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
   487			struct curseg_info *curseg = CURSEG_I(sbi, i);
   488	
   489			if (curseg->segno == segno) {
   490				sum = curseg->sum_blk->entries[blkoff];
   491				goto got_it;
   492			}
   493		}
   494	
   495		sum_page = f2fs_get_sum_page(sbi, segno);
   496		if (IS_ERR(sum_page))
   497			return PTR_ERR(sum_page);
   498		sum_node = (struct f2fs_summary_block *)page_address(sum_page);
   499		sum = sum_node->entries[blkoff];
   500		f2fs_put_page(sum_page, 1);
   501	got_it:
   502		/* Use the locked dnode page and inode */
   503		nid = le32_to_cpu(sum.nid);
   504		ofs_in_node = le16_to_cpu(sum.ofs_in_node);
   505	
   506		max_addrs = ADDRS_PER_PAGE(dn->node_page, dn->inode);
   507		if (ofs_in_node >= max_addrs) {
   508			f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%u, nid:%u, max:%u",
 > 509				ofs_in_node, ino, nid, max_addrs);
   510			return -EFSCORRUPTED;
   511		}
   512	
   513		if (dn->inode->i_ino == nid) {
   514			tdn.nid = nid;
   515			if (!dn->inode_page_locked)
   516				lock_page(dn->inode_page);
   517			tdn.node_page = dn->inode_page;
   518			tdn.ofs_in_node = ofs_in_node;
   519			goto truncate_out;
   520		} else if (dn->nid == nid) {
   521			tdn.ofs_in_node = ofs_in_node;
   522			goto truncate_out;
   523		}
   524	
   525		/* Get the node page */
   526		node_page = f2fs_get_node_page(sbi, nid);
   527		if (IS_ERR(node_page))
   528			return PTR_ERR(node_page);
   529	
   530		offset = ofs_of_node(node_page);
   531		ino = ino_of_node(node_page);
   532		f2fs_put_page(node_page, 1);
   533	
   534		if (ino != dn->inode->i_ino) {
   535			int ret;
   536	
   537			/* Deallocate previous index in the node page */
   538			inode = f2fs_iget_retry(sbi->sb, ino);
   539			if (IS_ERR(inode))
   540				return PTR_ERR(inode);
   541	
   542			ret = f2fs_dquot_initialize(inode);
   543			if (ret) {
   544				iput(inode);
   545				return ret;
   546			}
   547		} else {
   548			inode = dn->inode;
   549		}
   550	
   551		bidx = f2fs_start_bidx_of_node(offset, inode) +
   552					le16_to_cpu(sum.ofs_in_node);
   553	
   554		/*
   555		 * if inode page is locked, unlock temporarily, but its reference
   556		 * count keeps alive.
   557		 */
   558		if (ino == dn->inode->i_ino && dn->inode_page_locked)
   559			unlock_page(dn->inode_page);
   560	
   561		set_new_dnode(&tdn, inode, NULL, NULL, 0);
   562		if (f2fs_get_dnode_of_data(&tdn, bidx, LOOKUP_NODE))
   563			goto out;
   564	
   565		if (tdn.data_blkaddr == blkaddr)
   566			f2fs_truncate_data_blocks_range(&tdn, 1);
   567	
   568		f2fs_put_dnode(&tdn);
   569	out:
   570		if (ino != dn->inode->i_ino)
   571			iput(inode);
   572		else if (dn->inode_page_locked)
   573			lock_page(dn->inode_page);
   574		return 0;
   575	
   576	truncate_out:
   577		if (f2fs_data_blkaddr(&tdn) == blkaddr)
   578			f2fs_truncate_data_blocks_range(&tdn, 1);
   579		if (dn->inode->i_ino == nid && !dn->inode_page_locked)
   580			unlock_page(dn->inode_page);
   581		return 0;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
