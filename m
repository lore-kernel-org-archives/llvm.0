Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E133E49E;
	Sun, 20 Oct 2024 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413570; cv=none; b=iVKxAH6DXgsB7cKp1++dRLas/95jzDkuSROxlwn/qJZt9MKKw+13m21xGXwcm63eI3xUux+N/NUCEYdf/yaBahm4uFfgPx6DAEUWnvrd1J2YKCq1PrK9nsmWYlob2SjuGLNV+a0+NRnJ0sXBONOIg7+ZEf5xGC3VHcTLWw4S2Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413570; c=relaxed/simple;
	bh=5+0nPxWhqKb/RVZif0rjfToHtLz9i7HKFWWwkAw5SJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QK5P7YB5xPvmrYS3L4bwTKefGB4fW0zMqLhQb0c7p33eomHKRVXiz8oexbppSTsz/SHyWUnLhEfFYgDVjVzDV8mHmk8gtaQsF1pltfKigUJ7g0SSA4kY7VjhvKEIfw01IB9qK6FzZw/b8gTujmZ4wa2VRrpBdg5DXx9+O0T03iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Up1b4o+9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Up1b4o+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729413568; x=1760949568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+0nPxWhqKb/RVZif0rjfToHtLz9i7HKFWWwkAw5SJ4=;
  b=Up1b4o+9f2hIyp5FVBoQmFRQXd2rKETRfdQ09SC8f9v2ngrB97XiUyQI
   BYS4oJBb1El/Pcau92heFy/Bu/r2kxIFrT3IxAevQwy/4opNPMArL9JNm
   c/D8egX1Ig1vihENVo4Z7NsYDyn65gONVBAKDSs+k0xCSV/9eOCfBNjTI
   Gme3IRkHdlDyQ781u19F/U0IP//g0QbEafcCWybK9HufSSANWoWB+hkoT
   ABCvZT6SewLN82eAnMxPg/q8dNQdvKz316yxKQL9uVN/go1CEpExlRQ0H
   3DgWcPbumDKLrC0qLVJHK++UQa7UzUb7tgoGqsdujEUcG6sur2NLsHsSm
   g==;
X-CSE-ConnectionGUID: 7EUBGZOtQ0ihxOfdp/aA9w==
X-CSE-MsgGUID: v2nBsFJwQq+GpAa6xxN2ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28693293"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28693293"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 01:39:28 -0700
X-CSE-ConnectionGUID: agmxnTZ8QDaRsz7NzfkBXg==
X-CSE-MsgGUID: 7q6nrsBUQzWIbZwzbC57dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="83875283"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2024 01:39:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2RTA-000Q7R-2E;
	Sun, 20 Oct 2024 08:39:24 +0000
Date: Sun, 20 Oct 2024 16:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 39/39] fs/nfsd/nfs4state.c:5493:6: error:
 redefinition of 'mask'
Message-ID: <202410201607.joGn9Azm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   380a610024a1525d57e7d65bb495f7ecb87cb5ff
commit: 380a610024a1525d57e7d65bb495f7ecb87cb5ff [39/39] nfsd: add notification handlers for dir events
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241020/202410201607.joGn9Azm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201607.joGn9Azm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201607.joGn9Azm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:5493:6: error: redefinition of 'mask'
    5493 |         u32 mask = 0;
         |             ^
   fs/nfsd/nfs4state.c:5488:31: note: previous definition is here
    5488 | int nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
         |                               ^
>> fs/nfsd/nfs4state.c:5501:27: error: expected expression
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                         ^
   include/linux/container_of.h:19:30: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                     ^
>> fs/nfsd/nfs4state.c:5501:27: error: expected expression
   include/linux/container_of.h:20:16: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^
   include/linux/compiler_types.h:458:64: note: expanded from macro '__same_type'
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                ^
>> fs/nfsd/nfs4state.c:5501:27: error: expected expression
   include/linux/container_of.h:21:9: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^
   include/linux/compiler_types.h:458:64: note: expanded from macro '__same_type'
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                ^
>> fs/nfsd/nfs4state.c:5501:27: error: no member named 'flc_list' in 'file_lease'
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                         ^
    5502 |                                                      struct file_lease, flc_list);
         |                                                                         ~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> fs/nfsd/nfs4state.c:5501:22: error: initializing 'struct file_lease *' with an expression of incompatible type 'void'
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                    ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5502 |                                                      struct file_lease, flc_list);
         |                                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfs4state.c:5505:12: error: no member named 'fl_lmops' in 'struct file_lock_core'
    5505 |                 if (flc->fl_lmops != &nfsd_dir_lease_mng_ops)
         |                     ~~~  ^
