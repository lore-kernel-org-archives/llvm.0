Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6372DC344;
	Sun, 16 Nov 2025 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763299627; cv=none; b=uWehuAD8whoRePnIkJhkF7L8IraoXi4qb0kKTkyYHng8Wob8XGB8xYcCXc3ZSSv0Gr/0vC5H3851SUJ4BjspCa4+6aNO1TrgZEBp6Tm8yDuDR71irnkFOFruZN16lOlzQc07dunWybtJsSHQhR3s4bu4Qxbk2cfNPg7fxd2PBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763299627; c=relaxed/simple;
	bh=fxuxHJ0L9M/iahojHNHpH2oJDjZa/361zz4NmPF4L1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XG7Zk1qZamNxQ47Y3P9+dAWWpHfOUkSCbGRpRqaa3SMv2eT+VBVcIUlDZCsh6xsy7Cjy9FvpTOEqlFMiOvfeSqBbM2Te5zYf1a2axaru/vgZUwopSAdboewO4+tEHWX0BSq0VY2lokiiBAjeDhOOy2Jp85uw8Jldv+O70jnLP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krY2+CpL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krY2+CpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763299622; x=1794835622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fxuxHJ0L9M/iahojHNHpH2oJDjZa/361zz4NmPF4L1w=;
  b=krY2+CpLs4ul23oingRVV/6l11YORnfu6oDDGbITiQsVt2BA/8+mG7d6
   VjOZI4juSWQbg/3IY+KQlG9RbT6gUPuObWO69cV/IG3X77Kv/YZgP7V0i
   NSwJWx+45HNbIWH4ZRqyszxkv9nb8jmEy3e8Wskg6fIzMkAIHstQ7vZE7
   HZNirBAmuXducW9cP5NE7zQ+gBAJsPzehPPpFRcmw8gKeGZfTsswC8dxa
   r9SHfUMtbZ5P480E5ojhLO1Hgv/t+Ic6+HSjdQa2vYVztyUGr0OFskhy6
   W6spmdC7om430FcerJruJlWEk9vU9vkSMytz2N4IXPXRkWD9WutZEzar2
   Q==;
X-CSE-ConnectionGUID: rGyc5mEjQe6qPeyv8nygbg==
X-CSE-MsgGUID: DiqkTn0WQqKkD925TBdoLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65223779"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="65223779"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 05:26:58 -0800
X-CSE-ConnectionGUID: gTVpkbNRSiaugwx0/EJsSw==
X-CSE-MsgGUID: AQjVAoqSSFmZ9bKl5GsPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="190466957"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2025 05:26:57 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKcmM-0008mx-2b;
	Sun, 16 Nov 2025 13:26:54 +0000
Date: Sun, 16 Nov 2025 21:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 11/14] mm/vmscan.o: error: objtool:
 reclaim_throttle+0xfb: can't find switch jump table
Message-ID: <202511162102.zKpErqbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   df5520ea7e635c1cf8dd6620c2ece567ada21c26
commit: 7a98647d5f5badfa99588a7f64cd39be668fc283 [11/14] x86: Use PIE codegen for the core kernel
config: x86_64-randconfig-004-20251116 (https://download.01.org/0day-ci/archive/20251116/202511162102.zKpErqbz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511162102.zKpErqbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511162102.zKpErqbz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.o: error: objtool: reclaim_throttle+0xfb: can't find switch jump table
--
>> mm/shmem.o: error: objtool: shmem_parse_one+0x9c: can't find switch jump table
--
>> mm/madvise.o: error: objtool: madvise_should_skip+0x2f: can't find switch jump table
--
>> mm/khugepaged.o: error: objtool: madvise_collapse+0x571: can't find switch jump table
--
>> mm/mremap.o: error: objtool: move_pgt_entry+0x162: can't find switch jump table
--
>> mm/vmalloc.o: error: objtool: pcpu_get_vm_areas+0xf70: can't find switch jump table
--
>> mm/fadvise.o: error: objtool: generic_fadvise+0x12b: can't find switch jump table
--
>> mm/list_lru.o: error: objtool: __list_lru_walk_one+0x1d6: can't find switch jump table
--
>> security/commoncap.o: error: objtool: cap_task_fix_setuid+0x33: can't find switch jump table
--
>> net/compat.o: error: objtool: __ia32_compat_sys_socketcall+0x15e: can't find switch jump table
--
>> block/bfq-iosched.o: error: objtool: bfq_bfqq_expire+0x658: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
