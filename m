Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3685B20CCF4;
	Tue, 11 Feb 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279355; cv=none; b=oItdChkWPhvBUvxrsIhXaOk7V6JnnO5u8m+gFtrhuj5s8L5YZqOP2750gxWO8i7UxHp3XScL8p46tL1rQ9rIGv3CTdR+Jm1woqSM2sk6SH7f6GrPpX9Jn327Gya8/YUVhezT3Sr4GFaIqxg+Xj0807vCvSeU2M5UHF0vvIMnknU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279355; c=relaxed/simple;
	bh=SpwN0atZjdGK5aNI+errgydQvLs+glRdcJp6jxMa1cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzBFCwu3EcyPKmuBCf3HaR942S2VWx7jD66TuHbU/AcfVq7GijFKFiQpBAX+ejFBUt1wd30kPoRsELnBf/J4zwyBvkE0MTPu6wsBqydA15d4jEPMibQyAPergINMxpfhkIKGKBp/mK++3A9yWVIOKLE9FVFESztzwJQWgS3tZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meeBNEtM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meeBNEtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739279354; x=1770815354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SpwN0atZjdGK5aNI+errgydQvLs+glRdcJp6jxMa1cI=;
  b=meeBNEtME4ZyIBuoh/YUkOOQzDt1kcp8oX20I/9HdamKLTp9+GCisOv/
   L4DTNuHYN4qkV90y+1VVx0v4mvmtdv/J0w3iBnQgxJtGJevri2eZ/m91S
   UPCYglreVe7phDHL8M++SpdemPiJeaVNI4GagMTwQstxR4uexPN2PHeCS
   7HWgfDavFI8KTRBRCygDT/jlfVGcZXX9HxlWaqLKkn0bTjPaP7N1Bqwf0
   EV0jN8WWxlmtYAYsPvcujtFCwFboldZVEeG0LnGRWTVbYXt9qVHJ5BMh9
   Ef5lANDk7zkflgkpUDmmTFLeKVmSJSxmjBvTORqrJnuMEkY57ghnuJQLU
   w==;
X-CSE-ConnectionGUID: aJyG0Er6RKiwzYbHjiyO6A==
X-CSE-MsgGUID: 7X+xKcLaQ0Ojl3p2ouD4zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39779733"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39779733"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 05:09:13 -0800
X-CSE-ConnectionGUID: 3ODHPMa9S6GGtf5RTHGgxA==
X-CSE-MsgGUID: C+XaJ1XjRCSNCIbMvmNoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112355924"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Feb 2025 05:09:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thq0i-0014Bv-00;
	Tue, 11 Feb 2025 13:09:08 +0000
Date: Tue, 11 Feb 2025 21:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kai =?iso-8859-1?Q?M=E4kisara?= <Kai.Makisara@kolumbus.fi>,
	linux-scsi@vger.kernel.org, dgilbert@interlog.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	martin.petersen@oracle.com, James.Bottomley@hansenpartnership.com,
	jmeneghi@redhat.com,
	Kai =?iso-8859-1?Q?M=E4kisara?= <Kai.Makisara@kolumbus.fi>
Subject: Re: [PATCH v1 3/7] scsi: scsi_debug: Add write support with block
 lengths and 4 bytes of data
Message-ID: <202502112016.6zs2FpD6-lkp@intel.com>
References: <20250210191232.185207-4-Kai.Makisara@kolumbus.fi>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210191232.185207-4-Kai.Makisara@kolumbus.fi>

Hi Kai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-M-kisara/scsi-scsi_debug-First-fixes-for-tapes/20250211-031623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250210191232.185207-4-Kai.Makisara%40kolumbus.fi
patch subject: [PATCH v1 3/7] scsi: scsi_debug: Add write support with block lengths and 4 bytes of data
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250211/202502112016.6zs2FpD6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112016.6zs2FpD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112016.6zs2FpD6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/scsi_debug.c:31:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:2985:3: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
    2985 |                 len += resp_partition_m_pg(ap, pcontrol, target);
         |                 ^~~
   drivers/scsi/scsi_debug.c:2850:28: note: initialize the variable 'len' to silence this warning
    2850 |         u32 alloc_len, offset, len;
         |                                   ^
         |                                    = 0
>> drivers/scsi/scsi_debug.c:3378:10: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    3378 |         for ( ; i < TAPE_MAX_PARTITIONS; i++)
         |                 ^
   drivers/scsi/scsi_debug.c:3367:7: note: initialize the variable 'i' to silence this warning
    3367 |         int i;
         |              ^
         |               = 0
   5 warnings generated.


vim +/i +3378 drivers/scsi/scsi_debug.c

  3363	
  3364	static int partition_tape(struct sdebug_dev_info *devip, int nbr_partitions,
  3365				int part_0_size, int part_1_size)
  3366	{
  3367		int i;
  3368	
  3369		if (part_0_size + part_1_size > TAPE_UNITS)
  3370			return -1;
  3371		devip->tape_eop[0] = part_0_size;
  3372		devip->tape_blocks[0]->fl_size = TAPE_BLOCK_EOD_FLAG;
  3373		devip->tape_eop[1] = part_1_size;
  3374		devip->tape_blocks[1] = devip->tape_blocks[0] +
  3375				devip->tape_eop[0];
  3376		devip->tape_blocks[1]->fl_size = TAPE_BLOCK_EOD_FLAG;
  3377	
> 3378		for ( ; i < TAPE_MAX_PARTITIONS; i++)
  3379			devip->tape_location[i] = 0;
  3380	
  3381		devip->tape_nbr_partitions = nbr_partitions;
  3382		devip->tape_partition = 0;
  3383	
  3384		partition_pg[3] = nbr_partitions - 1;
  3385		put_unaligned_be16(devip->tape_eop[0], partition_pg + 8);
  3386		put_unaligned_be16(devip->tape_eop[1], partition_pg + 10);
  3387	
  3388		return nbr_partitions;
  3389	}
  3390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
