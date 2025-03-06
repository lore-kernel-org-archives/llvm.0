Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237002080FE;
	Thu,  6 Mar 2025 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741253793; cv=none; b=oAAIsdtPISlf0E3g3Y+6DuMZLBRVZ6rm7WyguDVjdKBoH+m7C0idblJ5SCF+Uc8kawGFPI0EVBQwNeNZRVbLGts8c6cIn8UPJXTlV65vhBtPiM8rgJ8pil/shZwOJPig9La52ZrPbARQcsEWhDc5TTKYS7OKiZ4DUFyZvdbdsNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741253793; c=relaxed/simple;
	bh=77Jhnao9qshXdlhv1RQhaWjySr6ycHZo8AWyOME78+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucOBpS7VivZoiOFPDE3D46/nJIn5/G27HzX0o+k8H2i0d/Wsex9gLonfrOSCBc99jDUKyG3wNty3mfsb8MeoP8uFEOKBwB76i1mlrT/vUfFRV+tQl5dzvThbNBjCJ6T1qT8cYSJMf1yHt1Q99SwDUXjRN6PObX7rsj44S11q11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHrWaclm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHrWaclm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741253792; x=1772789792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=77Jhnao9qshXdlhv1RQhaWjySr6ycHZo8AWyOME78+Q=;
  b=aHrWaclmXXchvdzd9pI1xVRdXni/brrea6/8q8eoocatl34/wQk5Bi0X
   S/JupbepGw8Kj7mkVIA/MtHnZ7nvOZXnGuQ+puxXqMMQ2WvwavZhUo8Os
   yvphWKc4fkuwinOB9NC6MAlPdHJkbtS5S8LN0aDa9PqEdv453qWI76f7z
   FBXlTo4Y+ssfS+6zbmjiPu/gPpgIH+KkzsFcdsYFOesJGQIf620DFdaXU
   FDDpQ26MdMjErC61tgn/PAKZBQZxyhbbWSi0dNugXH4/P+S3w7gEO9NZT
   wxq1tmUJS94a9JFK810p2s1lrCBUxkz36KQctAcHc01bQKYeJuFlbjJ9C
   g==;
X-CSE-ConnectionGUID: 8eQwAQIuSZuHIMmf7S9x0g==
X-CSE-MsgGUID: a9zg8mFyT8O2cXVT71lFgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46024910"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="46024910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 01:36:30 -0800
X-CSE-ConnectionGUID: H2euffjlQ5mfYwOA3hromw==
X-CSE-MsgGUID: MYnVw52qQu+sEfnmDccDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123988801"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2025 01:36:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq7eT-000Mqc-2K;
	Thu, 06 Mar 2025 09:36:25 +0000
Date: Thu, 6 Mar 2025 17:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
Message-ID: <202503061704.adraY1Jm-lkp@intel.com>
References: <20250305121705.2143540-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305121705.2143540-1-y-abhilashchandra@ti.com>

Hi Yemike,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/media-i2c-ds90ub960-Enable-second-i2c-interface/20250305-201858
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250305121705.2143540-1-y-abhilashchandra%40ti.com
patch subject: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
config: arm-randconfig-004-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061704.adraY1Jm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061704.adraY1Jm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061704.adraY1Jm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ds90ub960.c:2577:4: warning: variable 'fwd_ctl' is uninitialized when used here [-Wuninitialized]
    2577 |                         fwd_ctl |= BIT(nport); /* forward to TX1 */
         |                         ^~~~~~~
   drivers/media/i2c/ds90ub960.c:2458:12: note: initialize the variable 'fwd_ctl' to silence this warning
    2458 |         u8 fwd_ctl;
         |                   ^
         |                    = '\0'
   1 warning generated.


vim +/fwd_ctl +2577 drivers/media/i2c/ds90ub960.c

