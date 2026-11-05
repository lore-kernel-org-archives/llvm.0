Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890099;
	b=oCw7Ix8SjZQY0Oaaf0C5+Ra+o/oEPpf/fR4SYi6vGV2SnqT6b88avADllYAmPrNaQM5n
	 /2AQq6UQGiXdjQFSnbq5OjModEwPtXGyYBjQOcn8vwUpICN6OjGElTqNHyczJi1uMR5tW
	 7SuU31QtIL25Au2G5xOSxLKVw2qHhv7JsMW8gPgne05V4eZpdIJ4BhucwAvg9/9/pQpXZ
	 ekUxcNOttM/RxlbxVOOvS1ogT8K+UarEvzspwpeE528P8mz4CtZAWkazKEe/dtNt1nrs0
	 6mARMVl3a8PhfjKpH3gKilob8ob1LQMolhL4eTEwgcoj9L0vQn6KKM+2Eia01rFZ8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890099;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MsO2aG0141ZrdGAbf2ydyyxEU1QXOxGGyUGumfu2Qq0=;
	b=J2KVhWB0HJmMu+oxt9OOPSS2QqidDeYJyXUzOzYQ+zbCmheSsaanqPff3sDMSD/KPCMt
	 HV4xQQt8AQQG82SIXbju85kT5TyCQVuoKG+C5lfAKWXUogBcu7vHYwG+qOfME05AGAzkY
	 cy5/gT3cmKwAEDWFTdOg5zZ+He6DZ8vkEHJK3VSGgl1dv+y1b5h3sC6MD9s0Zs2VKLgDm
	 pZLhcBevW9p7WA5xDLXmcvZawkt54zzepnf5l503kfmULe8QBqzK3gTeAoG7cPm8calvd
	 xg7tQ++QSc++AJzfWHjhpXNtEl0nxGydUR5mmhFvo3ZmuvjywUM51JAWm9m9vc4XRrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nmcrWoB7;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6116606A31B;
	Thu,  5 Nov 2026 14:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6116606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nmcrWoB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793890098; x=1825426098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8+JLIQ6kVT4MrWwDMC0FkRxfkecYUWb5o4t4E5UKHQ8=;
  b=nmcrWoB7K1wsyU9sFLl8yyQjNLnm26wVKdgajK21THlN/8nc6LfBy6ho
   GnfUkTi5w2vJ0B2LExSPEcKkUvoV+xa1k15qb9Z9MJPX279+6hx5nyOH4
   G3VpK2XsmYTyG07zo/aGEIEMSAZXKHbYxN/4vCreybT7YTcHgqmC+PW/1
   bXzH7AKJbCW0Shc7XvccEiG6xxyznfGxIJLSFUxiqLgZWNWXziXv+LUxE
   3M1DzCEB8hJPddB9l3zASSqpvz3nfBue1cA7m1q47Yo83Yyph5FLa2IwG
   JJJ+KfU/ntkyJF6sLlcjRyl9FDrPMm88mFo8J34sJW7sYMVfDYBveArUD
   A==;
X-CSE-ConnectionGUID: U+rZH/zUR0KttRk8HK/7mA==
X-CSE-MsgGUID: rt4TRzqySU+XpGzGIKYrug==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2674355"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2674355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:48:18 -0800
X-CSE-ConnectionGUID: Q0J3K6OZROyPZm07udyoFQ==
X-CSE-MsgGUID: /8V/zFtHTwepTxLjhYLTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7033037"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2026 06:48:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOyl7-00000000mL9-1tc1;
	Thu, 05 Nov 2026 14:48:09 +0000
Date: Thu, 5 Nov 2026 22:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
	shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
	manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
	wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
	jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
	aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: Re: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <202611052242.iJ7HMqUH-lkp@intel.com>
References: <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on linus/master v7.4-rc1 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Savaliya/i3c-master-Add-Qualcomm-I3C-controller-driver/20261104-164609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20261104111610.3739095-2-mukesh.savaliya%40oss.qualcomm.com
patch subject: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611052242.iJ7HMqUH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 812626a41399a1d464a0d69627ab45c83b8ebfb9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052242.iJ7HMqUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052242.iJ7HMqUH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master/i3c-qcom-geni.c:19:
>> include/linux/soc/qcom/geni-se.h:378:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
>> include/linux/soc/qcom/geni-se.h:397:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   include/linux/soc/qcom/geni-se.h:413:10: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     413 |         s_cmd = readl_relaxed(se->base + SE_GENI_S_CMD0);
         |                 ^
   include/linux/soc/qcom/geni-se.h:417:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         writel(s_cmd, se->base + SE_GENI_S_CMD0);
         |         ^
