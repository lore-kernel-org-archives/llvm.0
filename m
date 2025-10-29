Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C73161AA;
	Wed, 29 Oct 2025 21:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761772462; cv=none; b=mVn1jqWpA2y4caU4gvVDR/RWWetz0OfGuJOWBXToJ7que6kbL9TU1fEU65HDilzUqKJt+hdX7x+DmY+rjeTazupE7NEIInlWt+jWwpCfK6yWjlxR4c4QMyQ7wsyrQSaWY9IoyugLxRqAOZPdq4jd+GtEy+/QQ5oRh5U3At7UOK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761772462; c=relaxed/simple;
	bh=yvg1e31Wd77OLurvqeDoHZZbeHUOM/E1aRxjrY+VyKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbB+t5jnSZg3ly53Gc/UMAk0bybr0iU7NasiJeYb/HGuH2Da7rNadOGyN1LBjcuu8lz+ccGE7+YhaRvDx4DZxJo2jyWxAFD2gImO38I+hNbcQ7mSf1X1DwCZWDhy76FHG9/tCUUbF0UixI8bccGT152Tg6gaA6hxZ6qKRSofROI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqEUdFjt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqEUdFjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761772460; x=1793308460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvg1e31Wd77OLurvqeDoHZZbeHUOM/E1aRxjrY+VyKE=;
  b=PqEUdFjtfvuDD3Do97egBNCo1VMW10v36FmO1Cmw0GanOduZdk0qj1QM
   pp5caBUrH8c8EaSNPNHjmGDS5xJZD0bVLwqv0+1i9kg2if5WzfbIMQTOg
   lbRMjCZmRWj94uxniCJsMu8IVH3sF7fvjI5PJP5kJa1hWZxDxf2ZE+vT1
   gPvWf2nHb5xAHCvuxKAan8BUO0aD7kvBCbVSM9JXjjbBcie3MY2iE07Py
   7nOmbXcJ97iifeYRoWQsKYOw8blJ6FOzyeajpRVscE1jhDSaeKl0n1zCR
   Z2pJy0guB7uiccd+xAu/ji0mjaZZCCzD1ZyElX9n0fSITVlu/Y3/FBR2x
   Q==;
X-CSE-ConnectionGUID: AhzO9rWvS7+h5jHkJRmKIw==
X-CSE-MsgGUID: NRWvT/8WSICchKChykHCgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64003290"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="64003290"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:14:20 -0700
X-CSE-ConnectionGUID: +cL+zbJfSXKRBfRTv5YGAQ==
X-CSE-MsgGUID: b+McfbZsT9etzHWuFdZ5Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="190942138"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2025 14:14:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEDUV-000LAQ-2r;
	Wed, 29 Oct 2025 21:14:08 +0000
Date: Thu, 30 Oct 2025 05:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.19.misc 5/5] include/linux/pipe_fs_i.h:204:25:
 error: no member named 'head' in 'struct pipe_inode_info'
Message-ID: <202510300538.PdxovfOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.misc
head:   ade24f8214fe3fdfe20233584bca932ab00b752d
commit: ade24f8214fe3fdfe20233584bca932ab00b752d [5/5] fs/pipe: stop duplicating union pipe_index declaration
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510300538.PdxovfOd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300538.PdxovfOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300538.PdxovfOd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/read_write.c:19:
   In file included from include/linux/splice.h:12:
   include/linux/pipe_fs_i.h:84:2: warning: declaration does not declare anything [-Wmissing-declarations]
      84 |         union pipe_index;
         |         ^~~~~~~~~~~~~~~~
>> include/linux/pipe_fs_i.h:204:25: error: no member named 'head' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                          ~~~~  ^
>> include/linux/pipe_fs_i.h:204:37: error: no member named 'tail' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                                      ~~~~  ^
   include/linux/pipe_fs_i.h:213:26: error: no member named 'head' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                           ~~~~  ^
   include/linux/pipe_fs_i.h:213:38: error: no member named 'tail' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                                       ~~~~  ^
   include/linux/pipe_fs_i.h:222:30: error: no member named 'head' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                               ~~~~  ^
   include/linux/pipe_fs_i.h:222:42: error: no member named 'tail' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                                           ~~~~  ^
   include/linux/pipe_fs_i.h:242:30: error: no member named 'head' in 'struct pipe_inode_info'
     242 |         return pipe_buf(pipe, pipe->head);
         |                               ~~~~  ^
   1 warning and 7 errors generated.
