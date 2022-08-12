Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC2138C
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660316690; x=1691852690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xtqehn2jqKyu0+Re9kL0AWZ6gXaqxuj5FPfav9EaBmo=;
  b=UBQbtBzGRnvmxoRdo0NlYOlhISNWiJYt4rjBRjf3Tl1MAxQ75mvuEUyE
   TOIfn9GFUzpvU9dornCYJAMMdcWthyGkarbBH9IgrP6n/BF3NK9WWIPcU
   G4sz8Yh+x7n9JJn0QhdZFy4o3ImelGOBn4ahTb1mU6xz4be8lrOlYPr9X
   Mm3wY712wz4yJ3Pqai3xlYIi+f9pWXwGaMmibj2AVgxWfZ7qtUs8SVUbc
   f8yrkPJOsmITtGu0WLfatdb3EBuDmZ4QmqEjI0sF1xBwGPAJ2RrOCeY4X
   hACT06F+RBylEB0MWAHFQ6eLWPKmyLihhJW49LgmeBfm1GBI2y6U1xwp9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="292876358"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="292876358"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 08:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="748218850"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2022 08:04:46 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMWDO-0000fD-0u;
	Fri, 12 Aug 2022 15:04:46 +0000
Date: Fri, 12 Aug 2022 23:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:totally-untested/remaining-fam0 2/2]
 ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field
 'target' with variable sized type 'struct ebt_entry_target' not at the end
 of a struct or class is a GNU extension
Message-ID: <202208122201.SveGt1yt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git totally-untested/remaining-fam0
head:   b0684d2f714f4ae515c283697c48d14e3ccef21b
commit: b0684d2f714f4ae515c283697c48d14e3ccef21b [2/2] totally-untested: remaining zero-length arrays in structs in next-20220811
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220812/202208122201.SveGt1yt-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=b0684d2f714f4ae515c283697c48d14e3ccef21b
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars totally-untested/remaining-fam0
        git checkout b0684d2f714f4ae515c283697c48d14e3ccef21b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field 'target' with variable sized type 'struct ebt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ebt_entry_target target;
                                   ^
   1 warning generated.
--
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
   In file included from ./usr/include/rdma/ib_user_ioctl_verbs.h:38:
>> usr/include/rdma/ib_user_verbs.h:436:34: warning: field 'base' with variable sized type 'struct ib_uverbs_create_cq_resp' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ib_uverbs_create_cq_resp base;
                                           ^
>> usr/include/rdma/ib_user_verbs.h:644:34: warning: field 'base' with variable sized type 'struct ib_uverbs_create_qp_resp' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ib_uverbs_create_qp_resp base;
                                           ^
>> usr/include/rdma/ib_user_verbs.h:740:29: warning: field 'base' with variable sized type 'struct ib_uverbs_modify_qp' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ib_uverbs_modify_qp base;
                                      ^
>> usr/include/rdma/ib_user_verbs.h:916:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_eth::(anonymous at usr/include/rdma/ib_user_verbs.h:916:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:938:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_ipv4::(anonymous at usr/include/rdma/ib_user_verbs.h:938:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:956:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_tcp_udp::(anonymous at usr/include/rdma/ib_user_verbs.h:956:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:979:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_ipv6::(anonymous at usr/include/rdma/ib_user_verbs.h:979:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:992:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_action_tag::(anonymous at usr/include/rdma/ib_user_verbs.h:992:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:1016:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_action_handle::(anonymous at usr/include/rdma/ib_user_verbs.h:1016:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:1029:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_action_count::(anonymous at usr/include/rdma/ib_user_verbs.h:1029:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:1046:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_tunnel::(anonymous at usr/include/rdma/ib_user_verbs.h:1046:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:1064:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_esp::(anonymous at usr/include/rdma/ib_user_verbs.h:1064:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:1091:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_gre::(anonymous at usr/include/rdma/ib_user_verbs.h:1091:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
>> usr/include/rdma/ib_user_verbs.h:1114:2: warning: field '' with variable sized type 'union ib_uverbs_flow_spec_mpls::(anonymous at usr/include/rdma/ib_user_verbs.h:1114:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           union {
           ^
   14 warnings generated.
--
   In file included from <built-in>:1:
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
   In file included from ./usr/include/linux/netfilter_ipv6/ip6_tables.h:24:
   usr/include/linux/netfilter/x_tables.h:66:25: warning: field 'target' with variable sized type 'struct xt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct xt_entry_target target;
                                  ^
   usr/include/linux/netfilter/x_tables.h:71:25: warning: field 'target' with variable sized type 'struct xt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
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
>> ./usr/include/linux/seg6_hmac.h:12:17: warning: field 'tlvhdr' with variable sized type 'struct sr6_tlv' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct sr6_tlv tlvhdr;
                          ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
