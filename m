Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC7D531;
	Sat, 25 Oct 2025 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761358562; cv=none; b=YIaFHXkfYQ6XdaMcLH/JDcQjPP2DCp3NE8tsO1/z/mNtgsHsaNne/67Zc4+X3CpC+f6MDL8ej46aqeHhFNBhyNPDcVlE7xZ8gtRyIt3AoeiFwFcTqGUf4RGAVrW/83yDjgSSAHypSfbhlI+PYVNYGmzsJo/y9+bHplzc29anyII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761358562; c=relaxed/simple;
	bh=d1f2mNmOeZ/yCo7xg0HF8FVKAvxVBHy8tK+Y092cIOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrccJs7Ks5v2bYYh5T61wdaQWtO8BOCiVFRCQkH5DPillb3E28QBc0JeoIiWfAiolIgf6ANghY9KM6+SWvmBHMtBGVMj8pakK2lkGbPfJLxv7NA5znuXSVY+n9rnXkYfsIJlEg1f5t2+K/IwIsyCPwKhW1I6RQJl6gWWOYX80aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3Y93grF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3Y93grF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761358561; x=1792894561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d1f2mNmOeZ/yCo7xg0HF8FVKAvxVBHy8tK+Y092cIOw=;
  b=H3Y93grFOIGZmfkmqh6TfLehhpiPp/dbD4eZgPp5OAzM1c5B9LrjW1l6
   t3EltCyIBJYrRAxkGvVH2I8AAlOWZQcTtAdrYP3pt3Z7+ZAL3CyZ0vSXv
   txcEUu8MATU/uAsCtXQpms0dGvTmATf6guJJ/XsQt61HWuay7SZN/pzab
   Vffgz3uimU2i79PTizdRKhvX4rernjmB4nHIrPFLt18SFLnOVrkOSS5SU
   7s9PAG5wO2xhPhrEh2Glq2gCe3asNXLkKUBOVObE0hx7EUgVX59wOZbcP
   wQUj4PEIE5ilAAcNuvcjpN+O/NvCwfLgbPX/f4ac4aEfqg/ywpvLuvB6r
   A==;
X-CSE-ConnectionGUID: jg2pt+aQQbqPHgWvub+YxA==
X-CSE-MsgGUID: fGj8V/LtTjqxp1hldavM2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74882975"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="74882975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 19:16:00 -0700
X-CSE-ConnectionGUID: 70EsEkTqQWmgRWYZ9Ob+AA==
X-CSE-MsgGUID: KP5U9BeoRpihWXieybM0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184179489"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Oct 2025 19:15:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCTox-000F4L-2q;
	Sat, 25 Oct 2025 02:15:55 +0000
Date: Sat, 25 Oct 2025 10:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [chunkuang-hu:mediatek-drm-next 9/11]
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:128:9: error: incompatible
 pointer types passing 'u16 *' (aka 'unsigned short *') to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <202510251014.JgkRssgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-drm-next
