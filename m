Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A28345739;
	Thu, 13 Nov 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049395; cv=none; b=n7NSJeE64yvEOUajQhSB9GsI8Q2AajmmrGio6/gPHgb6I2PAVG3boTVaaxXD1X53yaQ851cetM6wnx/xToDjHh2QvjaJzK4Hqu7LY+xCzXlS/vM90Dn8Ad8w5wrIzIfzlhRateItHFRO9XklqjamzSXdBgBe9for/NS/R50Gdtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049395; c=relaxed/simple;
	bh=adFAw5Npbq1bm5EVX/V0MHCzgyirVjm0YthS21igMlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gziFOO5bM6qpk8dtg7NaiI17oWAMQPgGNgFUHRH7k4tMB/Ot3/DBWG0Rfmgzrt3Te4GzTtI3pAss7PWBUadxtrrY3a8dOALWVSoYEEo9h7RML85YqKRQoZgeiQwSsg+qzaXsX2KqyH5LbhG+oVxBUq9lju4YS4fEeYjxvPAFaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B99EA28G; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B99EA28G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763049393; x=1794585393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adFAw5Npbq1bm5EVX/V0MHCzgyirVjm0YthS21igMlI=;
  b=B99EA28GPm/8o61C6PAJPPs0r798UmKKWvOcBRPjtHIVXLZ2pl6gFFOu
   vat8dovDX74zKSubMRoWwGPxcFilS5GceehvwbLOoAyZpByHCYSXCBd61
   q/Z3s+eas2pkwpdtmf2ZXsTbYFF4GfKnnfqjqT/gfWSXo3dNHnp7dHPBv
   roxgWuDV4zUfGU3KSRpUv2nBCnJ6QjJbsGE4sV3Kv6CzRn+KjTMZhGpFY
   mbnm7iEuEeJTSLEbeSfDsHLk2nf4SpTFud8zEGJqwLSCdOtCFaxPgVOZg
   uEAZN3obgn+QijN90UHE7gzACAtaE5pUXT2RFSFUa0sOUG/EoRWQE/4c7
   w==;
X-CSE-ConnectionGUID: H3t9YHF3SFKBftZZC9dlUg==
X-CSE-MsgGUID: 9y39OsB9RU6dgDX89/qkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65166758"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65166758"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:56:33 -0800
X-CSE-ConnectionGUID: be482FYWRaylR5n6sC8yNQ==
X-CSE-MsgGUID: 6yOWxpl1TXWoISIM1vmWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="193638687"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 07:56:32 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJZgT-0005Vv-0V;
	Thu, 13 Nov 2025 15:56:29 +0000
Date: Thu, 13 Nov 2025 23:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-next 2/9] fs/smb/client/cifs_debug.c:65:2: error:
 incomplete definition of type 'typeof (*mid_entry)' (aka 'struct
 mid_q_entry')
Message-ID: <202511132334.JSi2r6VJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-next
head:   4ca2b517a4ff65e3e8e3a7decc78e4a23481a1de
commit: 982884b7141b12c9c654dc657724605a87961809 [2/9] cifs: Rename mid_q_entry to smb_message
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251113/202511132334.JSi2r6VJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511132334.JSi2r6VJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511132334.JSi2r6VJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'typeof (*mid_entry)' (aka 'struct mid_q_entry')
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:782:13: note: expanded from macro 'list_for_each_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:620:2: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:2: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:537:74: note: expanded from macro '__same_type'
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
>> fs/smb/client/cifs_debug.c:65:2: error: offsetof of incomplete type 'typeof (*mid_entry)' (aka 'struct mid_q_entry')
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:782:13: note: expanded from macro 'list_for_each_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:620:2: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:2: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
>> fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'struct mid_q_entry'
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^                   ~~~~~~~~~
   include/linux/list.h:783:8: note: expanded from macro 'list_for_each_entry'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |               ^                  ~~~
   include/linux/list.h:773:19: note: expanded from macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                       ~~~^
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
>> fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'struct mid_q_entry'
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:18: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:26: note: expanded from macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
>> fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'struct mid_q_entry'
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:18: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:537:63: note: expanded from macro '__same_type'
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
>> fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'struct mid_q_entry'
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:18: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:537:63: note: expanded from macro '__same_type'
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
>> fs/smb/client/cifs_debug.c:65:2: error: offsetof of incomplete type 'typeof (*(mid_entry))' (aka 'struct mid_q_entry')
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:2: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:2: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
   fs/smb/client/cifs_debug.c:67:14: error: incomplete definition of type 'struct mid_q_entry'
      67 |                          mid_entry->mid_state,
         |                          ~~~~~~~~~^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                                  ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                                ^~~~~~~~~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
   fs/smb/client/cifs_debug.c:68:26: error: incomplete definition of type 'struct mid_q_entry'
      68 |                          le16_to_cpu(mid_entry->command),
         |                                      ~~~~~~~~~^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                                  ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                                ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
   fs/smb/client/cifs_debug.c:69:14: error: incomplete definition of type 'struct mid_q_entry'
      69 |                          mid_entry->pid,
         |                          ~~~~~~~~~^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                                  ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                                ^~~~~~~~~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
   fs/smb/client/cifs_debug.c:70:14: error: incomplete definition of type 'struct mid_q_entry'
      70 |                          mid_entry->callback_data,
         |                          ~~~~~~~~~^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                                  ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                                ^~~~~~~~~~~
   fs/smb/client/cifs_debug.c:58:9: note: forward declaration of 'struct mid_q_entry'
      58 |         struct mid_q_entry *mid_entry;
         |                ^
   fs/smb/client/cifs_debug.c:71:14: error: incomplete definition of type 'struct mid_q_entry'
      71 |                          mid_entry->mid);
         |                          ~~~~~~~~~^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \


