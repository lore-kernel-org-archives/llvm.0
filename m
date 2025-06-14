Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EBA2E11C1;
	Sat, 14 Jun 2025 03:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749872458; cv=none; b=LyPJCVup+bV/JSKII6jSEDko/ZhufNUD6pSAp4bhQn5U1UjD/R2bHF9UdmQxk3sabW2IYx4hOMeF8KN3fkaSeYiOI/0RQDFx4MOgCFtSq5Jgfre1WEs9HtYmpox6KQxcZMGFBJd6h3DkZkpooiBqrpJT3evvM9acV8c67QQScvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749872458; c=relaxed/simple;
	bh=YrVEucyXKWB6leghkV31ouVYEmpKu6XO2jZTXr4DLEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hM1eC7auNrar4+7xklM2+SkStGuHgZfYGKkWuDOqBVeMh9GWC/bLUY9lYPgWl0b8sPoeJ6acECiI5nzz9r8cgD0hBhEybFHuRSonBpgThdIaXWGNs/tL6NuEuI11FZ0/xw/F2yIuijXajEid5+fHOc7JL04nVO+yFZOagGg5iGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9MXEOqw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9MXEOqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749872457; x=1781408457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YrVEucyXKWB6leghkV31ouVYEmpKu6XO2jZTXr4DLEM=;
  b=V9MXEOqw+wCq3NjI2n1UMl9Hb5MlxEPMzvV6DJlp5IaKI+Hz3WemqpNE
   RWsAWzEogKnoikdaBawR8HjMpYLYLhcdO+uacJJ0nlLrVPCRcQZmRx7F9
   FSWBrKncsdo0AQNWtlS0TqFIknmW2QLIaVH1gZA6D/E0hFLHs+wgbPkpC
   SOvxeohTatgN8O9f0taSk7Dvu09bkCMtstFs5czbBNSHfYwoX2j8MObN2
   et962d9Izi90sBuWPaK45tvscx+uGDForxipFEZquXSZC6VdQqBiJPWui
   YVLOem0ND7H1AZqNX0pQV0X1/nEPp3FhhpUCq3//LtfeN4MYkDBAqBOZH
   A==;
X-CSE-ConnectionGUID: hzPTH7ZNQOiykPwwulAyxw==
X-CSE-MsgGUID: 7ti/m+adQWuRQxjwI81ruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52229353"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="52229353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 20:40:56 -0700
X-CSE-ConnectionGUID: v+ELZwfrR3eEKHqQi3jPlA==
X-CSE-MsgGUID: rzOyZdHWTZS8TzE1D0iGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="153149910"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2025 20:40:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQHlE-000DFk-0a;
	Sat, 14 Jun 2025 03:40:52 +0000
Date: Sat, 14 Jun 2025 11:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 39/58] fs/bcachefs/btree_journal_iter.c:716:6:
 warning: variable 'nr_entries' set but not used
Message-ID: <202506141140.fVn0pMnH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   6053c975f41c17553b50bb62d68a33bdd7c8283b
commit: 3939cc33bcc7bdd00723b25127a4004558dd0b60 [39/58] bcachefs: opts.journal_rewind
config: arm-randconfig-002-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141140.fVn0pMnH-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141140.fVn0pMnH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141140.fVn0pMnH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_journal_iter.c:716:6: warning: variable 'nr_entries' set but not used [-Wunused-but-set-variable]
     716 |         u64 nr_entries = 0, nr_non_ignored = 0;
         |             ^
>> fs/bcachefs/btree_journal_iter.c:716:22: warning: variable 'nr_non_ignored' set but not used [-Wunused-but-set-variable]
     716 |         u64 nr_entries = 0, nr_non_ignored = 0;
         |                             ^
   2 warnings generated.


vim +/nr_entries +716 fs/bcachefs/btree_journal_iter.c

   709	
   710	int bch2_journal_keys_sort(struct bch_fs *c)
   711	{
   712		struct genradix_iter iter;
   713		struct journal_replay *i, **_i;
   714		struct journal_keys *keys = &c->journal_keys;
   715		size_t nr_read = 0;
 > 716		u64 nr_entries = 0, nr_non_ignored = 0;
   717	
   718		u64 rewind_seq = c->opts.journal_rewind ?: U64_MAX;
   719	
   720		genradix_for_each(&c->journal_entries, iter, _i) {
   721			i = *_i;
   722	
   723			nr_entries += i != NULL;
   724	
   725			if (journal_replay_ignore(i))
   726				continue;
   727	
   728			nr_non_ignored++;
   729	
   730			cond_resched();
   731	
   732			vstruct_for_each(&i->j, entry) {
   733				bool rewind = !entry->level &&
   734					!btree_id_is_alloc(entry->btree_id) &&
   735					le64_to_cpu(i->j.seq) >= rewind_seq;
   736	
   737				if (entry->type != (rewind
   738						    ? BCH_JSET_ENTRY_overwrite
   739						    : BCH_JSET_ENTRY_btree_keys))
   740					continue;
   741	
   742				if (!rewind && le64_to_cpu(i->j.seq) < c->journal_replay_seq_start)
   743					continue;
   744	
   745				jset_entry_for_each_key(entry, k) {
   746					struct journal_key n = (struct journal_key) {
   747						.btree_id	= entry->btree_id,
   748						.level		= entry->level,
   749						.rewind		= rewind,
   750						.k		= k,
   751						.journal_seq	= le64_to_cpu(i->j.seq),
   752						.journal_offset	= k->_data - i->j._data,
   753					};
   754	
   755					if (darray_push(keys, n)) {
   756						__journal_keys_sort(keys);
   757	
   758						if (keys->nr * 8 > keys->size * 7) {
   759							bch_err(c, "Too many journal keys for slowpath; have %zu compacted, buf size %zu, processed %zu keys at seq %llu",
   760								keys->nr, keys->size, nr_read, le64_to_cpu(i->j.seq));
   761							return bch_err_throw(c, ENOMEM_journal_keys_sort);
   762						}
   763	
   764						BUG_ON(darray_push(keys, n));
   765					}
   766	
   767					nr_read++;
   768				}
   769			}
   770		}
   771	
   772		__journal_keys_sort(keys);
   773		keys->gap = keys->nr;
   774	
   775		bch_verbose(c, "Journal keys: %zu read, %zu after sorting and compacting", nr_read, keys->nr);
   776		return 0;
   777	}
   778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
