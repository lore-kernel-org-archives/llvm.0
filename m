Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27E1DF960;
	Tue, 29 Oct 2024 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204338; cv=none; b=GYRoNIcLjaL3gNQwEMX6CigjDWwtMvsU6bNBbMRzqz7afG/mCkPNQG+KfF8Gid9RyC4ESmSJ/yKs6ONq6orxGJoZi7KQLnc3cNdeYFZIix94vZ4Yrety8On5ZZLKqQsTpYNKB7Ux6HjMiYJiFrKvUKeBibz/nnXTJ633wdTA0J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204338; c=relaxed/simple;
	bh=YAFq5KbQEvc0i8idmT2cyrH8vmmPmrlOpPkvS9VkTQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1aGd21Mn4tBgvj4ZCDA2LKwUIX86kY+Avs1uGxyBcSrNYiJLcydPpol1pO9NfvEn25yKn5+5oi7miphWUXu55wAfFDkhZtDtJSk/EU3b6t97uHzlgErSRjm8SFgsAVk7Q0nh+1Z0xgU9A80Pb39JiCDZgWZUM/oCCpI4hOuJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXUbYzc+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXUbYzc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730204336; x=1761740336;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YAFq5KbQEvc0i8idmT2cyrH8vmmPmrlOpPkvS9VkTQs=;
  b=ZXUbYzc+8e7FGfmoxYNGchCqYos9toLWWa1KkI0tQnyzQXl5dKua7es9
   DALUHBM0PLcnOUDnAp3CSgxMGjqQo2yhbS/9FlcJ0IhbloC/sdyzOlbKs
   0FcFwkyWrOzuTbG0HtBGa3x9Ome1fkDegRPTiXiwRgzDPGT24WIT0J2jS
   gVSnGRxFC069UElpQzpAhUk4FWg49QKUjaoARDxnnoJUpD1R8OAPBrGvq
   ySYOzu593YtYG3tbcDfHodo9rT/SU8sp5CqWZo01pc9FnUvbAKz8v43cC
   n/pFEodWgcCumNt9TUD+uubiCudYR48vGEfpIJ9+agg5uW3hTy4egpive
   A==;
X-CSE-ConnectionGUID: BEaReY2RTcuu+urtKClTEA==
X-CSE-MsgGUID: tjGg9KRaTt2Xr2eNwxA0Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40939062"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40939062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 05:18:55 -0700
X-CSE-ConnectionGUID: l4joeGYqSWyzLJFW81xTvg==
X-CSE-MsgGUID: 4K8XmlhyQ5mciTNuZDbaxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82755859"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.0.178])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 05:18:53 -0700
Message-ID: <dc8c9c5c-6645-4fe5-81d1-a2e8e4f1e10f@intel.com>
Date: Tue, 29 Oct 2024 14:18:47 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6772/7183]
 drivers/mmc/host/sdhci-uhs2.c:684:6: warning: variable 'flags' set but not
 used
To: Victor Shih <victor.shih@genesyslogic.com.tw>,
 Ben Chuang <ben.chuang@genesyslogic.com.tw>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ulf Hansson <ulf.hansson@linaro.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 kernel test robot <lkp@intel.com>
