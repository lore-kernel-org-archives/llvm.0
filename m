Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE83090EE;
	Sat,  7 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470026; cv=none; b=sw5xJhE97uu1j04a/vYWgIsKTtFryT47H/a2014FXtJ/3bBUZYyVZi5IiiErziZ6+8AhTSmO9wyH0HiqgsX9RqsAk5gpQdhsDRWqjmY3WY0St2/3sWdZy/KMcEc/Gx5GG3LFcJiPYGs4Bj54fjA9EgXTLYZje7oqaMmTi37/lp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470026; c=relaxed/simple;
	bh=8aE6Nq3qfwUcyLJEykr2cEmucunP43giS4/LBU4RM7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Corjn5K9RcZ05uPpxjHaNMWgfS3gE9fkeAnYk+lYI7LR7vP8SzDmsbcPeODM7UEGkxjLxMQCEjhXs03QFBLhfK5kXFl7t4PH9FDctVCXPylhW/FSn8LKy+zJrDaGHIUqCv2NyLBxNdQThcwQs4MzMF69WyMuQmkV/o9KCVzJ+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdGAGpbo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdGAGpbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770470026; x=1802006026;
  h=date:from:to:cc:subject:message-id;
  bh=8aE6Nq3qfwUcyLJEykr2cEmucunP43giS4/LBU4RM7o=;
  b=BdGAGpboHNYN8A3188Kl/4XMGTv4fQVCWOAk5kEx9fvI27UgxFRCUQM2
   SAyQOQ+3o9vZfodnXQct2bkieMm/smNMMZq0NTS8Me1fT41JtXY13y7LI
   ai0b6NlwZAmyqqi8xubMWqD5HkGEuOmhvpC0rZX4kPytmyhATSEwv/No+
   t3pNDaLRMvRJu6Z0A7XOg6h4WOSheW3FwmVQVJ1jLPrJfs6dHnStqF94N
   x/ckoIPUFsnY/CH/YHxCnaa68It1RVmVfIXFXIcXp0wRb5Aywe3FwoPP3
   rV5vRjkFrOjoqY4NW4YnEW+LExDhmxVhpnqfzBgnwmshWHBtK722jyVUw
   A==;
X-CSE-ConnectionGUID: buRPVyncRZmmXwXqH21F4g==
X-CSE-MsgGUID: pHt1cQqjQPmH0/+Dot0YTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71838709"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71838709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 05:13:45 -0800
X-CSE-ConnectionGUID: 7l/c9jgYQJKzkR8GG9WYHg==
X-CSE-MsgGUID: WX7x/eppThmlL192BKmAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210864119"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2026 05:13:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voi86-00000000leu-03EX;
	Sat, 07 Feb 2026 13:13:42 +0000
Date: Sat, 07 Feb 2026 21:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 342/347] fs/bcachefs/util/util.c:467:6:
 warning: stack frame size (1072) exceeds limit (1024) in
 'bch2_time_stats_json_to_text'
Message-ID: <202602072159.nWhhcvjt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   805636effec53f8729424c23a39685a76744c81f
commit: 901bbf17808704205ff7ed14810b2a2c602c63af [342/347] bcachefs: Add bch2_time_stats_json_to_text() printbuf wrapper
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260207/202602072159.nWhhcvjt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072159.nWhhcvjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072159.nWhhcvjt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/util/util.c:467:6: warning: stack frame size (1072) exceeds limit (1024) in 'bch2_time_stats_json_to_text' [-Wframe-larger-than]
     467 | void bch2_time_stats_json_to_text(struct printbuf *out, struct bch2_time_stats *stats,
         |      ^
   1 warning generated.


vim +/bch2_time_stats_json_to_text +467 fs/bcachefs/util/util.c

   466	
 > 467	void bch2_time_stats_json_to_text(struct printbuf *out, struct bch2_time_stats *stats,
   468					  const char *epoch_name, unsigned int flags)
   469	{
   470		char buf[1024];
   471		struct seq_buf seq;
   472	
   473		seq_buf_init(&seq, buf, sizeof(buf));
   474		bch2_time_stats_to_json(&seq, stats, epoch_name, flags);
   475		prt_bytes(out, buf, seq_buf_used(&seq));
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
