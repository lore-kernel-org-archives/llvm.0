Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D45179
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 00:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661732324; x=1693268324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qB6gKtXOqNWIHpB07UtKDiu3sY+LF5pNHGp1Fsam19o=;
  b=mq6xZF3T4Dstsuaw6+dIb0yNxkTtpEE/fsQoudy4CYT8W3S/kSde6lRS
   2UyTmUkj6GSDRRJsF9MgP1kJwCk5SyoCluQlsL5a28BxcjibpyvcghZcU
   15a9x7CQQ19786JqujFZoHn+zePl1rR0XclEm/2idmjgEcA4qBgwG/eGL
   oavGQLX3UScgpIpCuurXJ6SO8D9P0inRQzeOiqUp17Gn7UnzsW+8IA2as
   ZxMYMI5u1MNIvieBs0rT2bmZYaBKOioh6iVbxmV+sKzjYnsKP7JvOFb4j
   EA56vT2JT9ukxODYQDzIF+jt9T012BYTz/kRGMhSpBXX1gbQl6OWdNsT/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="295557297"
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="295557297"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 17:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="939386877"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2022 17:18:42 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSSUD-0001lf-1T;
	Mon, 29 Aug 2022 00:18:41 +0000
Date: Mon, 29 Aug 2022 08:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Wysochanski <dwysocha@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 3/3] NFS: Convert buffered read paths to use netfs
 when fscache is enabled
Message-ID: <202208290826.WotYz4ZM-lkp@intel.com>
References: <20220828203913.956306-4-dwysocha@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220828203913.956306-4-dwysocha@redhat.com>

Hi Dave,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v6.0-rc2]
[also build test WARNING on linus/master next-20220826]
[cannot apply to trondmy-nfs/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Wysochanski/Convert-NFS-with-fscache-to-the-netfs-API/20220829-044110
base:    1c23f9e627a7b412978b4e852793c5e3c3efc555
config: i386-randconfig-a014-20220829 (https://download.01.org/0day-ci/archive/20220829/202208290826.WotYz4ZM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3c0431802baaa9bc2065d84310f2771a76c4351c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dave-Wysochanski/Convert-NFS-with-fscache-to-the-netfs-API/20220829-044110
        git checkout 3c0431802baaa9bc2065d84310f2771a76c4351c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nfs/read.c:113:16: warning: unused variable 'inode' [-Wunused-variable]
           struct inode *inode = d_inode(nfs_req_openctx(req)->dentry);
                         ^
   1 warning generated.


vim +/inode +113 fs/nfs/read.c

493292ddc78d18 Trond Myklebust  2011-07-13  110  
8f54c7a4babf58 Trond Myklebust  2019-08-15  111  static void nfs_readpage_release(struct nfs_page *req, int error)
0bcbf039f6b2bc Peng Tao         2015-12-05  112  {
9fcd5960e88bbd Trond Myklebust  2019-04-07 @113  	struct inode *inode = d_inode(nfs_req_openctx(req)->dentry);
8f54c7a4babf58 Trond Myklebust  2019-08-15  114  	struct page *page = req->wb_page;
0bcbf039f6b2bc Peng Tao         2015-12-05  115  
0bcbf039f6b2bc Peng Tao         2015-12-05  116  	dprintk("NFS: read done (%s/%llu %d@%lld)\n", inode->i_sb->s_id,
0bcbf039f6b2bc Peng Tao         2015-12-05  117  		(unsigned long long)NFS_FILEID(inode), req->wb_bytes,
0bcbf039f6b2bc Peng Tao         2015-12-05  118  		(long long)req_offset(req));
0bcbf039f6b2bc Peng Tao         2015-12-05  119  
8f54c7a4babf58 Trond Myklebust  2019-08-15  120  	if (nfs_error_is_fatal_on_server(error) && error != -ETIMEDOUT)
8f54c7a4babf58 Trond Myklebust  2019-08-15  121  		SetPageError(page);
3c0431802baaa9 Dave Wysochanski 2022-08-28  122  	if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE))
3c0431802baaa9 Dave Wysochanski 2022-08-28  123  #ifndef CONFIG_NFS_FSCACHE
8f54c7a4babf58 Trond Myklebust  2019-08-15  124  		unlock_page(page);
3c0431802baaa9 Dave Wysochanski 2022-08-28  125  #else
3c0431802baaa9 Dave Wysochanski 2022-08-28  126  		/*
3c0431802baaa9 Dave Wysochanski 2022-08-28  127  		 * If fscache is enabled, netfs will unlock pages.
3c0431802baaa9 Dave Wysochanski 2022-08-28  128  		 * Otherwise, we have to unlock the page here
3c0431802baaa9 Dave Wysochanski 2022-08-28  129  		 */
3c0431802baaa9 Dave Wysochanski 2022-08-28  130  		if (!netfs_inode(inode)->cache)
3c0431802baaa9 Dave Wysochanski 2022-08-28  131  			unlock_page(page);
3c0431802baaa9 Dave Wysochanski 2022-08-28  132  #endif
0bcbf039f6b2bc Peng Tao         2015-12-05  133  	nfs_release_request(req);
0bcbf039f6b2bc Peng Tao         2015-12-05  134  }
0bcbf039f6b2bc Peng Tao         2015-12-05  135  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