afe267f2d368f5 Tomi Valkeinen          2023-06-19  2454  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2455  static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2456  					       struct v4l2_subdev_state *state)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2457  {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2458  	u8 fwd_ctl;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2459  	struct {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2460  		u32 num_streams;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2461  		u8 pixel_dt;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2462  		u8 meta_dt;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2463  		u32 meta_lines;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2464  		u32 tx_port;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2465  	} rx_data[UB960_MAX_RX_NPORTS] = {};
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2466  	u8 vc_map[UB960_MAX_RX_NPORTS] = {};
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2467  	struct v4l2_subdev_route *route;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2468  	int ret;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2469  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2470  	ret = ub960_validate_stream_vcs(priv);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2471  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2472  		return ret;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2473  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2474  	ub960_get_vc_maps(priv, state, vc_map);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2475  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2476  	for_each_active_route(&state->routing, route) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2477  		struct ub960_rxport *rxport;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2478  		struct ub960_txport *txport;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2479  		struct v4l2_mbus_framefmt *fmt;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2480  		const struct ub960_format_info *ub960_fmt;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2481  		unsigned int nport;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2482  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2483  		nport = ub960_pad_to_port(priv, route->sink_pad);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2484  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2485  		rxport = priv->rxports[nport];
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2486  		if (!rxport)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2487  			return -EINVAL;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2488  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2489  		txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2490  		if (!txport)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2491  			return -EINVAL;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2492  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2493  		rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2494  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2495  		rx_data[nport].num_streams++;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2496  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2497  		/* For the rest, we are only interested in parallel busses */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2498  		if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
093d69ad556df2 Tomi Valkeinen          2023-07-31  2499  		    rxport->rx_mode == RXPORT_MODE_CSI2_NONSYNC)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2500  			continue;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2501  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2502  		if (rx_data[nport].num_streams > 2)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2503  			return -EPIPE;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2504  
d0fde6aae2bacd Sakari Ailus            2023-10-13  2505  		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2506  						   route->sink_stream);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2507  		if (!fmt)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2508  			return -EPIPE;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2509  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2510  		ub960_fmt = ub960_find_format(fmt->code);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2511  		if (!ub960_fmt)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2512  			return -EPIPE;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2513  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2514  		if (ub960_fmt->meta) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2515  			if (fmt->height > 3) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2516  				dev_err(&priv->client->dev,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2517  					"rx%u: unsupported metadata height %u\n",
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2518  					nport, fmt->height);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2519  				return -EPIPE;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2520  			}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2521  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2522  			rx_data[nport].meta_dt = ub960_fmt->datatype;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2523  			rx_data[nport].meta_lines = fmt->height;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2524  		} else {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2525  			rx_data[nport].pixel_dt = ub960_fmt->datatype;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2526  		}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2527  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2528  
cff7e9e5aee4ba Tomi Valkeinen          2024-12-06  2529  	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports;
cff7e9e5aee4ba Tomi Valkeinen          2024-12-06  2530  	     nport++) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2531  		struct ub960_rxport *rxport = priv->rxports[nport];
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2532  		u8 vc = vc_map[nport];
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2533  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2534  		if (rx_data[nport].num_streams == 0)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2535  			continue;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2536  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2537  		switch (rxport->rx_mode) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2538  		case RXPORT_MODE_RAW10:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2539  			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2540  				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT));
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2541  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2542  			ub960_rxport_write(priv, rxport->nport,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2543  				UB960_RR_RAW_EMBED_DTYPE,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2544  				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2545  					rx_data[nport].meta_dt);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2546  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2547  			break;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2548  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2549  		case RXPORT_MODE_RAW12_HF:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2550  		case RXPORT_MODE_RAW12_LF:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2551  			/* Not implemented */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2552  			break;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2553  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2554  		case RXPORT_MODE_CSI2_SYNC:
093d69ad556df2 Tomi Valkeinen          2023-07-31  2555  		case RXPORT_MODE_CSI2_NONSYNC:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2556  			if (!priv->hw_data->is_ub9702) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2557  				/* Map all VCs from this port to the same VC */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2558  				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2559  						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2560  						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2561  						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2562  						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2563  			} else {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2564  				unsigned int i;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2565  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2566  				/* Map all VCs from this port to VC(nport) */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2567  				for (i = 0; i < 8; i++)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2568  					ub960_rxport_write(priv, nport,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2569  							   UB960_RR_VC_ID_MAP(i),
5dbbd0609b83f6 Tomi Valkeinen          2024-12-06  2570  							   (nport << 4) | nport);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2571  			}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2572  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2573  			break;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2574  		}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2575  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2576  		if (rx_data[nport].tx_port == 1)
afe267f2d368f5 Tomi Valkeinen          2023-06-19 @2577  			fwd_ctl |= BIT(nport); /* forward to TX1 */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2578  		else
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2579  			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2580  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2581  
03fb91f512dd2e Yemike Abhilash Chandra 2025-03-05  2582  	ret = ub960_update_bits(priv, UB960_SR_FWD_CTL1, priv->rx_mask, fwd_ctl);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2583  
03fb91f512dd2e Yemike Abhilash Chandra 2025-03-05  2584  	return ret;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2585  }
afe267f2d368f5 Tomi Valkeinen          2023-06-19  2586  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
