Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA24C95
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 23:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655507760; x=1687043760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3HtJUaL6AK+hQVPvouGgMZ1sHbLrkehe8G2v8dPZwQs=;
  b=FfIC5bEdvtL+4T5QqAo5K99TQW3ti7t3L8B3AijedYLL1rB0nsCUjUf8
   s9z7sBaZsaNm9mDSLHLM4gJCLldMvjQfzmCLK0fhmoq9lV4JWHCmuXJ4h
   YXGd5JFvQXQmbh66znVfJrA+LvZB4UZ2uOooXj6/WZaDXk03NqT2AYzj8
   vONQdL4Rlmb4WHjsujs1BznAvaaycCkac1gkpjJfjw8m17pnMnA3ju5NC
   0YGqmPCFI8p6ZJvh+W2cLyEhWAqANuObUUiGSyp+ig2CG0FOAMh02OFxf
   B8GJy/BcbM5Qc7UXf/bF4ah8Vti8IntcELYvrZy57wKQezaz9BMm7ue12
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365930157"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="365930157"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 16:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="642226603"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2022 16:15:58 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2LC2-000PqH-6H;
	Fri, 17 Jun 2022 23:15:58 +0000
Date: Sat, 18 Jun 2022 07:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kernel@vger.kernel.org
Subject: [cilium:pr/meta4 2/2] include/net/sch_generic.h:744:14: error: no
 member named 'tc_at_ingress' in 'struct sk_buff'
Message-ID: <202206180759.g5Fqzf3d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/meta4
head:   dcea837b60f0d9f8f3cdae284680659042f560d1
commit: dcea837b60f0d9f8f3cdae284680659042f560d1 [2/2] bpf: Add fd-based API to attach tc BPF programs
config: arm-buildonly-randconfig-r002-20220617 (https://download.01.org/0day-ci/archive/20220618/202206180759.g5Fqzf3d-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/cilium/linux/commit/dcea837b60f0d9f8f3cdae284680659042f560d1
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/meta4
        git checkout dcea837b60f0d9f8f3cdae284680659042f560d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/packet/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/packet/af_packet.c:52:
   In file included from include/linux/filter.h:26:
>> include/net/sch_generic.h:744:14: error: no member named 'tc_at_ingress' in 'struct sk_buff'
           return skb->tc_at_ingress;
                  ~~~  ^
>> include/net/sch_generic.h:753:11: error: no member named 'tc_skip_classify' in 'struct sk_buff'
           if (skb->tc_skip_classify) {
               ~~~  ^
   include/net/sch_generic.h:754:8: error: no member named 'tc_skip_classify' in 'struct sk_buff'
                   skb->tc_skip_classify = 0;
                   ~~~  ^
   include/net/sch_generic.h:1361:27: error: no member named 'sch_ingress' in 'struct net_device'
                   rcu_assign_pointer(dev->sch_ingress, entry);
                                      ~~~  ^
   include/linux/rcupdate.h:454:15: note: expanded from macro 'rcu_assign_pointer'
                   WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
                               ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/packet/af_packet.c:52:
   In file included from include/linux/filter.h:26:
   include/net/sch_generic.h:1361:27: error: no member named 'sch_ingress' in 'struct net_device'
                   rcu_assign_pointer(dev->sch_ingress, entry);
                                      ~~~  ^
   include/linux/rcupdate.h:454:15: note: expanded from macro 'rcu_assign_pointer'
                   WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
                               ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/packet/af_packet.c:52:
   In file included from include/linux/filter.h:26:
   include/net/sch_generic.h:1361:27: error: no member named 'sch_ingress' in 'struct net_device'
                   rcu_assign_pointer(dev->sch_ingress, entry);
                                      ~~~  ^
   include/linux/rcupdate.h:454:15: note: expanded from macro 'rcu_assign_pointer'
                   WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
                               ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/packet/af_packet.c:52:
   In file included from include/linux/filter.h:26:
   include/net/sch_generic.h:1361:27: error: no member named 'sch_ingress' in 'struct net_device'
                   rcu_assign_pointer(dev->sch_ingress, entry);
                                      ~~~  ^
   include/linux/rcupdate.h:454:15: note: expanded from macro 'rcu_assign_pointer'
                   WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
                               ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/packet/af_packet.c:52:


vim +744 include/net/sch_generic.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  740  
fdc5432a7b44ab Daniel Borkmann  2016-01-07  741  static inline bool skb_at_tc_ingress(const struct sk_buff *skb)
fdc5432a7b44ab Daniel Borkmann  2016-01-07  742  {
fdc5432a7b44ab Daniel Borkmann  2016-01-07  743  #ifdef CONFIG_NET_CLS_ACT
8dc07fdbf2054f Willem de Bruijn 2017-01-07 @744  	return skb->tc_at_ingress;
fdc5432a7b44ab Daniel Borkmann  2016-01-07  745  #else
fdc5432a7b44ab Daniel Borkmann  2016-01-07  746  	return false;
fdc5432a7b44ab Daniel Borkmann  2016-01-07  747  #endif
fdc5432a7b44ab Daniel Borkmann  2016-01-07  748  }
fdc5432a7b44ab Daniel Borkmann  2016-01-07  749  
e7246e122aaa99 Willem de Bruijn 2017-01-07  750  static inline bool skb_skip_tc_classify(struct sk_buff *skb)
e7246e122aaa99 Willem de Bruijn 2017-01-07  751  {
e7246e122aaa99 Willem de Bruijn 2017-01-07  752  #ifdef CONFIG_NET_CLS_ACT
e7246e122aaa99 Willem de Bruijn 2017-01-07 @753  	if (skb->tc_skip_classify) {
e7246e122aaa99 Willem de Bruijn 2017-01-07  754  		skb->tc_skip_classify = 0;
e7246e122aaa99 Willem de Bruijn 2017-01-07  755  		return true;
e7246e122aaa99 Willem de Bruijn 2017-01-07  756  	}
e7246e122aaa99 Willem de Bruijn 2017-01-07  757  #endif
e7246e122aaa99 Willem de Bruijn 2017-01-07  758  	return false;
e7246e122aaa99 Willem de Bruijn 2017-01-07  759  }
e7246e122aaa99 Willem de Bruijn 2017-01-07  760  

:::::: The code at line 744 was first introduced by commit
:::::: 8dc07fdbf2054f157e8333f940a1ad728916c786 net-tc: convert tc_at to tc_at_ingress

:::::: TO: Willem de Bruijn <willemb@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
