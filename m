Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA986AAF
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 19:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645645016; x=1677181016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28eVFkMm3SOoNUQ1iwI8a71le4xUQriqCX4Mto4jfSA=;
  b=aYunqQZllSJN9A2+nSG1q6Pu3k7gTmg1kUGW+w5hlRdPmxowr1lCnS3m
   gNbddmQqLMfdL8su3r6vBBCaGCI4Qr02BU+7N9jT0dWeHL6Zhfd8xxjnX
   3NT+v8RUBuZFM8Xu9BAi/KHzq1hM/ZDgZi9Zr/eyNzxVWGu4ruxUQ77Wv
   GlO/0i03N9hNsOHg+Hx/cFj9a2UtoZsJYH5DvTJkHByqLST93vpGbBUEG
   US+qEcB7f25kfaaCN9ViZYW2Cv+TBeSyi0I2xIiWllpozXqwFhwe9zicW
   gOrqqMSJR9RCkXwEhURUf3bXqBSFwht1V7iwTQiFRZdqHiqa5BezWhSBw
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232686537"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="232686537"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 11:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="491331805"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2022 11:36:45 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMxRM-0001kH-Ph; Wed, 23 Feb 2022 19:36:44 +0000
Date: Thu, 24 Feb 2022 03:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2233/2340] net/ceph/messenger_v1.c:1066:3:
 error: implicit declaration of function 'memcpy_to_page'
Message-ID: <202202240347.8dLJwUNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   97c5eeb4de3ad324ed2a4656b46465299cfd010a
commit: 7134c56595f0f35bb1f17fcbf4dcca28c52b8ae8 [2233/2340] headers/deps: mm: Introduce <linux/highmem_extra.h> for rarely used APIs
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220224/202202240347.8dLJwUNW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=7134c56595f0f35bb1f17fcbf4dcca28c52b8ae8
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 7134c56595f0f35bb1f17fcbf4dcca28c52b8ae8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/sched/headers HEAD 97c5eeb4de3ad324ed2a4656b46465299cfd010a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> net/ceph/messenger_v1.c:1066:3: error: implicit declaration of function 'memcpy_to_page' [-Werror,-Wimplicit-function-declaration]
                   memcpy_to_page(page, off, page_address(con->bounce_page), ret);
                   ^
   net/ceph/messenger_v1.c:1066:3: note: did you mean 'memcpy_to_msg'?
   include/linux/skbuff_api.h:2215:19: note: 'memcpy_to_msg' declared here
   static inline int memcpy_to_msg(struct msghdr *msg, void *data, int len)
                     ^
   1 error generated.
--
>> net/ceph/messenger_v2.c:1805:3: error: implicit declaration of function 'memcpy_to_page' [-Werror,-Wimplicit-function-declaration]
                   memcpy_to_page(bv.bv_page, bv.bv_offset,
                   ^
   net/ceph/messenger_v2.c:1805:3: note: did you mean 'memcpy_to_msg'?
   include/linux/skbuff_api.h:2215:19: note: 'memcpy_to_msg' declared here
   static inline int memcpy_to_msg(struct msghdr *msg, void *data, int len)
                     ^
   1 error generated.


vim +/memcpy_to_page +1066 net/ceph/messenger_v1.c

2f713615ddd9d8 Ilya Dryomov 2020-11-12  1034  
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1035  static int read_partial_msg_data_bounce(struct ceph_connection *con)
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1036  {
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1037  	struct ceph_msg_data_cursor *cursor = &con->in_msg->cursor;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1038  	struct page *page;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1039  	size_t off, len;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1040  	u32 crc;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1041  	int ret;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1042  
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1043  	if (unlikely(!con->bounce_page)) {
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1044  		con->bounce_page = alloc_page(GFP_NOIO);
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1045  		if (!con->bounce_page) {
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1046  			pr_err("failed to allocate bounce page\n");
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1047  			return -ENOMEM;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1048  		}
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1049  	}
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1050  
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1051  	crc = con->in_data_crc;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1052  	while (cursor->total_resid) {
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1053  		if (!cursor->resid) {
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1054  			ceph_msg_data_advance(cursor, 0);
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1055  			continue;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1056  		}
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1057  
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1058  		page = ceph_msg_data_next(cursor, &off, &len, NULL);
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1059  		ret = ceph_tcp_recvpage(con->sock, con->bounce_page, 0, len);
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1060  		if (ret <= 0) {
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1061  			con->in_data_crc = crc;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1062  			return ret;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1063  		}
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1064  
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1065  		crc = crc32c(crc, page_address(con->bounce_page), ret);
038b8d1d1ab1cc Ilya Dryomov 2021-12-30 @1066  		memcpy_to_page(page, off, page_address(con->bounce_page), ret);
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1067  
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1068  		ceph_msg_data_advance(cursor, ret);
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1069  	}
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1070  	con->in_data_crc = crc;
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1071  
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1072  	return 1;	/* must return > 0 to indicate success */
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1073  }
038b8d1d1ab1cc Ilya Dryomov 2021-12-30  1074  

:::::: The code at line 1066 was first introduced by commit
:::::: 038b8d1d1ab1cce11a158d30bf080ff41a2cfd15 libceph: optionally use bounce buffer on recv path in crc mode

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