--
   In file included from fs/pipe.c:19:
   include/linux/pipe_fs_i.h:84:2: warning: declaration does not declare anything [-Wmissing-declarations]
      84 |         union pipe_index;
         |         ^~~~~~~~~~~~~~~~
>> include/linux/pipe_fs_i.h:204:25: error: no member named 'head' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                          ~~~~  ^
>> include/linux/pipe_fs_i.h:204:37: error: no member named 'tail' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                                      ~~~~  ^
   include/linux/pipe_fs_i.h:213:26: error: no member named 'head' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                           ~~~~  ^
   include/linux/pipe_fs_i.h:213:38: error: no member named 'tail' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                                       ~~~~  ^
   include/linux/pipe_fs_i.h:222:30: error: no member named 'head' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                               ~~~~  ^
   include/linux/pipe_fs_i.h:222:42: error: no member named 'tail' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                                           ~~~~  ^
   include/linux/pipe_fs_i.h:242:30: error: no member named 'head' in 'struct pipe_inode_info'
     242 |         return pipe_buf(pipe, pipe->head);
         |                               ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:232:56: error: no member named 'head_tail' in 'struct pipe_inode_info'
     232 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                         ~~~~  ^
>> fs/pipe.c:255:9: error: no member named 'tail' in 'struct pipe_inode_info'
     255 |                 pipe->tail = ++tail;
         |                 ~~~~  ^
   fs/pipe.c:264:8: error: no member named 'tail' in 'struct pipe_inode_info'
     264 |         pipe->tail = ++tail;
         |         ~~~~  ^
>> fs/pipe.c:294:47: error: no member named 'head' in 'struct pipe_inode_info'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                       ~~~~  ^
>> fs/pipe.c:294:47: error: no member named 'head' in 'struct pipe_inode_info'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                       ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.
--
   In file included from fs/splice.c:25:
   In file included from include/linux/splice.h:12:
   include/linux/pipe_fs_i.h:84:2: warning: declaration does not declare anything [-Wmissing-declarations]
      84 |         union pipe_index;
         |         ^~~~~~~~~~~~~~~~
>> include/linux/pipe_fs_i.h:204:25: error: no member named 'head' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                          ~~~~  ^
>> include/linux/pipe_fs_i.h:204:37: error: no member named 'tail' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                                      ~~~~  ^
   include/linux/pipe_fs_i.h:213:26: error: no member named 'head' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                           ~~~~  ^
   include/linux/pipe_fs_i.h:213:38: error: no member named 'tail' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                                       ~~~~  ^
   include/linux/pipe_fs_i.h:222:30: error: no member named 'head' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                               ~~~~  ^
   include/linux/pipe_fs_i.h:222:42: error: no member named 'tail' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                                           ~~~~  ^
   include/linux/pipe_fs_i.h:242:30: error: no member named 'head' in 'struct pipe_inode_info'
     242 |         return pipe_buf(pipe, pipe->head);
         |                               ~~~~  ^
>> fs/splice.c:201:28: error: no member named 'tail' in 'struct pipe_inode_info'
     201 |         unsigned int tail = pipe->tail;
         |                             ~~~~  ^
