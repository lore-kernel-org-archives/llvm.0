Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3924A64CA;
	Tue, 22 Sep 2026 06:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058576; cv=none; b=nrXilElNE6C7Ls34IiKtwIzen92Alns81m81Yh4CnFRP+1dfmeDl7UIhdYb2kfWK7mGtfBwqEnmUL9xcYoeaXhtl5b6hzF6g03dVJ8jVJMBfY5bsrjayAPsBe74mhCch8UFTruD58RAtwD2g8xDP8YQsxwCxuPsbvaMJAW11cU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058576; c=relaxed/simple;
	bh=Gwy+Gwuh9YzcmKWwVGjHycdhcK7AFlVdL6XxozLPGdQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RbrHCfTxg5z07/oDLANvlZi7zTNCiXXQe/re+NMRIylxHKG44hM1jasQYTg7RtrGUleRKUEPwxeZuUl0pQ7ME2unUeMEjnvp3zTP1UHM8A0vcVQnPjxhCUGO2F/59W3LzouJ6RCcPzmYUPmLCkPOH3pDELQKANMS3nFoU4UEpxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1Sfoz61; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1Sfoz61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790058574; x=1821594574;
  h=date:from:to:cc:subject:message-id;
  bh=Gwy+Gwuh9YzcmKWwVGjHycdhcK7AFlVdL6XxozLPGdQ=;
  b=R1Sfoz61p/vfSummnj9VW8xQIs/k/btZr0ODNaDmK9GBACRlpm4xQeqz
   RvyTJK69Zbe0H98qpC1dvdVH6dvuQF3OojDwPnB3oZ4RD8k+iEeY+eIWX
   NsMn7B/rOgvcxQZMejS3NTlxrsnPHBy+yR6mFVOrZKjk4UmYAPdBxd5Yb
   UbU5ZXAm/ATfcdO3soTz5396RRweLYfyGLyOY7x9n7x7oqZtkVWP41z7q
   HoN2pAbpqtP/Up/8Dc/v+61PQXo9u+LKpRNep9c/Erscn3KgtcOZ5YR1y
   OnOP22b2jawXUPg4okzW8YitHdW/8VhOQo2YxG3CciDQt2426p5X9nc4o
   w==;
X-CSE-ConnectionGUID: NWr2t0dFSA6miBb+V4YyoA==
X-CSE-MsgGUID: /Vg+RhcsQ4OOCIq1N8fkGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90749636"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="90749636"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:29:29 -0700
X-CSE-ConnectionGUID: gPUruDJLTn2HfcljImvf7Q==
X-CSE-MsgGUID: amD80WbiSOOQIN5vSzYmXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="4101158"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 21 Sep 2026 23:29:27 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8u0K-00000000F4y-1sbW;
	Tue, 22 Sep 2026 06:29:24 +0000
Date: Tue, 22 Sep 2026 14:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Hannes Reinecke <hare@kernel.org>
Subject: [linux-next:master 6088/8413]
 include/scsi/scsi_sense.h:34:9: warning: 'ASC' macro redefined
Message-ID: <202609221331.ibh0yv1y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c4d4169604b335c38bbc79bc1fc03042981fc6f
commit: 72c54bd0cbb2e0c35f4acd056e91c596469edc5f [6088/8413] scsi: core: Define all additional sense codes and their qualifiers
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260922/202609221331.ibh0yv1y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221331.ibh0yv1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221331.ibh0yv1y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/floppy.c:252:
   In file included from include/linux/cdrom.h:17:
   In file included from include/scsi/scsi_common.h:11:
   In file included from include/scsi/scsi_proto.h:15:
>> include/scsi/scsi_sense.h:34:9: warning: 'ASC' macro redefined [-Wmacro-redefined]
      34 | #define ASC(name, code)                                 \
         |         ^
   arch/sparc/include/asm/ns87303.h:23:9: note: previous definition is here
      23 | #define ASC     0x09
         |         ^
   1 warning generated.


vim +/ASC +34 include/scsi/scsi_sense.h

    32	
    33	#define ASC_DEF(name)	ASC_##name
  > 34	#define ASC(name, code)					\
    35		ASC_DEF(name)	= (code),			\
    36		name		= ((code) << 8) | 0x00
    37	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
