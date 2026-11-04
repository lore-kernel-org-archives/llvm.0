Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771199;
	b=QK+mcG24/p7HReQI9zq0rrjU/V81vAcj3GCCi/YujgcAX4MYdIjLxwlkVNHgoWZMuRop
	 8Eaq53ReDtA/FTJTN9azl+yKfvwVxLQhottfGctk03M4Zyyd5XOVjNdlG8l5abSgLFxqk
	 FOwWz7Dy82dMXiy6OaXcUeAZGJXqZo/dbesKgnZIYbV8ZvrDGeVDizty6HQQC5ZsJa4EA
	 fYqz39fgbQCtvifbVao1JKJVzwbuNB8GDdzzlYR2xsZL7XTka4GCKtrFUNcBZx3nfIJCe
	 JSelECiURBqiMwaqjgZFuaCV+TDlkP8AxXQrQh1gJTpqZJi3WjGtYsk/IvBM69aN5Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771199;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MGuO76z1xVTnvFgcL6pGp9r9+7I0Bp9JcevKKNgr29A=;
	b=5Y4cMogaPKp+Okp4lp36Vb5wjHOb0Z6aI+ASoFjF6oNhr9RFg2nHOBGvY5/O5ztNaR0b
	 6wEOJBcM6oInvIWNvaDD5vA4ScgMo8UOjFJYnSNBZwQbTk8f51cIP/Q757NaH9kUCwLgA
	 uKDEkx2OfVsMkExtK6KexXR/4n/S8eSfWC3fMji1p31s0U5JYOFCJBMxIS9XeJ0aEIaG1
	 rC2//LE5FrbzHSeZfV8+C2WrZ+nIxD2wFBnrUOyBM7d9WibWNSIXFusC2IttjdHzKBrRn
	 dQraXp5MmCmty9TRKLLyL4eFL8nB95u4bZglUdhP4C+25Hj6SVCUP6/yvbBpsH2P6mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oEBzdj0m;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061A606D81C;
	Wed,  4 Nov 2026 05:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5061A606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oEBzdj0m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793771194; x=1825307194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+6GOJlWx2xQFAN8XCCYt8Uc/Df6m6pxUQ0OnFnC5yQ=;
  b=oEBzdj0myjcBTCcJbJb6GyaJOo6luTL5xGYaxyvgKQ1huPCbFXMsrPiP
   rEQtyCzbCkbr6sZTbWTbD1lMId17GtD4ZgcG0CLs0Yq+n4zyr6aQgNevc
   i93gzsfJGa3nlXK7MlJaA36V5NkyPVJVpPS4ryVTKquBf3DFwD26C3UMA
   ccmrXC2VbE2ykbq9e2lbN6CNiqmlXxo8fOR4hVUMOmFj4LryO9X6szTnn
   Hn795HogLcqslxZ+re/DelpvBRiarrDywQJU1GDHaNDuOlJX3hwNKlwQn
   DsFv6YLUmHQsRfqNrmuxojSrOU9dRvkidkUfX3lWDc44q6EpjYgpQyf5K
   g==;
X-CSE-ConnectionGUID: ZtnxoNLaRxa/Z1CeIv71Ng==
X-CSE-MsgGUID: DTNgqM5XRkmzZqpSf5yoSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2403411"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2403411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 21:46:32 -0800
X-CSE-ConnectionGUID: 3hnfM52ZS9yO2FHbyXZ5Ng==
X-CSE-MsgGUID: E0V8ekVxS9yFdnT3LNJoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6729631"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 21:46:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOTpL-00000000jpp-1Yui;
	Wed, 04 Nov 2026 05:46:27 +0000
Date: Wed, 4 Nov 2026 13:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: wen.yang@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 39/39] sysctl: remove the extra pointers and the
 compatibility bounds read
