Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA92BEC32;
	Wed, 29 Oct 2025 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749178; cv=none; b=Fmf1AqSZWHL8FS5HCnCges85uOY9Di93K6DyH/BjaPmgNtInh7JAsE4cl84tlq+i9cKBiOG2bxMxAsOumiTzschl+rQX8hE6H7RU9jFgyh6Rh8W4HqyrvEagpSpD/j7UwgxK/oVIQIK6PXLRd8S2Pg0EJU3kO3RP7zI5CDVZ31w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749178; c=relaxed/simple;
	bh=aP4SRqzhIO34pea2vImSc5uKj7MEAAvxWjOUF/PMYV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruLvGcXSqoEbobEOnHp0olYq64OsRdGqJmP0+XWtMJx7CE34Q3Ekyx8vk7iEo+Zz9M5gKEDf/7PODB0BbABRmmAzXkOqmk4Yb+uUIJHf5XlD277f0bhqJ3KDGB1sSLS2juiFtxsvFEE7ed4TVQNxCtfQ0uqm7cnVd06VEU9cMTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce3nwi7W; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce3nwi7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761749177; x=1793285177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aP4SRqzhIO34pea2vImSc5uKj7MEAAvxWjOUF/PMYV0=;
  b=Ce3nwi7Ws0svy71NwkmMokfqU1CWAbEXEewmKch4P1KC3r2IRoDulDwH
   GGBgKAwS+j9GEOBgGJf/rRsKQ7JAb2gE0qIwJHX0rw7z9A0LhK8xdEbCT
   FlBAgLMT+FJs7Rs2DoE5CotjTIPeC8rUFdltME+bBZcBSPJwC3K+l6KRc
   WqmS9w62qSh2qynw05/3uLluTy+MH3Dr55w9tUEkdD51wsDLWKr8ayJM1
   RPU76byYwx487w9y3DAAo4Yvll0RrTntFZcRvAeaYWzCCvfIj03Gutme9
   B7RxJu/xhBVlTY1j7Z81BY+XAHqGCofkjUjHuedqIwh+zoa8JC9hXUuUk
   w==;
X-CSE-ConnectionGUID: j/dSdGJGRP2iFz4+hOLApw==
X-CSE-MsgGUID: uJXtKuJKRXmWeV5/0sLlTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63573516"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63573516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 07:46:16 -0700
X-CSE-ConnectionGUID: y7+oPJ0FT2eMMEpgfAyiIw==
X-CSE-MsgGUID: Cjs2nBxMRSawNbM/GhMaWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185323418"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2025 07:46:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE7Qo-000Khd-0U;
	Wed, 29 Oct 2025 14:45:55 +0000
Date: Wed, 29 Oct 2025 22:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jann Horn <jannh@google.com>, Mike Yuan <me@yhndnzj.com>,
	Zbigniew =?utf-8?Q?J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Amir Goldstein <amir73il@gmail.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	bpf@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v4 13/72] nstree: introduce a unified tree
Message-ID: <202510292247.swX8RW4u-lkp@intel.com>
References: <20251029-work-namespace-nstree-listns-v4-13-2e6f823ebdc0@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-work-namespace-nstree-listns-v4-13-2e6f823ebdc0@kernel.org>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/libfs-allow-to-specify-s_d_flags/20251029-205841
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251029-work-namespace-nstree-listns-v4-13-2e6f823ebdc0%40kernel.org
patch subject: [PATCH v4 13/72] nstree: introduce a unified tree
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251029/202510292247.swX8RW4u-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292247.swX8RW4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292247.swX8RW4u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/nstree.c:170:43: error: no member named 'type' in 'struct ns_tree'
     170 |         VFS_WARN_ON_ONCE(ns->ns_type != ns_tree->type);
         |                                         ~~~~~~~  ^
   kernel/nstree.c:297:93: error: no member named 'type' in 'struct ns_tree'
     297 |         VFS_WARN_ON_ONCE(list_entry_rcu(list, struct ns_common, ns_list_node)->ns_type != ns_tree->type);
         |                                                                                           ~~~~~~~  ^
   2 errors generated.


vim +170 kernel/nstree.c

885fc8ac0a4dc70 Christian Brauner 2025-09-12  165  
885fc8ac0a4dc70 Christian Brauner 2025-09-12  166  void __ns_tree_remove(struct ns_common *ns, struct ns_tree *ns_tree)
885fc8ac0a4dc70 Christian Brauner 2025-09-12  167  {
885fc8ac0a4dc70 Christian Brauner 2025-09-12  168  	VFS_WARN_ON_ONCE(RB_EMPTY_NODE(&ns->ns_tree_node));
885fc8ac0a4dc70 Christian Brauner 2025-09-12  169  	VFS_WARN_ON_ONCE(list_empty(&ns->ns_list_node));
4055526d35746ce Christian Brauner 2025-09-24 @170  	VFS_WARN_ON_ONCE(ns->ns_type != ns_tree->type);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  171  
01da9c6ec4269ba Christian Brauner 2025-10-29  172  	write_seqlock(&ns_tree_lock);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  173  	rb_erase(&ns->ns_tree_node, &ns_tree->ns_tree);
01da9c6ec4269ba Christian Brauner 2025-10-29  174  	rb_erase(&ns->ns_unified_tree_node, &ns_unified_tree);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  175  	list_bidir_del_rcu(&ns->ns_list_node);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  176  	RB_CLEAR_NODE(&ns->ns_tree_node);
01da9c6ec4269ba Christian Brauner 2025-10-29  177  	write_sequnlock(&ns_tree_lock);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  178  }
885fc8ac0a4dc70 Christian Brauner 2025-09-12  179  EXPORT_SYMBOL_GPL(__ns_tree_remove);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  180  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
