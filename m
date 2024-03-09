Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37810FC1F;
	Sat,  9 Mar 2024 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710007660; cv=none; b=Ux9EntpMO0b7F/L4SDMJHT5/BN6HrRceap7etI9WsLx9rJhvbTXv4mUDpNF9Bob918CoVPHcGU+IBAAtQ0fEyTGqhBP6hLkPp2qGTZxWCVFxjFZpfFMKKodY0dR2jamC8HbJpQFq/UaBKVjlDDowa9qXJaehu9huLvYGG2xLHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710007660; c=relaxed/simple;
	bh=jVkS2ad8fPYMwamszZ+6w37dEvmyPSb42Wn52yxBG/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2Y2CD4Ie3PbPUrFb2+XS3dtJpy0MrNnQVkrcu7sgCUrY49dGFZdL163+XXm48BQJQtE9ZxWQHQ6dXfl4y+YNLl4EKEQG9gEfYKNEnKI8uwndSvmvwo/DcPzpSRS5VfgZ4FT6k9LUZyfrkiX2HMdjUqIlG8sY24R/rIOLl4IYaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAWfAIUU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAWfAIUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710007658; x=1741543658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jVkS2ad8fPYMwamszZ+6w37dEvmyPSb42Wn52yxBG/g=;
  b=bAWfAIUUoE1m8fHs9aC1nPVBnHzkYduAasj4y6MmNG/3nePq23q5enIE
   cHyIfdHZGDCuVIl+6gpR4XDPTfYVwrWDSyKQ7BvL1Zq4iWrAVnTu3/CJ3
   E2YW1nOjsSosvjyGhGx9y/d1tSZilIrsTipjy8gCQaVOt02LmNlGLEhMo
   5GisZMmWEeAzDKhN055WIhRUz6vctQNpco1nTHToy2xltsAU4qnQY/Zib
   D7V23ZLCrmYzxdcCADIrVCzJ/4te/VF68Xcbui6fqFRMn1/7TofuBvdRB
   UC8KCpLTwmar2+lV07OBHMsHe9Y10CeR8ARUu1umleYwHDFOxcH3OCYQ6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="22173838"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="22173838"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 10:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="10852233"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2024 10:07:35 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj16a-0007ZJ-2y;
	Sat, 09 Mar 2024 18:07:32 +0000
Date: Sun, 10 Mar 2024 02:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 136/137]
 fs/bcachefs/btree_trans_commit.c:999:19: warning: shift count is negative
Message-ID: <202403100245.i6zMVKd9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d7b003a90209bd1fc2e539148dcf9eb64ae3ca89
commit: b62187885a0702d5233b59b91b19672f44ffab40 [136/137] bcachefs: map_bit()
config: i386-buildonly-randconfig-002-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100245.i6zMVKd9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100245.i6zMVKd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100245.i6zMVKd9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.c:999:19: warning: shift count is negative [-Wshift-count-negative]
     999 |         invalid_flags |= map_bit(~flags, BCH_TRANS_COMMIT_no_journal_res, BKEY_INVALID_WRITE);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:770:2: note: expanded from macro 'map_bit'
     770 |         signed_shift((_src) & _src_mask, ilog2(_dst_mask) - ilog2(_src_mask));  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:766:10: note: expanded from macro 'signed_shift'
     766 |          : (_w) >> (_s))
         |                 ^  ~~~~
   fs/bcachefs/btree_trans_commit.c:1000:19: warning: shift count is negative [-Wshift-count-negative]
    1000 |         invalid_flags |= map_bit(~flags, BCH_TRANS_COMMIT_no_journal_res, BKEY_INVALID_COMMIT);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:770:2: note: expanded from macro 'map_bit'
     770 |         signed_shift((_src) & _src_mask, ilog2(_dst_mask) - ilog2(_src_mask));  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:766:10: note: expanded from macro 'signed_shift'
     766 |          : (_w) >> (_s))
         |                 ^  ~~~~
   2 warnings generated.


vim +999 fs/bcachefs/btree_trans_commit.c

   981	
   982	int __bch2_trans_commit(struct btree_trans *trans, unsigned flags)
   983	{
   984		struct btree_insert_entry *errored_at = NULL;
   985		struct bch_fs *c = trans->c;
   986		int ret = 0;
   987	
   988		if (!trans->nr_updates &&
   989		    !trans->journal_entries_u64s)
   990			goto out_reset;
   991	
   992		memset(&trans->fs_usage_delta, 0, sizeof(trans->fs_usage_delta));
   993	
   994		ret = bch2_trans_commit_run_triggers(trans);
   995		if (ret)
   996			goto out_reset;
   997	
   998		enum bkey_invalid_flags invalid_flags = 0;
 > 999		invalid_flags |= map_bit(~flags, BCH_TRANS_COMMIT_no_journal_res, BKEY_INVALID_WRITE);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
