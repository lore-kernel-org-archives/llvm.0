Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FF221F00;
	Sat, 11 Oct 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760182555; cv=none; b=WsVA1+JlWLdzDlXgNcPcCvOVlHlMjLWyY4TzpqdR9/jN15A0iqRhaFHAYLC85oyER1ychj1QV8KxuJs0CiLBFG1UoWC4UnV91u+scHeyeUN03T1Is9xC1p2gq9/NjEU/1bd2+ZirlR/IADs78gdetuXlKJgq5ujBUH7YUY+Carc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760182555; c=relaxed/simple;
	bh=Qwx9nE59ChClGj+2o6/qydJnGr/6bfEvsCpmFoxC8fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KC9A8O4aUMStmoMjAEikXE57E8D6GzzHF+xvN+yey2p/N71V7L18eRR4JXeXKa+DT9pRqfiueOrZLApS6jKhaxQ6SoDtPXKQycJdT6XYMaoKo2CnM7bP2LaVWo4VL/ylkZPtnpMlE2wRI/E8nnLJP3yDXiiBAK2SudeF9I+NGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgFjQ26r; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgFjQ26r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760182549; x=1791718549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qwx9nE59ChClGj+2o6/qydJnGr/6bfEvsCpmFoxC8fA=;
  b=hgFjQ26rYAjq6B8yipWWHARZJrCtOXqdQk0ukYlJ6x5sufhEMMiQArpY
   K05ldDIOQosfF7rHRT3vcaYH5F73TYrI+gBK3DzmbKFaQSawmCqgAcPnt
   ISf54y+LJgqD5Mli7U7tbs6HDcudjQm5rDpC446fg29Yk6gXN0JHeXjCw
   I7nTdXVEajepffRiNvsYbPvaQnQOtojV2ONhqVrAJthc4hI1SoI8V3erO
   r2oQ/gR6dMgjWlh1GDz8xJft42HKOCMqLH4uo4oplZ5w+9y8gI8jK7DAI
   1rW1Qyc9NVRyRvFjQz5dWi75wuFCJ2olh1Df42CxCPQml8aO+9/rcAqZY
   A==;
X-CSE-ConnectionGUID: K9iR1QcoQyKtX/zLxoC1Fg==
X-CSE-MsgGUID: 0XApFSZ+QAq45DVgUqOSlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62087004"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62087004"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 04:35:48 -0700
X-CSE-ConnectionGUID: /TYwJ5OUTm2ImCH7+6gbCQ==
X-CSE-MsgGUID: QY8AQaa3QDynOSJmVw0YQw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Oct 2025 04:35:47 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Xt3-0003jh-0V;
	Sat, 11 Oct 2025 11:35:45 +0000
Date: Sat, 11 Oct 2025 19:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Junaid Shahid <junaids@google.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: [bjackman:asi/next 35/50] arch/x86/mm/tlb.c:1811:20: warning:
 function 'cr3_matches_current_mm' is not needed and will not be emitted
Message-ID: <202510111941.S3eziun0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   a6190e0f5b9d575cc97ef8289a7a6c5b0106fc4b
commit: b81276f766968738ddea77183e5b16043384ee81 [35/50] mm: asi: Avoid warning from NMI userspace accesses in ASI context
config: i386-buildonly-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111941.S3eziun0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111941.S3eziun0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111941.S3eziun0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:1811:20: warning: function 'cr3_matches_current_mm' is not needed and will not be emitted [-Wunneeded-internal-declaration]
    1811 | static inline bool cr3_matches_current_mm(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/cr3_matches_current_mm +1811 arch/x86/mm/tlb.c

  1810	
> 1811	static inline bool cr3_matches_current_mm(void)
  1812	{
  1813		struct asi *asi = asi_get_current();
  1814		unsigned long pgd_asi = __pa(asi_pgd(asi));
  1815		unsigned long pgd_cr3;
  1816	
  1817		/*
  1818		 * Prevent read_cr3_pa -> [NMI, asi_exit] -> asi_get_current,
  1819		 * otherwise we might find CR3 pointing to the ASI PGD but not
  1820		 * find a current ASI domain.
  1821		 */
  1822		barrier();
  1823		pgd_cr3 = read_cr3_pa();
  1824		return pgd_cr3 == __pa(current->mm->pgd) || pgd_cr3 == pgd_asi;
  1825	}
  1826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
