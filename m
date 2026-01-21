Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DC37E308;
	Wed, 21 Jan 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005670; cv=none; b=ob++hkJ09SEG7khhsSwvQ7nJeSHmxv2pGDaMNYmkdOYjeT0LojZK9BzerAgpsgEIJ0Jk5xiHIkkxj/iqz3Cst17861TMN91+FGTRA6qyl76+4zSZtmQOoyNnujLDBvoVgUWWTR81YKj+lxqqntd54bK5lHyHck+c7lJXelEn7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005670; c=relaxed/simple;
	bh=5ZRWs9xXfr5MhLjyldecu1D79f6ZK8VE+HPThNMbI60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVPQ5hWT24hFSKWT2fICk7oYRXQQhS0M4Q2MVa/e2TPioaQBeBOCaUCTDBTd2bt4dB33TyFgqpSvrPzbJ9DeaaP6BNacnj5DiZYPs0zQmV7OElcielsHsM6DH0eICwrbTwc7rZz8uaGB9z6JQEK2JzQZSkmpNwMd8HJoe2Pt1dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZspDEtbY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZspDEtbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769005667; x=1800541667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ZRWs9xXfr5MhLjyldecu1D79f6ZK8VE+HPThNMbI60=;
  b=ZspDEtbYAddkjEK/UlzBhl4QhS7Lul+D4uhOrZEdc3p0Ep30DO417oMp
   zKWpzheTMAL83uZQaL2A1to8K7XI/I7546yfI8zqPQr+MDHG6dnupi3qb
   gfwsgpgzSVEZ/FkEI3p8uI9JflkAXjrIClCAtawSH7iM5P3s88CNhlqLh
   TNVzUcdb8igKARGhrKQy0qD1eFK9xoV1wOYBCMp58r2p6rtvS2buPHV8L
   /5tK5ey0Hw10fj4mhFKcoyZoycmbF23D/Mw0yPhHHTEMFuuxxSOVR5Rdl
   X5KBAIAV/0xvifXoD1sbXKBmgcCG1fv3KGC/3h0GIViAzRHyElmv+eZil
   A==;
X-CSE-ConnectionGUID: irCo4YEsRkaWUWSJ239flw==
X-CSE-MsgGUID: +tqQ2ijMSd+oFdNph3y4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69250461"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69250461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 06:27:46 -0800
X-CSE-ConnectionGUID: dJMZTeArSL6jW6aZnJH4tw==
X-CSE-MsgGUID: hTxK/I4iQfqddwbWYKkhgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206888102"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 06:27:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viZBJ-00000000RIj-2tQ5;
	Wed, 21 Jan 2026 14:27:37 +0000
Date: Wed, 21 Jan 2026 22:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v9 15/17] media: rkvdec: Add H264 support for the VDPU383
 variant
Message-ID: <202601211924.rqKS2Ihm-lkp@intel.com>
References: <20260120222018.404741-16-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120222018.404741-16-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v6.19-rc6 next-20260120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-ls-t_rps-controls/20260121-071026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20260120222018.404741-16-detlev.casanova%40collabora.com
patch subject: [PATCH v9 15/17] media: rkvdec: Add H264 support for the VDPU383 variant
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601211924.rqKS2Ihm-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211924.rqKS2Ihm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211924.rqKS2Ihm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c:485:12: warning: stack frame size (2064) exceeds limit (2048) in 'rkvdec_h264_run' [-Wframe-larger-than]
     485 | static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
         |            ^
   1 warning generated.


vim +/rkvdec_h264_run +485 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c

   484	
 > 485	static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
   486	{
   487		struct v4l2_h264_reflist_builder reflist_builder;
   488		struct rkvdec_dev *rkvdec = ctx->dev;
   489		struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
   490		struct rkvdec_h264_run run;
   491		struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
   492		u32 timeout_threshold;
   493	
   494		rkvdec_h264_run_preamble(ctx, &run);
   495	
   496		/* Build the P/B{0,1} ref lists. */
   497		v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
   498					       run.sps, run.decode_params->dpb);
   499		v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
   500		v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
   501					    h264_ctx->reflists.b1);
   502	
   503		assemble_hw_scaling_list(&run, &tbl->scaling_list);
   504		assemble_hw_pps(ctx, &run);
   505		lookup_ref_buf_idx(ctx, &run);
   506		assemble_hw_rps(&reflist_builder, &run, &h264_ctx->reflists, &tbl->rps);
   507	
   508		config_registers(ctx, &run);
   509	
   510		rkvdec_run_postamble(ctx, &run.base);
   511	
   512		timeout_threshold = h264_ctx->regs.common.reg013_core_timeout_threshold;
   513		rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
   514	
   515		/* Start decoding! */
   516		writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
   517		writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
   518		writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
   519	
   520		return 0;
   521	}
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
