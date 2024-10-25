Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FAF212161;
	Fri, 25 Oct 2024 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862651; cv=none; b=WU48SLvNOZurA63fut64Y5OLnghSpCgpMvtI7XzKFnY3IIj9mj0F19Tcx8TqrBrp5EmQuF6mMn0iIjzf58H9j+mr6tghqMOWhHXsJ360N+LNizhUDrsjoELs52QrPEumvZrGMxbmYHz7aBWcQUJGnUIkBVCIlB5H4fGumZX/Aws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862651; c=relaxed/simple;
	bh=Hor68YZSrgtREs9BV4UZJPsDGWWfhfLQGQ5vSDwW8ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYkqNtPuJkaYjixMHgGeaimR4nOYsHtOePtzROYm49KKdONETh7HSj4foO6dLmdv+ass+m5GDCC093XEzgrDIl4VuCe0RSThHTb/ArRTo8ky+Zq6WwCku8cYuN4U12ThBalknd54zZQ/49UZ1rxaY/qyrrl9s97TDlHAI3kYbOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1d2zZ3R; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1d2zZ3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729862648; x=1761398648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hor68YZSrgtREs9BV4UZJPsDGWWfhfLQGQ5vSDwW8ws=;
  b=C1d2zZ3RVXQ/c6mIXf488cRsOqUaj1i3VgCOT6Jn6W0SUN+/J4a86uJ+
   BIYQcgQ7JesgvLJMZc5/F7/fDaR57DvnPj5uRSatxJ9C6dhjbNZc54hWw
   L3n57oszbTa660vAI7EdEv4ly2a0DQkSzK0FE2Svgew38uI/CjsjGt3Eb
   qERVqnaDskAlpF2PETMfQmY2ejHOWAzpPLBoBPO2e7cDIpWT7S44e6usW
   /eh5ub0epE/q8PwIRNs3CLOGX9sGpTbCOLunQh5qtTnFetvhEp+aodT47
   f0oOdRvrWmxyBT4v9NrGjfj+5OICOKgdHqs/xUIW3tWLM743BcZBGTJSN
   A==;
X-CSE-ConnectionGUID: Hp8/DIE2SYSARrMudoN9uQ==
X-CSE-MsgGUID: FFPywN0yTGqzxMlDWoAMRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29648934"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="29648934"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 06:24:07 -0700
X-CSE-ConnectionGUID: P8OW3Uv0TlGFUdkc1z6b2A==
X-CSE-MsgGUID: wmxgfvbUSc63aX1H0DpZ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="104222774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2024 06:24:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4KIN-000YIG-2s;
	Fri, 25 Oct 2024 13:24:03 +0000
Date: Fri, 25 Oct 2024 21:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Shih <victor.shih@genesyslogic.com.tw>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [linux-next:master 6772/7183] drivers/mmc/host/sdhci-uhs2.c:684:6:
 warning: variable 'flags' set but not used
Message-ID: <202410252107.y9EgrTbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: 9cbb2358bb1f17b61bf75cbebc2c9746b3a29e32 [6772/7183] mmc: sdhci-uhs2: add request() and others
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410252107.y9EgrTbA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252107.y9EgrTbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252107.y9EgrTbA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/host/sdhci-uhs2.c:14:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/mmc/host/sdhci-uhs2.c:15:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/mmc/host/sdhci-uhs2.c:15:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/mmc/host/sdhci-uhs2.c:15:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/mmc/host/sdhci-uhs2.c:684:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
     684 |         int flags;
         |             ^
   17 warnings generated.


vim +/flags +684 drivers/mmc/host/sdhci-uhs2.c

   681	
   682	static bool sdhci_uhs2_send_command(struct sdhci_host *host, struct mmc_command *cmd)
   683	{
 > 684		int flags;
   685		u32 mask;
   686		unsigned long timeout;
   687	
   688		WARN_ON(host->cmd);
   689	
   690		/* Initially, a command has no error */
   691		cmd->error = 0;
   692	
   693		if (cmd->opcode == MMC_STOP_TRANSMISSION)
   694			cmd->flags |= MMC_RSP_BUSY;
   695	
   696		mask = SDHCI_CMD_INHIBIT;
   697	
   698		if (sdhci_readl(host, SDHCI_PRESENT_STATE) & mask)
   699			return false;
   700	
   701		host->cmd = cmd;
   702		host->data_timeout = 0;
   703		if (sdhci_data_line_cmd(cmd)) {
   704			WARN_ON(host->data_cmd);
   705			host->data_cmd = cmd;
   706			__sdhci_uhs2_set_timeout(host);
   707		}
   708	
   709		if (cmd->data)
   710			sdhci_uhs2_prepare_data(host, cmd);
   711	
   712		sdhci_uhs2_set_transfer_mode(host, cmd);
   713	
   714		if ((cmd->flags & MMC_RSP_136) && (cmd->flags & MMC_RSP_BUSY)) {
   715			WARN_ONCE(1, "Unsupported response type!\n");
   716			/*
   717			 * This does not happen in practice because 136-bit response
   718			 * commands never have busy waiting, so rather than complicate
   719			 * the error path, just remove busy waiting and continue.
   720			 */
   721			cmd->flags &= ~MMC_RSP_BUSY;
   722		}
   723	
   724		if (!(cmd->flags & MMC_RSP_PRESENT))
   725			flags = SDHCI_CMD_RESP_NONE;
   726		else if (cmd->flags & MMC_RSP_136)
   727			flags = SDHCI_CMD_RESP_LONG;
   728		else if (cmd->flags & MMC_RSP_BUSY)
   729			flags = SDHCI_CMD_RESP_SHORT_BUSY;
   730		else
   731			flags = SDHCI_CMD_RESP_SHORT;
   732	
   733		if (cmd->flags & MMC_RSP_CRC)
   734			flags |= SDHCI_CMD_CRC;
   735		if (cmd->flags & MMC_RSP_OPCODE)
   736			flags |= SDHCI_CMD_INDEX;
   737	
   738		timeout = jiffies;
   739		if (host->data_timeout)
   740			timeout += nsecs_to_jiffies(host->data_timeout);
   741		else if (!cmd->data && cmd->busy_timeout > 9000)
   742			timeout += DIV_ROUND_UP(cmd->busy_timeout, 1000) * HZ + HZ;
   743		else
   744			timeout += 10 * HZ;
   745		sdhci_mod_timer(host, cmd->mrq, timeout);
   746	
   747		__sdhci_uhs2_send_command(host, cmd);
   748	
   749		return true;
   750	}
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
