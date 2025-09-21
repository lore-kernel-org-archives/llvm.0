Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC71400E;
	Sun, 21 Sep 2025 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758437892; cv=none; b=lqaYko9lV3vKaquUH+PT58Gzo+P0tWIJuiSLZo1SrbNTzy+nZtlICwZl8v7ZKLj9S7hiDp9A1//JQlxjYqkqm2dx/8MBJN7armRTawjJ6qL4aWi9Gm87J7XjXpS+lhACjiR8P9Xdn6xjvu3LwPhAzEpBFwNViJ2aTNfou7blX80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758437892; c=relaxed/simple;
	bh=tQIG7qkE7NA8A8NdzsCaBaPvW4jbVvucGCF8Gdnq2wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KC1ZV47hwK+ZswFeTWBJK2bQM3ETuoNA0vLgIWRKR3tIbl2XfSduy9SYEty5tCm4DuK8mMV/nDlLEsh9MmGrkdarbmVVVs6f7GP4vafCZgcNMqMaLX7s/smiFEz2JTKDD5khB6pRQ9fFmC1DOVUbqPFsgqivXtzvJp6hahx+lpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mT+LkJJJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mT+LkJJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758437889; x=1789973889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQIG7qkE7NA8A8NdzsCaBaPvW4jbVvucGCF8Gdnq2wc=;
  b=mT+LkJJJbc9ngzptSwV/yVQ12rURYpbP5d5bWlWzR3ZkPG/pQ/aGVIu5
   ScrSOtQsNulcOeLiMhzgdgPXI2RHlLxH70PUaGUlGBsoRmRBsTBigr61J
   Ubr4sL+oeT8qxEwGkrfh9jzZ8xrRyAlzij8iyGJMrvvesx4lVHtDjL7mp
   oWT39bvg/UmnnO3wH67qcLdIEJS/bKArsByQ9aXK4iL0k7tx61Z+IgTh0
   OU2UD/nEz1iyAf4ApdVYdeltq57emMm2T1U8EfFAbVwZ6yQpZiyh3jryw
   a0XRnj1DsaI+0CrJZTk9xZiP336howNzMWrvNTMBX2SnH5veiT5i2K7AR
   Q==;
X-CSE-ConnectionGUID: mNiE6Wf0TLaZI/xFm8xUQQ==
X-CSE-MsgGUID: 3LSPFbgXT8SY4BOzVEdoqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="70980954"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="70980954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 23:58:09 -0700
X-CSE-ConnectionGUID: 0JwsK07KTym0p/XuKj++BA==
X-CSE-MsgGUID: cJ3cNDp+SgGBJ0UlI/k4kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="180618679"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2025 23:58:07 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0E1N-0000XH-1P;
	Sun, 21 Sep 2025 06:58:05 +0000
Date: Sun, 21 Sep 2025 14:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: <instantiation>:7:11: error: expected an immediate
Message-ID: <202509211441.wZt0EM95-lkp@intel.com>
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
head:   f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
commit: 56651128e2fbad80f632f388d6bf1f39c928267a MIPS: Fix idle VS timer enqueue
date:   5 months ago
config: mips-rb532_defconfig (https://download.01.org/0day-ci/archive/20250921/202509211441.wZt0EM95-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211441.wZt0EM95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211441.wZt0EM95-lkp@intel.com/

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
