Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC36148306;
	Thu, 11 Apr 2024 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712841899; cv=none; b=aaQLqlqcGIF+WeeUODnu93kFBNM5kVKb8z8/VhcfUldsr8QPSN84Yeubw1OP4lj6oJb9ybif0UVAb8r6d4oHFIpMPaXflTtZWsxRBtxfoThMHWsdp+lsuWwvXc+cbSy6BSj3Eq7AF8nen4/OYUYLS9if4sWPmJM3HX4oxLrZYWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712841899; c=relaxed/simple;
	bh=0K5wZ0JP5Ley0IklK8KFv9Jwt2LW91kJlD0nuigeqmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0IaCeeNsV+Z19/Ei2eWioFruY4YKGsMGN2osYC/S9LVsu44VNVsY8fbdCLqOf6y+Nu9xEAyTjrDW9qh8Jsy7Ef7XYFMp/1VtGM7/5ZyfjB/yIHfimka24kizMYeu1hxwdQAow0FvQRpY4PT7hqteRRLTbMdsbAvQpsR6HkjhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZbFiEhv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZbFiEhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712842054; x=1744378054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0K5wZ0JP5Ley0IklK8KFv9Jwt2LW91kJlD0nuigeqmE=;
  b=gZbFiEhvuTYE3Fppvb14ScSb6K7VQuMVMBLLK8dyLqStPkW/8dM3Z+U9
   Q989Zzri8P2FWDdjjPHc6JEDKviqmc43G+Zirnvpeke/n3esvc1n08ynG
   /Xpyv9d64IBCbqKn2LRPA2DhJTxtjacgJ4zofo6K4J3iFudV2J/rMZ6fA
   wGLRR0oIHj5bRfYR8EmANW5nqfptPtnnQNW5rDAGLAIj/D/HO8Zsa53I/
   Jsmcv4RIH4YpBFn0BO/S6aCKq9Uke2MYajeuBC9oY2a18xvSSFKmYh/VR
   VaUQYOort1pmaa03Z8I/TSisv5hLRycmNwsFKBfCpUew2mDp85TAW+noQ
   w==;
X-CSE-ConnectionGUID: /b97b/SySKysR7c95dPMJw==
X-CSE-MsgGUID: w6D+o6t5RNiQi/2yu9+KoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18958502"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18958502"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:27:33 -0700
X-CSE-ConnectionGUID: oW9LtvEdRqGYIR1K3Uhf4g==
X-CSE-MsgGUID: KX5sQs3eSJa9uNpEKvAGyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20948523"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2024 06:27:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruuSf-0008eF-1N;
	Thu, 11 Apr 2024 13:27:29 +0000
Date: Thu, 11 Apr 2024 21:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 204/415] drivers/misc/ibmvmc.c:1040:35: error:
 expected ';' at end of declaration
Message-ID: <202404112133.BapUjEZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: 3fa1175e116213a99f5f54c7d3f2101c252b1c4a [204/415] misc: ibmvmc: convert to read/write iterators
config: powerpc64-randconfig-003-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112133.BapUjEZE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112133.BapUjEZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112133.BapUjEZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/ibmvmc.c:22:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/ibmvmc.c:1040:35: error: expected ';' at end of declaration
    1040 |         struct file *file = iocb->ki_filp
         |                                          ^
         |                                          ;
>> drivers/misc/ibmvmc.c:1130:8: error: use of undeclared identifier 'p'
    1130 |         ret = p - buffer;
         |               ^
>> drivers/misc/ibmvmc.c:1130:12: error: use of undeclared identifier 'buffer'
    1130 |         ret = p - buffer;
         |                   ^
   5 warnings and 3 errors generated.


