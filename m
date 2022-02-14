Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7441EB8
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 23:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644882544; x=1676418544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=06tmGudHz31nq+18iqRjT9pi8sBK3LuB78ri/HwR/wc=;
  b=comg14K+7/r2xhFBzzPvfsB/AoxlFQqBslcNR7JSSYuTqqTi5EIJWLH8
   GmvpXpNpCSaLTrY0UWFW5CF3XLW20A5Ymmp4yy54fCC65jDUcUH7fDE+Z
   cB3AqEQ0tYt3OuslCHwdxhrI7TAEOrejTdHTY3atD+jmSqv0G368URxYg
   1QEex/n9vdNyFJWBQ27909S3or+Fu6IrS2QMIRQ9EuwlqkqPjF90Sk1Qq
   cWN5Jq6v4qUGOdZI7S0cNwZO7GkUSicbY0Z6+pswlqR+PScvlUUChgD83
   sTJUtURAWnfNBLEuBWSeThGW1CMe+6zVwA7EdKJUHdtJedpzTQ9H2I9om
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230848579"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="230848579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 15:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="543990889"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2022 15:48:22 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJl4w-00092r-6z; Mon, 14 Feb 2022 23:48:22 +0000
Date: Tue, 15 Feb 2022 07:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, davem@davemloft.net,
	kuba@kernel.org, Willem de Bruijn <willemb@google.com>,
	Congyu Liu <liu3101@purdue.edu>
Subject: Re: [PATCH net] ipv6: per-netns exclusive flowlabel checks
Message-ID: <202202150740.uPYefwp7-lkp@intel.com>
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net/master]

url:    https://github.com/0day-ci/linux/commits/Willem-de-Bruijn/ipv6-per-netns-exclusive-flowlabel-checks/20220215-042330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 86006f996346e8a5a1ea80637ec949ceeea4ecbc
config: arm-netwinder_defconfig (https://download.01.org/0day-ci/archive/20220215/202202150740.uPYefwp7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/5d3936d3544b4cdd6d63c896d158d4975a4822c3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Willem-de-Bruijn/ipv6-per-netns-exclusive-flowlabel-checks/20220215-042330
        git checkout 5d3936d3544b4cdd6d63c896d158d4975a4822c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/mptcp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:313:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
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
   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:313:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
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
   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
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
   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
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
   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
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
   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
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
   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   In file included from net/mptcp/protocol.c:16:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:402:60: error: invalid operands to binary expression ('long' and 'void')
           if (static_branch_unlikely(&ipv6_flowlabel_exclusive.key) &&
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   8 errors generated.
--
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:313:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
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
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:313:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
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
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
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
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
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
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
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
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
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
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
               READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
                         ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   In file included from net/mptcp/options.c:11:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:27:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
>> include/net/ipv6.h:402:60: error: invalid operands to binary expression ('long' and 'void')
           if (static_branch_unlikely(&ipv6_flowlabel_exclusive.key) &&
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   net/mptcp/options.c:552:21: warning: parameter 'remaining' set but not used [-Wunused-but-set-parameter]
                                             unsigned int remaining,
                                                          ^
   1 warning and 8 errors generated.


vim +403 include/net/ipv6.h

   397	
   398	extern struct static_key_false_deferred ipv6_flowlabel_exclusive;
   399	static inline struct ip6_flowlabel *fl6_sock_lookup(struct sock *sk,
   400							    __be32 label)
   401	{
 > 402		if (static_branch_unlikely(&ipv6_flowlabel_exclusive.key) &&
 > 403		    READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))
   404			return __fl6_sock_lookup(sk, label) ? : ERR_PTR(-ENOENT);
   405	
   406		return NULL;
   407	}
   408	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
