Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764912581;
	Sat, 24 Feb 2024 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708739584; cv=none; b=cicfHo2Mvy7TKpQMG5TtYmD6QacahUQ44yr1rsJ1DYsLAu3Bit+hdOMfxYdwSl7Mwb5v7ZtBcJNw09728VKNlptmUeWNSWUEos9p9gzqyOXi9Voz1mO3Ji+VKjMusywcQbZCh7fgFkPgcb6Y3TdXdASCFrKk7cPJ5i1QVWEWUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708739584; c=relaxed/simple;
	bh=TqfSwWvEqvaCt0tiTDF+Shtog97gbCmygS4E0/HxB7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MVHr4EFhjjJzvO1IMaOiwm02M8C+RgdVRKw1MBx2VppAG3EnAJM7dG/+QDopaiZ9gWiKQX7lhB0RGg7RO4FGPN7dLF/m54XyzTvGkgPfBbcO6MU61y3/WM9Z+DdSw/LDTdCUhIkkQjrWOw1ae1q/9Jez1LIX0Tqdw+UuwHNFn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NycT1zJ3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NycT1zJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708739583; x=1740275583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TqfSwWvEqvaCt0tiTDF+Shtog97gbCmygS4E0/HxB7A=;
  b=NycT1zJ3yMaEYJ2Dr6CwldGTZtivvvBAVBvY0cq7T8+5owi8CzAPVjqQ
   Sf0MsCuKradFxuoJ58QTmDgI0D7XKpqHyV6FAwx8U50QypuHPDnN2JJwI
   mapxZZfAosHimBHfMjFpRbGD8uNC1OYwBYxlaSJTj+xRSV0QEiSsY+Vjw
   V+c9mGvK1z2NkdhaDPwduaGJt/9nz3GXc2k+XRd0DLqNRla7SL+sTPpUN
   YEoBS7+9oCrVZ8wLG7GPVs8c40Osvzz2UQQCaicNzBmc33+seyc5BjQ4c
   Pny8Df8ZzK9bs7RjloIKXtz6P72Y+74k/jM8dirZwIQo5P4zgYNoYGZ2h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25557136"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="25557136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 17:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6242241"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2024 17:53:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdhDl-000860-2w;
	Sat, 24 Feb 2024 01:52:57 +0000
Date: Sat, 24 Feb 2024 09:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-5.15.y 108/204] drivers/media/i2c/lt8619c.c:124:11:
 warning: variable 'val' is uninitialized when used here
Message-ID: <202402240923.dKmuxHcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   200d2466033be9a082bfb81368de8a994e399a02
commit: 17501341aae8821abf97050abc9620fb7769581f [108/204] ODROID-COMMON: Add LT8619C HDMI/Dual-mode DP receiver
config: powerpc-randconfig-001-20240224 (https://download.01.org/0day-ci/archive/20240224/202402240923.dKmuxHcz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240923.dKmuxHcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240923.dKmuxHcz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/lt8619c.c:124:11: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
     124 |                           reg, val);
         |                                ^~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/media/i2c/lt8619c.c:100:13: note: initialize the variable 'val' to silence this warning
     100 |         uint8_t val;
         |                    ^
         |                     = '\0'
>> drivers/media/i2c/lt8619c.c:308:6: warning: no previous prototype for function 'lt8619c_audio_init' [-Wmissing-prototypes]
     308 | void lt8619c_audio_init(uint8_t audio_input)
         |      ^
   drivers/media/i2c/lt8619c.c:308:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     308 | void lt8619c_audio_init(uint8_t audio_input)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [y]:
   - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]