>> fs/nfsd/nfs4state.c:5510:40: error: member reference type 'const struct qstr *' is a pointer; did you mean to use '->'?
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                         ~~~~^
         |                                                             ->
   fs/nfsd/nfs4state.c:5510:61: error: member reference type 'const struct qstr *' is a pointer; did you mean to use '->'?
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                                              ~~~~^
         |                                                                                  ->
>> fs/nfsd/nfs4state.c:5510:28: error: field designator 'count' does not refer to any field in type 'component4' (aka 'opaque')
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                ~^~~~~~~~~~~~~~~~
>> fs/nfsd/nfs4state.c:5510:47: error: field designator 'element' does not refer to any field in type 'component4' (aka 'opaque')
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                                   ~^~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfs4state.c:5510:68: error: expected ';' at end of declaration
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                                                         ^
         |                                                                                         ;
>> fs/nfsd/nfs4state.c:5513:29: error: no member named 'count' in 'opaque'
    5513 |                         nr.nrm_old_entry.ne_file.count = name.len;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   fs/nfsd/nfs4state.c:5513:41: error: member reference type 'const struct qstr *' is a pointer; did you mean to use '->'?
    5513 |                         nr.nrm_old_entry.ne_file.count = name.len;
         |                                                          ~~~~^
         |                                                              ->
>> fs/nfsd/nfs4state.c:5514:29: error: no member named 'element' in 'opaque'
    5514 |                         nr.nrm_old_entry.ne_file.element = name.name;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   fs/nfsd/nfs4state.c:5514:43: error: member reference type 'const struct qstr *' is a pointer; did you mean to use '->'?
    5514 |                         nr.nrm_old_entry.ne_file.element = name.name;
         |                                                            ~~~~^
         |                                                                ->
>> fs/nfsd/nfs4state.c:5516:26: error: redefinition of 'nr'
    5516 |                         struct notify_remove4 nr;
         |                                               ^
   fs/nfsd/nfs4state.c:5511:26: note: previous definition is here
    5511 |                         struct notify_remove4 nr = { };
         |                                               ^
>> fs/nfsd/nfs4state.c:5488:5: warning: no previous prototype for function 'nfsd_handle_dir_event' [-Wmissing-prototypes]
    5488 | int nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
         |     ^
   fs/nfsd/nfs4state.c:5488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5488 | int nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
         | ^
         | static 
   1 warning and 17 errors generated.


vim +/mask +5493 fs/nfsd/nfs4state.c

  5487	
> 5488	int nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
  5489				  const struct qstr *name)
  5490	{
  5491		struct file_lock_context *ctx;
  5492		struct file_lock_core *flc;
> 5493		u32 mask = 0;
  5494	
  5495		ctx = locks_inode_context(inode);
  5496		if (!ctx)
  5497			return 0;
  5498	
  5499		spin_lock(&ctx->flc_lock);
  5500		list_for_each_entry(flc, &ctx->flc_lease, flc_list) {
> 5501			struct file_lease *fl = container_of(struct file_lock_core,
  5502							     struct file_lease, flc_list);
  5503			struct nfs4_delegation *dp = flc->flc_owner;
  5504	
> 5505			if (flc->fl_lmops != &nfsd_dir_lease_mng_ops)
  5506				continue;
  5507	
  5508			/* find delegation, check IGN bits, marshal notify if they match */
  5509			if (mask & FS_DELETE) {
> 5510				component4 oldname = { .count = name.len, .element = name.name }
  5511				struct notify_remove4 nr = { };
  5512	
> 5513				nr.nrm_old_entry.ne_file.count = name.len;
> 5514				nr.nrm_old_entry.ne_file.element = name.name;
  5515	
> 5516				struct notify_remove4 nr;
  5517	
  5518				if (!(flc->flc_flags & FL_IGN_DIR_DELETE))
  5519					continue;
  5520			}
  5521	
  5522		}
  5523		spin_unlock(&ctx->flc_lock);
  5524	}
  5525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
