Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A193019A6;
	Tue,  2 Dec 2025 23:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764718920; cv=none; b=P//rsAEFRYpfWu/v5PFbpujRB2tifqMNYCrkX9hgq6sYthydc/KpUleYMUIEQRmUdFpGU2eTqa/Y4G39pMYnup3zJPxVfTrgldEaxsQHVDLp+/iOT6uix7D9XM1z5LA/ERebGH/mnFFoyuDc5IjaYsORllJ66GHv2WPKDsdWlkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764718920; c=relaxed/simple;
	bh=r0nkihzFxZI/i+s45y+M6yZMT2ED5o7DuIyKTn9go30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0vFnN5NPxYkvBF1j6p2SGMLDPe1TpqNamyGKIFdhw7T4J3fqWP5E+oFUCcA4kP2eNH5wbjUSOlZ91zeeOYFfJcMf1QA0OHPkQua+HDp6HGA8e2b1/0IPlN5qac7XWKI/agbmoFiIffdgb8ud+BZ3fQPIchJ+OISf/3g0qhizSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGNDjPbe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGNDjPbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764718919; x=1796254919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r0nkihzFxZI/i+s45y+M6yZMT2ED5o7DuIyKTn9go30=;
  b=XGNDjPbeVeVFY9mZguvo4508TLLQZS0o5BcTltzqvM44e/E4ZqSflbzQ
   qnONN2U/ILs/dqTaPmNoGo5n2VhexeFr2kZmBvOq9UW7EQfWprrxJqv5o
   pB05YgfX6AecJMvp1v/pHkwfEIo2g/iWkvE/UFMcWwF2/U/DwlYTAsJ4X
   1d32+t5CnfRcsK9vhsltZaLnZOO7dWvO+lP19lw4aTsflrEk0RM8r2QBm
   u7t1bl4X6YVPfQrKmSKOkFdZrwiewnw8JoK8L1aEEvXjan2a+7+qu/0/C
   QesmumfPJlyvpjk2JKjij7YLVMt0C1SZAFJy4LGmCXo2yeFOt6Lw0yCTm
   A==;
X-CSE-ConnectionGUID: vXyZQiRMTma21uEj3ENlcw==
X-CSE-MsgGUID: WcXLUcLFTSOi39inaD7htQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78049783"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="78049783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:41:58 -0800
X-CSE-ConnectionGUID: W7mfCgFAQEKbgEIIPaesJA==
X-CSE-MsgGUID: nHr+0vDATTeKHv8cvZTbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198925877"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2025 15:41:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQa0I-00000000AJ3-03Hk;
	Tue, 02 Dec 2025 23:41:54 +0000
Date: Wed, 3 Dec 2025 07:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: adrianhoyin.ng@altera.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	adrianhoyin.ng@altera.com
Subject: Re: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table
 macros
Message-ID: <202512030728.3yMG8FZJ-lkp@intel.com>
References: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on linus/master v6.18 next-20251202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adrianhoyin-ng-altera-com/i3c-add-sysfs-entry-for-Device-NACK-Retry-count/20251202-163150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng%40altera.com
patch subject: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table macros
config: i386-buildonly-randconfig-005-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030728.3yMG8FZJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030728.3yMG8FZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030728.3yMG8FZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/master/dw-i3c-master.c:862:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     862 |                 writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
         |                        ^
   drivers/i3c/master/dw-i3c-master.c:214:40: note: expanded from macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
     214 | #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
         |                                        ^
   drivers/i3c/master/dw-i3c-master.c:1017:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1017 |         writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
         |                ^
   drivers/i3c/master/dw-i3c-master.c:214:40: note: expanded from macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
     214 | #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
         |                                        ^
   drivers/i3c/master/dw-i3c-master.c:1046:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1046 |         writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
         |                ^
   drivers/i3c/master/dw-i3c-master.c:214:40: note: expanded from macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
     214 | #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
         |                                        ^
   drivers/i3c/master/dw-i3c-master.c:1165:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1165 |                DEV_ADDR_TABLE_STATIC_ADDR(dev->addr),
         |                ^
   drivers/i3c/master/dw-i3c-master.c:215:39: note: expanded from macro 'DEV_ADDR_TABLE_STATIC_ADDR'
     215 | #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
         |                                       ^
   drivers/i3c/master/dw-i3c-master.c:1719:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1719 |                                DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
         |                                ^
   drivers/i3c/master/dw-i3c-master.c:215:39: note: expanded from macro 'DEV_ADDR_TABLE_STATIC_ADDR'
     215 | #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
         |                                       ^
   5 errors generated.


vim +/FIELD_PREP +862 drivers/i3c/master/dw-i3c-master.c

