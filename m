Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401AE1862;
	Fri, 10 Apr 2026 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827126; cv=none; b=BIHpzG7oTZFZXmJDbf1+GVh0GvcQ5I99mqenYtbNEPDtan3aQ5qDltAqX/veyrWUu9ZsXzlGXZavassV0nALqz2k4B35z0w52h4kbbp2recpbdbSXmpjxYmXPc3l7i5yQBPcUtQnJTd36pUsafjZULdpk1SgdEeqY3pibTRJwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827126; c=relaxed/simple;
	bh=sjBnQNwOlKk26IkmHqTO1pxRIazMDALvsnz1okcoG4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cthp9VOQ4iElE2CZGFtj0JJ3XZAECR3Dw5EZBXEwjgVqm3btPiYcLos7lBZo0BgIOFN1g4tTBztHTAna48LI7+IsqA6qAnCEepavPVMbPwA965zEhVvl2q7+lpDw3FvqEKg45WtA4IEZSKAQF09u+BYidmHQcFAxoOLOFiQPhLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JABzfbpe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JABzfbpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775827124; x=1807363124;
  h=date:from:to:cc:subject:message-id;
  bh=sjBnQNwOlKk26IkmHqTO1pxRIazMDALvsnz1okcoG4c=;
  b=JABzfbpenHLAoMtjDlRLsQzcufXVy0ROb2DSHPdtP6U5KDs1hEQz/pDI
   xFKF4LlOthv3K9zv2XoIUpspC1WyO1TKhhpFXNSPFgMYCudkLHia4wXqC
   KVTNJiiZl6x54RUHkChM+bbErkGf04auFhgWxJ6LkoIoJypNoohhsj6Gf
   IT4uF2dYHXnJGJE3icpAzzLfLl92/zMuIdgJpsBElq5//DSfyWzwg9VmT
   KoRkBBce29cva2CGpidfoDSOgc+KvCrnPb6k3f7TMwYPKUFdQGbogI6RU
   JeNI7RNg9q0HeJuP3yl+pAD73x6rqyP2lHyR/7n1svWjDXcJYd3cm+CjH
   g==;
X-CSE-ConnectionGUID: bY5mtw7rRZWzW6bp4wf2Uw==
X-CSE-MsgGUID: f/nrFS5MQjOtCtMNiR6Ypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="102303055"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="102303055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:18:43 -0700
X-CSE-ConnectionGUID: gw0jgXi3Txe0RXF18Upz1g==
X-CSE-MsgGUID: 4EbmJxI7TSCoO1vC4E425g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="259547850"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 06:18:41 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBBkt-000000003ld-0VWT;
	Fri, 10 Apr 2026 13:18:39 +0000
Date: Fri, 10 Apr 2026 21:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:tracefs/for-next 1/3] fs/tracefs/event_inode.c:577:6:
 warning: variable 'ret' set but not used
Message-ID: <202604102117.N77kyKGR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace tracefs/for-next
head:   e8368d1f4bedbb0cce4cfe33a1d2664bb0fd4f27
commit: 4d9b262031ffef203243e53577a90ae6e1090e67 [1/3] eventfs: Simplify code using guard()s
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260410/202604102117.N77kyKGR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102117.N77kyKGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102117.N77kyKGR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:577:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     577 |         int ret = -EINVAL;
         |             ^
   1 warning generated.


vim +/ret +577 fs/tracefs/event_inode.c