vim +1040 drivers/misc/ibmvmc.c

  1025	
  1026	/**
  1027	 * ibmvmc_write - Write
  1028	 *
  1029	 * @file:	file struct
  1030	 * @buffer:	Character buffer
  1031	 * @count:	Count field
  1032	 * @ppos:	Offset
  1033	 *
  1034	 * Return:
  1035	 *	0 - Success
  1036	 *	Non-zero - Failure
  1037	 */
  1038	static ssize_t ibmvmc_write(struct kiocb *iocb, struct iov_iter *from)
  1039	{
> 1040		struct file *file = iocb->ki_filp
  1041		struct inode *inode;
  1042		struct ibmvmc_buffer *vmc_buffer;
  1043		struct ibmvmc_file_session *session;
  1044		struct crq_server_adapter *adapter;
  1045		size_t count = iov_iter_count(from);
  1046		struct ibmvmc_hmc *hmc;
  1047		unsigned char *buf;
  1048		unsigned long flags;
  1049		size_t bytes;
  1050		size_t c = count;
  1051		int ret = 0;
  1052	
  1053		session = file->private_data;
  1054		if (!session)
  1055			return -EIO;
  1056	
  1057		hmc = session->hmc;
  1058		if (!hmc)
  1059			return -EIO;
  1060	
  1061		spin_lock_irqsave(&hmc->lock, flags);
  1062		if (hmc->state == ibmhmc_state_free) {
  1063			/* HMC connection is not valid (possibly was reset under us). */
  1064			ret = -EIO;
  1065			goto out;
  1066		}
  1067	
  1068		adapter = hmc->adapter;
  1069		if (!adapter) {
  1070			ret = -EIO;
  1071			goto out;
  1072		}
  1073	
  1074		if (count > ibmvmc.max_mtu) {
  1075			dev_warn(adapter->dev, "invalid buffer size 0x%lx\n",
  1076				 (unsigned long)count);
  1077			ret = -EIO;
  1078			goto out;
  1079		}
  1080	
  1081		/* Waiting for the open resp message to the ioctl(1) - retry */
  1082		if (hmc->state == ibmhmc_state_opening) {
  1083			ret = -EBUSY;
  1084			goto out;
  1085		}
  1086	
  1087		/* Make sure the ioctl() was called & the open msg sent, and that
  1088		 * the HMC connection has not failed.
  1089		 */
  1090		if (hmc->state != ibmhmc_state_ready) {
  1091			ret = -EIO;
  1092			goto out;
  1093		}
  1094	
  1095		vmc_buffer = ibmvmc_get_valid_hmc_buffer(hmc->index);
  1096		if (!vmc_buffer) {
  1097			/* No buffer available for the msg send, or we have not yet
  1098			 * completed the open/open_resp sequence.  Retry until this is
  1099			 * complete.
  1100			 */
  1101			ret = -EBUSY;
  1102			goto out;
  1103		}
  1104		if (!vmc_buffer->real_addr_local) {
  1105			dev_err(adapter->dev, "no buffer storage assigned\n");
  1106			ret = -EIO;
  1107			goto out;
  1108		}
  1109		buf = vmc_buffer->real_addr_local;
  1110	
  1111		ret = 0;
  1112		while (c > 0) {
  1113			bytes = min_t(size_t, c, vmc_buffer->size);
  1114	
  1115			if (!copy_from_iter_full(buf, bytes, from)) {
  1116				ret = -EFAULT;
  1117				goto out;
  1118			}
  1119			c -= bytes;
  1120		}
  1121	
  1122		inode = file_inode(file);
  1123		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
  1124		mark_inode_dirty(inode);
  1125	
  1126		dev_dbg(adapter->dev, "write: file = 0x%lx, count = 0x%lx\n",
  1127			(unsigned long)file, (unsigned long)count);
  1128	
  1129		ibmvmc_send_msg(adapter, vmc_buffer, hmc, count);
> 1130		ret = p - buffer;
  1131	 out:
  1132		spin_unlock_irqrestore(&hmc->lock, flags);
  1133		return (ssize_t)(ret);
  1134	}
  1135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
