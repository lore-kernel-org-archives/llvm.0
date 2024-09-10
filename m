Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CB43C0C;
	Tue, 10 Sep 2024 00:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725928156; cv=none; b=ZsX4O7PSXwnrwmtliJjgW2jiubbru12Yjqf4UnrORMB3Av/0A/r/B/rLELJWsr8pB5xlvNliqYoBRe1puFkvNNX43ouY8qVAdppd2+/7D9xzLSWQUsf2lbbdD3asy5SzTR2wBgM6MfmBsqdgBqi+Xt5X6W0WLIcfSM19BKynX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725928156; c=relaxed/simple;
	bh=7fPNm5/sxCPJLu50eVZZR/kI0/DhS4yy4HpuRTm6se4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2otL+lA+LEbX1FTWI5cRyuEXU07yJLihoqURUhYYbJmb0QxD6ER+3N4CeM9sRW6d1/00PIKpsTpQyxeNK4DQr/majmazJjlToxaK29ivNqfeM6Q+SxTgJYtMq7U6uYkXQh+b598vdfObcxKhACvJgFP2USVqZRQppTRSXMsvZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlGbawu/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlGbawu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725928155; x=1757464155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fPNm5/sxCPJLu50eVZZR/kI0/DhS4yy4HpuRTm6se4=;
  b=SlGbawu/MvXUq1E5I3KetlhI8YbFetGm/aa3A7n1tD/KF4nXDhkm/eZ6
   QjmJqvOtfFZ7ZJ+/EvL6v4kxgztL9wPmi+UUQ4vnJixbXokNueCZyXLqA
   oYtNWO4jpcfXBvIj9lu4BXWLsv0l2oh7IKuIaLLg1629EjfwsxfK9YYXS
   nHVGfy547/68WYxTqTDWiNMFiisub3aSOffD1DPbxNawNCvF9d57m9wwM
   7jOVZAnW8qZG84+nb7juB2H/picm6oH2ZGu16tCnEvBdm5KtvgICqVKaX
   KNNC1Ts0tDptYjJS9apBA6ELXKIMNbJyzyRXEG46qvNYaTCogFL+5cNqu
   Q==;
X-CSE-ConnectionGUID: aHBmevThQ6aAEBEzkg02bQ==
X-CSE-MsgGUID: PatehOjkQB6aOZDrlT6cWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36035094"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="36035094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 17:29:14 -0700
X-CSE-ConnectionGUID: Z3m8elRgRVWXItUpKWkVsg==
X-CSE-MsgGUID: 6ObswO2DSCqOhZAf49O/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67101639"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 17:29:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snoko-000FOx-39;
	Tue, 10 Sep 2024 00:29:10 +0000
Date: Tue, 10 Sep 2024 08:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 199/258]
 fs/bcachefs/btree_locking.h:450:69: warning: omitting the parameter name in
 a function definition is a C2x extension
Message-ID: <202409100859.BQhTo30Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: edde99ce91c811e0b46b10c82e21d883ba0cb4aa [199/258] bcachefs: Path must be locked if trans->locked && path->should_be_locked
config: powerpc64-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100859.BQhTo30Z-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100859.BQhTo30Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100859.BQhTo30Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/move.c:9:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:450:69: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
                                                                       ^
   1 warning generated.
--
   In file included from fs/bcachefs/journal_io.c:5:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:450:69: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
                                                                       ^
   fs/bcachefs/journal_io.c:1566:35: warning: unused function 'journal_last_unwritten_buf' [-Wunused-function]
   static inline struct journal_buf *journal_last_unwritten_buf(struct journal *j)
                                     ^
   2 warnings generated.


vim +450 fs/bcachefs/btree_locking.h

   445	
   446	#ifdef CONFIG_BCACHEFS_DEBUG
   447	void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *);
   448	void bch2_trans_verify_locks(struct btree_trans *);
   449	#else
 > 450	static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
   451	static inline void bch2_trans_verify_locks(struct btree_trans *trans) {}
   452	#endif
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
