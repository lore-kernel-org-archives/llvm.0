Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794087863;
	b=SM2K19SFjNxoxgaO84Eh1wlRjy4eE8jtFbkG/4VmSuBUwpJmBiwW0HBh9YhEFl5JRP0o
	 fAoummVxD3oauSIUSaY17kTtyRq0yjXjrA38eTPHGr78wuhvJNK2HIchMERt09n4vekfz
	 VIxfzKfCcd5BcRleFNTwwYgZTz3fFIayL8A7jo0mUJNdHGGFNRLNAeaRTLHJmqUm/JqZE
	 16EBqHonJnkq2x5texm/sZkOqnRGOBUqv6vWN3PSyHmCwVk2hcTMX9NuRifC/RtbJEYWB
	 zki+37DMXHV3B4Sa7jCefgaKoND0I9Nk8FzILmIjJ/650afavbYlYlhTjDNEBln+AQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794087863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=sB09WNJW3d+13A5arIFJlIiie4qXGyky7H+wWE0/lag=;
	b=0pqFznMATQsJD92gfPg085tYEoo9i9Tef/q8TxAC47DhAb2fFaY82V+P91BCsIRytU7y
	 o/xviQPEeFGCZTugvVjJmxKwsKiaWiTlL5WuBDhrbNtpxvJCS2Oh2TmrxbR3UGAZ9RN6G
	 /0s+LOB2da26Y9L2e2iNMYkIjwg3szquU00ryVcrvXXmdkiVJJRIWzU2+ESClYE6SZhP1
	 u+oH6agXt6GzyDm5G53Go06Oii+LPiOB1gOxCgjacgsCffGS5QF8j8ZuPxSdIQrAeVUGy
	 BYa11HSKjH+VtaDwENHnW2vN9BVbQ4WwUiV4zzAYpXOlWesclpgGoRX24ZTXEncWOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VsNlCjdM;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79934606A32C;
	Sat,  7 Nov 2026 21:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79934606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VsNlCjdM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794087861; x=1825623861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k/1rDklUHfMI9DthPG297ITL+KaRw6yRNRqwI1fACI4=;
  b=VsNlCjdM1USFRNJcoE0fpcGRcolhQ7v5RL0jRb0mNc5bbP76h+Gh5AYw
   9zdpv6iwNsAgl/vL0tbn2Qh3CdAYEHOTihSkkiTIGTQlgTFLJsy50fByY
   uzCiLFTXqJwOGq5ZnTk2sP4nkVByQG//kpSHspNlWgfjm1+1lYtYDLmTV
   4elHOyMvyNq1GuUvF+9CgsaDPgrBshXr7q5ExlYgGaGNN6u/Q0xtnCZIp
   F8ivQ3B1G9r0MlfxRdHmLSjw8KJKT94B1Ka5zJNzjoJ1duMiI+HTZfzgI
   46As3ZsH/GlDFQwDBE5f6p/AU4RFd4rAgAhVfIRnpH21FJqMLAdjrtAjS
   A==;
X-CSE-ConnectionGUID: tHdnXeKWTV2X9uMaK9ha1g==
X-CSE-MsgGUID: pzL7JEKLTiO0l+YYZ+aaAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2857735"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2857735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 13:44:19 -0800
X-CSE-ConnectionGUID: VrhxRO5+Sn2Cwe90b4oEJg==
X-CSE-MsgGUID: TdkUtEKjQyCGw/zQ3k6YSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7727986"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 13:44:15 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPoCq-00000000rbn-1NfD;
	Sat, 07 Nov 2026 21:44:12 +0000
Date: Sun, 8 Nov 2026 05:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: amit <amittibi123@gmail.com>, neil.armstrong@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hanxu5@huaqin.corp-partner.google.com, jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	icenowy@aosc.io, jagan@amarulasolutions.com, linusw@kernel.org,
	robert.chiras@nxp.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, amit <amittibi123@gmail.com>
Subject: Re: [PATCH] drm/panel: Replace deprecated DCS display-on calls
Message-ID: <202611080509.DZUY4PHf-lkp@intel.com>
References: <20261104073813.42429-1-amittibi123@gmail.com>
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
In-Reply-To: <20261104073813.42429-1-amittibi123@gmail.com>

Hi amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.4-rc1]
[also build test WARNING on linus/master next-20261105]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/amit/drm-panel-Replace-deprecated-DCS-display-on-calls/20261104-093813
base:   v7.4-rc1
patch link:    https://lore.kernel.org/r/20261104073813.42429-1-amittibi123%40gmail.com
patch subject: [PATCH] drm/panel: Replace deprecated DCS display-on calls
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611080509.DZUY4PHf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080509.DZUY4PHf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080509.DZUY4PHf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c:356:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     356 |                 return ret;
         |                        ^~~
   drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c:350:9: note: initialize the variable 'ret' to silence this warning
     350 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +356 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c

fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  342  
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  343  static int k101_im2ba02_enable(struct drm_panel *panel)
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  344  {
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  345  	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  346  	const struct k101_im2ba02_init_cmd *cmd = &timed_cmds[1];
7bb5e5e01ffc36b amit          2026-11-04  347  	struct mipi_dsi_multi_context dsi_ctx = {
7bb5e5e01ffc36b amit          2026-11-04  348  		.dsi = ctx->dsi,
7bb5e5e01ffc36b amit          2026-11-04  349  	};
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  350  	int ret;
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  351  
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  352  	msleep(150);
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  353  
7bb5e5e01ffc36b amit          2026-11-04  354  	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
7bb5e5e01ffc36b amit          2026-11-04  355  	if (dsi_ctx.accum_err)
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16 @356  		return ret;
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  357  
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  358  	msleep(50);
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  359  
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  360  	return mipi_dsi_dcs_write_buffer(ctx->dsi, cmd->data, K101_IM2BA02_INIT_CMD_LEN);
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  361  }
fac47b1ebeda3b5 Icenowy Zheng 2020-01-16  362  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
