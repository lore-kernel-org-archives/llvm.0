Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7A8C0B;
	Tue, 21 Feb 2023 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677008142; x=1708544142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJn1rF4pWC5og0M6rh5cqZjcldr1ptYh0tAPQL4Zk14=;
  b=FPLLA8O3XeRQyxRcjIDPy7S7+6DMhLzG07I5tyh6E2XzQYuEnKBbsQPh
   TkPFpOoZ6Sec+3JI6O2BG6jQD7IDvUhq0Ye9EA/eTt+oV9+1jNUaN1ULS
   xdiiEAbB9VDGoc6LI8PPgsik1kosHbAF4jqhM0Mpf4CXaBBkS9ltklm62
   0N3w5DpFvUeCxKuoXsVQMeY4n3EkYF7oyyx5ZuRWKvOYxlq2IpsXLtsQP
   MGG0OWmv7M4xdBvSXtvSCpoZ1z7P5RCElG9qfnt1IQWwn8bmjPAmul/dG
   R27gDoGXiCw/nTbo7UJqeqtxEPNj+w6Dk5Ce2F6T9BBt66fswy346cBlN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="418956043"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="418956043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 11:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="795633629"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="795633629"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Feb 2023 11:35:39 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUYQM-0000C9-0V;
	Tue, 21 Feb 2023 19:35:38 +0000
Date: Wed, 22 Feb 2023 03:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	David Howells <dhowells@redhat.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-cifs-mm 1/2]
 fs/gfs2/log.c:143:41: error: incompatible function pointer types passing
 'int (struct page *, struct writeback_control *, void *)' to parameter of
 type 'writepage_t' (aka 'int (*)(struct folio *, struct writeback_control *,
 void *)')