vim +65 fs/smb/client/cifs_debug.c

3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  54  
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  55  void cifs_dump_mids(struct TCP_Server_Info *server)
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  56  {
8aa26f3ed80ddba fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-05-17  57  #ifdef CONFIG_CIFS_DEBUG2
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  58  	struct mid_q_entry *mid_entry;
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  59  
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  60  	if (server == NULL)
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  61  		return;
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  62  
f96637be081141d fs/cifs/cifs_debug.c       Joe Perches     2013-05-04  63  	cifs_dbg(VFS, "Dump pending requests:\n");
f3ba7c9b0421e39 fs/smb/client/cifs_debug.c Wang Zhaolong   2025-08-04  64  	spin_lock(&server->mid_queue_lock);
a506ccb47c9e93f fs/cifs/cifs_debug.c       Baokun Li       2021-06-17 @65  	list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
f96637be081141d fs/cifs/cifs_debug.c       Joe Perches     2013-05-04  66  		cifs_dbg(VFS, "State: %d Cmd: %d Pid: %d Cbdata: %p Mid %llu\n",
7c9421e1a9ce8d1 fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-03-23  67  			 mid_entry->mid_state,
7c9421e1a9ce8d1 fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-03-23  68  			 le16_to_cpu(mid_entry->command),
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  69  			 mid_entry->pid,
2b84a36c5529da1 fs/cifs/cifs_debug.c       Jeff Layton     2011-01-11  70  			 mid_entry->callback_data,
b6b38f704a8193d fs/cifs/cifs_debug.c       Joe Perches     2010-04-21  71  			 mid_entry->mid);
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  72  #ifdef CONFIG_CIFS_STATS2
f96637be081141d fs/cifs/cifs_debug.c       Joe Perches     2013-05-04  73  		cifs_dbg(VFS, "IsLarge: %d buf: %p time rcv: %ld now: %ld\n",
7c9421e1a9ce8d1 fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-03-23  74  			 mid_entry->large_buf,
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  75  			 mid_entry->resp_buf,
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  76  			 mid_entry->when_received,
b6b38f704a8193d fs/cifs/cifs_debug.c       Joe Perches     2010-04-21  77  			 jiffies);
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  78  #endif /* STATS2 */
f96637be081141d fs/cifs/cifs_debug.c       Joe Perches     2013-05-04  79  		cifs_dbg(VFS, "IsMult: %d IsEnd: %d\n",
f96637be081141d fs/cifs/cifs_debug.c       Joe Perches     2013-05-04  80  			 mid_entry->multiRsp, mid_entry->multiEnd);
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  81  		if (mid_entry->resp_buf) {
71992e62b864e49 fs/cifs/cifs_debug.c       Steve French    2018-05-06  82  			cifs_dump_detail(mid_entry->resp_buf, server);
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  83  			cifs_dump_mem("existing buf: ",
ad7a2926b9e53cf fs/cifs/cifs_debug.c       Steve French    2008-02-07  84  				mid_entry->resp_buf, 62);
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  85  		}
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  86  	}
f3ba7c9b0421e39 fs/smb/client/cifs_debug.c Wang Zhaolong   2025-08-04  87  	spin_unlock(&server->mid_queue_lock);
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  88  #endif /* CONFIG_CIFS_DEBUG2 */
8aa26f3ed80ddba fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-05-17  89  }
3979877e5606ecc fs/cifs/cifs_debug.c       Steve French    2006-05-31  90  

:::::: The code at line 65 was first introduced by commit
:::::: a506ccb47c9e93fde843532670a7805452bf699b cifs: convert list_for_each to entry variant in cifs_debug.c

:::::: TO: Baokun Li <libaokun1@huawei.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
