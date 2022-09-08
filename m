Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED3B610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662673173; x=1694209173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2xBcGZM+LgOc9GsmfvGBL+u0+9VYAb7zZAC+0yVoJxw=;
  b=gihTWAELqgy7ezzGPIl6rHJfcaMRww83MWAWraaTVySs1/zk8MadGm8B
   VSt9rBIOVPAcgtHh6xKsZj9z70akQCgwuDSZ2YbAwIU2ovqqcHtI4Dwlf
   R4rQ2d5heQzqGHSMrPoGA16unfLlZi5DSxWpbwVFr+gVzDZ3bb5GmnzK6
   t23AA5wgamij5x1xzN4VqU28TFtaqO8OV4kdDPfUspW7nOVw3iEvfXlHZ
   FIC4W+qfGHLG7YuNKwCHvVJ1hQMWroH5IkrQbEIPayIUN8/fZxou42LOz
   xPpYhgM56dMiZ7UDIoFOVJEMxYLre7aYbSHdhFbzKlP+mkC8qvo3rgUVY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323532610"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="323532610"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 14:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="790591354"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Sep 2022 14:39:31 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWPFC-0000LZ-2h;
	Thu, 08 Sep 2022 21:39:30 +0000
Date: Fri, 9 Sep 2022 05:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Hesmans <benjamin.hesmans@tessares.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC mptcp-next 06/10] mptcp: allow delayed data_ack
 calculation
Message-ID: <202209090500.AiAyWqre-lkp@intel.com>
References: <20220908133829.3410092-7-benjamin.hesmans@tessares.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908133829.3410092-7-benjamin.hesmans@tessares.net>

Hi Benjamin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mptcp/export]
[also build test ERROR on linus/master v6.0-rc4 next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Hesmans/Implement-TCP_FASTOPEN_CONNECT-for-mptcp/20220908-214128
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220909/202209090500.AiAyWqre-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a8172edcbe49cfa83d8c34b285935fb51793e8af
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Hesmans/Implement-TCP_FASTOPEN_CONNECT-for-mptcp/20220908-214128
        git checkout a8172edcbe49cfa83d8c34b285935fb51793e8af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:251:8: error: redefinition of 'mptcp_sock'
   struct mptcp_sock {
          ^
   include/net/mptcp.h:315:8: note: previous definition is here
   struct mptcp_sock { };
          ^
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                                ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:10: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:38: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                               ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                                         ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:310:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:317:15: note: expanded from macro '__unqual_scalar_typeof'
                            default: (x)))
                                      ^
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:67: error: no member named 'rmem_released' in 'struct mptcp_sock'
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                                                              ~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:337:41: error: invalid operands to binary expression ('int' and 'void')
           return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:321:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                                ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:10: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                   ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:322:38: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                               ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                                         ^
   include/linux/compiler_types.h:354:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:342:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:310:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:317:15: note: expanded from macro '__unqual_scalar_typeof'
                            default: (x)))
                                      ^
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:24: error: no member named 'first_pending' in 'struct mptcp_sock'
           return READ_ONCE(msk->first_pending);
                            ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   In file included from net/ipv4/tcp_minisocks.c:28:
>> net/ipv4/../../net/mptcp/protocol.h:349:9: error: returning 'void' from a function with incompatible result type 'struct mptcp_data_frag *'
           return READ_ONCE(msk->first_pending);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
   #define READ_ONCE(x)                                                    \
                                                                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/mptcp_sock +251 net/ipv4/../../net/mptcp/protocol.h

