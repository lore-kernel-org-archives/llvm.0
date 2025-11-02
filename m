Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFCC23EA82;
	Sun,  2 Nov 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101578; cv=none; b=N+yqzIzBkAv1emIFrssiPy62Axhf1GTTfB6XSAMW+j4NeFRWDpJSEUWQtbadMxhu1ElRwK0PGzshu0Kz50r/mfgzF84+RGb/2msCAoYrOlkmsgyfAs5IBadCJSTVRVqz2j1q4GUYxU0saU9kc9xChM0VjEWg3RR1znLld0Syq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101578; c=relaxed/simple;
	bh=jpyxDNfZdCNZyktO+9Dc38Cd+dAAumraCzbRRsom1Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVCUMFxPlnfvhVe+qCeBRz/QsnsDRK8aPrEHFHum1ZUgekRv/oDUcm9kXj2hQieKQgjt6kLggkX6c0DhlpJqSz/ZlqFynuaLlVCTPvjefr0piSwh6XUVjdg8sN8/xTYH6yjBouJlp1h49dfAQqKFGmNq6CZ7Zd5BT+QJ+T8xi+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atn0BHYu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atn0BHYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762101576; x=1793637576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jpyxDNfZdCNZyktO+9Dc38Cd+dAAumraCzbRRsom1Hs=;
  b=atn0BHYuh21Tr3kNiAeBcynWqNSvNX/ppWuFiiiWRIapMDfJmqGM8+r3
   Ht2Zny8cBmmkeqz1CUCV/+mgO9dhkP+I/l9evo8BCpVZ64R13znxfNLPF
   HN9ynFMNWngBB6D+8xp8cEa4d+fqGdTQ02a+Cya3KCYY3ClZaolLpzGlV
   P+sKc9GXp3bwdv3fIvNnSFaOR0TVbPoi36DNTLOZot7fjW96R4H5wxgIU
   B0mybl5hju0PW73cem5pbwHO1+P3cqlFDOfAc2x2UxPpJfQax4bbnaUQd
   lT5293Bn2MZO9fMLNO/yiwmVpN567143j+7LuVrYkSHgS+PCZFB+qA80G
   w==;
X-CSE-ConnectionGUID: kKxCoNT8T0CPxsnvBj47kw==
X-CSE-MsgGUID: NfRIeJVMQf608k9pRBJgUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74484360"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="74484360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 08:39:35 -0800
X-CSE-ConnectionGUID: lWqWAaUiS9movxCgI5iTcg==
X-CSE-MsgGUID: UyVkSAroQkCREhUmWszrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="210213881"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2025 08:39:33 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFb2M-000POA-0o;
	Sun, 02 Nov 2025 16:35:51 +0000
Date: Mon, 3 Nov 2025 00:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: <instantiation>:7:11: error: expected an immediate
Message-ID: <202511030036.kg3v3YEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marco,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   691d401c7e0e5ea34ac6f8151bc0696db1b2500a
commit: 56651128e2fbad80f632f388d6bf1f39c928267a MIPS: Fix idle VS timer enqueue
date:   6 months ago
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20251103/202511030036.kg3v3YEd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030036.kg3v3YEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030036.kg3v3YEd-lkp@intel.com/

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
