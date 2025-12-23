Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136AD1B4138;
	Tue, 23 Dec 2025 22:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766527361; cv=none; b=sQL6Kyui0KLPZJ7oLFWDn4aHy93mnyLPWgwcJ6MYjr8fURdgJCc78KvV+VjeVB3yxvOkU0dz0XCrUOljQHX52cjE/m1/S+d6kmbkGR+m8Zf9BhJ00NNM3pfqPigA3fSyd6y72k04dK52vYP6sfMGElscU+RAxChdK4YRtQeXJxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766527361; c=relaxed/simple;
	bh=EERO72D6Rav5U0Vw5ECe+RECTMIVyLpR7BMNIl4ObHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jBoghGU2ZLoSd/WXYX0gQFbXJpeWvTb0WZSiSVIubLQMUslxrn3IX3iI6YTbq9awG8Nzeq1xmdu9cO2ILfuA8PYWV49hFm8ctPAGDQsk2d26CsEhgb0DZb04mwiITO7ifSu15ldd66CvjEbBYbulVEngmiWp2wnvGdkw94WumC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZh6Rc2y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZh6Rc2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766527359; x=1798063359;
  h=date:from:to:cc:subject:message-id;
  bh=EERO72D6Rav5U0Vw5ECe+RECTMIVyLpR7BMNIl4ObHo=;
  b=JZh6Rc2ybpzTr968Aea8H7k+bqoDN1fHMohzwbW2xK9+/0dfoyhFyK2l
   93QuhW9A5qBjzFWfeE5Vf7XhtPFcVuDHPm3dEZeW6oiI/lXK2179wWYjf
   Ui7WsaK4JOcD/Bt24+8rW9tSdmg4K9+P66cFol/eVd+29rqSW2LYYHWsV
   5nxEcMq6p5ULHaUK9cKlbFSJsG21UMUrs8xTujL7yrn4ttmZIcNpn9jjS
   laa7S5xu9spWycXVsokY5uk9djt2hw8A9rb+7XHbsbwKQCeAB7Ltk7BTr
   SZR9TyS70UWGkAv0fRmkdl0Aw6WOWmwUToB74Pvx4fRr6fqZvhOInXMSW
   Q==;
X-CSE-ConnectionGUID: sQsOZqhOReOBQpSDYOtDdQ==
X-CSE-MsgGUID: NnhjADP5RMiR8mTlN+gsBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72003687"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="72003687"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 14:02:38 -0800
X-CSE-ConnectionGUID: hfgmYnikSj+f9HSMDCvlnQ==
X-CSE-MsgGUID: 2rwml5hyRLq0eDAPXOvQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="237276845"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Dec 2025 14:02:37 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYASg-000000002Pb-3QSj;
	Tue, 23 Dec 2025 22:02:34 +0000
Date: Wed, 24 Dec 2025 06:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrii Nakryiko <andrii@kernel.org>
Subject: [bpf-next:master 8/9] ld.lld: error: .tmp_vmlinux1.btf.o is
 incompatible with elf32lriscv
Message-ID: <202512240559.2M06DSX7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   f14cdb1367b947d373215e36cfe9c69768dbafc9
commit: 522397d05e7d4a7c30b91841492360336b24f833 [8/9] resolve_btfids: Change in-place update with raw binary output
config: riscv-randconfig-002-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240559.2M06DSX7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240559.2M06DSX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240559.2M06DSX7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: .tmp_vmlinux1.btf.o is incompatible with elf32lriscv

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
