Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A475A28850E;
	Tue,  2 Sep 2025 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756812914; cv=none; b=gQaasKiZpPS5vrbjxUE7dZcvdOd9LDQqn1PcEOzSDRMnQYNP6Uu7GHWffCvcnwzlcq6sM1WJdXG25LVJTWqJRTPHmAUrTwE8qVSgEPF4YAbw/u6pgoCr2c4Jm7/OAZ+IksFeX8FPCEC8OIgu8KoKPpbKkG2Ro0yeo5vqKV4PlNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756812914; c=relaxed/simple;
	bh=rIDxfPOWbDbOIrhqwYq1sr15Abv6ryso4TG4tH6RirQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrDYsG9tDm93BD249rjmQ3/6dAD8ULk5IW/DZrhmLLrb6UNp5AGal1sCNF9yupjohJ5Pk7JOt1NcCwePM2Q2tK783qBVw2aVozE0vEk4sRnutem0VqWBmbOHjZPEipMNnoiQ2ABSBqbbeRtY8SPzZQTXRi4lzleB8KFz4QwayQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtfE1sYi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtfE1sYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756812912; x=1788348912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIDxfPOWbDbOIrhqwYq1sr15Abv6ryso4TG4tH6RirQ=;
  b=BtfE1sYi01HUFK809LHuebV1wqbzcbIoZBBBu7vzx/RHlU04JsuB+G7a
   vRosG+GB5Wrd1tu9FDrsFaI38IXHX4TLUQ4BO36UqFAgNJsz935eCbHAU
   gG7r0FX6rPSDciE3ROqx/rmliGUgE1XiUMP1YjCdu4FvbpfQycRISVd5z
   6OC/i3vsKJdy4d0LPnFF6awaJrqLQqujJjDvoeDYSTPGg+7lcsPMxNEEO
   0I9wLmWBz6yBOnyhKPTK+hAjHC6eMbATUu3GR9SEQRlWvoh2aC3N1ARnO
   f6klNGe5wAmRHG1Z3XHVp92ldeyd5TquofG86Au8vOsGbtO0YnAAKjU0A
   w==;
X-CSE-ConnectionGUID: ljQ8FK0zTQ+wcp9BL5JcUg==
X-CSE-MsgGUID: OvC4lpQRQRiWPJxuv5+t8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62912318"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62912318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 04:35:10 -0700
X-CSE-ConnectionGUID: /NhvF/YaQemutRrM3Ttnqg==
X-CSE-MsgGUID: xxUa6dEeSbWXwCSAmdMMWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175389317"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Sep 2025 04:35:09 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPI2-0001ue-24;
	Tue, 02 Sep 2025 11:35:06 +0000
Date: Tue, 2 Sep 2025 19:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/genexis-xg6846b-v6.17-rc1 7/9]
 drivers/i2c/busses/i2c-bcmbca.c:113:9: error: call to undeclared function
 'readl'; ISO C99 and later do not support implicit function declarations
Message-ID: <202509021931.0iObHyQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.17-rc1
head:   e48e1a2def8a9105cfaf3ccbf10260bde3e75f78
commit: 90cd351fb3a974ada20c5b4128b65d7d8965f24e [7/9] i2c: bcmbca: Add BCMBCA I2C adapter
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250902/202509021931.0iObHyQR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021931.0iObHyQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021931.0iObHyQR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-bcmbca.c:113:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     113 |                 val = readl(b->base + I2C_BCMBCA_IIC_ENABLE);
         |                       ^
