Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA1235F605;
	Sat,  7 Mar 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772887516; cv=none; b=qQt7IuOSuAAE5G2iHh4vwakeRBejLU/Xy/VUy557RCQu3kf2bAVyJEroCLsEVJKD3olgK02YQQ+qGs5fGN3J5RTskUnv+8t95/3ZCuDxZ+BLOrpVlStP6cs9cAmVdYNNIxKTFNh4SJxkL9jotUNh/J593fmiCDu11xjG0rZK6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772887516; c=relaxed/simple;
	bh=cVLLyXB9vg75HttolN/DpKVa2tDWJ/km/qpiCJZiY4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA+e4KUI9PXyT98kW2UWBuAMQOMOe433V4HXL5xqAo24ckRG2LuTmDXLwdomWdvQOaTAAMNIcalBxX2NiPik772rV6C8SBlG57LxUJjKXxWVVKtbNRnQf1uEi3TTaG/30wVlJXZmNAT0oE6aOG6KERfQA/j39XH2V/c8TKcv6jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xay5ExZX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xay5ExZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772887513; x=1804423513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cVLLyXB9vg75HttolN/DpKVa2tDWJ/km/qpiCJZiY4A=;
  b=Xay5ExZX3ola9ur/aubqm+o1QDHx4hhGciNVp4WkNhcZkcRUfdasGfH2
   hCdbkP2rCrisqXoQ3gQkp2AnhRXHyhMN0q2sLMAUwt3YZREG0JMnJmlaK
   PQMWS0XdRX8+T3P3sad4FOabYiP7wR0WbSXIeNxTSI2qss4KYM2NN3CCg
   DKZg7BYlLXaYOl8HY0DYF7U34QWYbAy/c1RV2cOwGPE0qzMvMQrb+7aa/
   sh/eX7/n7h2aeCBqtpapWeVwAjIPEMydH+ALOU1BXDEnBhyg71hWvgFFa
   NunKsDXgEIjHOoSJMN5M7ldCVdRcrJ3Vzu6CB/JBbSu6BdYtlY0o5RVDK
   w==;
X-CSE-ConnectionGUID: XLBR9keRTteAxEzh+bw90w==
X-CSE-MsgGUID: VhI7HT3LQIud1GQPV7i+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="99449780"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="99449780"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 04:45:12 -0800
X-CSE-ConnectionGUID: xdG1BgUvSL2QGH/mU7NYzA==
X-CSE-MsgGUID: nJ1zVpPXQWSxDUl+P2cadg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="242289603"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 07 Mar 2026 04:45:09 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyr1n-000000002UD-0WUM;
	Sat, 07 Mar 2026 12:45:07 +0000
Date: Sat, 7 Mar 2026 13:44:28 +0100
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kui-Feng Lee <thinker.li@gmail.com>,
	Xin Long <lucien.xin@gmail.com>, Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v1 net 2/2] ipv6: Don't remove permanent routes with
 exceptions from tb6_gc_hlist.
Message-ID: <202603071301.jcZkyoAP-lkp@intel.com>
References: <20260307024709.718395-3-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307024709.718395-3-kuniyu@google.com>

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/ipv6-Remove-permanent-routes-from-tb6_gc_hlist-when-all-exceptions-expire/20260307-104803
base:   net/main
patch link:    https://lore.kernel.org/r/20260307024709.718395-3-kuniyu%40google.com
patch subject: [PATCH v1 net 2/2] ipv6: Don't remove permanent routes with exceptions from tb6_gc_hlist.
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260307/202603071301.jcZkyoAP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071301.jcZkyoAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071301.jcZkyoAP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/cxgbi/libcxgbi.c:28:
   In file included from include/net/ip6_route.h:7:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:667:10: note: expanded from macro '__native_word'
     667 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/libcxgbi.c:28:
   In file included from include/net/ip6_route.h:7:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:667:39: note: expanded from macro '__native_word'
     667 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/libcxgbi.c:28:
   In file included from include/net/ip6_route.h:7:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:668:10: note: expanded from macro '__native_word'
     668 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/libcxgbi.c:28:
   In file included from include/net/ip6_route.h:7:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:668:38: note: expanded from macro '__native_word'
     668 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/libcxgbi.c:28:
   In file included from include/net/ip6_route.h:7:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/libcxgbi.c:28:
   In file included from include/net/ip6_route.h:7:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:642:53: note: expanded from macro '__unqual_scalar_typeof'
     642 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   In file included from drivers/scsi/cxgbi/libcxgbi.c:28:
   In file included from include/net/ip6_route.h:7:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   7 errors generated.
--
   In file included from drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:667:10: note: expanded from macro '__native_word'
     667 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:667:39: note: expanded from macro '__native_word'
     667 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:668:10: note: expanded from macro '__native_word'
     668 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:668:38: note: expanded from macro '__native_word'
     668 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:642:53: note: expanded from macro '__unqual_scalar_typeof'
     642 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   In file included from drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:995:44: warning: variable 'size6' set but not used [-Wunused-but-set-variable]
     995 |         int t4 = is_t4(lldi->adapter_type), size, size6;
         |                                                   ^
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1776:21: warning: variable 'size6' set but not used [-Wunused-but-set-variable]
    1776 |         unsigned int size, size6;
         |                            ^
   2 warnings and 7 errors generated.
--
   In file included from cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:667:10: note: expanded from macro '__native_word'
     667 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:667:39: note: expanded from macro '__native_word'
     667 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:668:10: note: expanded from macro '__native_word'
     668 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:668:38: note: expanded from macro '__native_word'
     668 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:642:53: note: expanded from macro '__unqual_scalar_typeof'
     642 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   In file included from cxgb4i/cxgb4i.c:20:
   In file included from include/net/tcp.h:45:
   In file included from include/net/xfrm.h:26:
>> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct net'
     557 |         gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
         |                                     ~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   cxgb4i/cxgb4i.c:995:44: warning: variable 'size6' set but not used [-Wunused-but-set-variable]
     995 |         int t4 = is_t4(lldi->adapter_type), size, size6;
         |                                                   ^
   cxgb4i/cxgb4i.c:1776:21: warning: variable 'size6' set but not used [-Wunused-but-set-variable]
    1776 |         unsigned int size, size6;
         |                            ^
   2 warnings and 7 errors generated.


vim +557 include/net/ip6_fib.h

   548	
   549	static inline void fib6_may_remove_gc_list(struct net *net,
   550						   struct fib6_info *f6i)
   551	{
   552		struct fib6_gc_args gc_args;
   553	
   554		if (hlist_unhashed(&f6i->gc_link))
   555			return;
   556	
 > 557		gc_args.timeout = READ_ONCE(net->ipv6.sysctl.ip6_rt_gc_interval),
   558		gc_args.more = 0,
   559	
   560		fib6_age_exceptions(f6i, &gc_args, jiffies);
   561	}
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
