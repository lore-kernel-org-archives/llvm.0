Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD51A42B4;
	Tue,  3 Sep 2024 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361686; cv=none; b=rQTBLJX9UCBTxtszd3/2dS/Ve3q1vm3Ing8NLRQi6gSKQLMT/GMx2SvSRHH+BQ8bYdSyHdv1rzwOxRLhPaZHlQMUE76Dd2lflMJ9rigKN7kyYpubfa6aKN7nDVCAq5gQKLDcwnT+to8aQjwum32eHuJzxpYphhVghszLO0v3FYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361686; c=relaxed/simple;
	bh=CTGV5cSWNEwdtCEqsR0WZlu+pKua+Ipafbs6CHg0sqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwZitzDNf90xhnXPgjPtOnsvQgCaFjzODbAVMljvzrkQI4ovd7be9EGmnUCcmlN8/3CpgrBZ9y++rbnFuyMVO5geG12GB76JqmB8SJEKsMwhWylTeDoqxChyAH0pzoiQH/DAIudw1j7tasxWa1vkQzBL8cHd0S23jgjMdI3gBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IO5+Q7bO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IO5+Q7bO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725361684; x=1756897684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTGV5cSWNEwdtCEqsR0WZlu+pKua+Ipafbs6CHg0sqg=;
  b=IO5+Q7bO78vTsVHjQTDrlfnOk6F3QgAoL2A/k9vQvcQYS+Bv/VG5APqS
   I3VDvwjrOG+G93yaMBY4wE7xL56mczzTM0BCNpiqVMb79E4cYrtgkOh8n
   ST8QiO7EaCut6dSuFmhkZeQLYwZXAMNTqBt8XTc8FaG89z3+wEjLKdcMV
   AXtgl0qtl6qRgHDkk0ioYk+M1xxE9WwUVL/sCSUTM6iuk1ENd6fAlZ00j
   numfxKhv11nPFwiuAIerE3twxt7VIirKt6oN/qyUxGzMSEW37pQzEi8gq
   Jp9l2gbD+DAuMeLIzhqW/h/3nAlsLbavPujcUtoetnLjA2E1QiQN/K/MH
   g==;
X-CSE-ConnectionGUID: D5/6gUFvRAGu+Wvqamha7g==
X-CSE-MsgGUID: McrRKBZ7TFexQy5jV6XZ5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="26867827"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="26867827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:08:00 -0700
X-CSE-ConnectionGUID: mDgBZVmTS0Ku1cA481AZHg==
X-CSE-MsgGUID: Tbten34rRRiMy3U7FRYB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="64886686"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2024 04:07:59 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slRO8-0006XW-1a;
	Tue, 03 Sep 2024 11:07:56 +0000
Date: Tue, 3 Sep 2024 19:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7634/8795] fs/bcachefs/sb-members.c:503:2: error:
 expected expression
Message-ID: <202409031807.S80qlUjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: 4e7795eda4459bf3e69c87c793bc34f610f9d981 [7634/8795] bcachefs: bch2_sb_member_alloc()
config: powerpc64-randconfig-003-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031807.S80qlUjK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031807.S80qlUjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031807.S80qlUjK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/sb-members.c:503:2: error: expected expression
           unsigned nr_devices = max_t(unsigned, dev_idx + 1, c->sb.nr_devices);
           ^
>> fs/bcachefs/sb-members.c:507:42: error: use of undeclared identifier 'nr_devices'
                                        le16_to_cpu(mi->member_bytes) * nr_devices, sizeof(u64));
                                                                        ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   fs/bcachefs/sb-members.c:513:30: error: use of undeclared identifier 'nr_devices'
           c->disk_sb.sb->nr_devices = nr_devices;
                                       ^
   3 errors generated.


vim +503 fs/bcachefs/sb-members.c

   476	
   477	int bch2_sb_member_alloc(struct bch_fs *c)
   478	{
   479		unsigned dev_idx = c->sb.nr_devices;
   480		if (dev_idx < BCH_SB_MEMBERS_MAX)
   481			goto have_slot;
   482	
   483		int best = -1;
   484		u64 best_last_mount = 0;
   485		for (dev_idx = 0; dev_idx < BCH_SB_MEMBERS_MAX; dev_idx++) {
   486			struct bch_member m = bch2_sb_member_get(c->disk_sb.sb, dev_idx);
   487			if (bch2_member_alive(&m))
   488				continue;
   489	
   490			u64 last_mount = le64_to_cpu(m.last_mount);
   491			if (best < 0 || last_mount < best_last_mount) {
   492				best = dev_idx;
   493				best_last_mount = last_mount;
   494			}
   495		}
   496		if (best >= 0) {
   497			dev_idx = best;
   498			goto have_slot;
   499		}
   500	
   501		return -BCH_ERR_ENOSPC_sb_members;
   502	have_slot:
 > 503		unsigned nr_devices = max_t(unsigned, dev_idx + 1, c->sb.nr_devices);
   504	
   505		struct bch_sb_field_members_v2 *mi = bch2_sb_field_get(c->disk_sb.sb, members_v2);
   506		unsigned u64s = DIV_ROUND_UP(sizeof(struct bch_sb_field_members_v2) +
 > 507					     le16_to_cpu(mi->member_bytes) * nr_devices, sizeof(u64));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
