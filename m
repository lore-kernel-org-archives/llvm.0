Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B11E832A;
	Thu, 20 Nov 2025 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645155; cv=none; b=CB3TbJWmwyUdlWlK8DCuSiob5wb1BsqiFv20MS4b7n9dNVVy2SthoCNpaSBJTz8b3tuXEpDaPD4wk1h4OvDaHPy2ecdsONz6+obkekPXMm91Hxu8zc1a5KQqz7Is78GIVC4qU9Tc+rI6Dktj+G0j8XpMXTZC2vXxK0PlI8+d4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645155; c=relaxed/simple;
	bh=KXOXBNNqRDNObVZfpLK1oYKzNvhGYYVFa1HhpU0+aJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCJonZ2u2xjPqqYj7aZCKzar4OJgtjVzkPk1QViCXFRE1HlcWAxvWii+FAAQdvkltbXfBSGsTrTZ+C8+4HKw/4qP9HnGqmIi0iRbr0MsRCnhB0QFpUmhkW/xOM3Dcy6dD8tNVM7nNIgNAN0B7TFfT5iGWDsUJ9gdP+MMN/wt9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6SosZip; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6SosZip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763645153; x=1795181153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXOXBNNqRDNObVZfpLK1oYKzNvhGYYVFa1HhpU0+aJ0=;
  b=S6SosZipGG3VnTJ64jQP6BXBPFVpjXrbbiKSKwgA7LSzthTg2XW15jPv
   Lxn9Bd7p4GN1Omai5ti6nu3VH0cRaOym7Ml3mjWdSwuK0kL4XArU0bte0
   lY7b3Girwxjo4nzCWLcLXnSB4yIpv/cxBWVBaVgXThl2IlN2sszxYSB+Z
   69uiem0bSF0MFuG7AXADKrBWhKNzmbvO/N3dzeZrfHRJsS5WnTC0AXU1J
   earKNZQL7AuoW3zPu1edNLOCO03neX+dimSlyvwPRL3aDkFQtONITrpM6
   kVqaE4oG8Mk212bp4gbRGXxjnD61bnWdxWklxcOMJ/yDwkClWtPzcx7y5
   w==;
X-CSE-ConnectionGUID: AR7rY47VTz2OxLu9qcIXCA==
X-CSE-MsgGUID: 2sTiISo0SxmqdE9L5eHKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77179934"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="77179934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:25:52 -0800
X-CSE-ConnectionGUID: pASk1B8jQDOEOhtwuqxhQA==
X-CSE-MsgGUID: d4T26UBrT9agj0sxG9EgbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="192163228"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Nov 2025 05:25:51 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM4fV-000000001SV-280U;
	Thu, 20 Nov 2025 13:25:49 +0000
Date: Thu, 20 Nov 2025 14:24:53 +0100
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri 20/24] include/linux/riscv_qos.h:10:10:
 fatal error: 'asm/qos.h' file not found
Message-ID: <202511201442.TVJXxaCx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   f8bf739ad96594b69b3bf724e65ddf8c25a7d570
commit: 6ef95cee3c96622eb715a3f707edc237f0bbdf89 [20/24] DO_NOT_MERGE soc: build Foobar SoC drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251120/202511201442.TVJXxaCx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201442.TVJXxaCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201442.TVJXxaCx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/foobar/foobar_cbqri_cache.c:10:
>> include/linux/riscv_qos.h:10:10: fatal error: 'asm/qos.h' file not found
      10 | #include <asm/qos.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +10 include/linux/riscv_qos.h

323bf1bd959da7 Drew Fustini 2023-04-19   9  
323bf1bd959da7 Drew Fustini 2023-04-19 @10  #include <asm/qos.h>
323bf1bd959da7 Drew Fustini 2023-04-19  11  

:::::: The code at line 10 was first introduced by commit
:::::: 323bf1bd959da71b544db59810cec3a50afffe5b RISC-V: QoS: define properties of CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
