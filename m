Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553D335B152;
	Wed, 21 Jan 2026 04:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768970253; cv=none; b=uftTjUQ1l+Xb4oD29Beuz+nhacev16fcFbg4walSBWQLCRv7rIkozUFWXXFfQmTlqHu9ZJ7nTpT7jeJS3eN3nyy4WKkUdK8aJtElG5u9dg2ZIrUGTmjn9CBscJAdesG74mzLOxgufV1+x01JF5brnjh09UOFqq/E8GsMnMdeUvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768970253; c=relaxed/simple;
	bh=G5dShjbFsE5k9+rZ7aymHy3jbkiq3aAgKGfeZvaF4a0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H+lukuQ+FXumjghhTcLR9oq8uxleXefrYUEVc2JBYUVcdySMdwn9bySh83rAfaBIV5wUMsvI+7PrVyyWHEtOA4hgvScFguhZfq39SqDDQwHqGSV48kjP6qkl3UJOUDzfSoly/g+eHTD4SwWjBX4VuRRBkA7cavShR4omT+qCybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR1dOocj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR1dOocj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768970251; x=1800506251;
  h=date:from:to:cc:subject:message-id;
  bh=G5dShjbFsE5k9+rZ7aymHy3jbkiq3aAgKGfeZvaF4a0=;
  b=hR1dOocj4FvBpqM1blD8jqwkyl0QkoWaGod5sdh8G1uG/D8G32nTwJTo
   Ob5ZFRe7ZElMzqAJOQi2/CAUMJ7cr3NVyekCQUWA0yLgqMVrNjseilFsU
   VQ7X7OhR2sGIN5WzNvYPbQi0eBuOedsSnX68vrKYTnPIVsgU/e5nMCiM5
   gm4sxFoKC9rXE0r5TOMFq5hZztMFNnGCQuwoLyKSij60i1pr2ZdJ7Amy9
   aEn5p0rPpuaPs1geR8utZMEmfb5FBuY2MpvWdXEvOtrHbVutuUx9e436Y
   PT+8QENegBo3tY4KNV58BWZBj0mEi+n9TAipnjsw61ZNiXgci1K/cqVy1
   A==;
X-CSE-ConnectionGUID: CuUHgqaAQMmD0WVo7ZNTAQ==
X-CSE-MsgGUID: oUojV7qITJCyhxuZlDwTbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81570335"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="81570335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 20:37:30 -0800
X-CSE-ConnectionGUID: 8Abx/x+rQLe3NK0LG/G0Yg==
X-CSE-MsgGUID: 7cMG1qlSTIylsImI3+LCyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206656783"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jan 2026 20:37:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viPyB-00000000Pxh-0D4h;
	Wed, 21 Jan 2026 04:37:27 +0000
Date: Wed, 21 Jan 2026 12:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-riscv-v6.19-rc1 2/2] ERROR:
 modpost: "virt_to_pfn" [fs/xfs/xfs.ko] undefined!
Message-ID: <202601211213.2FjE6tv3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-riscv-v6.19-rc1
head:   877fcd0044b0a64fc875e01ea3c462f0fdeadd29
commit: 877fcd0044b0a64fc875e01ea3c462f0fdeadd29 [2/2] riscv: Make virt_to_pfn() a real function
config: riscv-randconfig-001-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211213.2FjE6tv3-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211213.2FjE6tv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211213.2FjE6tv3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "virt_to_pfn" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [fs/btrfs/btrfs.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [security/keys/encrypted-keys/encrypted-keys.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [crypto/gcm.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [crypto/tcrypt.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [lib/raid6/raid6_pq.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [drivers/tty/serial/amba-pl011.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [drivers/tty/serial/sprd_serial.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [drivers/gpu/drm/drm_dma_helper.ko] undefined!
>> ERROR: modpost: "virt_to_pfn" [drivers/mtd/nand/raw/nand.ko] undefined!
WARNING: modpost: suppressed 21 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
