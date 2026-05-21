Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FC330EF95;
	Thu, 21 May 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379928; cv=none; b=lZeb55pvXoYCYxzLsEXfO8EJJLAr9IO3a9uNZOmopGdutX/455tSjcaquzg5A1kWcvCCcLRDwusmwPItPb8kehxdBhUbvqHvgcVMwICtJr05OLSI9mVFFif27+GWSVnm1p+U8jZXIkFg8Bvj/Nedf8xfJB2HPBY2GANd2ali38U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379928; c=relaxed/simple;
	bh=11NXiQbScHt7Qe+mC8n1AMv90obBf1oZDyqyIriqbSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZFl3g1KTkAQIeouU1nDhs0ZtYUPsBJ8O9rLRR9uDULWm1UZRtDy/GZpGK+CsgP0o87G1rkoOnGT72/PHLzLImFbz+gy2MCyWmxDtlW7OT3gBMtcsClKK2wW8ttU60qd82fKBOScjgJmhu9k4z7vVl6RedUBx1zBFctri9UUnGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FloEmZZj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FloEmZZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779379928; x=1810915928;
  h=date:from:to:cc:subject:message-id;
  bh=11NXiQbScHt7Qe+mC8n1AMv90obBf1oZDyqyIriqbSY=;
  b=FloEmZZjUFfJZ/sDsF0r9ZaZN0L6UMy5QSLOULJXJBgnyXHVh9psZU+L
   Y7zW4rSgEah2IFtV1RXhT8upN1r1Nyv9sdRW3kywDbHA1g0/qGeCN6Ke2
   w351GAwWu+6Ajq4MzWa0r8/1jffbw79/QY+E7s2DovBRC7TZUCxAxF1qi
   liH0tFdl9mzGJuhhIF8lzY5iUuVCz17AGWcSvTJ9yUnDedNsqtxNh6RRs
   t08rLnaZDAUWIPjEZmKzJiVPk0Vk5NaSS/sibyMn6N+xoTB056BGDWAsR
   686lNpBqHWwFZEUp2uNcNpT1gVW4Pj7lsT7oISj7RZgHMpe2EgoLWzmkk
   g==;
X-CSE-ConnectionGUID: lq7pihUITf6HzEYVXrV1YA==
X-CSE-MsgGUID: 8pDDlBsqTn6JwA2I6O0EvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80269600"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="80269600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 09:12:07 -0700
X-CSE-ConnectionGUID: V2PhT261S/y4XS/wKjfa/A==
X-CSE-MsgGUID: P0f9JHB2Twy6KQs93GUy5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="278678144"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2026 09:12:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ609-00000000AyL-3wZ3;
	Thu, 21 May 2026 16:12:01 +0000
Date: Thu, 21 May 2026 18:11:38 +0200
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/ring-buffer-bootid 4/4]
 kernel/trace/trace.c:5842:1: error: function definition is not allowed here
Message-ID: <202605211823.ejyoDwBk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/ring-buffer-bootid
head:   11c7f327c260ca2dd626cb8e242b1aed41959caf
commit: 11c7f327c260ca2dd626cb8e242b1aed41959caf [4/4] tracing: Record and show boot ID in last_boot_info
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260521/202605211823.ejyoDwBk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211823.ejyoDwBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211823.ejyoDwBk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:5842:1: error: function definition is not allowed here
    5842 | {
         | ^
>> kernel/trace/trace.c:5859:11: error: use of undeclared identifier 'l_show'
    5859 |         .show           = l_show,
         |                           ^
   kernel/trace/trace.c:5863:1: error: function definition is not allowed here
    5863 | {
         | ^
   kernel/trace/trace.c:5885:1: error: function definition is not allowed here
    5885 | {
         | ^
   kernel/trace/trace.c:5903:1: error: function definition is not allowed here
    5903 | {
         | ^
   kernel/trace/trace.c:5916:1: error: function definition is not allowed here
    5916 | {
         | ^
   kernel/trace/trace.c:5934:1: error: function definition is not allowed here
    5934 | {
         | ^
   kernel/trace/trace.c:6008:1: error: function definition is not allowed here
    6008 | {
         | ^
   kernel/trace/trace.c:6023:1: error: function definition is not allowed here
    6023 | {
         | ^
   kernel/trace/trace.c:6054:1: error: function definition is not allowed here
    6054 | {
         | ^
   kernel/trace/trace.c:6064:1: error: function definition is not allowed here
    6064 | {
         | ^
   kernel/trace/trace.c:6086:1: error: function definition is not allowed here
    6086 | {
         | ^
   kernel/trace/trace.c:6113:1: error: function definition is not allowed here
    6113 | {
         | ^
   kernel/trace/trace.c:6137:1: error: function definition is not allowed here
    6137 | {
         | ^
   kernel/trace/trace.c:6156:1: error: function definition is not allowed here
    6156 | {
         | ^
   kernel/trace/trace.c:6201:1: error: function definition is not allowed here
    6201 | {
         | ^
   kernel/trace/trace.c:6302:1: error: function definition is not allowed here
    6302 | {
         | ^
   kernel/trace/trace.c:6347:1: error: function definition is not allowed here
    6347 | {
         | ^
   kernel/trace/trace.c:6383:1: error: function definition is not allowed here
    6383 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +5842 kernel/trace/trace.c

7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  5840) 
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5841  static int l_show(struct seq_file *m, void *v)
1bd25a6f7173c0 Steven Rostedt          2025-03-05 @5842  {
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5843  	struct trace_array *tr = m->private;
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5844  	struct trace_mod_entry *entry = v;
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5845  
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5846  	if (v == LAST_BOOT_HEADER) {
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5847  		show_last_boot_header(m, tr);
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5848  		return 0;
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5849  	}
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5850  
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5851  	seq_printf(m, "%lx\t%s\n", entry->mod_addr, entry->mod_name);
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5852  	return 0;
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5853  }
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  5854) 
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5855  static const struct seq_operations last_boot_seq_ops = {
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5856  	.start		= l_start,
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5857  	.next		= l_next,
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5858  	.stop		= l_stop,
1bd25a6f7173c0 Steven Rostedt          2025-03-05 @5859  	.show		= l_show,
1bd25a6f7173c0 Steven Rostedt          2025-03-05  5860  };
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  5861) 

:::::: The code at line 5842 was first introduced by commit
:::::: 1bd25a6f7173c005844cd0076718b3c87bccd891 tracing: Show module names and addresses of last boot

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
