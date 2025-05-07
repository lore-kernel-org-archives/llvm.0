Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B111FE44A;
	Wed,  7 May 2025 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596995; cv=none; b=pTn6cntBYKnQBQFIYDD+6RN5zDLkyYXVRsPyRIZoNJzqeI7ScOGTXi4qBy7Egah8fcbSzJYjsCxNuqOQ/bp3SVf5SqlA7+HFq6cFjqzmeQ0u9Fj3PmVG9+VSnPFVYxcAvcrvq4bbGKhTYa16ZhRc62+A+eOhW4bN3A7uy/ykyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596995; c=relaxed/simple;
	bh=rHtOeMv1v+04B+Ws8qxgXklXnnXyS/kMS7eX/sotCf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vtvyg2TGOzmtrGI6i/FsDGzj9q75Y1CITozDVyDXaxdUTRXRF/YiPNLyuHZCgYUXxcEX7wMxcNnCQcEpTgd5VkXBTC5kwhxL+7w5Keo/hFQD3+tXvOpUQBDK33WnNMe8hL1DxxBnYWK6kvX4nDBUn6kOGCA4ftcBWEFaitst1AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3N7jIKI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3N7jIKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596994; x=1778132994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rHtOeMv1v+04B+Ws8qxgXklXnnXyS/kMS7eX/sotCf8=;
  b=I3N7jIKIiJ3yExWEMpLKVJTW7eiJ2oqPXQdDj/NzRMdlKZgBs72EObBc
   fYlnm+bgLc3hjRRNFFKbergEgC4FYZIhPc5j9Oy7np3kMYMaWUTueREk7
   odeAKv3aATJsmXe/0o8t4P9djyq2Q0Wj5nyxDJKJ7iP0U05VY7/SzartP
   WwCxRekHWXuEjAp4EKmnPLVM/Anz51R/yThnvWvvV22ScWjXkMy8YnMQy
   C+GIrVFRdBA57GMISXmwdo8Guhx4uJRy7EOcagNHJBphOS5A0Zbd9LcJE
   j/mqj1uglbEOWCbbOzLET2EURVFN+TYvrEXQwsnJgjPsZWk3SAlBVy6J+
   w==;
X-CSE-ConnectionGUID: Z6l7m4+rTd2k8c+0e83GMQ==
X-CSE-MsgGUID: NvRJODm8RsCWPZgl2/ZI5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58936908"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58936908"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:50 -0700
X-CSE-ConnectionGUID: e7k25f1MSwa1MwA4RoGNMA==
X-CSE-MsgGUID: JrCCtrA+Qh2PQO8W+ZbVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136368901"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2025 22:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077n-35;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [linux-next:master 5904/8679] <instantiation>:7:11: error: expected
 an immediate
Message-ID: <202505071331.Z0N2eSkr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 56651128e2fbad80f632f388d6bf1f39c928267a [5904/8679] MIPS: Fix idle VS timer enqueue
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20250507/202505071331.Z0N2eSkr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071331.Z0N2eSkr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071331.Z0N2eSkr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^
>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
