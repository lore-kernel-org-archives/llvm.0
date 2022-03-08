Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE1048D0
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646744124; x=1678280124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZFVatCUIH69Wx4sEnbEXQTcA3kQ6zoxIkVnuhR2T3JY=;
  b=SStB/3RSgYavLoXNRHo6nl2kcL68zhkXjfwPyt+ERfiDjSW/eqyQ7MPp
   /fUf4vTh6hn6emvCyhTLnx9er5zMcWKbWOxt9TQBSGK/WHzYSDFRW8BvD
   jxOg357XlL2saRMl+o8Cadm5114kKwCGB+5kiKQrBCkvKbI7eFYhsK/Nu
   qlwWQGtf0taY6BKA+y+7/8Vd4Rl8WBYffWBzI3bTAIRTFpNsTwgL+23E9
   A+f4tjYYdvdn2UEirjazr+hmKLnOzwzqPeZMeIvEhAUTqWgQyvi25rotO
   8iRM3dyEt1hMYN7Q+KwdvCpbKsFZ2gA+w/pUbgn/UnzNTITSpyZz++iQD
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="235284443"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="235284443"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 04:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="610995764"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2022 04:55:22 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRZN3-0001P3-Uy; Tue, 08 Mar 2022 12:55:21 +0000
Date: Tue, 8 Mar 2022 20:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [netfilter-nf-next:testing 13/16]
 include/net/netfilter/nf_conntrack_extend.h:80:21: error: use of undeclared
 identifier 'NF_CT_EXT_LABELS'
Message-ID: <202203082057.NDl4sAYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
head:   25cd959c0ff9a7d226b95faf21988bf8f986d81e
commit: 267a989cb33fc2e38b9fa8855a107100257a8882 [13/16] netfilter: extensions: introduce extension genid count
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220308/202203082057.NDl4sAYU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git/commit/?id=267a989cb33fc2e38b9fa8855a107100257a8882
        git remote add netfilter-nf-next git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git
        git fetch --no-tags netfilter-nf-next testing
        git checkout 267a989cb33fc2e38b9fa8855a107100257a8882
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/netfilter/nf_conntrack_core.c:40:
   In file included from include/net/netfilter/nf_conntrack_helper.h:15:
>> include/net/netfilter/nf_conntrack_extend.h:80:21: error: use of undeclared identifier 'NF_CT_EXT_LABELS'
           BUILD_BUG_ON(id != NF_CT_EXT_LABELS);
                              ^
   1 error generated.
--
   In file included from net/netfilter/nf_nat_core.c:20:
   In file included from include/net/netfilter/nf_conntrack_core.h:18:
   In file included from include/net/netfilter/nf_conntrack_ecache.h:14:
>> include/net/netfilter/nf_conntrack_extend.h:80:21: error: use of undeclared identifier 'NF_CT_EXT_LABELS'; did you mean 'NFT_CT_LABELS'?
           BUILD_BUG_ON(id != NF_CT_EXT_LABELS);
                              ^~~~~~~~~~~~~~~~
                              NFT_CT_LABELS
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
                            ^
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^
   include/linux/compiler_types.h:349:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^
   include/linux/compiler_types.h:337:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^
   include/linux/compiler_types.h:329:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/uapi/linux/netfilter/nf_tables.h:1095:2: note: 'NFT_CT_LABELS' declared here
           NFT_CT_LABELS,
           ^
   1 error generated.


vim +/NF_CT_EXT_LABELS +80 include/net/netfilter/nf_conntrack_extend.h

    69	
    70	/* like nf_ct_ext_find, but no check of ext->gen_id.
    71	 *
    72	 * Can only be used for extensions that do not store any pointers
    73	 * to external data, and should only be used from core kernel code
    74	 * that cannot use symbols exported by nf_conntrack module.
    75	 */
    76	static __always_inline void *nf_ct_ext_find_unsafe(const struct nf_conn *ct, u8 id)
    77	{
    78		struct nf_ct_ext *ext = ct->ext;
    79	
  > 80		BUILD_BUG_ON(id != NF_CT_EXT_LABELS);
    81	
    82		if (!ext || !__nf_ct_ext_exist(ext, id))
    83			return NULL;
    84	
    85		return (void *)ct->ext + ct->ext->offset[id];
    86	}
    87	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