>> drivers/i2c/busses/i2c-bcmbca.c:138:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |         writel(chip_addr << I2C_CHIP_ADDRESS_SHIFT, b->base + I2C_BCMBCA_CHIP_ADDRESS);
         |         ^
   drivers/i2c/busses/i2c-bcmbca.c:144:8: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |         val = readl(b->base + I2C_BCMBCA_CTL);
         |               ^
   drivers/i2c/busses/i2c-bcmbca.c:170:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     170 |                 writel(0, b->base + I2C_BCMBCA_IIC_ENABLE);
         |                 ^
   drivers/i2c/busses/i2c-bcmbca.c:205:31: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |                                 buf[i*fifo_len + j] = (u8)readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4);
         |                                                           ^
   drivers/i2c/busses/i2c-bcmbca.c:214:7: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     214 |                                                 readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4);
         |                                                 ^
   drivers/i2c/busses/i2c-bcmbca.c:217:14: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     217 |                                                 swab32(readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4));
         |                                                        ^
   include/linux/swab.h:8:17: note: expanded from macro 'swab32'
       8 | # define swab32 __swab32
         |                 ^
   drivers/i2c/busses/i2c-bcmbca.c:222:8: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     222 |                                                         readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4);
         |                                                         ^
   drivers/i2c/busses/i2c-bcmbca.c:225:15: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     225 |                                                         swab32(readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4));
         |                                                                ^
   include/linux/swab.h:8:17: note: expanded from macro 'swab32'
       8 | # define swab32 __swab32
         |                 ^
   drivers/i2c/busses/i2c-bcmbca.c:235:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     235 |         writel(0, b->base + I2C_BCMBCA_IIC_ENABLE);
         |         ^
   drivers/i2c/busses/i2c-bcmbca.c:260:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     260 |                 writel(0, b->base + I2C_BCMBCA_IIC_ENABLE);
         |                 ^
   drivers/i2c/busses/i2c-bcmbca.c:313:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     313 |         writel(0, b->base + I2C_BCMBCA_IIC_ENABLE);
         |         ^
   drivers/i2c/busses/i2c-bcmbca.c:325:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |         writel(0, b->base + I2C_BCMBCA_IIC_ENABLE);
         |         ^
   drivers/i2c/busses/i2c-bcmbca.c:364:20: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     364 |                         p->buf[j] = (u8)readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4);
         |                                         ^
   drivers/i2c/busses/i2c-bcmbca.c:373:6: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     373 |                                         readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4);
         |                                         ^
   drivers/i2c/busses/i2c-bcmbca.c:376:13: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     376 |                                         swab32(readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4));
         |                                                ^
   include/linux/swab.h:8:17: note: expanded from macro 'swab32'
       8 | # define swab32 __swab32
         |                 ^
   drivers/i2c/busses/i2c-bcmbca.c:383:6: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     383 |                                         readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4);
         |                                         ^
   drivers/i2c/busses/i2c-bcmbca.c:386:13: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     386 |                                         swab32(readl(b->base + I2C_BCMBCA_DATAOUT_0 + j*4));
         |                                                ^
   include/linux/swab.h:8:17: note: expanded from macro 'swab32'
       8 | # define swab32 __swab32
         |                 ^
   drivers/i2c/busses/i2c-bcmbca.c:407:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |         writel(0, b->base + I2C_BCMBCA_IIC_ENABLE);
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/readl +113 drivers/i2c/busses/i2c-bcmbca.c

   105	
   106	/*  Keep polling until the bcm63000 completes the I2C transaction or timeout */
   107	static int bcmbca_i2c_wait_xfer_done(struct i2c_bcmbca *b)
   108	{
   109		int i;
   110		u32 val;
   111	
   112		for (i = 0; i < b->xfer_timeout; i++) {
 > 113			val = readl(b->base + I2C_BCMBCA_IIC_ENABLE);
   114	
   115			if (val & I2C_IIC_NO_ACK) {
   116				dev_err(b->dev, "No ACK received\n");
   117				return -EIO;
   118			}
   119			/*
   120			 * The xfer is complete and successful when INTRP is set
   121			 * and NOACK is not set.
   122			 */
   123			if (val & I2C_IIC_INTRP)
   124				return 0;
   125	
   126			/* TBD: use usleep_range() */
   127			udelay(1);
   128		}
   129	
   130		return -ETIMEDOUT;
   131	}
   132	
   133	static void bcmbca_i2c_rd_wr_common(struct i2c_bcmbca *b, u8 chip_addr, u16 xfer_cnt, u8 dtf)
   134	{
   135		u32 val;
   136	
   137		/* Write the Address */
 > 138		writel(chip_addr << I2C_CHIP_ADDRESS_SHIFT, b->base + I2C_BCMBCA_CHIP_ADDRESS);
   139	
   140		/* Write the Transfer Count */
   141		writel(xfer_cnt, b->base + I2C_BCMBCA_CNT);
   142	
   143		/* Set the Control Register Data Transfer Format in the lowest bits */
   144		val = readl(b->base + I2C_BCMBCA_CTL);
   145		val &= ~I2C_CTL_DTF_MASK;
   146		val |= dtf;
   147		writel(val, b->base + I2C_BCMBCA_CTL);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
