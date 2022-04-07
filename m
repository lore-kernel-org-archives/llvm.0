Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868192100
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649322940; x=1680858940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxRZcjjseRZxzRc0GgEhlUkQ4erBkt8WoK0z5YIVoTU=;
  b=JkQueh72KhKpXkyFtPFvgMmCCXqrP0KJbsWz3d6nKsjcUrdEcGwIRKwh
   3m4ZhcHwJACseKgtuB83bGq5PbuDjxYTiSLuDk7gZYLrN/I3+4hysefVM
   pQno8YGhZfQLUFPoYQw7bgE4wBjUx7qG8pjeYw1RDVrDpEyYiLcPKdK5/
   FrgwQ1UzK52f3Zo5mv35WrxjJeQFa98BhdnKkLYB3PRMcukX9e+ddyoOU
   lvFY3/E6+b+0i9QEUlQ5sjqSpARtbK++8J8dawr+Ysb5ROt0MVxX3hxGZ
   ZdHkS2zW0Bob4s0jcgUDXjkKSC7Q04uYkUmmYXB+0RLCgsKD4xc1Szlv/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="258863934"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="258863934"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 02:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="722886309"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Apr 2022 02:15:37 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncOEr-0005H5-8O;
	Thu, 07 Apr 2022 09:15:37 +0000
Date: Thu, 7 Apr 2022 17:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:for-next/kspp-fam0-uapi 1/1]
 ./usr/include/linux/netfilter/x_tables.h:66:25: warning: field 'target' with
 variable sized type 'struct xt_entry_target' not at the end of a struct or
 class is a GNU extension
Message-ID: <202204071723.D6aqUADV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git for-next/kspp-fam0-uapi
head:   862abfce15c96ae3daa696f8f125ebefbbb76ce7
commit: 862abfce15c96ae3daa696f8f125ebefbbb76ce7 [1/1] treewide: uapi: Replace zero-length arrays with flexible-array members
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220407/202204071723.D6aqUADV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=862abfce15c96ae3daa696f8f125ebefbbb76ce7
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars for-next/kspp-fam0-uapi
        git checkout 862abfce15c96ae3daa696f8f125ebefbbb76ce7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/netfilter/x_tables.h:66:25: warning: field 'target' with variable sized type 'struct xt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct xt_entry_target target;
                                  ^
   ./usr/include/linux/netfilter/x_tables.h:71:25: warning: field 'target' with variable sized type 'struct xt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct xt_entry_target target;
                                  ^
   2 warnings generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/netfilter_ipv6/ip6_tables.h:24:
>> ./usr/include/linux/netfilter/x_tables.h:66:25: warning: field 'target' with variable sized type 'struct xt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct xt_entry_target target;
                                  ^
   ./usr/include/linux/netfilter/x_tables.h:71:25: warning: field 'target' with variable sized type 'struct xt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct xt_entry_target target;
                                  ^
   In file included from <built-in>:1:
>> ./usr/include/linux/netfilter_ipv6/ip6_tables.h:131:20: warning: field 'entry' with variable sized type 'struct ip6t_entry' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ip6t_entry entry;
                             ^
   ./usr/include/linux/netfilter_ipv6/ip6_tables.h:136:20: warning: field 'entry' with variable sized type 'struct ip6t_entry' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ip6t_entry entry;
                             ^
   4 warnings generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/smc_diag.h:7:
>> ./usr/include/rdma/ib_user_verbs.h:436:34: warning: field 'base' with variable sized type 'struct ib_uverbs_create_cq_resp' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ib_uverbs_create_cq_resp base;
                                           ^
>> ./usr/include/rdma/ib_user_verbs.h:644:34: warning: field 'base' with variable sized type 'struct ib_uverbs_create_qp_resp' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ib_uverbs_create_qp_resp base;
                                           ^
>> ./usr/include/rdma/ib_user_verbs.h:740:29: warning: field 'base' with variable sized type 'struct ib_uverbs_modify_qp' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ib_uverbs_modify_qp base;
                                      ^
>> ./usr/include/rdma/ib_user_verbs.h:916:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_eth::(anonymous at ./usr/include/rdma/ib_user_verbs.h:916:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:938:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_ipv4::(anonymous at ./usr/include/rdma/ib_user_verbs.h:938:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:956:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_tcp_udp::(anonymous at ./usr/include/rdma/ib_user_verbs.h:956:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:979:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_ipv6::(anonymous at ./usr/include/rdma/ib_user_verbs.h:979:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:992:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_action_tag::(anonymous at ./usr/include/rdma/ib_user_verbs.h:992:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:1016:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_action_handle::(anonymous at ./usr/include/rdma/ib_user_verbs.h:1016:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:1029:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_action_count::(anonymous at ./usr/include/rdma/ib_user_verbs.h:1029:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:1046:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_tunnel::(anonymous at ./usr/include/rdma/ib_user_verbs.h:1046:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:1064:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_esp::(anonymous at ./usr/include/rdma/ib_user_verbs.h:1064:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:1091:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_gre::(anonymous at ./usr/include/rdma/ib_user_verbs.h:1091:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> ./usr/include/rdma/ib_user_verbs.h:1114:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_mpls::(anonymous at ./usr/include/rdma/ib_user_verbs.h:1114:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
   14 warnings generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/seg6_hmac.h:12:17: warning: field 'tlvhdr' with variable sized type 'struct sr6_tlv' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct sr6_tlv tlvhdr;
                          ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
