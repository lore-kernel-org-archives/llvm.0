Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC31F099C;
	Wed, 22 Oct 2025 04:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108677; cv=none; b=kGtV20QOJPQl9+r/0ej3zKUCoZ/uLrD1BNvdfDfQyS9VuvBXknvgZ3SZ1W84OuGifgF6FD0196x16von7dcLPK4tDAcIeZAdd8qnO7//UUl80TRtprevjn3oI2l3Ch8G9syO+Xk6Ju6aFHhzPPJJAWjZp27WbJ8ByXezeQJasHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108677; c=relaxed/simple;
	bh=oNcnI1xOKbehjw6oqRs3btyp6ZarBY5/CW8o6MKFEMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfMqCsx+FDBxhugNnaF4exZRjQ7zc2aHd84VduB9bcEQCtB7ATJIRe0sk1XZEkZdMskzjcWM+LiPThzbttHzo39k40WE4VFS3yISCY5CIWZLRf9oOQ8MXz9TK5UhkJZWkhy3cpUjBHxGdkvVnLU5FwPB5ropAaoYv/utA8htDkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqTtxRD3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqTtxRD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761108675; x=1792644675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNcnI1xOKbehjw6oqRs3btyp6ZarBY5/CW8o6MKFEMs=;
  b=AqTtxRD3uGK7c4QjITBgBobCm5YHZiqVovGIe2hi1CPG3fzS34Rtec/u
   taiYIhIF/SKIPoPWwDjGgPalFqnavZUchiooewfY9UUxLdW2MEg4Kx4Uy
   ayxHUmjqWjEMu7fHuF94mCVdmTOG2DDoOobRyQ4iH8kfFg05Uda/Uey2C
   0dTsWspbzyAYUdBy5qtjhjpQz5DZON9UldkLzX5o+WZH+LQ4Fcw/6gyZl
   GzDxaM5kcLNf/DQkfhd84k2xtzedG9GfDvTHFH+UeuFlGxD9AL/SN0E+W
   KtlLQBrAAYnA6fDCRMBJC5g5M6KjoDGrm07KE7b9DxOl9iRLOk203OC2u
   g==;
X-CSE-ConnectionGUID: xsgSzeDSSh60PScku2hmRQ==
X-CSE-MsgGUID: SddxJFEfRgCu4eHxmk2U1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73536305"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73536305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 21:51:15 -0700
X-CSE-ConnectionGUID: eiVSz0V9RPu47NYvzxP4zQ==
X-CSE-MsgGUID: CukPv+sWS+a4GhT9StNlwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182938867"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2025 21:51:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBQoZ-000C0T-2q;
	Wed, 22 Oct 2025 04:51:11 +0000
Date: Wed, 22 Oct 2025 12:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC DRAFT 15/50] nstree: add listns()
Message-ID: <202510221241.1ROUwVQu-lkp@intel.com>
References: <20251021-work-namespace-nstree-listns-v1-15-ad44261a8a5b@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-work-namespace-nstree-listns-v1-15-ad44261a8a5b@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/libfs-allow-to-specify-s_d_flags/20251021-200829
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251021-work-namespace-nstree-listns-v1-15-ad44261a8a5b%40kernel.org
patch subject: [PATCH RFC DRAFT 15/50] nstree: add listns()
config: x86_64-buildonly-randconfig-004-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221241.1ROUwVQu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221241.1ROUwVQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221241.1ROUwVQu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/nstree.c:499:11: warning: variable 'ns' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     499 |         else if (kls->user_ns_id)
         |                  ^~~~~~~~~~~~~~~
   kernel/nstree.c:501:7: note: uninitialized use occurs here
     501 |         if (!ns)
         |              ^~
   kernel/nstree.c:499:7: note: remove the 'if' if its condition is always true
     499 |         else if (kls->user_ns_id)
         |              ^~~~~~~~~~~~~~~~~~~~
     500 |                 ns = lookup_ns_id(kls->user_ns_id, CLONE_NEWUSER);
   kernel/nstree.c:490:22: note: initialize the variable 'ns' to silence this warning
     490 |         struct ns_common *ns, *first_ns = NULL;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +499 kernel/nstree.c

   485	
   486	static ssize_t do_listns_userns(struct klistns *kls)
   487	{
   488		u64 *ns_ids = kls->kns_ids;
   489		size_t nr_ns_ids = kls->nr_ns_ids;
   490		struct ns_common *ns, *first_ns = NULL;
   491		const struct list_head *head;
   492		bool userns_capable;
   493		ssize_t ret;
   494	
   495		VFS_WARN_ON_ONCE(!kls->user_ns_id);
   496	
   497		if (kls->user_ns_id == LISTNS_CURRENT_USER)
   498			ns = to_ns_common(current_user_ns());
 > 499		else if (kls->user_ns_id)
   500			ns = lookup_ns_id(kls->user_ns_id, CLONE_NEWUSER);
   501		if (!ns)
   502			return -EINVAL;
   503		kls->user_ns = to_user_ns(ns);
   504	
   505		/*
   506		 * Use the rbtree to find the first namespace we care about and
   507		 * then use it's list entry to iterate from there.
   508		 */
   509		if (kls->last_ns_id) {
   510			kls->first_ns = lookup_ns_owner_at(kls->last_ns_id + 1, ns);
   511			if (!kls->first_ns)
   512				return -ENOENT;
   513			first_ns = kls->first_ns;
   514		}
   515	
   516		ret = 0;
   517		head = &to_ns_common(kls->user_ns)->ns_owner;
   518		userns_capable = ns_capable_noaudit(kls->user_ns, CAP_SYS_ADMIN);
   519		guard(rcu)();
   520		if (!first_ns)
   521			first_ns = list_entry_rcu(head->next, typeof(*ns), ns_owner_entry);
   522		for (ns = first_ns; &ns->ns_owner_entry != head && nr_ns_ids;
   523		     ns = list_entry_rcu(ns->ns_owner_entry.next, typeof(*ns), ns_owner_entry)) {
   524			if (kls->ns_type && !(kls->ns_type & ns->ns_type))
   525				continue;
   526			if (!__ns_ref_active_read(ns))
   527				continue;
   528			if (!userns_capable && !is_current_namespace(ns) &&
   529			    ((ns->ns_type != CLONE_NEWUSER) ||
   530			     !ns_capable_noaudit(to_user_ns(ns), CAP_SYS_ADMIN)))
   531				continue;
   532			*ns_ids = ns->ns_id;
   533			ns_ids++;
   534			nr_ns_ids--;
   535			ret++;
   536		}
   537	
   538		return ret;
   539	}
   540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
