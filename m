Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2823164D0;
	Thu, 13 Nov 2025 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763072659; cv=none; b=g4IFMZdER/iXxARTbpXiHkcd4g6moDAVQaUU2j3s/+VYEQ48VwfxtI9k826pKbnBJ2y/5JyJ6yFF/E6jqn9GMs7friClRDQ+Akb2BI8xV8EgUnSpVjMvKCr2xzcIuSc3wPUeVawC3EJ1T5uiOTBpp/LIpZjAEBfPV3i2rcPuqFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763072659; c=relaxed/simple;
	bh=Ik/Mx+Cu2VRVDAeQNU1QI4Cl1OGqJTyMWjqubhNmbsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zbo18JtntW7IHNu/gcKAqpffzDwAQED/j5nPVzmCm7hHJN1DCRbGKiuhboHHmr9n/KBKuk7RVZZyzWzUf7syFuaKg2NvdH+pP6/SO+/g5PIEh57R4l2c4UgT/rOJYZB0e5HDBV8aI+AUUY3VDCh5UEtaWyb/rXl3o4dSUjMS5qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HI2yobXH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HI2yobXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763072657; x=1794608657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ik/Mx+Cu2VRVDAeQNU1QI4Cl1OGqJTyMWjqubhNmbsY=;
  b=HI2yobXHqE04rRBJZAkon5vXbiYsUvGiGE1CxcH+VhVY6Lupi79iOF7f
   BTRLP4I4+KPQeZBvB9Fnlxc9s0JayzwuT8mJ/KJDhfAKaFwqqdIxv+Cf9
   bT6tXbyCsJYKe70Q+0oUX3lo4xX7KdRE2eqDlAikUFWkeo3xu4DE4ErYh
   G3lAH151qMKO4VkvgKvYaHGX+hPVChw59eDtz4RZDQJ0JFwCHxduO+7A8
   2wLZmqkSWgjcHtkghD9pw2OSdcNpToejMCECqFElaJJqLTeAwAx70/7My
   ItCGsS0BAqIzE4Ws1URdEy9hTqSd7wuUcDko8k3MHCvYsnjD8wAEMnthE
   g==;
X-CSE-ConnectionGUID: iKD/s9XYRFaheuX2uKLxiA==
X-CSE-MsgGUID: lEOPHvD4Se2IzGk5lUhWDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82798565"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="82798565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 14:24:15 -0800
X-CSE-ConnectionGUID: ftYPmSFBSre7aojwUoeeww==
X-CSE-MsgGUID: 6KOqORENTh+BztgW1wuVVQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2025 14:24:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJfjg-0005wb-0M;
	Thu, 13 Nov 2025 22:24:12 +0000
Date: Fri, 14 Nov 2025 06:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-next 3/9] fs/smb/client/smb2ops.c:443:65: error:
 too few arguments to function call, expected 4, have 3
Message-ID: <202511140608.Ns5i0tJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-next
head:   4ca2b517a4ff65e3e8e3a7decc78e4a23481a1de
commit: 99a365f9df4d8326defaf33b4dbef35c16d9cde8 [3/9] cifs: Remove the RFC1002 header from smb_hdr
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251114/202511140608.Ns5i0tJT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140608.Ns5i0tJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140608.Ns5i0tJT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/cifs_debug.c:48:65: error: too few arguments to function call, expected 4, have 3
      48 |         if (!server->ops->check_message(buf, server->total_read, server)) {
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~                                ^
   fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'typeof (*mid_entry)' (aka 'struct mid_q_entry')
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
   fs/smb/client/cifs_debug.c:65:2: error: offsetof of incomplete type 'typeof (*mid_entry)' (aka 'struct mid_q_entry')
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
   fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'struct mid_q_entry'
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
   fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'struct mid_q_entry'
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
   fs/smb/client/cifs_debug.c:65:2: error: incomplete definition of type 'struct mid_q_entry'
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
--
>> fs/smb/client/smb2ops.c:443:65: error: too few arguments to function call, expected 4, have 3
     443 |         if (!server->ops->check_message(buf, server->total_read, server)) {
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~                                ^
   1 error generated.


vim +443 fs/smb/client/smb2ops.c

ac873aa3dc21707 fs/cifs/smb2ops.c       Rohith Surabattula 2020-10-29  433  
093b2bdad3221e3 fs/cifs/smb2ops.c       Pavel Shilovsky    2011-06-08  434  static void
14547f7d74c4a25 fs/cifs/smb2ops.c       Ronnie Sahlberg    2018-04-22  435  smb2_dump_detail(void *buf, struct TCP_Server_Info *server)
093b2bdad3221e3 fs/cifs/smb2ops.c       Pavel Shilovsky    2011-06-08  436  {
093b2bdad3221e3 fs/cifs/smb2ops.c       Pavel Shilovsky    2011-06-08  437  #ifdef CONFIG_CIFS_DEBUG2
0d35e382e4e96a4 fs/cifs/smb2ops.c       Ronnie Sahlberg    2021-11-05  438  	struct smb2_hdr *shdr = (struct smb2_hdr *)buf;
093b2bdad3221e3 fs/cifs/smb2ops.c       Pavel Shilovsky    2011-06-08  439  
3175eb9b577e82b fs/cifs/smb2ops.c       Ronnie Sahlberg    2019-09-04  440  	cifs_server_dbg(VFS, "Cmd: %d Err: 0x%x Flags: 0x%x Mid: %llu Pid: %d\n",
31473fc4f9653b7 fs/cifs/smb2ops.c       Pavel Shilovsky    2016-10-24  441  		 shdr->Command, shdr->Status, shdr->Flags, shdr->MessageId,
0d35e382e4e96a4 fs/cifs/smb2ops.c       Ronnie Sahlberg    2021-11-05  442  		 shdr->Id.SyncId.ProcessId);
567320c46a60a3c fs/smb/client/smb2ops.c Paulo Alcantara    2023-12-19 @443  	if (!server->ops->check_message(buf, server->total_read, server)) {
3175eb9b577e82b fs/cifs/smb2ops.c       Ronnie Sahlberg    2019-09-04  444  		cifs_server_dbg(VFS, "smb buf %p len %u\n", buf,
68ed14496b032b0 fs/cifs/smb2ops.c       Enzo Matsumiya     2022-08-17  445  				server->ops->calc_smb_size(buf));
567320c46a60a3c fs/smb/client/smb2ops.c Paulo Alcantara    2023-12-19  446  	}
093b2bdad3221e3 fs/cifs/smb2ops.c       Pavel Shilovsky    2011-06-08  447  #endif
093b2bdad3221e3 fs/cifs/smb2ops.c       Pavel Shilovsky    2011-06-08  448  }
093b2bdad3221e3 fs/cifs/smb2ops.c       Pavel Shilovsky    2011-06-08  449  

:::::: The code at line 443 was first introduced by commit
:::::: 567320c46a60a3c39b69aa1df802d753817a3f86 smb: client: fix potential OOB in smb2_dump_detail()

:::::: TO: Paulo Alcantara <pc@manguebit.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
