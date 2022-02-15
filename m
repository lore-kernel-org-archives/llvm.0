Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773BEB8
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 00:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644884369; x=1676420369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZSirIDvlIWHGucFV8M2Rio4bqMTvd2u/FR+TdqsQcwk=;
  b=YyuXhR7D/zXY/3eyHc9Kjmc+QQK7jvC8UrU8k9aJC5ZAT4h0IaNxBZo4
   /SPnUuhhYRl0XMYD1dzIfbnixoWjgLpdEOITHFyFNErEaOWVOmGiRc8n5
   iiLwQuD4nNRu9FVFlm3T/fygs3qt7RcrqmE+v6z+rqxQyn1SAjZc5YRQD
   RyriBKJ8aS5By50dG01blzUJvAz/cTxCMua95k3EbZh1SvTLmPuJFTiuE
   G/sM9n6oXhNPZOqoqAHP6k1aMO+wySZQTywi4DKZimV4NVvEKAGfOI9Y6
   h9lqzavmXE/l7O9zvepvBzRHOO3VJRZCo2QyFQATn4T5O3x2nHD/c0dN4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="249046751"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="249046751"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 16:19:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="570547087"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2022 16:19:26 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJlYz-000951-HR; Tue, 15 Feb 2022 00:19:25 +0000
Date: Tue, 15 Feb 2022 08:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, davem@davemloft.net,
	kuba@kernel.org, Willem de Bruijn <willemb@google.com>,
	Congyu Liu <liu3101@purdue.edu>
Subject: Re: [PATCH net] ipv6: per-netns exclusive flowlabel checks
Message-ID: <202202150837.bGbeRjWx-lkp@intel.com>
References: <20220214200400.513069-1-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214200400.513069-1-willemdebruijn.kernel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Willem,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]

url:    https://github.com/0day-ci/linux/commits/Willem-de-Bruijn/ipv6-per-netns-exclusive-flowlabel-checks/20220215-042330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 86006f996346e8a5a1ea80637ec949ceeea4ecbc
config: hexagon-randconfig-r036-20220214 (https://download.01.org/0day-ci/archive/20220215/202202150837.bGbeRjWx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5d3936d3544b4cdd6d63c896d158d4975a4822c3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Willem-de-Bruijn/ipv6-per-netns-exclusive-flowlabel-checks/20220215-042330
        git checkout 5d3936d3544b4cdd6d63c896d158d4975a4822c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/ceph/ net/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:314:10: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                   ^
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/sched/cls_flow.c:24:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
   include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:314:38: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                               ^
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/sched/cls_flow.c:24:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
   include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                                         ^
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/sched/cls_flow.c:24:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
   include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:302:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
   In file included from net/sched/cls_flow.c:24:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
   include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   In file included from net/sched/cls_flow.c:24:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
   include/net/ipv6.h:402:60: error: invalid operands to binary expression ('long' and 'void')
           if (static_branch_unlikely(&ipv6_flowlabel_exclusive.key) &&
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> net/sched/cls_flow.c:63:52: warning: shift count >= width of type [-Wshift-count-overflow]
           return (a & 0xFFFFFFFF) ^ (BITS_PER_LONG > 32 ? a >> 32 : 0);
                                                             ^  ~~
   1 warning and 8 errors generated.


vim +63 net/sched/cls_flow.c

e5dfb815181fcb Patrick McHardy 2008-01-31  58  
e5dfb815181fcb Patrick McHardy 2008-01-31  59  static inline u32 addr_fold(void *addr)
e5dfb815181fcb Patrick McHardy 2008-01-31  60  {
e5dfb815181fcb Patrick McHardy 2008-01-31  61  	unsigned long a = (unsigned long)addr;
e5dfb815181fcb Patrick McHardy 2008-01-31  62  
e5dfb815181fcb Patrick McHardy 2008-01-31 @63  	return (a & 0xFFFFFFFF) ^ (BITS_PER_LONG > 32 ? a >> 32 : 0);
e5dfb815181fcb Patrick McHardy 2008-01-31  64  }
e5dfb815181fcb Patrick McHardy 2008-01-31  65  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
