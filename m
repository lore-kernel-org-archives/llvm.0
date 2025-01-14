Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5967B1D54E2;
	Tue, 14 Jan 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880017; cv=none; b=dACAfkA0hK2NC3tfdCamxPW6JSIbs/tWO90IRm8KakGSu5N8tEQE+47WYp0Hc8pI1xg0SD+12aGKrFmL3I8ZIpoEclOtrKZAKH+gNRkgQ/HRAmAjlQMplKYLf6CdoaRWAPlr0EBrj6SE8eTGR3AS2J2mcSOM192DqcghPkHhnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880017; c=relaxed/simple;
	bh=AgcyMOKi7zfKXDbbKMWInKpXMA1JqjVX+2HyK22qEVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8on31s/Q61rcFF1m8JXHy60IyfjggffdPJvNA8gcmfiXbM17FDKp6UDbcaNLPLgStKsMG19Qe5GhFIgsaQ92MsVQgFpFPl5KgiLVYH8cagHW/0ChcprrIhVZ5Loc0rXgfYu/UTXZ6a1fT4DgfUu7duCeltnWs4uMC8OQHRDa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9NVx+j1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9NVx+j1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736880015; x=1768416015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgcyMOKi7zfKXDbbKMWInKpXMA1JqjVX+2HyK22qEVE=;
  b=F9NVx+j1JvoFjaAf/uCBdlORStq/RRleoR7TiSW0UxMf2TvFNNf5F8ZS
   8r3dryJFCXfzju/MuUZ8xbeiD9iKKaCbZ4x3k0lYEa0mmqCiwmb+vgdnH
   CoyyqJ5EScFJuIsRiGBPDuuLLhCvKwhy8VCpji+i1bNoOgk8ICJ09J4Dg
   iHL65Nz9XlbysHRUQboT7WkdimjHiMNXUoaBk5Kj2mEnhmX6qKGbGxK0d
   LJXfB6iVECZAWauSxcEwWB31/+f/jRvCfsF5JU3cAaXxc4sD+SNve0oOh
   C9PXu/mV840tuAy81ExXVmGnfzvPGjgBzI7V/9DKTWk+trHixtPURNACl
   Q==;
X-CSE-ConnectionGUID: s5EJbhqKRwS3NZZoPUIWAA==
X-CSE-MsgGUID: U0z1iua3ScK/3AH61Tyr/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37348428"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="37348428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 10:40:15 -0800
X-CSE-ConnectionGUID: 28SrnblaTUmylWJ/7j3R9Q==
X-CSE-MsgGUID: SOPI95WvTAi0DXuQwnZq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104754032"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2025 10:40:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXlpi-000OtU-2T;
	Tue, 14 Jan 2025 18:40:10 +0000
Date: Wed, 15 Jan 2025 02:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kaixiong Yu <yukaixiong@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joel Granados <joel.granados@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error: static
 declaration of 'sysctl_nr_trim_pages' follows non-static declaration
Message-ID: <202501150216.3RVz44uS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-testing
head:   2fc99f285719e0cce8df1fe21479cb9e6626c2fe
commit: 0450345eca3ca45264db9ab09d31281e001236b7 [8/16] mm: nommu: move sysctl to mm/nommu.c
config: arm-randconfig-001-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150216.3RVz44uS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150216.3RVz44uS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/nommu.c:394:12: error: static declaration of 'sysctl_nr_trim_pages' follows non-static declaration
   static int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
              ^
   include/linux/mm.h:4082:12: note: previous declaration is here
   extern int sysctl_nr_trim_pages;
              ^
   1 error generated.


vim +/sysctl_nr_trim_pages +394 mm/nommu.c

   393	
 > 394	static int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
