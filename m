Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933C10A1A;
	Thu, 28 Mar 2024 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711609982; cv=none; b=ZDLoPM7a4OXt3CmEap5KnaL02HytsHcUyaDnSxBUXlO4uSc4GMIVHyxshffID/sYumBiL43Dr7UYUIyu05hw4XhWe8F34/VqWLf+oIEl1Fkj/H1qlDYMr33cua/ROhru3PW8qAWDvEdI7xCuLIkJN0YetZSEEBIqu59shiuH8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711609982; c=relaxed/simple;
	bh=VVdusaAyCv0n6mqbKlECLIlBrFbmiMklXLWuY3JYGTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFSg0z2M1pFeKqO1M73EM4iek3nBTLtft04ImSqxvxxsFIqW+s33spA9YuRI83uygOdsKH30VNxf6BZaEu3s9e/yvOx8snvBbbNzX6ZrP1BfVhdJWAP+GllcgRhujow7QyUxzkAFF7e/4m6JoO37sWGUSvTlL3MOGsHMx0/LkTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJ5xqr2h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJ5xqr2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711609981; x=1743145981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVdusaAyCv0n6mqbKlECLIlBrFbmiMklXLWuY3JYGTI=;
  b=IJ5xqr2hKTwDodJ4Fm47m5CtNvTLbrLerL209jMX9jg8/1RV5d850r6g
   jarfv/CulkWp4YJOjgLAZzDUlO47DG1SFvaI+qnLb+rF+w64uvKMdgoUj
   b5i3T2xixTzDBeWloi6WenIB+lIHl86Gh9EHiZY8cJD/ioXnWQ2dFxdri
   +lgzCynNSnBA6FfxBR/EiCHNiO6WeslYaynqHqyViIFg1AiliurmbY9tN
   Gdex1O8iEEU/VT0B33sid+Zf26n4oFl51mQKw87ZNLxcjv7M3BHdxpilE
   ULNwqQSlBS+tDx54YA8+A/AeCpWV17WtJqgzfe87QTwhXHJiC7ViDutOR
   w==;
X-CSE-ConnectionGUID: QaxsarckQdS3VkBrXFaVRw==
X-CSE-MsgGUID: W8a/F0HbT9agy99ZH6TRkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6576389"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6576389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="39679382"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Mar 2024 00:12:56 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpjwU-0001tn-1d;
	Thu, 28 Mar 2024 07:12:54 +0000
Date: Thu, 28 Mar 2024 15:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-ring-map 12/12] io_uring/memmap.c:328:1:
 warning: non-void function does not return a value in all control paths
Message-ID: <202403281503.iQPx7oEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-map
head:   3b4304514621e1f4af1a826c969fa2f2aea19c31
commit: 3b4304514621e1f4af1a826c969fa2f2aea19c31 [12/12] io_uring: move mapping/allocation helpers to a separate file
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240328/202403281503.iQPx7oEx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403281503.iQPx7oEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403281503.iQPx7oEx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/memmap.c:5:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/memmap.c:328:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     328 | }
         | ^
   2 warnings generated.


vim +328 io_uring/memmap.c

   317	
   318	unsigned long io_uring_get_unmapped_area(struct file *file, unsigned long addr,
   319						 unsigned long len, unsigned long pgoff,
   320						 unsigned long flags)
   321	{
   322		void *ptr;
   323	
   324		ptr = io_uring_validate_mmap_request(file, pgoff, len);
   325		if (IS_ERR(ptr))
   326	
   327		return (unsigned long) ptr;
 > 328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