>> include/linux/soc/qcom/geni-se.h:430:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:443:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     443 |         writel_relaxed(S_GENI_CMD_CANCEL, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:455:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |         writel_relaxed(M_GENI_CMD_ABORT, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:468:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |         writel_relaxed(S_GENI_CMD_ABORT, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:494:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:512:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     512 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:540:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     540 |         val = readl_relaxed(se->base + SE_HW_PARAM_1);
         |               ^
   In file included from drivers/i3c/master/i3c-qcom-geni.c:22:
   In file included from drivers/i3c/master/../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:288:20: error: static declaration of 'writel' follows non-static declaration
     288 | static inline void writel(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:287:16: note: expanded from macro 'writel'
     287 | #define writel writel
         |                ^
   include/linux/soc/qcom/geni-se.h:397:2: note: previous implicit declaration is here
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   In file included from drivers/i3c/master/i3c-qcom-geni.c:22:
   In file included from drivers/i3c/master/../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:353:19: error: static declaration of 'readl_relaxed' follows non-static declaration
     353 | static inline u32 readl_relaxed(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:352:23: note: expanded from macro 'readl_relaxed'
     352 | #define readl_relaxed readl_relaxed
         |                       ^
   include/linux/soc/qcom/geni-se.h:378:8: note: previous implicit declaration is here
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
   In file included from drivers/i3c/master/i3c-qcom-geni.c:22:
   In file included from drivers/i3c/master/../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:407:20: error: static declaration of 'writel_relaxed' follows non-static declaration
     407 | static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:406:24: note: expanded from macro 'writel_relaxed'
     406 | #define writel_relaxed writel_relaxed
         |                        ^
   include/linux/soc/qcom/geni-se.h:430:2: note: previous implicit declaration is here
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   drivers/i3c/master/i3c-qcom-geni.c:284:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
         |               ^
   drivers/i3c/master/i3c-qcom-geni.c:363:6: warning: variable 'm_stat_mask' set but not used [-Wunused-but-set-variable]
     363 |         u32 m_stat_mask, dm_tx_st, dm_rx_st;
         |             ^
   drivers/i3c/master/i3c-qcom-geni.c:579:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     579 |                 pid = FIELD_PREP(GENMASK_ULL(47, 40), (u64)rx_buf[0]) |
         |                       ^
   drivers/i3c/master/i3c-qcom-geni.c:637:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     637 |                         xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
         |                                         ^
   drivers/i3c/master/i3c-qcom-geni.c:737:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     737 |                         xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
         |                                         ^
   drivers/i3c/master/i3c-qcom-geni.c:791:19: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     791 |                 xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
         |                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.
--
   In file included from i3c-qcom-geni.c:19:
>> include/linux/soc/qcom/geni-se.h:378:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
>> include/linux/soc/qcom/geni-se.h:397:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   include/linux/soc/qcom/geni-se.h:413:10: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     413 |         s_cmd = readl_relaxed(se->base + SE_GENI_S_CMD0);
         |                 ^
   include/linux/soc/qcom/geni-se.h:417:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         writel(s_cmd, se->base + SE_GENI_S_CMD0);
         |         ^
>> include/linux/soc/qcom/geni-se.h:430:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:443:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     443 |         writel_relaxed(S_GENI_CMD_CANCEL, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:455:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |         writel_relaxed(M_GENI_CMD_ABORT, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:468:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |         writel_relaxed(S_GENI_CMD_ABORT, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:494:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:512:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     512 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:540:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     540 |         val = readl_relaxed(se->base + SE_HW_PARAM_1);
         |               ^
   In file included from i3c-qcom-geni.c:22:
   In file included from ./../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:288:20: error: static declaration of 'writel' follows non-static declaration
     288 | static inline void writel(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:287:16: note: expanded from macro 'writel'
     287 | #define writel writel
         |                ^
   include/linux/soc/qcom/geni-se.h:397:2: note: previous implicit declaration is here
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   In file included from i3c-qcom-geni.c:22:
   In file included from ./../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:353:19: error: static declaration of 'readl_relaxed' follows non-static declaration
     353 | static inline u32 readl_relaxed(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:352:23: note: expanded from macro 'readl_relaxed'
     352 | #define readl_relaxed readl_relaxed
         |                       ^
   include/linux/soc/qcom/geni-se.h:378:8: note: previous implicit declaration is here
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
   In file included from i3c-qcom-geni.c:22:
   In file included from ./../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:407:20: error: static declaration of 'writel_relaxed' follows non-static declaration
     407 | static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:406:24: note: expanded from macro 'writel_relaxed'
     406 | #define writel_relaxed writel_relaxed
         |                        ^
   include/linux/soc/qcom/geni-se.h:430:2: note: previous implicit declaration is here
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   i3c-qcom-geni.c:284:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
         |               ^
   i3c-qcom-geni.c:363:6: warning: variable 'm_stat_mask' set but not used [-Wunused-but-set-variable]
     363 |         u32 m_stat_mask, dm_tx_st, dm_rx_st;
         |             ^
   i3c-qcom-geni.c:579:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     579 |                 pid = FIELD_PREP(GENMASK_ULL(47, 40), (u64)rx_buf[0]) |
         |                       ^
   i3c-qcom-geni.c:637:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     637 |                         xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
         |                                         ^
   i3c-qcom-geni.c:737:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     737 |                         xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
         |                                         ^
   i3c-qcom-geni.c:791:19: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     791 |                 xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
         |                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/readl_relaxed +378 include/linux/soc/qcom/geni-se.h

eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  367  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  368  /**
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  369   * geni_se_read_proto() - Read the protocol configured for a serial engine
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  370   * @se:		Pointer to the concerned serial engine.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  371   *
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  372   * Return: Protocol value as configured in the serial engine.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  373   */
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  374  static inline u32 geni_se_read_proto(struct geni_se *se)
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  375  {
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  376  	u32 val;
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  377  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30 @378  	val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  379  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  380  	return (val & FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT;
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  381  }
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  382  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  383  /**
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  384   * geni_se_setup_m_cmd() - Setup the primary sequencer
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  385   * @se:		Pointer to the concerned serial engine.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  386   * @cmd:	Command/Operation to setup in the primary sequencer.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  387   * @params:	Parameter for the sequencer command.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  388   *
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  389   * This function is used to configure the primary sequencer with the
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  390   * command and its associated parameters.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  391   */
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  392  static inline void geni_se_setup_m_cmd(struct geni_se *se, u32 cmd, u32 params)
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  393  {
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  394  	u32 m_cmd;
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  395  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  396  	m_cmd = (cmd << M_OPCODE_SHFT) | (params & M_PARAMS_MSK);
0feea33d79825d include/linux/qcom-geni-se.h Douglas Anderson            2020-07-22 @397  	writel(m_cmd, se->base + SE_GENI_M_CMD0);
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  398  }
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  399  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  400  /**
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  401   * geni_se_setup_s_cmd() - Setup the secondary sequencer
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  402   * @se:		Pointer to the concerned serial engine.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  403   * @cmd:	Command/Operation to setup in the secondary sequencer.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  404   * @params:	Parameter for the sequencer command.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  405   *
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  406   * This function is used to configure the secondary sequencer with the
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  407   * command and its associated parameters.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  408   */
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  409  static inline void geni_se_setup_s_cmd(struct geni_se *se, u32 cmd, u32 params)
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  410  {
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  411  	u32 s_cmd;
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  412  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  413  	s_cmd = readl_relaxed(se->base + SE_GENI_S_CMD0);
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  414  	s_cmd &= ~(S_OPCODE_MSK | S_PARAMS_MSK);
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  415  	s_cmd |= (cmd << S_OPCODE_SHFT);
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  416  	s_cmd |= (params & S_PARAMS_MSK);
0feea33d79825d include/linux/qcom-geni-se.h Douglas Anderson            2020-07-22  417  	writel(s_cmd, se->base + SE_GENI_S_CMD0);
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  418  }
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  419  
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  420  /**
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  421   * geni_se_cancel_m_cmd() - Cancel the command configured in the primary
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  422   *                          sequencer
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  423   * @se:	Pointer to the concerned serial engine.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  424   *
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  425   * This function is used to cancel the currently configured command in the
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  426   * primary sequencer.
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  427   */
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  428  static inline void geni_se_cancel_m_cmd(struct geni_se *se)
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  429  {
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30 @430  	writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  431  }
eddac5af06546d include/linux/qcom-geni-se.h Karthikeyan Ramasubramanian 2018-03-30  432  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
