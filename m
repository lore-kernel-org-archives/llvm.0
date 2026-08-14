Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4246AA79;
	Fri, 14 Aug 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709267; cv=none; b=asQMCGjx8aiM9ag5CE8j+dmy9dEi7ff0uJxieCy4ztJ+St5zEp4+MhCZKmBd2g/EguLF2+Br8VFHuF5fJ8oIc5uQJL3dao01nwI5W39LmRtqyvAH3NEQI3Fa0z/dIyeMRjbBIAfACqk+zAekBo2XzvCosrMNtgvXnabNdJJYzP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709267; c=relaxed/simple;
	bh=mMqZ+zWlfrE0Oqa4Y4JCu7pqVTV4pnWvGkgU38A0MbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tK4XXi1q0T22POlvFRmmEKo/49ZIXeTdXvyLSWpAMX6KIFQxgBIbtBN7pzROok2bK7Lh3UWA4c72PKq3rmBLmsuI1OpI3e8556bbkE5ewuHI9pjptPYHyOjoSG/6fb7USHmvKU6wo4ARdcQiJYuonHPP5kZ0sEt69hov0ayspSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vka6G/Ak; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vka6G/Ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709266; x=1818245266;
  h=date:from:to:cc:subject:message-id;
  bh=mMqZ+zWlfrE0Oqa4Y4JCu7pqVTV4pnWvGkgU38A0MbY=;
  b=Vka6G/AkalN5IIh0hhVwOplo897iYEXBBT/Ksjvs0iiylPlz0CBMUQgZ
   DBk/E5TVJTOwE07bJcXbH5+fZmCT0YtGtTxWNfhoA9sRpeTsNjoYEUJr1
   kktWPVHXglYOwW0UP6lj4mZeMJ4ZJFralo92p07gfLRZRCT93sSewQB/E
   QYO8oqJvzVfi9mptrZhEcG7Iiavz4SC6VeHmybHh7R4fFlxjpz8PI+niI
   OHnHlvbs3+Y4fUlwDTeYu8t0ct8aX2x+Lyx0ixcByh8STvVZQWb8bMAZD
   S4XdX35Ch8qD0ZrpCJGqbrfjflwbkPrYCV+TF8PKlJcn7UKpOk37uPa3e
   Q==;
X-CSE-ConnectionGUID: lgN3m1WBRYaHoZezTbUtIQ==
X-CSE-MsgGUID: +DF+f5cqQBiEbKbIcreA1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="90962396"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="90962396"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:07:43 -0700
X-CSE-ConnectionGUID: SYYbPCNhR0yGplDcUn8prQ==
X-CSE-MsgGUID: JHRz5T0kSIaeSt/GgPM3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="287691816"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2026 05:07:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuqhG-000000006FH-2oW4;
	Fri, 14 Aug 2026 12:07:38 +0000
Date: Fri, 14 Aug 2026 14:06:40 +0200
From: kernel test robot <lkp@intel.com>
To: Tom Haynes <loghyr@hammerspace.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Mike Snitzer <snitzer@hammerspace.com>
Subject: fs/nfs/nfs4proc.c:231:2: error: expected expression
Message-ID: <202608141400.RkKLVEMl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mike-Snitzer/nfs4-2-add-nfs4_2-x-to-generate-the-UNCACHEABLE_FILE_DATA-attribute/20260809-013525
head:   d4e3d375fc17be88b916893f8c10abf763e51718
commit: 05a7e931533f15c5e8a56b30cd59cd2aafc5c717 nfs4.2: add UNCACHEABLE_FILE_DATA attribute support
date:   6 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260814/202608141400.RkKLVEMl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141400.RkKLVEMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141400.RkKLVEMl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/nfs4proc.c:231:2: error: expected expression
     231 |         | FATTR4_WORD2_UNCACHEABLE_FILE_DATA
         |         ^
   1 error generated.


vim +231 fs/nfs/nfs4proc.c

   207	
   208	/*
   209	 * This is our standard bitmap for GETATTR requests.
   210	 */
   211	const u32 nfs4_fattr_bitmap[3] = {
   212		FATTR4_WORD0_TYPE
   213		| FATTR4_WORD0_CHANGE
   214		| FATTR4_WORD0_SIZE
   215		| FATTR4_WORD0_FSID
   216		| FATTR4_WORD0_FILEID,
   217		FATTR4_WORD1_MODE
   218		| FATTR4_WORD1_NUMLINKS
   219		| FATTR4_WORD1_OWNER
   220		| FATTR4_WORD1_OWNER_GROUP
   221		| FATTR4_WORD1_RAWDEV
   222		| FATTR4_WORD1_SPACE_USED
   223		| FATTR4_WORD1_TIME_ACCESS
   224		| FATTR4_WORD1_TIME_CREATE
   225		| FATTR4_WORD1_TIME_METADATA
   226		| FATTR4_WORD1_TIME_MODIFY
   227		| FATTR4_WORD1_MOUNTED_ON_FILEID,
   228	#ifdef CONFIG_NFS_V4_SECURITY_LABEL
   229		FATTR4_WORD2_SECURITY_LABEL
   230	#endif
 > 231		| FATTR4_WORD2_UNCACHEABLE_FILE_DATA
   232	};
   233	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
