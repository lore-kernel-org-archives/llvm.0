Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E29E204C01;
	Mon,  3 Feb 2025 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587324; cv=none; b=MAyY+CxlUYu2gJfo0N0HtBrwi8pEffQ4S6acCvyX87k+aWOH54abAiEEIdXDT4RarC+rLVfMvGzl7KU9HXpiHybGO6ph/FXl1bQrCPY78nauiOrLPmcfE+W8wnndFBii4bQnF3w0ljg46L1AJtVBrOGziCuc9yfjOjZ6ve1MPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587324; c=relaxed/simple;
	bh=q0caLat2CCBxKYMWdMMiUqwC56FhUojcb7HuJmIEigo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mC3J6s4FRnSJmXL9nKYz7pVkzsSy4l1Fs1UL0/EyTIPi3lEX/xXSrX7xtq+8uz5RTkF1dxspbxTpv570gmgc7brVnmu3jxjJvIFNF6S4dwJ5eZ0aPzaDBUUP2MlitiHonYL+brb7blVtqoyxkeQ3tRtDmbIep27tZ/hNhqwQDXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gr+SiChi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gr+SiChi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738587323; x=1770123323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0caLat2CCBxKYMWdMMiUqwC56FhUojcb7HuJmIEigo=;
  b=gr+SiChiJ8NbOr7XjLgPznsRidt68Xgpm2thS9DPAe57O/jVGEKj1teZ
   VS7oOyfJACPDO4ocnqZxjpLF4hdqk3xuw3KYgWJ8OBcT0IviCWXbwgqc0
   mTYncpW1q1Ebbfmep3CGAX3gCLvjcQUwm38+rpZrwQYYYO5adGSDpoTGU
   MZU22GYV5oMI6NssW1NGkWhL2feN4CD3wC3GcTaCpyRQZgOhXjO4TW5/E
   IXGBjj6+XkjYJuZ8Bbmbde5QD7wAgdR4E/0SacFodQsqV5BJScrdSm8fH
   sWZvIV2oJPIcf/MIw5Y+V0vlhU716BBN/q+VAHF23CbyCrBr7r4LUpttd
   A==;
X-CSE-ConnectionGUID: TZ2MkPwMS8e6mkUqBJtVUw==
X-CSE-MsgGUID: cQEDcM9HTpSYOqJprhgEJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56505681"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56505681"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:55:22 -0800
X-CSE-ConnectionGUID: 9KkxNfzWTdSGwF5426YnEQ==
X-CSE-MsgGUID: mKnIBt6+ROar8bYLXD4bjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110100003"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2025 04:55:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tevyw-000qvD-0e;
	Mon, 03 Feb 2025 12:55:18 +0000
Date: Mon, 3 Feb 2025 20:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [ambarus:mtd/spimem-odd-octal-ops 3/3]
 drivers/mtd/spi-nor/core.c:2179: warning: bad line:
Message-ID: <202502032020.x4VCTYwd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day mtd/spimem-odd-octal-ops
head:   2fe5adeaab12de539cebb3a3d3fe321f4d267d53
commit: 2fe5adeaab12de539cebb3a3d3fe321f4d267d53 [3/3] mtd: spi-nor: core: avoid odd length/address writes in 8D-8D-8D mode
config: hexagon-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032020.x4VCTYwd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032020.x4VCTYwd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032020.x4VCTYwd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/core.c:2179: warning: bad line: 


vim +2179 drivers/mtd/spi-nor/core.c

  2171	
  2172	/**
  2173	 * spi_nor_dtr_write() - write data to flash memory by avoiding odd lengths and
  2174	 * addresses.
  2175	 * @nor:        pointer to 'struct spi_nor'
  2176	 * @to:         offset to write to
  2177	 * @len:        number of bytes to write
  2178	 * @buf:        pointer to src buffer
> 2179	
  2180	 * On DTR capable flashes the writes cannot start or end at an odd address in
  2181	 * DTR mode. Extra 0xff bytes need to be appended or prepended to make sure the
  2182	 * start address and end address are even. 0xff is used because on NOR flashes
  2183	 * a program operation can only flip bits from 1 to 0, not the other way round.
  2184	 * 0 to 1 flip needs to happen via erases.
  2185	 *
  2186	 * Return: number of bytes written successfully, -errno otherwise.
  2187	 */
  2188	static int spi_nor_dtr_write(struct spi_nor *nor, loff_t to, size_t len,
  2189				     const u8 *buf)
  2190	{
  2191		u32 page_size = nor->params->page_size;
  2192		size_t bytes_written;
  2193		loff_t start, end;
  2194		u8 *tmp_buf;
  2195		int ret;
  2196	
  2197		if (IS_ALIGNED(to, 2) && IS_ALIGNED(len, 2))
  2198			return spi_nor_write_data(nor, to, len, buf);
  2199	
  2200		tmp_buf = kmalloc(page_size, GFP_KERNEL);
  2201		if (!tmp_buf)
  2202			return -ENOMEM;
  2203	
  2204		memset(tmp_buf, 0xff, page_size);
  2205	
  2206		start = round_down(to, 2);
  2207		end = round_up(to + len, 2);
  2208	
  2209		memcpy(tmp_buf + (to - start), buf, len);
  2210	
  2211		ret = spi_nor_write_data(nor, start, end - start, tmp_buf);
  2212		if (ret == 0) {
  2213			ret = -EIO;
  2214			goto out;
  2215		}
  2216		if (ret < 0)
  2217			goto out;
  2218	
  2219		/*
  2220		 * More bytes are written than actually requested, but that number can't
  2221		 * be reported to the calling function or it will confuse its
  2222		 * calculations. Calculate how many of the _requested_ bytes were
  2223		 * written.
  2224		 */
  2225		bytes_written = ret;
  2226	
  2227		if (to != start)
  2228			ret -= to - start;
  2229	
  2230		/*
  2231		 * Only account for extra bytes at the end if they were actually
  2232		 * written. For example, if for some reason the controller could only
  2233		 * complete a partial write then the adjustment for the extra bytes at
  2234		 * the end is not needed.
  2235		 */
  2236		if (start + bytes_written == end)
  2237			ret -= end - (to + len);
  2238	
  2239		/* Should not be possible. */
  2240		if (ret < 0)
  2241			ret = -EIO;
  2242	
  2243	out:
  2244		kfree(tmp_buf);
  2245		return ret;
  2246	}
  2247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
