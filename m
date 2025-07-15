Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40342264D5;
	Tue, 15 Jul 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752598583; cv=none; b=UVxfTDhkVBGWbcgM6DV5rhrPTNmQ6LQeOz9IAcYRlXO2B3dhO/7dTJW366YjmSvTrzWO16qthy5o7Z8BzgbwWvfxqZzStuxkvz3/9RIxvt4ie9wWw8PRTYkL5YXZm24CNReEKmGlwXjMj6EnOUCgF9WlBPTlwyNaApnvSYWa7x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752598583; c=relaxed/simple;
	bh=6Zq4vCI3EQD94atH9GTHPsSMwiAX+jSAGBU4/gLmVXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7t8aiuA9Y34TqQJjU8ix39pBblPkYC/O2XJ5iYJASzMjtXRn7VEN471yMGGUn5WyILx7thEYBHTvTuBEwVWM7E/gexTRJXZld/rvwOUCmkx6Dl3yPumktcjq03KTX5sbfaxWdvizqYDp15zhs7MlQ/2+OpZxnpz4l9BbkAxuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR1YOsdk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR1YOsdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752598582; x=1784134582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Zq4vCI3EQD94atH9GTHPsSMwiAX+jSAGBU4/gLmVXk=;
  b=KR1YOsdklIcRRL+CyRp8vtXGS75b+gUOfFDC/3Rc7UvEgDmu2clIcRy/
   R3NJCDOBRa4LHiEf1zlVmFa9iuiUCv2qJrPtdr9b7FqcxaKrTpo7lNZHR
   PvOXVOTuZnemnUS9GRhcqndiYYKjcgqwosPGnZXilsP3xfwUbXGW87M2x
   6l9ESXEa0FO+C1OHglb4RPvs4veGASZeMoUCjfqQEkyYymIwMHttdGPOY
   GqUtB08vTegkY0nzEgvU8t8Etpo8e9nZOnkSvaqcYC4RJd1Ja+5xIExjf
   M02KhMx0qqjmKOot7ae4ewPjmj7SG8dS/mCHzNCgOm2GB12/f07Kzthul
   A==;
X-CSE-ConnectionGUID: c9zcCxxjQpqpfgNaaj8nnA==
X-CSE-MsgGUID: UCJZVLz6SQizbEJKL2gChA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80271970"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="80271970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 09:56:20 -0700
X-CSE-ConnectionGUID: Ro3xxuVeReGBL21gcAAKUA==
X-CSE-MsgGUID: jVAPcq1vSRCkaCdZIgJetA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="188283059"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2025 09:56:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubiwy-000BMZ-0v;
	Tue, 15 Jul 2025 16:56:16 +0000
Date: Wed, 16 Jul 2025 00:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 172/174] fs/bcachefs/dirent.h:46:23:
 error: use of undeclared identifier 'c'
Message-ID: <202507160030.SxpLU2RF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   a6e8423df525d9fb1d0feff091aff2a0d86c5ffd
commit: 6db4e8f88c74a40e7b09ea9c7d862c54c3c75bce [172/174] fixup! bcachefs: Allow CONFIG_UNICODE=m
config: i386-buildonly-randconfig-005-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160030.SxpLU2RF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160030.SxpLU2RF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160030.SxpLU2RF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/fs.c:10:
>> fs/bcachefs/dirent.h:46:23: error: use of undeclared identifier 'c'
      46 |         return bch_err_throw(c, no_casefolding_without_utf8);
         |                              ^
   fs/bcachefs/fs.c:1108:3: error: cannot jump from this goto statement to its label
    1108 |                 goto err;
         |                 ^
   fs/bcachefs/fs.c:1110:21: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1110 |         CLASS(btree_trans, trans)(c);
         |                            ^
   2 errors generated.
--
   In file included from fs/bcachefs/inode.c:10:
>> fs/bcachefs/dirent.h:46:23: error: use of undeclared identifier 'c'
      46 |         return bch_err_throw(c, no_casefolding_without_utf8);
         |                              ^
   1 error generated.


vim +/c +46 fs/bcachefs/dirent.h

    25	
    26	#if IS_ENABLED(CONFIG_UNICODE)
    27	int bch2_casefold(struct btree_trans *, const struct bch_hash_info *,
    28			  const struct qstr *, struct qstr *);
    29	
    30	static inline int bch2_maybe_casefold(struct btree_trans *trans,
    31					      const struct bch_hash_info *info,
    32					      const struct qstr *str, struct qstr *out_cf)
    33	{
    34		if (likely(!info->cf_encoding)) {
    35			*out_cf = *str;
    36			return 0;
    37		} else {
    38			return bch2_casefold(trans, info, str, out_cf);
    39		}
    40	}
    41	#else
    42	static inline int bch2_maybe_casefold(struct btree_trans *trans,
    43					      const struct bch_hash_info *info,
    44					      const struct qstr *str, struct qstr *out_cf)
    45	{
  > 46		return bch_err_throw(c, no_casefolding_without_utf8);
    47	}
    48	#endif
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