63940449555e799 Ajay Kaher              2023-07-28  563  
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  564) /*
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  565)  * Walk the children of a eventfs_inode to fill in getdents().
63940449555e799 Ajay Kaher              2023-07-28  566   */
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  567) static int eventfs_iterate(struct file *file, struct dir_context *ctx)
63940449555e799 Ajay Kaher              2023-07-28  568  {
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  569) 	const struct file_operations *fops;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  570) 	struct inode *f_inode = file_inode(file);
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  571) 	const struct eventfs_entry *entry;
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  572) 	struct eventfs_inode *ei_child;
63940449555e799 Ajay Kaher              2023-07-28  573  	struct tracefs_inode *ti;
63940449555e799 Ajay Kaher              2023-07-28  574  	struct eventfs_inode *ei;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  575) 	const char *name;
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  576) 	umode_t mode;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03 @577) 	int ret = -EINVAL;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  578) 	int ino;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  579) 	int i, r, c;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  580) 
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  581) 	if (!dir_emit_dots(file, ctx))
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  582) 		return 0;
63940449555e799 Ajay Kaher              2023-07-28  583  
63940449555e799 Ajay Kaher              2023-07-28  584  	ti = get_tracefs(f_inode);
63940449555e799 Ajay Kaher              2023-07-28  585  	if (!(ti->flags & TRACEFS_EVENT_INODE))
63940449555e799 Ajay Kaher              2023-07-28  586  		return -EINVAL;
63940449555e799 Ajay Kaher              2023-07-28  587  
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  588) 	c = ctx->pos - 2;
ef36b4f92868d66 Steven Rostedt (Google  2023-09-22  589) 
4d9b262031ffef2 Steven Rostedt          2025-06-04  590  	guard(srcu)(&eventfs_srcu);
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  591) 
4d9b262031ffef2 Steven Rostedt          2025-06-04  592  	scoped_guard(mutex, &eventfs_mutex) {
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  593) 		ei = READ_ONCE(ti->private);
4d9b262031ffef2 Steven Rostedt          2025-06-04  594  		if (!ei || ei->is_freed)
4d9b262031ffef2 Steven Rostedt          2025-06-04  595  			return -EINVAL;
4d9b262031ffef2 Steven Rostedt          2025-06-04  596  	}
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  597) 
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  598) 	/*
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  599) 	 * Need to create the dentries and inodes to have a consistent
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  600) 	 * inode number.
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  601) 	 */
1de94b52d5e8d8b Steven Rostedt (Google  2024-01-04  602) 	ret = 0;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  603) 
1de94b52d5e8d8b Steven Rostedt (Google  2024-01-04  604) 	/* Start at 'c' to jump over already read entries */
1de94b52d5e8d8b Steven Rostedt (Google  2024-01-04  605) 	for (i = c; i < ei->nr_entries; i++, ctx->pos++) {
1de94b52d5e8d8b Steven Rostedt (Google  2024-01-04  606) 		void *cdata = ei->data;
1e4624eb5a0ecaa Steven Rostedt (Google  2024-01-04  607) 
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  608) 		entry = &ei->entries[i];
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  609) 		name = entry->name;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  610) 
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  611) 		/* If ei->is_freed then just bail here, nothing more to do */
4d9b262031ffef2 Steven Rostedt          2025-06-04  612  		scoped_guard(mutex, &eventfs_mutex) {
4d9b262031ffef2 Steven Rostedt          2025-06-04  613  			if (ei->is_freed)
4d9b262031ffef2 Steven Rostedt          2025-06-04  614  				return -EINVAL;
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  615) 			r = entry->callback(name, &mode, &cdata, &fops);
4d9b262031ffef2 Steven Rostedt          2025-06-04  616  		}
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  617) 		if (r <= 0)
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  618) 			continue;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  619) 
852e46e239ee6db Steven Rostedt (Google  2024-01-16  620) 		ino = EVENTFS_FILE_INODE_INO;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  621) 
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  622) 		if (!dir_emit(ctx, name, strlen(name), ino, DT_REG))
4d9b262031ffef2 Steven Rostedt          2025-06-04  623  			return -EINVAL;
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  624) 	}
ef36b4f92868d66 Steven Rostedt (Google  2023-09-22  625) 
1de94b52d5e8d8b Steven Rostedt (Google  2024-01-04  626) 	/* Subtract the skipped entries above */
1de94b52d5e8d8b Steven Rostedt (Google  2024-01-04  627) 	c -= min((unsigned int)c, (unsigned int)ei->nr_entries);
1de94b52d5e8d8b Steven Rostedt (Google  2024-01-04  628) 
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  629) 	list_for_each_entry_srcu(ei_child, &ei->children, list,
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  630) 				 srcu_read_lock_held(&eventfs_srcu)) {
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  631) 
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  632) 		if (c > 0) {
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  633) 			c--;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  634) 			continue;
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  635) 		}
493ec81a8fb8e4a Steven Rostedt (Google  2024-01-03  636) 
1e4624eb5a0ecaa Steven Rostedt (Google  2024-01-04  637) 		ctx->pos++;
1e4624eb5a0ecaa Steven Rostedt (Google  2024-01-04  638) 
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  639) 		if (ei_child->is_freed)
5790b1fb3d672d9 Steven Rostedt (Google  2023-10-04  640) 			continue;
ef36b4f92868d66 Steven Rostedt (Google  2023-09-22  641) 
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  642) 		name = ei_child->name;
704f960dbee2f16 Steven Rostedt (Google  2024-01-04  643) 
834bf76add3e616 Steven Rostedt (Google  2024-01-22  644) 		ino = eventfs_dir_ino(ei_child);
ef36b4f92868d66 Steven Rostedt (Google  2023-09-22  645) 
4d9b262031ffef2 Steven Rostedt          2025-06-04  646  		if (!dir_emit(ctx, name, strlen(name), ino, DT_DIR)) {
1e4624eb5a0ecaa Steven Rostedt (Google  2024-01-04  647) 			/* Incremented ctx->pos without adding something, reset it */
1e4624eb5a0ecaa Steven Rostedt (Google  2024-01-04  648) 			ctx->pos--;
4d9b262031ffef2 Steven Rostedt          2025-06-04  649  			return -EINVAL;
4d9b262031ffef2 Steven Rostedt          2025-06-04  650  		}
4d9b262031ffef2 Steven Rostedt          2025-06-04  651  	}
4d9b262031ffef2 Steven Rostedt          2025-06-04  652  	return 1;
63940449555e799 Ajay Kaher              2023-07-28  653  }
63940449555e799 Ajay Kaher              2023-07-28  654  

:::::: The code at line 577 was first introduced by commit
:::::: 493ec81a8fb8e4ada6f223b8b73791a1280d4774 eventfs: Stop using dcache_readdir() for getdents()

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