1dd728f5d4d4b8 Vitor Soares 2018-11-13  826  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  827  static int dw_i3c_master_daa(struct i3c_master_controller *m)
1dd728f5d4d4b8 Vitor Soares 2018-11-13  828  {
1dd728f5d4d4b8 Vitor Soares 2018-11-13  829  	struct dw_i3c_master *master = to_dw_i3c_master(m);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  830  	struct dw_i3c_xfer *xfer;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  831  	struct dw_i3c_cmd *cmd;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  832  	u32 olddevs, newdevs;
e89cc14e96a99c Wolfram Sang 2025-01-07  833  	u8 last_addr = 0;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  834  	int ret, pos;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  835  
62fe9d06f5709c Aniket       2024-07-08  836  	ret = pm_runtime_resume_and_get(master->dev);
62fe9d06f5709c Aniket       2024-07-08  837  	if (ret < 0) {
62fe9d06f5709c Aniket       2024-07-08  838  		dev_err(master->dev,
62fe9d06f5709c Aniket       2024-07-08  839  			"<%s> cannot resume i3c bus master, err: %d\n",
62fe9d06f5709c Aniket       2024-07-08  840  			__func__, ret);
62fe9d06f5709c Aniket       2024-07-08  841  		return ret;
62fe9d06f5709c Aniket       2024-07-08  842  	}
62fe9d06f5709c Aniket       2024-07-08  843  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  844  	olddevs = ~(master->free_pos);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  845  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  846  	/* Prepare DAT before launching DAA. */
1dd728f5d4d4b8 Vitor Soares 2018-11-13  847  	for (pos = 0; pos < master->maxdevs; pos++) {
1dd728f5d4d4b8 Vitor Soares 2018-11-13  848  		if (olddevs & BIT(pos))
1dd728f5d4d4b8 Vitor Soares 2018-11-13  849  			continue;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  850  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  851  		ret = i3c_master_get_free_addr(m, last_addr + 1);
62fe9d06f5709c Aniket       2024-07-08  852  		if (ret < 0) {
62fe9d06f5709c Aniket       2024-07-08  853  			ret = -ENOSPC;
62fe9d06f5709c Aniket       2024-07-08  854  			goto rpm_out;
62fe9d06f5709c Aniket       2024-07-08  855  		}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  856  
e2d43101f61d6e Jeremy Kerr  2023-03-30  857  		master->devs[pos].addr = ret;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  858  		last_addr = ret;
e89cc14e96a99c Wolfram Sang 2025-01-07  859  
e89cc14e96a99c Wolfram Sang 2025-01-07  860  		ret |= parity8(ret) ? 0 : BIT(7);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  861  
1dd728f5d4d4b8 Vitor Soares 2018-11-13 @862  		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
1dd728f5d4d4b8 Vitor Soares 2018-11-13  863  		       master->regs +
1dd728f5d4d4b8 Vitor Soares 2018-11-13  864  		       DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
62fe9d06f5709c Aniket       2024-07-08  865  
62fe9d06f5709c Aniket       2024-07-08  866  		ret = 0;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  867  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  868  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  869  	xfer = dw_i3c_master_alloc_xfer(master, 1);
62fe9d06f5709c Aniket       2024-07-08  870  	if (!xfer) {
62fe9d06f5709c Aniket       2024-07-08  871  		ret = -ENOMEM;
62fe9d06f5709c Aniket       2024-07-08  872  		goto rpm_out;
62fe9d06f5709c Aniket       2024-07-08  873  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  874  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  875  	pos = dw_i3c_master_get_free_pos(master);
13462ba1815db5 Tom Rix      2022-01-08  876  	if (pos < 0) {
13462ba1815db5 Tom Rix      2022-01-08  877  		dw_i3c_master_free_xfer(xfer);
62fe9d06f5709c Aniket       2024-07-08  878  		ret = pos;
62fe9d06f5709c Aniket       2024-07-08  879  		goto rpm_out;
13462ba1815db5 Tom Rix      2022-01-08  880  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  881  	cmd = &xfer->cmds[0];
1dd728f5d4d4b8 Vitor Soares 2018-11-13  882  	cmd->cmd_hi = 0x1;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  883  	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  884  		      COMMAND_PORT_DEV_INDEX(pos) |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  885  		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  886  		      COMMAND_PORT_ADDR_ASSGN_CMD |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  887  		      COMMAND_PORT_TOC |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  888  		      COMMAND_PORT_ROC;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  889  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  890  	dw_i3c_master_enqueue_xfer(master, xfer);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  891  	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
1dd728f5d4d4b8 Vitor Soares 2018-11-13  892  		dw_i3c_master_dequeue_xfer(master, xfer);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  893  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  894  	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  895  	newdevs &= ~olddevs;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  896  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  897  	for (pos = 0; pos < master->maxdevs; pos++) {
1dd728f5d4d4b8 Vitor Soares 2018-11-13  898  		if (newdevs & BIT(pos))
e2d43101f61d6e Jeremy Kerr  2023-03-30  899  			i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  900  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  901  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  902  	dw_i3c_master_free_xfer(xfer);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  903  
62fe9d06f5709c Aniket       2024-07-08  904  rpm_out:
62fe9d06f5709c Aniket       2024-07-08  905  	pm_runtime_put_autosuspend(master->dev);
62fe9d06f5709c Aniket       2024-07-08  906  	return ret;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  907  }
1dd728f5d4d4b8 Vitor Soares 2018-11-13  908  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
