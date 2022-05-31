Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B6320F8
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 05:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653976260; x=1685512260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5tbc2dUXSrDblMPikE6E/hurK+/ZWfHmH0eI55lgG9A=;
  b=oECwbMbbn1+sgeol2xz2cnJfdreBpCx9JChJTNpZro9SgiV13WtUUHYT
   Kdsb3+wVC2b1cKwc6ib78sXKbQQnbc0Qb2aCoIdF76zF6R4ls1STYqG7Q
   dF6a0l/3xEHVtV6IR0aGfVF3zbbvu8PONinjWSRNP/pGT++j+/zywFNr5
   DgYp08PLIJHGu8VXxLP+OYJ5yzBphwZ6/CenFpwgl5bFsCmTAg3yDJ+V+
   Lu4xmi17j81GN9aPgb0VM/rdbYdB5O7BJfhcwfFDnGwafgtXoP/IuP57V
   1wBPh2kCp16MJiMn3QUQeXUS+CCu9zVmkovLhxeMzvhj/nfIjMJHyalMT
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="361523247"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="361523247"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 22:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="720160579"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 May 2022 22:50:58 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvumP-0002Nw-Ab;
	Tue, 31 May 2022 05:50:57 +0000
Date: Tue, 31 May 2022 13:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>
Subject: [ceph-client:wip-fscrypt 6/64] net/ceph/osd_client.c:5702:51: error:
 too many arguments to function call, expected 3, have 4
Message-ID: <202205311337.ZFkD1cPR-lkp@intel.com>
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
commit: 0614a83e4f104460d5bdb8ba414ab69b8fdbdb39 [6/64] libceph: add sparse read support to OSD client
config: arm64-buildonly-randconfig-r002-20220531 (https://download.01.org/0day-ci/archive/20220531/202205311337.ZFkD1cPR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ceph/ceph-client/commit/0614a83e4f104460d5bdb8ba414ab69b8fdbdb39
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client wip-fscrypt
        git checkout 0614a83e4f104460d5bdb8ba414ab69b8fdbdb39
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash net/ceph/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/ceph/osd_client.c:5702:51: error: too many arguments to function call, expected 3, have 4
                   page = ceph_msg_data_next(cursor, &poff, &plen, &last);
                          ~~~~~~~~~~~~~~~~~~                       ^~~~~
   include/linux/ceph/messenger.h:527:14: note: 'ceph_msg_data_next' declared here
   struct page *ceph_msg_data_next(struct ceph_msg_data_cursor *cursor,
                ^
   1 error generated.


vim +5702 net/ceph/osd_client.c

  5694	
  5695	static void advance_cursor(struct ceph_msg_data_cursor *cursor, size_t len, bool zero)
  5696	{
  5697		while (len) {
  5698			struct page *page;
  5699			size_t poff, plen;
  5700			bool last = false;
  5701	
> 5702			page = ceph_msg_data_next(cursor, &poff, &plen, &last);
  5703			if (plen > len)
  5704				plen = len;
  5705			if (zero)
  5706				zero_user_segment(page, poff, poff + plen);
  5707			len -= plen;
  5708			ceph_msg_data_advance(cursor, plen);
  5709		}
  5710	}
  5711	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