vim +/val +124 drivers/media/i2c/lt8619c.c

    95	
    96	static uint8_t lt8619c_reg_read(char reg)
    97	{
    98		uint8_t out_buf[2];
    99		uint8_t in_buf[2];
   100		uint8_t val;
   101	
   102		struct i2c_msg msgs[] = {
   103			{
   104				.addr = LT8619C_ADDR,
   105				.flags = 0,
   106				.len = 1,
   107				.buf = out_buf,
   108			},
   109			{
   110				.addr = LT8619C_ADDR,
   111				.flags = I2C_M_RD,
   112				.len = 1,
   113				.buf = in_buf,
   114			}
   115		};
   116	
   117		out_buf[0] = reg;
   118		out_buf[1] = 0;
   119	
   120		if (i2c_transfer(lt8619c->client->adapter, msgs, 2) == 2) {
   121			val = in_buf[0];
   122		} else {
   123			dev_info(lt8619c->dev, "i2c 0x%02x 0x%02x read failed\n",
 > 124				  reg, val);
   125		}
   126	
   127		return val;
   128	}
   129	
   130	static int lt8619c_reg_write(uint8_t reg, uint8_t data)
   131	{
   132		uint8_t outbuf[2];
   133		struct i2c_msg msg = {
   134			.addr = LT8619C_ADDR,
   135			.flags = 0,
   136			.len = 2,
   137			.buf = outbuf,
   138		};
   139	
   140		outbuf[0] = reg;
   141		outbuf[1] = data;
   142	
   143		if (i2c_transfer(lt8619c->client->adapter, &msg, 1) != 1)
   144			dev_info(lt8619c->dev, "i2c 0x%02x 0x%02x write failed\n",
   145				  reg, data);
   146	
   147		return 0;
   148	}
   149	
   150	static int lt8619c_reg_write_bytes(uint8_t reg, uint8_t *data, uint16_t length)
   151	{
   152		uint8_t outbuf[256 + 1];
   153		struct i2c_msg msg = {
   154			.addr = LT8619C_ADDR,
   155			.flags = 0,
   156			.len = sizeof(outbuf),
   157			.buf = outbuf,
   158		};
   159	
   160		outbuf[0] = reg;
   161		memcpy(outbuf + 1, data, length);
   162	
   163		if (i2c_transfer(lt8619c->client->adapter, &msg, 1) != 1)
   164			dev_info(lt8619c->dev, "i2c write failed\n");
   165	
   166		return 0;
   167	}
   168	
   169	static bool lt8619c_check_chipid(void)
   170	{
   171		unsigned int chip_id[3];
   172	
   173		lt8619c_reg_write(0xff, 0x60);
   174	
   175		chip_id[0] = lt8619c_reg_read(0x00);
   176		chip_id[1] = lt8619c_reg_read(0x01);
   177		chip_id[2] = lt8619c_reg_read(0x02);
   178		dev_dbg(lt8619c->dev, "Read Chip : 0x%x, 0x%x, 0x%x\n",
   179				chip_id[0], chip_id[1], chip_id[2]);
   180	
   181		if ((chip_id[0] == 0x16) && chip_id[1] == 0x04)
   182			return true;
   183		else
   184			return false;
   185	}
   186	
   187	static void lt8619c_setHPD(uint8_t level)
   188	{
   189		lt8619c_reg_write(0xff, 0x80);
   190	
   191		if (level)
   192			lt8619c_reg_write(0x06, (lt8619c_reg_read(0x06) | 0x08));
   193		else
   194			lt8619c_reg_write(0x06, (lt8619c_reg_read(0x06) & 0xf7));
   195	}
   196	
   197	static void lt8619c_edid_calc(uint8_t *pbuf, struct video_timing *timing)
   198	{
   199		uint16_t hblanking = 0;
   200		uint16_t vblanking = 0;
   201		uint16_t pixel_clk;
   202	
   203		pixel_clk = timing->pixel_clk / 10;
   204	
   205		if (pbuf == NULL || timing == NULL)
   206			return;
   207	
   208		hblanking = timing->hfp + timing->hs + timing->hbp; /* H blanking */
   209		vblanking = timing->vfp + timing->vs + timing->vbp; /* V blanking */
   210	
   211		pbuf[0] = pixel_clk % 256;
   212		pbuf[1] = pixel_clk / 256;
   213		pbuf[2] = timing->hact % 256;
   214		pbuf[3] = hblanking % 256;
   215		pbuf[4] = ((timing->hact / 256) << 4) + hblanking / 256;
   216		pbuf[5] = timing->vact % 256;
   217		pbuf[6] = vblanking % 256;
   218		pbuf[7] = ((timing->vact / 256) << 4) + vblanking / 256;
   219		pbuf[8] = timing->hfp % 256;
   220		pbuf[9] = timing->hs % 256;
   221		pbuf[10] = ((timing->vfp % 256) << 4) + timing->vs % 256;
   222		pbuf[11] = ((timing->hfp/256) << 6) + ((timing->hs / 256) << 4)+
   223			((timing->vfp / 256) << 2) + (timing->vs / 256);
   224		pbuf[17] = 0x1c; /* progress negative vsync, negative hsync */
   225	}
   226	
   227	static uint8_t lt8619c_edid_checksum(uint8_t block, uint8_t *buf)
   228	{
   229		uint8_t i = 0;
   230		uint8_t checksum = 0;
   231		uint8_t *pbuf = buf + 128 * block;
   232	
   233		if (pbuf == NULL || (pbuf + 127) == NULL)
   234			return 0;
   235	
   236		for (i = 0, checksum = 0; i < 127 ; i++) {
   237			checksum += pbuf[i];
   238			checksum %= 256;
   239		}
   240		checksum = 256 - checksum;
   241	
   242		dev_info(lt8619c->dev, "EDID checksum 0x%x\n", checksum);
   243	
   244		return checksum;
   245	}
   246	
   247	static void lt8619c_set_edid(uint8_t *edid_buf)
   248	{
   249		int ret = 0;
   250	
   251		lt8619c_reg_write(0xff, 0x80);
   252		lt8619c_reg_write(0x8e, 0x07);
   253		lt8619c_reg_write(0x8f, 0x00);
   254	
   255		if (edid_buf == NULL)
   256			ret = lt8619c_reg_write_bytes(0x90, &onchip_edid[0], 256);
   257		else
   258			ret = lt8619c_reg_write_bytes(0x90, edid_buf, 256);
   259	
   260		if (ret)
   261			dev_info(lt8619c->dev, "EDID Set write error\n");
   262	
   263		lt8619c_reg_write(0x8e, 0x02);
   264	}
   265	
   266	static void lt8619c_rx_init(void)
   267	{
   268		lt8619c_reg_write(0xff, 0x80);
   269		/* RGD_CLK_STABLE_OPT[1:0] */
   270		lt8619c_reg_write(0x2c, (lt8619c_reg_read(0x2C)|0x30));
   271	
   272		lt8619c_reg_write(0xff, 0x60);
   273		lt8619c_reg_write(0x04, 0xF2);
   274		lt8619c_reg_write(0x83, 0x3F);
   275		lt8619c_reg_write(0x80, 0x08); /* use xtal_clk as sys_clk */
   276	#ifdef DDR_CLK
   277		lt8619c_reg_write(0xa4, 0x14); /* 0x10:SDR clk,0x14: DDR clk */
   278	#else
   279		lt8619c_reg_write(0xa4, 0x10); /* 0x10:SDR clk,0x14: DDR clk */
   280	#endif
   281		dev_dbg(lt8619c->dev, "LT8619C output mode : %d\n", LT8619C_OUTPUTMODE);
   282	
   283		dev_info(lt8619c->dev, "\nLT8619C set to OUTPUT_RGB888");
   284		lt8619c_reg_write(0xff, 0x60);
   285		lt8619c_reg_write(0x07, 0xff);
   286		lt8619c_reg_write(0xa8, 0x0f);
   287		lt8619c_reg_write(0x60, 0x00);
   288		lt8619c_reg_write(0x96, 0x71);
   289		lt8619c_reg_write(0xa0, 0x50);
   290		// 0x60A3=0x44:Phase adjust enable;0x60A3=0x30:PIN68
   291		// switch to output PCLK(only use for U5);
   292		lt8619c_reg_write(0xa3, 0x74);
   293		//Phase code value: 0x20,0x28,0x21,0x29,0x22,0x2a,0x23,0x2b,0x24,0x2c
   294		lt8619c_reg_write(0xa2, 0x29);
   295		//RGB mapping control
   296		lt8619c_reg_write(0x6d, 0x00);//0x07//00
   297		//RGB high/low bit swap control
   298		lt8619c_reg_write(0x6e, 0x00);
   299		/* LT8619C_OUTPUTMODE == OUTPUT_RGB888 */
   300	
   301		lt8619c_reg_write(0xff, 0x60);
   302		lt8619c_reg_write(0x0e, 0xfd);
   303		lt8619c_reg_write(0x0e, 0xff);
   304		lt8619c_reg_write(0x0d, 0xfc);
   305		lt8619c_reg_write(0x0d, 0xff);
   306	}
   307	
 > 308	void lt8619c_audio_init(uint8_t audio_input)
   309	{
   310		if (audio_input == I2S_2CH) {
   311			dev_dbg(lt8619c->dev, "Audio Init : Audio set to I2S_2CH\n");
   312			lt8619c_reg_write(0xff, 0x60);
   313			lt8619c_reg_write(0x4c, 0x00);
   314		} else if (audio_input == SPDIF) {
   315			dev_dbg(lt8619c->dev, "Audio Init : Audio set to SPDIF\n");
   316			lt8619c_reg_write(0xff, 0x60);
   317			lt8619c_reg_write(0x4c, 0x80);
   318		} else {
   319			dev_dbg(lt8619c->dev, "Audio Init : Error! Check Audio Mode\n");
   320		}
   321	
   322		lt8619c_reg_write(0xff, 0x80);
   323		lt8619c_reg_write(0x5d, 0xc9);
   324		lt8619c_reg_write(0x07, 0x16);
   325		lt8619c_reg_write(0x08, 0x80);
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
