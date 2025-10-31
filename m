Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C2288D2;
	Fri, 31 Oct 2025 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761908025; cv=none; b=ZPVlJnzsT4UGqWDlmYD/Fb93HsPbhmMQQA5WONvhf29n/NaaBUi40aG6GiL6kfy5qjbvIwZBEbWkY2kojycdCUasXTSZvyWc088hQ0djtiNuwa0huNz24gGtLxwSkq5WIJhSNk6muJIAI/TDcFX+zT4TRVRzY/Jv7pccJwsmnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761908025; c=relaxed/simple;
	bh=8xV4cQCDmjodPeTex43ujcHEU1yokN1i0lqWUD2SNBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NbIX56pdFI5X9jxaVECxgU1hBz3xVjeUNpptZoKOgQ/dar5exL4C/9+6Al+qiuoYKaMHNQ1J5naIlwIos5PyDQS6BQo05kIR8KbxJkqgbWJQiNc6OjU2pvEwq6TjNWJqRhAr7kvPjWVlSjTASxIFOMr7Zj64Fc64YCMMIP6gbkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dj+lJiVt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj+lJiVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761908023; x=1793444023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xV4cQCDmjodPeTex43ujcHEU1yokN1i0lqWUD2SNBk=;
  b=Dj+lJiVtJLGregv03OrfhwLyTUNoLsPzgl9UrQQLm0trWnx6S7RsCoOg
   PyVSAAp0i2uFURbZFAYMkvSWnePFlRCEWGaw97Xx7D/XWO4hErxX2r6MF
   fBk7oPr4glzC5zR5KaaVCjaQX8tnFc41v1QQsV/P+YuedLNaQqy30t7zk
   hQ/zn1KtF0BG+Rnn1juHx2iHd5aVtHzaUFTqPCKT+5EHFoKm3luWz133i
   l/1OVfP6soGetqsFUfepWkOjrrch0ZPZk6UlM+VqCtG9W5v4D8miW+1jU
   irAVvRpuhVsW/RsMx8eXh7gLGsSTskA4FBpw5Z2OgglwL9I/Y+p72YNxw
   w==;
X-CSE-ConnectionGUID: 5iTgs8AASxumKxBLJGOCQg==
X-CSE-MsgGUID: v+YFJrzvT0yCsp0C2kgRcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89531520"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89531520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:53:43 -0700
X-CSE-ConnectionGUID: pceVKnYFTiqaxftmoZGAMg==
X-CSE-MsgGUID: B0oHGn42QeWbiajWzN3dxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="217046286"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2025 03:53:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEmlG-000N1A-07;
	Fri, 31 Oct 2025 10:53:38 +0000
Date: Fri, 31 Oct 2025 18:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:namespace-6.19 13/73] kernel/nstree.c:170:43: error:
 no member named 'type' in 'struct ns_tree'
Message-ID: <202510311816.lUmY9q8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git namespace-6.19
head:   232affb34bfb5be4df33a3e7bc92154e38f74535
commit: 6696d17cfe2b00c43717aecab6f461e1a68c7b28 [13/73] nstree: introduce a unified tree
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251031/202510311816.lUmY9q8Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311816.lUmY9q8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311816.lUmY9q8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/nstree.c:170:43: error: no member named 'type' in 'struct ns_tree'
     170 |         VFS_WARN_ON_ONCE(ns->ns_type != ns_tree->type);
         |                                         ~~~~~~~  ^
   include/linux/vfsdebug.h:37:53: note: expanded from macro 'VFS_WARN_ON_ONCE'
      37 | #define VFS_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
         |                                                     ^~~~
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   kernel/nstree.c:297:93: error: no member named 'type' in 'struct ns_tree'
     297 |         VFS_WARN_ON_ONCE(list_entry_rcu(list, struct ns_common, ns_list_node)->ns_type != ns_tree->type);
         |                                                                                           ~~~~~~~  ^
   include/linux/vfsdebug.h:37:53: note: expanded from macro 'VFS_WARN_ON_ONCE'
      37 | #define VFS_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
         |                                                     ^~~~
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   2 errors generated.


vim +170 kernel/nstree.c

885fc8ac0a4dc7 Christian Brauner 2025-09-12  165  
885fc8ac0a4dc7 Christian Brauner 2025-09-12  166  void __ns_tree_remove(struct ns_common *ns, struct ns_tree *ns_tree)
885fc8ac0a4dc7 Christian Brauner 2025-09-12  167  {
885fc8ac0a4dc7 Christian Brauner 2025-09-12  168  	VFS_WARN_ON_ONCE(RB_EMPTY_NODE(&ns->ns_tree_node));
885fc8ac0a4dc7 Christian Brauner 2025-09-12  169  	VFS_WARN_ON_ONCE(list_empty(&ns->ns_list_node));
4055526d35746c Christian Brauner 2025-09-24 @170  	VFS_WARN_ON_ONCE(ns->ns_type != ns_tree->type);
885fc8ac0a4dc7 Christian Brauner 2025-09-12  171  
6696d17cfe2b00 Christian Brauner 2025-10-29  172  	write_seqlock(&ns_tree_lock);
885fc8ac0a4dc7 Christian Brauner 2025-09-12  173  	rb_erase(&ns->ns_tree_node, &ns_tree->ns_tree);
6696d17cfe2b00 Christian Brauner 2025-10-29  174  	rb_erase(&ns->ns_unified_tree_node, &ns_unified_tree);
885fc8ac0a4dc7 Christian Brauner 2025-09-12  175  	list_bidir_del_rcu(&ns->ns_list_node);
885fc8ac0a4dc7 Christian Brauner 2025-09-12  176  	RB_CLEAR_NODE(&ns->ns_tree_node);
6696d17cfe2b00 Christian Brauner 2025-10-29  177  	write_sequnlock(&ns_tree_lock);
885fc8ac0a4dc7 Christian Brauner 2025-09-12  178  }
885fc8ac0a4dc7 Christian Brauner 2025-09-12  179  EXPORT_SYMBOL_GPL(__ns_tree_remove);
885fc8ac0a4dc7 Christian Brauner 2025-09-12  180  

:::::: The code at line 170 was first introduced by commit
:::::: 4055526d35746ce8b04bfa5e14e14f28bb163186 ns: move ns type into struct ns_common

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