References: <202410252107.y9EgrTbA-lkp@intel.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <202410252107.y9EgrTbA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/24 16:23, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
> commit: 9cbb2358bb1f17b61bf75cbebc2c9746b3a29e32 [6772/7183] mmc: sdhci-uhs2: add request() and others
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410252107.y9EgrTbA-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252107.y9EgrTbA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410252107.y9EgrTbA-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/mmc/host/sdhci-uhs2.c:14:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:181:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2213:
>    include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      505 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      512 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      525 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    In file included from drivers/mmc/host/sdhci-uhs2.c:15:
>    In file included from include/linux/iopoll.h:14:
>    In file included from include/linux/io.h:14:
>    In file included from arch/s390/include/asm/io.h:95:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
>      102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
>          |                                                      ^
>    In file included from drivers/mmc/host/sdhci-uhs2.c:15:
>    In file included from include/linux/iopoll.h:14:
>    In file included from include/linux/io.h:14:
>    In file included from arch/s390/include/asm/io.h:95:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
>      115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
>          |                                                      ^
>    In file included from drivers/mmc/host/sdhci-uhs2.c:15:
>    In file included from include/linux/iopoll.h:14:
>    In file included from include/linux/io.h:14:
>    In file included from arch/s390/include/asm/io.h:95:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      693 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      701 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      709 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      718 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      727 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      736 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>>> drivers/mmc/host/sdhci-uhs2.c:684:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
>      684 |         int flags;
>          |             ^
>    17 warnings generated.
> 
> 
> vim +/flags +684 drivers/mmc/host/sdhci-uhs2.c
> 
>    681	
>    682	static bool sdhci_uhs2_send_command(struct sdhci_host *host, struct mmc_command *cmd)
>    683	{
>  > 684		int flags;
>    685		u32 mask;
>    686		unsigned long timeout;
>    687	
>    688		WARN_ON(host->cmd);
>    689	
>    690		/* Initially, a command has no error */
>    691		cmd->error = 0;
>    692	
>    693		if (cmd->opcode == MMC_STOP_TRANSMISSION)
>    694			cmd->flags |= MMC_RSP_BUSY;
>    695	
>    696		mask = SDHCI_CMD_INHIBIT;
>    697	
>    698		if (sdhci_readl(host, SDHCI_PRESENT_STATE) & mask)
>    699			return false;
>    700	
>    701		host->cmd = cmd;
>    702		host->data_timeout = 0;
>    703		if (sdhci_data_line_cmd(cmd)) {
>    704			WARN_ON(host->data_cmd);
>    705			host->data_cmd = cmd;
>    706			__sdhci_uhs2_set_timeout(host);
>    707		}
>    708	
>    709		if (cmd->data)
>    710			sdhci_uhs2_prepare_data(host, cmd);
>    711	
>    712		sdhci_uhs2_set_transfer_mode(host, cmd);
>    713	
>    714		if ((cmd->flags & MMC_RSP_136) && (cmd->flags & MMC_RSP_BUSY)) {
>    715			WARN_ONCE(1, "Unsupported response type!\n");
>    716			/*
>    717			 * This does not happen in practice because 136-bit response
>    718			 * commands never have busy waiting, so rather than complicate
>    719			 * the error path, just remove busy waiting and continue.
>    720			 */
>    721			cmd->flags &= ~MMC_RSP_BUSY;
>    722		}
>    723	
>    724		if (!(cmd->flags & MMC_RSP_PRESENT))
>    725			flags = SDHCI_CMD_RESP_NONE;
>    726		else if (cmd->flags & MMC_RSP_136)
>    727			flags = SDHCI_CMD_RESP_LONG;
>    728		else if (cmd->flags & MMC_RSP_BUSY)
>    729			flags = SDHCI_CMD_RESP_SHORT_BUSY;
>    730		else
>    731			flags = SDHCI_CMD_RESP_SHORT;
>    732	
>    733		if (cmd->flags & MMC_RSP_CRC)
>    734			flags |= SDHCI_CMD_CRC;
>    735		if (cmd->flags & MMC_RSP_OPCODE)
>    736			flags |= SDHCI_CMD_INDEX;
>    737	
>    738		timeout = jiffies;
>    739		if (host->data_timeout)
>    740			timeout += nsecs_to_jiffies(host->data_timeout);
>    741		else if (!cmd->data && cmd->busy_timeout > 9000)
>    742			timeout += DIV_ROUND_UP(cmd->busy_timeout, 1000) * HZ + HZ;
>    743		else
>    744			timeout += 10 * HZ;
>    745		sdhci_mod_timer(host, cmd->mrq, timeout);
>    746	
>    747		__sdhci_uhs2_send_command(host, cmd);
>    748	
>    749		return true;
>    750	}
>    751	
> 

Looks like unneeded code duplicated from non-uhs2.  Presumably
just remove it (incl. MMC_RSP_136 busy check) e.g.

diff --git a/drivers/mmc/host/sdhci-uhs2.c b/drivers/mmc/host/sdhci-uhs2.c
index c488c6d56015..43820eb5a7ea 100644
--- a/drivers/mmc/host/sdhci-uhs2.c
+++ b/drivers/mmc/host/sdhci-uhs2.c
@@ -684,7 +684,6 @@ static void __sdhci_uhs2_send_command(struct sdhci_host *host, struct mmc_comman
 
 static bool sdhci_uhs2_send_command(struct sdhci_host *host, struct mmc_command *cmd)
 {
-	int flags;
 	u32 mask;
 	unsigned long timeout;
 
@@ -714,30 +713,6 @@ static bool sdhci_uhs2_send_command(struct sdhci_host *host, struct mmc_command
 
 	sdhci_uhs2_set_transfer_mode(host, cmd);
 
-	if ((cmd->flags & MMC_RSP_136) && (cmd->flags & MMC_RSP_BUSY)) {
-		WARN_ONCE(1, "Unsupported response type!\n");
-		/*
-		 * This does not happen in practice because 136-bit response
-		 * commands never have busy waiting, so rather than complicate
-		 * the error path, just remove busy waiting and continue.
-		 */
-		cmd->flags &= ~MMC_RSP_BUSY;
-	}
-
-	if (!(cmd->flags & MMC_RSP_PRESENT))
-		flags = SDHCI_CMD_RESP_NONE;
-	else if (cmd->flags & MMC_RSP_136)
-		flags = SDHCI_CMD_RESP_LONG;
-	else if (cmd->flags & MMC_RSP_BUSY)
-		flags = SDHCI_CMD_RESP_SHORT_BUSY;
-	else
-		flags = SDHCI_CMD_RESP_SHORT;
-
-	if (cmd->flags & MMC_RSP_CRC)
-		flags |= SDHCI_CMD_CRC;
-	if (cmd->flags & MMC_RSP_OPCODE)
-		flags |= SDHCI_CMD_INDEX;
-
 	timeout = jiffies;
 	if (host->data_timeout)
 		timeout += nsecs_to_jiffies(host->data_timeout);



