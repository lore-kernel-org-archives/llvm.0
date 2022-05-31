Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40120FC
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653983825; x=1685519825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blAnd/CwLvYq8vuBHY6+jp83ZrdFmvIGwKowYFS60Ro=;
  b=jpJCc7jGDe+wLGUEXOZhVAiI1oDP69x4f2FDIvr6gSBGu23MvU7LwsE8
   HM7tof7wjZSKqUT7DUaAAUTQgfgiAsvYLV3nBafTg9ZebRLJW1moOQlkU
   +xFPtjYd0IxHWQV1L3hRKoVyByooq7Run1XNcPdOojSJB/1rC7DqtFTrB
   HTYiO/G/7FrsYcWJrl3YnNZ1eg/Pe/Bh3Jqykz4LzToRlWC/WMOKwlqq+
   IgMZ4wZw59BwsUqTYfyluoDj0rpOcBQbI/DSQtktz1awtTpgB2BPgGEcT
   g/2wVkekX8mxUxdnzRxb7kSp7n4/FS8qQviypfRBsruJ/PZYJ5+g9WKMn
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="262806860"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="262806860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 00:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="706464540"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 May 2022 00:57:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvwkQ-0002Ur-By;
	Tue, 31 May 2022 07:57:02 +0000
Date: Tue, 31 May 2022 15:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>
Subject: [ceph-client:wip-fscrypt 8/64] net/ceph/messenger_v1.c:1019:49:
 error: too many arguments to function call, expected 3, have 4
Message-ID: <202205311559.ghi4Hs9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git wip-fscrypt
head:   4a13fcc148c64143afe231bd0cae743b89c70177
commit: 2c136200054ea17849153ac4f55fe2abc99ee34e [8/64] libceph: add sparse read support to msgr1
config: arm64-buildonly-randconfig-r002-20220531 (https://download.01.org/0day-ci/archive/20220531/202205311559.ghi4Hs9C-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ceph/ceph-client/commit/2c136200054ea17849153ac4f55fe2abc99ee34e
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client wip-fscrypt
        git checkout 2c136200054ea17849153ac4f55fe2abc99ee34e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash net/ceph/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/ceph/messenger_v1.c:1019:49: error: too many arguments to function call, expected 3, have 4
                   page = ceph_msg_data_next(cursor, &off, &len, NULL);
                          ~~~~~~~~~~~~~~~~~~                     ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   include/linux/ceph/messenger.h:531:14: note: 'ceph_msg_data_next' declared here
   struct page *ceph_msg_data_next(struct ceph_msg_data_cursor *cursor,
                ^
   1 error generated.


vim +1019 net/ceph/messenger_v1.c

  1000	
  1001	static int read_sparse_msg_extent(struct ceph_connection *con, u32 *crc)
  1002	{
  1003		struct ceph_msg_data_cursor *cursor = &con->in_msg->cursor;
  1004		bool do_bounce = ceph_test_opt(from_msgr(con->msgr), RXBOUNCE);
  1005	
  1006		if (do_bounce && unlikely(!con->bounce_page)) {
  1007			con->bounce_page = alloc_page(GFP_NOIO);
  1008			if (!con->bounce_page) {
  1009				pr_err("failed to allocate bounce page\n");
  1010				return -ENOMEM;
  1011			}
  1012		}
  1013	
  1014		while (cursor->sr_resid > 0) {
  1015			struct page *page, *rpage;
  1016			size_t off, len;
  1017			int ret;
  1018	
> 1019			page = ceph_msg_data_next(cursor, &off, &len, NULL);
  1020			rpage = do_bounce ? con->bounce_page : page;
  1021	
  1022			/* clamp to what remains in extent */
  1023			len = min_t(int, len, cursor->sr_resid);
  1024			ret = ceph_tcp_recvpage(con->sock, rpage, (int)off, len);
  1025			if (ret <= 0)
  1026				return ret;
  1027			*crc = ceph_crc32c_page(*crc, rpage, off, ret);
  1028			ceph_msg_data_advance(cursor, (size_t)ret);
  1029			cursor->sr_resid -= ret;
  1030			if (do_bounce)
  1031				memcpy_page(page, off, rpage, off, ret);
  1032		}
  1033		return 1;
  1034	}
  1035	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
