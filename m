Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6808336D51F;
	Sat, 29 Nov 2025 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764399896; cv=none; b=X2/5QwwsokFmuHkCZOTPug0wiHWD5xJx//zEL7QYIcrVe6Y+wrTxi5lGzb18ToF/lIUA95NV/5TID++kNmsCFlPdAImPUgOx20OpJgMGpsYr4fGytueq9TbYkjje+Rjs0CmWlDX5KKhmkJbbCv6an7qAlubnzevRtq7rtRLe8R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764399896; c=relaxed/simple;
	bh=7F1Dzn2/7mwokVLDYIAc/0V4fBIjX6U1YhFnLtXmEyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edicawRIZOIg5EX5y4IC+nZmhp0QKRJ2NAgl61ufpsXhNQAzCcqTkjaLlESN9FOVbOmywiGmcb/WbEhnsbLY5MJa2AxTrqEyLEz1gz69xN81uJfE0EmTDGd+2tH0oCrlyYZJNIGy/7u6I5CR3unViLqjNz2HqglQPp1XFH3HFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdNAF9IV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdNAF9IV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764399894; x=1795935894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7F1Dzn2/7mwokVLDYIAc/0V4fBIjX6U1YhFnLtXmEyk=;
  b=PdNAF9IVIzFKKdxtWdaf53RL+ULYv5yI7JlYFKRg3zV23ksDz1ctcE3m
   zjqc42RyEKzBfElQJZM/yGQrQ7gsL5mgaRkCzIckKNrlGidtkl/xxA+pd
   sippptSxwU/fMhbdwALwRFTbXtZcjHJUfZLolJDo9/19Al3/5QALsx4wt
   YQwtooeANKAAPs8D3jQPlDQLjLRMvxcC4jqTgl0nUttCdEFNELH47TuiR
   qY1yOkUPHgtGFrKNx6+2CQc08iY9hu7KBDnMW2Zho0/QY6CypZCwvaQ/k
   mxhYvxbR3A8/NWWJWSqgYWLILEVRLeYwI/kVE7xgDL+7EAymclQl4PaoI
   Q==;
X-CSE-ConnectionGUID: BbOCV1BpRNGTvQtGoBSfOQ==
X-CSE-MsgGUID: 7mnVCvoyTLGzyM7Sb3vUiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77042985"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="77042985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 23:04:54 -0800
X-CSE-ConnectionGUID: kvK3kIsxQieKl4HxzTs5Kw==
X-CSE-MsgGUID: 6aZHHrSDQ5+1yD/2i7Maxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="192738158"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Nov 2025 23:04:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPF0k-0000000071x-0nTr;
	Sat, 29 Nov 2025 07:04:50 +0000
Date: Sat, 29 Nov 2025 15:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] afs: Fix delayed allocation of a cell's anonymous key
Message-ID: <202511291414.IgkEFchx-lkp@intel.com>
References: <800328.1764325145@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <800328.1764325145@warthog.procyon.org.uk>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc7 next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/afs-Fix-delayed-allocation-of-a-cell-s-anonymous-key/20251128-182016
base:   linus/master
patch link:    https://lore.kernel.org/r/800328.1764325145%40warthog.procyon.org.uk
patch subject: [PATCH v3] afs: Fix delayed allocation of a cell's anonymous key
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251129/202511291414.IgkEFchx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291414.IgkEFchx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291414.IgkEFchx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/security.c:29:6: warning: variable 'key' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      29 |         if (!cell->anonymous_key) {
         |             ^~~~~~~~~~~~~~~~~~~~
   fs/afs/security.c:36:13: note: uninitialized use occurs here
      36 |         if (IS_ERR(key))
         |                    ^~~
   fs/afs/security.c:29:2: note: remove the 'if' if its condition is always true
      29 |         if (!cell->anonymous_key) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/afs/security.c:26:17: note: initialize the variable 'key' to silence this warning
      26 |         struct key *key;
         |                        ^
         |                         = NULL
   1 warning generated.


vim +29 fs/afs/security.c

    20	
    21	/*
    22	 * Allocate a key to use as a placeholder for anonymous user security.
    23	 */
    24	static int afs_alloc_anon_key(struct afs_cell *cell)
    25	{
    26		struct key *key;
    27	
    28		mutex_lock(&afs_key_lock);
  > 29		if (!cell->anonymous_key) {
    30			key = rxrpc_get_null_key(cell->key_desc);
    31			if (!IS_ERR(key))
    32				cell->anonymous_key = key;
    33		}
    34		mutex_unlock(&afs_key_lock);
    35	
    36		if (IS_ERR(key))
    37			return PTR_ERR(key);
    38	
    39		_debug("anon key %p{%x}",
    40		       cell->anonymous_key, key_serial(cell->anonymous_key));
    41		return 0;
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