>> fs/splice.c:202:28: error: no member named 'head' in 'struct pipe_inode_info'
     202 |         unsigned int head = pipe->head;
         |                             ~~~~  ^
   fs/splice.c:226:9: error: no member named 'head' in 'struct pipe_inode_info'
     226 |                 pipe->head = head;
         |                 ~~~~  ^
   fs/splice.c:247:28: error: no member named 'head' in 'struct pipe_inode_info'
     247 |         unsigned int head = pipe->head;
         |                             ~~~~  ^
   fs/splice.c:248:28: error: no member named 'tail' in 'struct pipe_inode_info'
     248 |         unsigned int tail = pipe->tail;
         |                             ~~~~  ^
   fs/splice.c:258:9: error: no member named 'head' in 'struct pipe_inode_info'
     258 |                 pipe->head = head + 1;
         |                 ~~~~  ^
   fs/splice.c:393:9: error: no member named 'head' in 'struct pipe_inode_info'
     393 |                 pipe->head++;
         |                 ~~~~  ^
   fs/splice.c:446:28: error: no member named 'head' in 'struct pipe_inode_info'
     446 |         unsigned int head = pipe->head;
         |                             ~~~~  ^
   fs/splice.c:447:28: error: no member named 'tail' in 'struct pipe_inode_info'
     447 |         unsigned int tail = pipe->tail;
         |                             ~~~~  ^
   fs/splice.c:479:10: error: no member named 'tail' in 'struct pipe_inode_info'
     479 |                         pipe->tail = tail;
         |                         ~~~~  ^
   fs/splice.c:494:28: error: no member named 'tail' in 'struct pipe_inode_info'
     494 |         unsigned int tail = pipe->tail;
         |                             ~~~~  ^
   fs/splice.c:499:9: error: no member named 'tail' in 'struct pipe_inode_info'
     499 |                 pipe->tail = tail+1;
         |                 ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.
--
   In file included from mm/filemap.c:46:
   include/linux/pipe_fs_i.h:84:2: warning: declaration does not declare anything [-Wmissing-declarations]
      84 |         union pipe_index;
         |         ^~~~~~~~~~~~~~~~
>> include/linux/pipe_fs_i.h:204:25: error: no member named 'head' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                          ~~~~  ^
>> include/linux/pipe_fs_i.h:204:37: error: no member named 'tail' in 'struct pipe_inode_info'
     204 |         return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
         |                                      ~~~~  ^
   include/linux/pipe_fs_i.h:213:26: error: no member named 'head' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                           ~~~~  ^
   include/linux/pipe_fs_i.h:213:38: error: no member named 'tail' in 'struct pipe_inode_info'
     213 |         return pipe_empty(pipe->head, pipe->tail);
         |                                       ~~~~  ^
   include/linux/pipe_fs_i.h:222:30: error: no member named 'head' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                               ~~~~  ^
   include/linux/pipe_fs_i.h:222:42: error: no member named 'tail' in 'struct pipe_inode_info'
     222 |         return pipe_occupancy(pipe->head, pipe->tail);
         |                                           ~~~~  ^
   include/linux/pipe_fs_i.h:242:30: error: no member named 'head' in 'struct pipe_inode_info'
     242 |         return pipe_buf(pipe, pipe->head);
         |                               ~~~~  ^
>> mm/filemap.c:2968:9: error: no member named 'head' in 'struct pipe_inode_info'
    2968 |                 pipe->head++;
         |                 ~~~~  ^
   1 warning and 8 errors generated.


vim +204 include/linux/pipe_fs_i.h

8cefc107ca54c8 David Howells  2019-11-15  197  
00a7d39898c801 Linus Torvalds 2025-03-06  198  /**
00a7d39898c801 Linus Torvalds 2025-03-06  199   * pipe_is_full - Return true if the pipe is full
00a7d39898c801 Linus Torvalds 2025-03-06  200   * @pipe: the pipe
00a7d39898c801 Linus Torvalds 2025-03-06  201   */
00a7d39898c801 Linus Torvalds 2025-03-06  202  static inline bool pipe_is_full(const struct pipe_inode_info *pipe)
00a7d39898c801 Linus Torvalds 2025-03-06  203  {
00a7d39898c801 Linus Torvalds 2025-03-06 @204  	return pipe_full(pipe->head, pipe->tail, pipe->max_usage);
00a7d39898c801 Linus Torvalds 2025-03-06  205  }
00a7d39898c801 Linus Torvalds 2025-03-06  206  

:::::: The code at line 204 was first introduced by commit
:::::: 00a7d39898c8010bfd5ff62af31ca5db34421b38 fs/pipe: add simpler helpers for common cases

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
