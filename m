Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAF29994A;
	Mon, 23 Jun 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698474; cv=none; b=dErAiZQRvuXerluClsZ2sjB7cz3+wdJl6qrbBQXr9X8lOhseadrfOW/ufqE0r/K0Nf0gHN/qWIbn0INcz1pKF1kGcdoKtVRwU6/Pl784iVINdMt5/B+z1BYwpie9PN35CFqNQeJBHsSSZvNjcHyVLF4Y9ChsgeBiHz5iyCzg0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698474; c=relaxed/simple;
	bh=YGPdP9EYyQ5rqnqb/XWx+MOzAq7zKRQNrg1vN8bY3RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGds0vznMUrK0McuNs+33OkSzY360oN6NamT6K3DXYXc/7noDZOp7bCaR8huoiiZh3h+YNt5pqu6N7dtJ4CyhSlxuqbCi2+qUOERE7ojICenJ3LeY0NXuXRt2K4FQrFsQFp2eAK+A9FybFway/zmruJZA47xVMEgIagKwmXuLMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcPc4iBo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcPc4iBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750698473; x=1782234473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YGPdP9EYyQ5rqnqb/XWx+MOzAq7zKRQNrg1vN8bY3RA=;
  b=JcPc4iBoTcSGtIyVK1INsG7lO0d25bmkTwaby3AJEvF9FKglauvBzK2r
   YHBMT7CO1C70KZS2nbE2OA7G5Uz2jEySQ+ZJ8yXV3HnRdWVjPZ2/H4OD7
   Q+qAE3iQeG7aj+5UkudHY9PR/JgA9snogGI6WYbs/IYp3ImGDCB9TvW1U
   gYmdd/p0Qdn7oqwdHfbwwW30xSacRptyNXFq5e7dTxvU1rymVwgt2yTl0
   IWESbXbf8lEoboz9wYpIQj6Wv7oIq0LafhO/jfLs+cv2DK19hAvr2A5dR
   kR+4trh8yiyW1FsObGibRELro19QraMCTLpCpLlTIHPO0H6aszk7uRuG3
   Q==;
X-CSE-ConnectionGUID: 2OtvSuf0QWq6U82C77OyPg==
X-CSE-MsgGUID: Phwx3pbgR0eozLxUYIVpyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56694225"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="56694225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 10:07:50 -0700
X-CSE-ConnectionGUID: 7+PtXplxQ6OZzXcsjQv2Jw==
X-CSE-MsgGUID: ov4gStV/S4ukfxsEc2yJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151955575"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2025 10:07:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTke2-000P8t-1z;
	Mon, 23 Jun 2025 17:07:46 +0000
Date: Tue, 24 Jun 2025 01:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/genexis-xg6846b-v6.16-rc1 9/10]
 drivers/i2c/busses/i2c-bcmbca.c:113:9: error: call to undeclared function
 'readl'; ISO C99 and later do not support implicit function declarations
Message-ID: <202506240053.mm8zlmKj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.16-rc1
head:   5420b6e9c9c247c32861570d0332ec5376c283a8
commit: e11267dedd54a6adc749af876bde9c1fa55fb76a [9/10] i2c: bcmbca: Add BCMBCA I2C adapter
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240053.mm8zlmKj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240053.mm8zlmKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240053.mm8zlmKj-lkp@intel.com/

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
