Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CC6101F2;
	Tue,  1 Jul 2025 00:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329948; cv=none; b=XsqmcOTIUrN8tYE2LC9eswTt2dnC8gQi8Wxy4n3OWlwGvEByKzQ+xSql76IlAuteP11vtuul34elXhpCoogt2t6H2+Z7CDzpQba+mCxbtMqId+6y1I53o5Z4h2olK4UQ8+lumuxbTSFxRx6ymlwtVZXjbfxxdqtrN5s/o7jPUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329948; c=relaxed/simple;
	bh=qBsJM7jyXytfyhHcxnnncvZRM4YzLgWm78hSNTUfLtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MMvg6uqqTSSbrtJGbQ3q4c0hHWZszKdL01xLYhjyOioP9ElfresF+InYc9+evzBcEslA5ws0HX78jR6f8fwv6gtvLp0YrhalCsadLIhMK4zNtPUERH4joXO+qxIJmSLsYJIg/bmNJn78zz+dJR5gv8VHe1dOmOcEQApPpZs+D5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVTSJVtU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVTSJVtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751329946; x=1782865946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBsJM7jyXytfyhHcxnnncvZRM4YzLgWm78hSNTUfLtY=;
  b=QVTSJVtUZHiQeh/Qt+Ox7WjALgKuVzKeW2WsoSFspbp9GLep82HAgKti
   lwzq11TOapF/eUKXdu3JIJMpB+/sn6sUhY1ytkW0PfamT6CaZchhTQ2qb
   Yhf3T6kQN/DMbF/RKD3FReFK+gazt9K59nPMduQ/rn637spn2F6dVPsa+
   KKUlkWFwSkx7n0eqnZrCRipEL5X4Vp74XQtxkv68AnKVQixGa/adyxN3c
   Z3qTvG1mEszwrPLWOY/K7vyi15UTnkS+K6q52I0CeEHWZ0mqT3LFzhEeI
   R83MhewWkU8pfJZ/xSThg8C9UoIvmsKKl+9MH6/pWS0uu/DvTJMFX5vcN
   w==;
X-CSE-ConnectionGUID: hMaZ8BTgR2iYJiab0Bb4Cg==
X-CSE-MsgGUID: VN8MMl10TZqBKBqRthAMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="79014262"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="79014262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 17:32:26 -0700
X-CSE-ConnectionGUID: 4rMC11u6Sv29p055FCy19A==
X-CSE-MsgGUID: rO9OrNlVSb62/J3EfT+TZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="154333165"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2025 17:32:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWOv9-000ZTW-0H;
	Tue, 01 Jul 2025 00:32:23 +0000
Date: Tue, 1 Jul 2025 08:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/ftrace+kprobes 1/5] mm/execmem.c:398:8: error:
 call to undeclared function 'execmem_force_rw'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202507010810.GlEoFWbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/ftrace+kprobes
head:   613ecd4bb6b74a860ac4f227a325d4ba9e7cac8e
commit: e5f977585f86b7b52a41661128872f622e8a2641 [1/5] dev: execmem: add execmem_alloc_rw
config: s390-randconfig-002-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010810.GlEoFWbv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010810.GlEoFWbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010810.GlEoFWbv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/execmem.c:398:8: error: call to undeclared function 'execmem_force_rw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     398 |         err = execmem_force_rw(p, size);
         |               ^
   1 error generated.


vim +/execmem_force_rw +398 mm/execmem.c

   389	
   390	void *execmem_alloc_rw(enum execmem_type type, size_t size)
   391	{
   392		void *p __free(execmem) = execmem_alloc(type, size);
   393		int err;
   394	
   395		if (!p)
   396			return NULL;
   397	
 > 398		err = execmem_force_rw(p, size);
   399		if (err)
   400			return NULL;
   401	
   402		return no_free_ptr(p);
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