Message-ID: <202611041234.Gjf6kfSR-lkp@intel.com>
References: <b6e4cbd509687301a8ee2106f19a3ac01e7671a6.1793204511.git.wen.yang@linux.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6e4cbd509687301a8ee2106f19a3ac01e7671a6.1793204511.git.wen.yang@linux.dev>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to sysctl/sysctl-next brauner-vfs/vfs.all linus/master mcgrof/sysctl-next v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wen-yang-linux-dev/sysctl-replace-overloaded-extra-pointers-with-typed-bounds-and-context/20261029-003440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/b6e4cbd509687301a8ee2106f19a3ac01e7671a6.1793204511.git.wen.yang%40linux.dev
patch subject: [RFC PATCH 39/39] sysctl: remove the extra pointers and the compatibility bounds read
config: um-defconfig (https://download.01.org/0day-ci/archive/20261104/202611041234.Gjf6kfSR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041234.Gjf6kfSR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041234.Gjf6kfSR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/unix/sysctl_net_unix.c:23:4: error: field designator 'extra1' does not refer to any field in type 'const struct ctl_table'
      23 |                 .extra1         = SYSCTL_ZERO,
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/unix/sysctl_net_unix.c:24:4: error: field designator 'extra2' does not refer to any field in type 'const struct ctl_table'
      24 |                 .extra2         = SYSCTL_INT_MAX,
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/unix/sysctl_net_unix.c:32:36: error: invalid application of 'sizeof' to an incomplete type 'const struct ctl_table[]'
      32 |         table = kmemdup(unix_table, sizeof(unix_table), GFP_KERNEL);
         |                                           ^~~~~~~~~~~~
   include/linux/string.h:315:49: note: expanded from macro 'kmemdup'
     315 | #define kmemdup(...)    alloc_hooks(kmemdup_noprof(__VA_ARGS__))
         |                                                    ^~~~~~~~~~~
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:256:9: note: expanded from macro 'alloc_hooks_tag'
     256 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
>> net/unix/sysctl_net_unix.c:32:36: error: invalid application of 'sizeof' to an incomplete type 'const struct ctl_table[]'
      32 |         table = kmemdup(unix_table, sizeof(unix_table), GFP_KERNEL);
         |                                           ^~~~~~~~~~~~
   include/linux/string.h:315:49: note: expanded from macro 'kmemdup'
     315 | #define kmemdup(...)    alloc_hooks(kmemdup_noprof(__VA_ARGS__))
         |                                                    ^~~~~~~~~~~
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:260:10: note: expanded from macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
>> net/unix/sysctl_net_unix.c:32:36: error: invalid application of 'sizeof' to an incomplete type 'const struct ctl_table[]'
      32 |         table = kmemdup(unix_table, sizeof(unix_table), GFP_KERNEL);
         |                                           ^~~~~~~~~~~~
   include/linux/string.h:315:49: note: expanded from macro 'kmemdup'
     315 | #define kmemdup(...)    alloc_hooks(kmemdup_noprof(__VA_ARGS__))
         |                                                    ^~~~~~~~~~~
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:263:10: note: expanded from macro 'alloc_hooks_tag'
     263 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   net/unix/sysctl_net_unix.c:54:12: error: invalid application of 'sizeof' to an incomplete type 'const struct ctl_table[]'
      54 |                                               ARRAY_SIZE(unix_table));
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   6 errors generated.


vim +23 net/unix/sysctl_net_unix.c

84960bf2403123a Kuniyuki Iwashima 2025-03-17  15  
0abc76bc20826e2 Joel Granados     2026-08-10  16  static const struct ctl_table unix_table[] = {
^1da177e4c3f415 Linus Torvalds    2005-04-16  17  	{
^1da177e4c3f415 Linus Torvalds    2005-04-16  18  		.procname	= "max_dgram_qlen",
a0a53c8ba95451f Denis V. Lunev    2007-12-11  19  		.data		= &init_net.unx.sysctl_max_dgram_qlen,
^1da177e4c3f415 Linus Torvalds    2005-04-16  20  		.maxlen		= sizeof(int),
^1da177e4c3f415 Linus Torvalds    2005-04-16  21  		.mode		= 0644,
1a4e7bc6e3457ad Yingjie Wang      2026-10-16  22  		.proc_handler	= proc_dointvec_minmax,
1a4e7bc6e3457ad Yingjie Wang      2026-10-16 @23  		.extra1		= SYSCTL_ZERO,
1a4e7bc6e3457ad Yingjie Wang      2026-10-16 @24  		.extra2		= SYSCTL_INT_MAX,
^1da177e4c3f415 Linus Torvalds    2005-04-16  25  	},
^1da177e4c3f415 Linus Torvalds    2005-04-16  26  };
^1da177e4c3f415 Linus Torvalds    2005-04-16  27  
0abc76bc20826e2 Joel Granados     2026-08-10  28  static const struct ctl_table *unix_table_dup(struct net *net)
^1da177e4c3f415 Linus Torvalds    2005-04-16  29  {
1597fbc0faf88c4 Pavel Emelyanov   2007-12-01  30  	struct ctl_table *table;
1597fbc0faf88c4 Pavel Emelyanov   2007-12-01  31  
0abc76bc20826e2 Joel Granados     2026-08-10 @32  	table = kmemdup(unix_table, sizeof(unix_table), GFP_KERNEL);
0abc76bc20826e2 Joel Granados     2026-08-10  33  	if (!table)
0abc76bc20826e2 Joel Granados     2026-08-10  34  		return NULL;
0abc76bc20826e2 Joel Granados     2026-08-10  35  
0abc76bc20826e2 Joel Granados     2026-08-10  36  	table[0].data = &net->unx.sysctl_max_dgram_qlen;
0abc76bc20826e2 Joel Granados     2026-08-10  37  
0abc76bc20826e2 Joel Granados     2026-08-10  38  	return table;
0abc76bc20826e2 Joel Granados     2026-08-10  39  }
0abc76bc20826e2 Joel Granados     2026-08-10  40  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
