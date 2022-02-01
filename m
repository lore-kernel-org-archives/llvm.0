Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478572C9E
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 04:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643690299; x=1675226299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZQB9I0NhR5pbxfa5F4MEMcztxDxXT6iwabpzVfIaak=;
  b=LH2xan/sdUFPX9T6cXvuRmHPcAtXKD5aqkx69ldh4tvI/CfGN0wTRdLZ
   ykA4W1ziQRUCksos+Qup/w+6038D57YIsnRCqUtGwXQife6+zisw31pTZ
   ms8F1dv8c+p8oZrW07GzRrPMEQyL9LL+Ov+dQ4UdD0x2ZodVvIhdVfN2M
   v6PY+W6rWyMVjjNlG0dzuPVXpcxIvHcKjZs9mc66uHNTQh9gexVNOiJ4t
   JiPnlKB5RTnsrFE9iPjopUoSJ11DPniCADeVL/HoZFs//NRHvW3svxHeX
   YQVHopLjLqEPxzQ6l9emFXaYKeAzckYpCr17b738zCjbTdViPNKCmK2Te
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247388337"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="247388337"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 20:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="582914961"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2022 20:38:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEkvo-000Sme-Iz; Tue, 01 Feb 2022 04:38:16 +0000
Date: Tue, 1 Feb 2022 12:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jlayton:ceph-fscrypt 53/54] net/ceph/messenger.c:1122:16: warning:
 comparison of distinct pointer types ('typeof (bytes) *' (aka 'unsigned int
 *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *'))
Message-ID: <202202011252.GlKY0IdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ceph-fscrypt
head:   14cb86455b249f05d1b11dbab353e33f4fad6a5a
commit: 7e935aa6d4c23a6bcbd27a28c4f5457885c9ae98 [53/54] libceph: allow ceph_msg_data_advance to advance more than a page
config: i386-randconfig-r013-20220131 (https://download.01.org/0day-ci/archive/20220201/202202011252.GlKY0IdE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=7e935aa6d4c23a6bcbd27a28c4f5457885c9ae98
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ceph-fscrypt
        git checkout 7e935aa6d4c23a6bcbd27a28c4f5457885c9ae98
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ceph/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ceph/messenger.c:1122:16: warning: comparison of distinct pointer types ('typeof (bytes) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   size_t cur = min(bytes, PAGE_SIZE);
                                ^~~~~~~~~~~~~~~~~~~~~
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


vim +1122 net/ceph/messenger.c

  1118	
  1119	void ceph_msg_data_advance(struct ceph_msg_data_cursor *cursor, size_t bytes)
  1120	{
  1121		while (bytes) {
> 1122			size_t cur = min(bytes, PAGE_SIZE);
  1123	
  1124			__ceph_msg_data_advance(cursor, cur);
  1125			bytes -= cur;
  1126		}
  1127	}
  1128	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
