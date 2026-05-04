Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C72F1FE4;
	Mon,  4 May 2026 20:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777925617; cv=none; b=f/SRmYitny7dvuA1LYkRIK4R0PrJ0ot6+g+ekmVLaylu2I6utTLdM0PPmvz4hMTN07rxpkAVlWQsrXhQ8cNhCOVcaLCpH/rfaBaM9MadS4RMpv5ncKN/DehtTyc8XEoL+fCkUwFmsmJu3vufriVidipOm5+TE5hydKDGNNvfSiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777925617; c=relaxed/simple;
	bh=J4sGrwOcQs1QqRf1giDDheWvThUBjS3LrQv+gvuUrM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rG13nwpja/JnhosGfyC99VYqUUmXijDA2MplVniKQInl+Q2i/ESyJfb43veuYWQYGE9o9ovUb+5rn9ZEBkTeaU4m1k9XKTVY3bwfSKr1m6SbIg+f6U+JQpeUAjyeMBqCxfYpHdr6OYTbzPmzOZo+ncv8YR632525vCMYUXfPuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVCveHeJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVCveHeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777925615; x=1809461615;
  h=date:from:to:cc:subject:message-id;
  bh=J4sGrwOcQs1QqRf1giDDheWvThUBjS3LrQv+gvuUrM4=;
  b=IVCveHeJ1Dj+0DgEnHB17QZ6otpbTy3hKnvB6IY164m813Vlh5oGWf6B
   XumMB7qwAcIXEGdmsP39GDoB0aa+NvmMxZdoHfjJrFe2v6gRwzR82fAaC
   ofcOlW38Y+348YI2aMiKErBL4Bfcnnz+klj0IuTU88CNr0hbrPwbutF/o
   dTUT2CPpLEAd/XTQyDO3TIa5ndMmIlygw1L4KdBQ+CFJ6tc9ZV83WOhyM
   InogoFhn73rZPvICb0ZCExjAXsv5Gv4TrxF2e7pRhbmkSvkzlGVtZ5uci
   sFFF+ML2tGKH4cpHzci0FoPuYnWbHMDO+FDdbleogwKE5nSdBbd6b6weg
   A==;
X-CSE-ConnectionGUID: A4wrh9KbT5iRtAhJw53j6A==
X-CSE-MsgGUID: 5FtcVyx8TxmBRY1nB+VExg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101457354"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="101457354"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 13:13:34 -0700
X-CSE-ConnectionGUID: QmQu9XIpSluao73m3f/4sg==
X-CSE-MsgGUID: kwzOFcS7QO6cOhTzg9pQ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="237377380"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 May 2026 13:13:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJzfL-000000003zH-0y7k;
	Mon, 04 May 2026 20:13:24 +0000
Date: Tue, 05 May 2026 04:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, Guodong Xu <guodong@riscstar.com>
Subject: [broonie-ci:spi-7.2 9/9]
 drivers/spi/spi-spacemit-k1.c:393:31: warning: overflow in expression; result
 is -589934592 with type 'long'
Message-ID: <202605050437.RS6mmV2b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-7.2
head:   efcd8b9d111177d48c841d09beca43b15d5b9e5f
commit: efcd8b9d111177d48c841d09beca43b15d5b9e5f [9/9] spi: spacemit: introduce SpacemiT K1 SPI controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260505/202605050437.RS6mmV2b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050437.RS6mmV2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050437.RS6mmV2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-spacemit-k1.c:393:31: warning: overflow in expression; result is -589934592 with type 'long' [-Winteger-overflow]
     393 |         nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
         |                                      ^
   1 warning generated.


vim +/long +393 drivers/spi/spi-spacemit-k1.c

   356	
   357	/* Set the transfer speed; the SPI core code ensures it is supported */
   358	static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
   359				    struct spi_transfer *transfer)
   360	{
   361		struct clk *clk = drv_data->clk;
   362		u64 nsec_per_word;
   363		u64 bus_ticks;
   364		u32 timeout;
   365		u32 val;
   366		int ret;
   367	
   368		ret = clk_set_rate(clk, transfer->speed_hz);
   369		if (ret)
   370			return ret;
   371	
   372		drv_data->rate = clk_get_rate(clk);
   373	
   374		/* No need for RX FIFO timeout if we're not receiving anything */
   375		if (!transfer->rx_buf)
   376			return 0;
   377	
   378		/*
   379		 * Compute the RX FIFO inactivity timeout value that should be used.
   380		 * The inactivity timer restarts with each word that lands in the
   381		 * FIFO.  If several "word transfer times" pass without any new data
   382		 * in the RX FIFO, we might as well read what's there.
   383		 *
   384		 * The rate at which words land in the FIFO is determined by the
   385		 * word size and the transfer rate.  One bit is transferred per
   386		 * clock tick, and 8 (or 16 or 32) bits are transferred per word.
   387		 *
   388		 * So we can get word transfer time (in nanoseconds) from:
   389		 *   nsec_per_tick = NSEC_PER_SEC / drv_data->rate;
   390		 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
   391		 * We do the divide last for better accuracy.
   392		 */
 > 393		nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
   394		nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
   395	
   396		/*
   397		 * The timeout (which we'll set to three word transfer times) is
   398		 * expressed as a number of APB clock ticks.
   399		 *   bus_ticks = 3 * nsec * (drv_data->bus_rate / NSEC_PER_SEC)
   400		 */
   401		bus_ticks = 3 * nsec_per_word * drv_data->bus_rate;
   402		timeout = DIV_ROUND_UP_ULL(bus_ticks, NSEC_PER_SEC);
   403	
   404		/* Set the RX timeout period (required for both DMA and PIO) */
   405		val = FIELD_PREP(SSP_TIMEOUT_MASK, timeout);
   406		writel(val, drv_data->base + SSP_TIMEOUT);
   407	
   408		return 0;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