head:   793b39b8398f24ec73a3ed09ac87c1d572e2502d
commit: 8db28701a2a05fcdbd8ec6364f0e817ee0aeff26 [9/11] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20251025/202510251014.JgkRssgD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251014.JgkRssgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251014.JgkRssgD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:128:9: warning: comparison of distinct pointer types ('typeof ((loop_counter)) *' (aka 'unsigned short *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:128:9: error: incompatible pointer types passing 'u16 *' (aka 'unsigned short *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Wincompatible-pointer-types]
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:174:38: note: passing argument to parameter 'dividend' here
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:128:9: warning: shift count >= width of type [-Wshift-count-overflow]
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   2 warnings and 1 error generated.


vim +128 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c

   111	
   112	static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *ddc, u16 uc_dev,
   113				      u8 addr, u8 *puc_value, u16 data_cnt)
   114	{
   115		u16 dly_cnt, i, loop_counter, temp_length, uc_idx;
   116		u32 rem, uc_read_count, val;
   117		int ret;
   118	
   119		mtk_ddc_check_and_rise_low_bus(ddc);
   120	
   121		regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
   122				   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLEAR_FIFO));
   123	
   124		if (data_cnt >= 16) {
   125			temp_length = 16;
   126			loop_counter = data_cnt;
   127	
 > 128			rem = do_div(loop_counter, temp_length);
   129			if (rem)
   130				loop_counter++;
   131		} else {
   132			temp_length = data_cnt;
   133			loop_counter = 1;
   134		}
   135	
   136		if (uc_dev >= DDC_ADDR)
   137			dly_cnt = DDC2_DLY_CNT_EDID;
   138		else
   139			dly_cnt = DDC2_DLY_CNT;
   140	
   141		regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
   142				   FIELD_PREP(HPD_DDC_DELAY_CNT, dly_cnt));
   143	
   144		for (i = 0; i < loop_counter; i++) {
   145			rem = data_cnt % 16;
   146	
   147			if (i > 0 && i == (loop_counter - 1) && rem)
   148				temp_length = rem;
   149	
   150			/* 0x51 - 0x53: Flow control */
   151			if (uc_dev > DDC_ADDR && uc_dev <= 0x53) {
   152				regmap_update_bits(ddc->regs, SCDC_CTRL, SCDC_DDC_SEGMENT,
   153						   FIELD_PREP(SCDC_DDC_SEGMENT, uc_dev - DDC_ADDR));
   154	
   155				regmap_write(ddc->regs, DDC_CTRL,
   156					     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ENH_READ_NOACK) |
   157					     FIELD_PREP(DDC_CTRL_DIN_CNT, temp_length) |
   158					     FIELD_PREP(DDC_CTRL_OFFSET, addr + i * temp_length) |
   159					     FIELD_PREP(DDC_CTRL_ADDR, DDC_ADDR));
   160			} else {
   161				u16 offset;
   162	
   163				if (addr != 0x43)
   164					offset = i * 16;
   165				else
   166					offset = 0;
   167	
   168				regmap_write(ddc->regs, DDC_CTRL,
   169					     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_SEQ_READ_NOACK) |
   170					     FIELD_PREP(DDC_CTRL_DIN_CNT, temp_length) |
   171					     FIELD_PREP(DDC_CTRL_OFFSET, addr + offset) |
   172					     FIELD_PREP(DDC_CTRL_ADDR, uc_dev));
   173			}
   174			usleep_range(5000, 5500);
   175	
   176			ret = regmap_read_poll_timeout(ddc->regs, HPD_DDC_STATUS, val,
   177						       !(val & DDC_I2C_IN_PROG), 1000,
   178						       500 * (temp_length + 5));
   179			if (ret) {
   180				dev_err(ddc->dev, "Timeout waiting for DDC I2C\n");
   181				return ret;
   182			}
   183	
   184			ret = mtk_ddc_check_and_rise_low_bus(ddc);
   185			if (ret) {
   186				dev_err(ddc->dev, "Error during read operation: No ACK\n");
   187				return ret;
   188			}
   189	
   190			for (uc_idx = 0; uc_idx < temp_length; uc_idx++) {
   191				unsigned int read_idx = i * 16 + uc_idx;
   192	
   193				regmap_write(ddc->regs, SI2C_CTRL,
   194					     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
   195					     SI2C_RD);
   196	
   197				regmap_read(ddc->regs, HPD_DDC_STATUS, &val);
   198				puc_value[read_idx] = FIELD_GET(DDC_DATA_OUT, val);
   199	
   200				regmap_write(ddc->regs, SI2C_CTRL,
   201					     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
   202					     SI2C_CONFIRM_READ);
   203	
   204				/*
   205				 * If HDMI IP gets reset during EDID read, DDC read
   206				 * operation will fail and its delay counter will be
   207				 * reset to 400.
   208				 */
   209				regmap_read(ddc->regs, HPD_DDC_CTRL, &val);
   210				if (FIELD_GET(HPD_DDC_DELAY_CNT, val) < DDC2_DLY_CNT)
   211					return 0;
   212	
   213				uc_read_count = read_idx + 1;
   214			}
   215		}
   216		if (uc_read_count > U8_MAX)
   217			dev_warn(ddc->dev, "Invalid read data count %u\n", uc_read_count);
   218	
   219		return uc_read_count;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