18b683bff89d46 Paolo Abeni      2020-03-27  249  
f870fa0b576884 Mat Martineau    2020-01-21  250  /* MPTCP connection sock */
f870fa0b576884 Mat Martineau    2020-01-21 @251  struct mptcp_sock {
f870fa0b576884 Mat Martineau    2020-01-21  252  	/* inet_connection_sock must be the first member */
f870fa0b576884 Mat Martineau    2020-01-21  253  	struct inet_connection_sock sk;
cec37a6e41aae7 Peter Krystad    2020-01-21  254  	u64		local_key;
cec37a6e41aae7 Peter Krystad    2020-01-21  255  	u64		remote_key;
6d0060f600adfd Mat Martineau    2020-01-21  256  	u64		write_seq;
eaa2ffabfc3558 Paolo Abeni      2020-11-16  257  	u64		snd_nxt;
6d0060f600adfd Mat Martineau    2020-01-21  258  	u64		ack_seq;
f3589be0c420a3 Paolo Abeni      2022-05-04  259  	atomic64_t	rcv_wnd_sent;
3721b9b64676b3 Mat Martineau    2020-07-28  260  	u64		rcv_data_fin_seq;
6511882cdd82d6 Paolo Abeni      2021-10-26  261  	int		rmem_fwd_alloc;
d5f49190def61c Paolo Abeni      2020-09-14  262  	struct sock	*last_snd;
d5f49190def61c Paolo Abeni      2020-09-14  263  	int		snd_burst;
ea4ca586b16ff2 Paolo Abeni      2020-11-19  264  	int		old_wspace;
1e1d9d6f119c55 Paolo Abeni      2021-08-13  265  	u64		recovery_snd_nxt;	/* in recovery mode accept up to this seq;
1e1d9d6f119c55 Paolo Abeni      2021-08-13  266  						 * recovery related fields are under data_lock
1e1d9d6f119c55 Paolo Abeni      2021-08-13  267  						 * protection
1e1d9d6f119c55 Paolo Abeni      2021-08-13  268  						 */
7439d687b79cbb Paolo Abeni      2020-11-27  269  	u64		snd_una;
7439d687b79cbb Paolo Abeni      2020-11-27  270  	u64		wnd_end;
b51f9b80c032e1 Paolo Abeni      2020-03-27  271  	unsigned long	timer_ival;
79c0949e9a09f6 Peter Krystad    2020-01-21  272  	u32		token;
879526030c8b5e Paolo Abeni      2020-11-27  273  	int		rmem_released;
648ef4b88673da Mat Martineau    2020-01-21  274  	unsigned long	flags;
e9d09baca67625 Paolo Abeni      2022-01-06  275  	unsigned long	cb_flags;
e9d09baca67625 Paolo Abeni      2022-01-06  276  	unsigned long	push_pending;
1e1d9d6f119c55 Paolo Abeni      2021-08-13  277  	bool		recovery;		/* closing subflow write queue reinjected */
d22f4988ffecbe Christoph Paasch 2020-01-21  278  	bool		can_ack;
b93df08ccda326 Paolo Abeni      2020-07-23  279  	bool		fully_established;
3721b9b64676b3 Mat Martineau    2020-07-28  280  	bool		rcv_data_fin;
7279da6145bbb2 Mat Martineau    2020-07-28  281  	bool		snd_data_fin_enable;
50c504a20a754c Florian Westphal 2020-12-10  282  	bool		rcv_fastclose;
37198e93ced707 Davide Caratti   2020-10-06  283  	bool		use_64bit_ack; /* Set when we received a 64-bit DSN */
752e906732c694 Geliang Tang     2021-06-17  284  	bool		csum_enabled;
0530020a7c8f22 Geliang Tang     2022-04-22  285  	bool		allow_infinite_fallback;
3ad14f54bd7448 Paolo Abeni      2022-07-11  286  	u8		mpc_endpoint_id;
4f6e14bd19d6de Maxim Galaganov  2021-12-03  287  	u8		recvmsg_inq:1,
4f6e14bd19d6de Maxim Galaganov  2021-12-03  288  			cork:1,
4f6e14bd19d6de Maxim Galaganov  2021-12-03  289  			nodelay:1;
80992017150b4e Paolo Abeni      2020-02-26  290  	struct work_struct work;
ab174ad8ef7627 Paolo Abeni      2020-09-14  291  	struct sk_buff  *ooo_last_skb;
ab174ad8ef7627 Paolo Abeni      2020-09-14  292  	struct rb_root  out_of_order_queue;
879526030c8b5e Paolo Abeni      2020-11-27  293  	struct sk_buff_head receive_queue;
cec37a6e41aae7 Peter Krystad    2020-01-21  294  	struct list_head conn_list;
18b683bff89d46 Paolo Abeni      2020-03-27  295  	struct list_head rtx_queue;
f0e6a4cf11f164 Paolo Abeni      2020-11-16  296  	struct mptcp_data_frag *first_pending;
ec3edaa7ca6ce0 Peter Krystad    2020-03-27  297  	struct list_head join_list;
f870fa0b576884 Mat Martineau    2020-01-21  298  	struct socket	*subflow; /* outgoing connect/listener/!mp_capable */
8ab183deb26a3b Paolo Abeni      2020-01-21  299  	struct sock	*first;
1b1c7a0ef7f323 Peter Krystad    2020-03-27  300  	struct mptcp_pm_data	pm;
037e43390ec6a9 Geliang Tang     2022-09-08  301  	struct mptcp_sched_ops	*sched;
a6b118febbab3f Florian Westphal 2020-06-30  302  	struct {
a6b118febbab3f Florian Westphal 2020-06-30  303  		u32	space;	/* bytes copied in last measurement window */
a6b118febbab3f Florian Westphal 2020-06-30  304  		u32	copied; /* bytes copied in this measurement window */
a6b118febbab3f Florian Westphal 2020-06-30  305  		u64	time;	/* start time of measurement window */
a6b118febbab3f Florian Westphal 2020-06-30  306  		u64	rtt_us; /* last maximum rtt of subflows */
a6b118febbab3f Florian Westphal 2020-06-30  307  	} rcvq_space;
df00b087da24c0 Florian Westphal 2021-04-15  308  
df00b087da24c0 Florian Westphal 2021-04-15  309  	u32 setsockopt_seq;
20b5759f21cf53 Paolo Abeni      2021-05-25  310  	char		ca_name[TCP_CA_NAME_MAX];
6aeed9045071f2 Paolo Abeni      2022-06-27  311  	struct mptcp_sock	*dl_next;
f870fa0b576884 Mat Martineau    2020-01-21  312  };
f870fa0b576884 Mat Martineau    2020-01-21  313  
879526030c8b5e Paolo Abeni      2020-11-27  314  #define mptcp_data_lock(sk) spin_lock_bh(&(sk)->sk_lock.slock)
879526030c8b5e Paolo Abeni      2020-11-27  315  #define mptcp_data_unlock(sk) spin_unlock_bh(&(sk)->sk_lock.slock)
879526030c8b5e Paolo Abeni      2020-11-27  316  
cec37a6e41aae7 Peter Krystad    2020-01-21  317  #define mptcp_for_each_subflow(__msk, __subflow)			\
cec37a6e41aae7 Peter Krystad    2020-01-21  318  	list_for_each_entry(__subflow, &((__msk)->conn_list), node)
b0ae1f010f8f07 Matthieu Baerts  2022-09-08  319  #define mptcp_for_each_subflow_safe(__msk, __subflow, __tmp)			\
b0ae1f010f8f07 Matthieu Baerts  2022-09-08  320  	list_for_each_entry_safe(__subflow, __tmp, &((__msk)->conn_list), node)
cec37a6e41aae7 Peter Krystad    2020-01-21  321  
3abc05d9ef6fe9 Florian Westphal 2021-02-04  322  static inline void msk_owned_by_me(const struct mptcp_sock *msk)
3abc05d9ef6fe9 Florian Westphal 2021-02-04  323  {
3abc05d9ef6fe9 Florian Westphal 2021-02-04  324  	sock_owned_by_me((const struct sock *)msk);
3abc05d9ef6fe9 Florian Westphal 2021-02-04  325  }
3abc05d9ef6fe9 Florian Westphal 2021-02-04  326  
f870fa0b576884 Mat Martineau    2020-01-21  327  static inline struct mptcp_sock *mptcp_sk(const struct sock *sk)
f870fa0b576884 Mat Martineau    2020-01-21  328  {
f870fa0b576884 Mat Martineau    2020-01-21  329  	return (struct mptcp_sock *)sk;
f870fa0b576884 Mat Martineau    2020-01-21  330  }
f870fa0b576884 Mat Martineau    2020-01-21  331  
ce599c516386f0 Paolo Abeni      2021-07-09  332  /* the msk socket don't use the backlog, also account for the bulk
ce599c516386f0 Paolo Abeni      2021-07-09  333   * free memory
ce599c516386f0 Paolo Abeni      2021-07-09  334   */
ce599c516386f0 Paolo Abeni      2021-07-09  335  static inline int __mptcp_rmem(const struct sock *sk)
ce599c516386f0 Paolo Abeni      2021-07-09  336  {
ce599c516386f0 Paolo Abeni      2021-07-09 @337  	return atomic_read(&sk->sk_rmem_alloc) - READ_ONCE(mptcp_sk(sk)->rmem_released);
ce599c516386f0 Paolo Abeni      2021-07-09  338  }
ce599c516386f0 Paolo Abeni      2021-07-09  339  
ea4ca586b16ff2 Paolo Abeni      2020-11-19  340  static inline int __mptcp_space(const struct sock *sk)
ea4ca586b16ff2 Paolo Abeni      2020-11-19  341  {
ce599c516386f0 Paolo Abeni      2021-07-09  342  	return tcp_win_from_space(sk, READ_ONCE(sk->sk_rcvbuf) - __mptcp_rmem(sk));
ea4ca586b16ff2 Paolo Abeni      2020-11-19  343  }
ea4ca586b16ff2 Paolo Abeni      2020-11-19  344  
f0e6a4cf11f164 Paolo Abeni      2020-11-16  345  static inline struct mptcp_data_frag *mptcp_send_head(const struct sock *sk)
f0e6a4cf11f164 Paolo Abeni      2020-11-16  346  {
f0e6a4cf11f164 Paolo Abeni      2020-11-16  347  	const struct mptcp_sock *msk = mptcp_sk(sk);
f0e6a4cf11f164 Paolo Abeni      2020-11-16  348  
f0e6a4cf11f164 Paolo Abeni      2020-11-16 @349  	return READ_ONCE(msk->first_pending);
f0e6a4cf11f164 Paolo Abeni      2020-11-16  350  }
f0e6a4cf11f164 Paolo Abeni      2020-11-16  351  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