Message-ID: <202302220331.y7RwxHvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-cifs-mm
head:   71ad4f67439e60fe04bbf7aed8870e6f83a5d15e
commit: dfb379388e7d018fea286956f77228902c36b7c2 [1/2] Merge remote-tracking branch 'cifs/for-next' into iov-cifs-mm
config: x86_64-randconfig-r013-20230220 (https://download.01.org/0day-ci/archive/20230222/202302220331.y7RwxHvB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/dfb379388e7d018fea286956f77228902c36b7c2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-cifs-mm
        git checkout dfb379388e7d018fea286956f77228902c36b7c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/gfs2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220331.y7RwxHvB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/gfs2/log.c:143:41: error: incompatible function pointer types passing 'int (struct page *, struct writeback_control *, void *)' to parameter of type 'writepage_t' (aka 'int (*)(struct folio *, struct writeback_control *, void *)') [-Werror,-Wincompatible-function-pointer-types]
                   ret = write_cache_pages(mapping, wbc, __gfs2_writepage, mapping);
                                                         ^~~~~~~~~~~~~~~~
   include/linux/writeback.h:375:52: note: passing argument to parameter 'writepage' here
                         struct writeback_control *wbc, writepage_t writepage,
                                                                    ^
   1 error generated.


vim +143 fs/gfs2/log.c

95ecbd0f162fc0 Andreas Gruenbacher     2023-01-19   91  
ddacfaf76dd620 Steven Whitehouse       2006-10-03   92  /**
c551f66c5dfefd Lee Jones               2021-03-30   93   * gfs2_ail1_start_one - Start I/O on a transaction
c551f66c5dfefd Lee Jones               2021-03-30   94   * @sdp: The superblock
4667a0ec328678 Steven Whitehouse       2011-04-18   95   * @wbc: The writeback control structure
c551f66c5dfefd Lee Jones               2021-03-30   96   * @tr: The transaction to start I/O on
c551f66c5dfefd Lee Jones               2021-03-30   97   * @plug: The block plug currently active
ddacfaf76dd620 Steven Whitehouse       2006-10-03   98   */
ddacfaf76dd620 Steven Whitehouse       2006-10-03   99  
4f1de018215fb5 Steven Whitehouse       2011-04-26  100  static int gfs2_ail1_start_one(struct gfs2_sbd *sdp,
4667a0ec328678 Steven Whitehouse       2011-04-18  101  			       struct writeback_control *wbc,
17d77684088510 Bob Peterson            2021-02-18  102  			       struct gfs2_trans *tr, struct blk_plug *plug)
d6a079e82efd5f Dave Chinner            2011-03-11  103  __releases(&sdp->sd_ail_lock)
d6a079e82efd5f Dave Chinner            2011-03-11  104  __acquires(&sdp->sd_ail_lock)
ddacfaf76dd620 Steven Whitehouse       2006-10-03  105  {
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  106  	struct gfs2_glock *gl = NULL;
4667a0ec328678 Steven Whitehouse       2011-04-18  107  	struct address_space *mapping;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  108  	struct gfs2_bufdata *bd, *s;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  109  	struct buffer_head *bh;
b1676cbb11153b Bob Peterson            2019-11-13  110  	int ret = 0;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  111  
16ca9412d80181 Benjamin Marzinski      2013-04-05  112  	list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list, bd_ail_st_list) {
ddacfaf76dd620 Steven Whitehouse       2006-10-03  113  		bh = bd->bd_bh;
ddacfaf76dd620 Steven Whitehouse       2006-10-03  114  
16ca9412d80181 Benjamin Marzinski      2013-04-05  115  		gfs2_assert(sdp, bd->bd_tr == tr);
ddacfaf76dd620 Steven Whitehouse       2006-10-03  116  
ddacfaf76dd620 Steven Whitehouse       2006-10-03  117  		if (!buffer_busy(bh)) {
30fe70a85a909a Bob Peterson            2019-11-13  118  			if (buffer_uptodate(bh)) {
30fe70a85a909a Bob Peterson            2019-11-13  119  				list_move(&bd->bd_ail_st_list,
30fe70a85a909a Bob Peterson            2019-11-13  120  					  &tr->tr_ail2_list);
30fe70a85a909a Bob Peterson            2019-11-13  121  				continue;
30fe70a85a909a Bob Peterson            2019-11-13  122  			}
036330c914365f Bob Peterson            2019-04-10  123  			if (!cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
ddacfaf76dd620 Steven Whitehouse       2006-10-03  124  				gfs2_io_error_bh(sdp, bh);
69511080bd6efd Bob Peterson            2019-02-12  125  				gfs2_withdraw_delayed(sdp);
9e1a9ecd13b9bb Andreas Gruenbacher     2018-06-07  126  			}
ddacfaf76dd620 Steven Whitehouse       2006-10-03  127  		}
ddacfaf76dd620 Steven Whitehouse       2006-10-03  128  
30fe70a85a909a Bob Peterson            2019-11-13  129  		if (gfs2_withdrawn(sdp)) {
30fe70a85a909a Bob Peterson            2019-11-13  130  			gfs2_remove_from_ail(bd);
30fe70a85a909a Bob Peterson            2019-11-13  131  			continue;
30fe70a85a909a Bob Peterson            2019-11-13  132  		}
ddacfaf76dd620 Steven Whitehouse       2006-10-03  133  		if (!buffer_dirty(bh))
ddacfaf76dd620 Steven Whitehouse       2006-10-03  134  			continue;
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  135  		if (gl == bd->bd_gl)
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  136  			continue;
5ac048bb7ea6e8 Steven Whitehouse       2011-03-30  137  		gl = bd->bd_gl;
16ca9412d80181 Benjamin Marzinski      2013-04-05  138  		list_move(&bd->bd_ail_st_list, &tr->tr_ail1_list);
11551cf15ecc17 Matthew Wilcox (Oracle  2022-12-15  139) 		mapping = bh->b_folio->mapping;
4f1de018215fb5 Steven Whitehouse       2011-04-26  140  		if (!mapping)
4f1de018215fb5 Steven Whitehouse       2011-04-26  141  			continue;
d6a079e82efd5f Dave Chinner            2011-03-11  142  		spin_unlock(&sdp->sd_ail_lock);
95ecbd0f162fc0 Andreas Gruenbacher     2023-01-19 @143  		ret = write_cache_pages(mapping, wbc, __gfs2_writepage, mapping);
17d77684088510 Bob Peterson            2021-02-18  144  		if (need_resched()) {
17d77684088510 Bob Peterson            2021-02-18  145  			blk_finish_plug(plug);
17d77684088510 Bob Peterson            2021-02-18  146  			cond_resched();
17d77684088510 Bob Peterson            2021-02-18  147  			blk_start_plug(plug);
17d77684088510 Bob Peterson            2021-02-18  148  		}
d6a079e82efd5f Dave Chinner            2011-03-11  149  		spin_lock(&sdp->sd_ail_lock);
4e79e3f08e576a Bob Peterson            2020-11-12  150  		if (ret == -ENODATA) /* if a jdata write into a new hole */
4e79e3f08e576a Bob Peterson            2020-11-12  151  			ret = 0; /* ignore it */
b1676cbb11153b Bob Peterson            2019-11-13  152  		if (ret || wbc->nr_to_write <= 0)
4667a0ec328678 Steven Whitehouse       2011-04-18  153  			break;
b1676cbb11153b Bob Peterson            2019-11-13  154  		return -EBUSY;
4667a0ec328678 Steven Whitehouse       2011-04-18  155  	}
4f1de018215fb5 Steven Whitehouse       2011-04-26  156  
b1676cbb11153b Bob Peterson            2019-11-13  157  	return ret;
4667a0ec328678 Steven Whitehouse       2011-04-18  158  }
ddacfaf76dd620 Steven Whitehouse       2006-10-03  159  

:::::: The code at line 143 was first introduced by commit
:::::: 95ecbd0f162fc06ef4c4045a66f653f47b62a2d3 Revert "gfs2: stop using generic_writepages in gfs2_ail1_start_one"

:::::: TO: Andreas Gruenbacher <agruenba@redhat.com>
:::::: CC: Andreas Gruenbacher <agruenba@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
