Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8534223DEA;
	Sat,  2 May 2026 20:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777755491; cv=none; b=MDrH8nepzDcym4raBvSmKaEvq1Xjf35zprO1HG9pVPZEUJWSi0hjBL2FvNQJIIWyeQCLdkksv7fiBmoBmPubJ9LkvZaGe2kYY0vDS/Zj0ryadc7ktPfsInB1NpQVPCQzDaCMvB9AvJjQlkqxVBZnGyZO+fDmFxNPhJRxenzRors=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777755491; c=relaxed/simple;
	bh=mB35y+G02AyJsoUv4RJ4RE8TI/Ftg8+CNAmNOmrb/hE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lFep9cVocpKehevPmKjNuhDfCQczhFlFy22wJS9kJLWaHXC4JSF8cU3JKtEYjmnbk9ZiNmNnftOsdzfvZAr2M3gHPF821GKXxakNO1JTg16VoVLmmAaOEP9L/EByCk5pV7vC6imHKkJVcY8zyRGw0xIoHP84dzE89bm1VCKFIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLkXJQeH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLkXJQeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777755489; x=1809291489;
  h=date:from:to:cc:subject:message-id;
  bh=mB35y+G02AyJsoUv4RJ4RE8TI/Ftg8+CNAmNOmrb/hE=;
  b=KLkXJQeH1YtpOrbhZP+yJbP1WIXtV1qDbVFFmC6cXNraX0jO3KXPma3D
   s10wgpSYNsDcI8uW57duE5Lx1Db7/KTdCKwRogimUN100geADsQ1U5+L8
   grmxOnaBoLtAhwkqv+D/QpVg/hM9uUwkT4yOcMriHuqgEfAX2ti5z2fFi
   i2ZgjzPgF9CnzD2dteGv+fe6mlxNceGlBiFil7rRb7ae5PDr6Ps2kelqV
   S5iAscD5pWNIwBb61ySufpImT01tv25sXkazGYaPNafbL9kheSfmXxZYm
   TI9YsDn9mb7E8EjJwvAhgsPZoCbx1Sn7BQu5y58BPPAvmdhqeS4VL58Jb
   A==;
X-CSE-ConnectionGUID: oP82ZfaoRQKNeqkT9e/HuA==
X-CSE-MsgGUID: 4YewRP+iRRqdwVQ4n5ofJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="96240206"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="96240206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 13:58:08 -0700
X-CSE-ConnectionGUID: NnF1fwNFRrC8s+H97EwL4g==
X-CSE-MsgGUID: BuUsTAp0T8SJyBytD2QooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273259470"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 13:58:07 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJHPZ-000000005Lx-07em;
	Sat, 02 May 2026 20:58:05 +0000
Date: Sat, 02 May 2026 22:57:29 +0200
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/memory_hotplug.c:586 function parameter 'pgmap'
 not described in '__remove_pages'
Message-ID: <202605022258.E1bRDIm9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Muchun-Song/mm-sparse-vmemmap-Fix-vmemmap-accounting-underflow/20260421-132535
head:   dc0177fc2cee4d3ad5682369d961087baf084ece
commit: c3a62066e7b934b30859a8dbe3976202bde93d16 mm/sparse-vmemmap: Pass @pgmap argument to memory deactivation paths
date:   12 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260502/202605022258.E1bRDIm9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605022258.E1bRDIm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605022258.E1bRDIm9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory_hotplug.c:586 function parameter 'pgmap' not described in '__remove_pages'
>> Warning: mm/memory_hotplug.c:586 function parameter 'pgmap' not described in '__remove_pages'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
