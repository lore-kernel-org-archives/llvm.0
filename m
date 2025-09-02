Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343432F75F;
	Tue,  2 Sep 2025 05:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756790148; cv=none; b=NgX9ilJS9ybeoqx/LdmVnpe1yNbqKAS0IWOxGOqQAk8kgV8LL9XbxV/0dpLja9Bg+N/cj3S6c/LySZyvKtpPExscSdltJKdEUKwgMUCIk4KKiCxAewXiGGpHFa5Ibs/SLcQhgKl+qQkiuh9P2N8dluQUDhXimeW9zmmoKbL9sis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756790148; c=relaxed/simple;
	bh=jMpXdgHiv6wOMMk2UtMONWqg5gfjgoaKQ7mv3sxZprQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEwkiZOkdqpsrIeBRlCXwM4mAJ97ZsYShF9DN+YEP/Qh+85GAaEYb45PF30cLrl/TwfruWFxH7Rc0e687XagwtEEh2foTqR8+lbuMXaqvRYeAYeJA40TEzivLFcpEQRgpv8HX5rTrvaAFuL7CW8IopNqzS2buIiaSIswES4GAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PL/Og10G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PL/Og10G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756790147; x=1788326147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMpXdgHiv6wOMMk2UtMONWqg5gfjgoaKQ7mv3sxZprQ=;
  b=PL/Og10GyIxJCNbk0hrQ3P/3ECFRUyNSV4T/+vWo5Iebmhk8IauFGGZw
   DK5u1cNnx92A4lRt0MvBILR6m+x92B/kd0DwpnCSA/3os75blXEb7XqNE
   F2ms1MeG5mIBxMKk1pJWuJPnEGKlbopj9Qeq7eJltPt5TqVyUC1RHvybp
   +sZqClUefCop8Z3VIQQbmCe8EoXesIDq4AHGODJY9vKx5hTLH+aI16iHf
   58fJoJnvwUYIqKT3bVvWDqsTNJXVWtooJ82shIevLQ7npoa7hcP5n9Pak
   Ffe+eksnJHvHuN9d9/XkOIALO/D6UjgeDil2t/J6Oux+u1ufXwj6TLbQT
   g==;
X-CSE-ConnectionGUID: RAGvpebJQnqzICYmEz1wpQ==
X-CSE-MsgGUID: ZwXPbgAzS36BFEhGSpGjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="84460706"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="84460706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 22:15:46 -0700
X-CSE-ConnectionGUID: pM5X2ulzQPGB3SE15tCAFg==
X-CSE-MsgGUID: lyTpVJErTSGWbQbF8O5kOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170440472"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2025 22:15:44 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utJML-0001SY-1t;
	Tue, 02 Sep 2025 05:15:17 +0000
Date: Tue, 2 Sep 2025 13:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 349/349] fs/bcachefs/rebalance.c:132:50:
 warning: variable 'ec' set but not used
Message-ID: <202509021339.LIDKTzQO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ea00c2fe19d282d2563fb11b6548b484ee21d55a
commit: ea00c2fe19d282d2563fb11b6548b484ee21d55a [349/349] bcachefs: bcachefs_metadata_version_rebalance_v2
config: s390-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021339.LIDKTzQO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021339.LIDKTzQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021339.LIDKTzQO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/rebalance.c:132:50: warning: variable 'ec' set but not used [-Wunused-but-set-variable]
     132 |         bool incompressible = false, unwritten = false, ec = false;
         |                                                         ^
>> fs/bcachefs/rebalance.c:133:11: warning: variable 'durability' set but not used [-Wunused-but-set-variable]
     133 |         unsigned durability = 0, min_durability = INT_MAX;
         |                  ^
   fs/bcachefs/rebalance.c:520:30: warning: unused variable 'r' [-Wunused-variable]
     520 |         struct bch_extent_rebalance r =
         |                                     ^
   3 warnings generated.


vim +/ec +132 fs/bcachefs/rebalance.c

   126	
   127		unsigned compression_type = bch2_compression_opt_to_type(r.background_compression);
   128		unsigned target		= r.background_target;
   129		if (target && !bch2_target_accepts_data(c, BCH_DATA_user, target))
   130			target = 0;
   131	
 > 132		bool incompressible = false, unwritten = false, ec = false;
 > 133		unsigned durability = 0, min_durability = INT_MAX;
   134	
   135		const union bch_extent_entry *entry;
   136		struct extent_ptr_decoded p;
   137		unsigned ptr_idx = 1;
   138	
   139		guard(rcu)();
   140		bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
   141			incompressible	|= p.crc.compression_type == BCH_COMPRESSION_TYPE_incompressible;
   142			unwritten	|= p.ptr.unwritten;
   143	
   144			if (!p.ptr.cached) {
   145				if (p.crc.compression_type != compression_type)
   146					*compress_ptrs |= ptr_idx;
   147	
   148				if (target && !bch2_dev_in_target(c, p.ptr.dev, target))
   149					*move_ptrs |= ptr_idx;
   150	
   151				unsigned d = bch2_extent_ptr_durability(c, &p);
   152				durability += d;
   153				min_durability = min(min_durability, d);
   154	
   155				ec |= p.has_ec;
   156			}
   157	
   158			ptr_idx <<= 1;
   159		}
   160	
   161		if (unwritten)
   162			*compress_ptrs = 0;
   163		if (incompressible)
   164			*compress_ptrs = 0;
   165	
   166		if (*compress_ptrs)
   167			r.need_rb |= BIT(BCH_REBALANCE_background_compression);
   168		if (*move_ptrs)
   169			r.need_rb |= BIT(BCH_REBALANCE_background_target);
   170		return r;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
