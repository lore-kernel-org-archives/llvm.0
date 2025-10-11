Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0AF2417C3;
	Sat, 11 Oct 2025 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760223166; cv=none; b=c5QT9ILdv0HV0byVVLwRxThZzH2FhDBU/nbRMWhDrYwxB6vOwaOQPCsuauOE2TozIjuX7BdT2Q1p98h/HjRuNxwJe/9FLe4F8Goe4GLQ1ls6wmtn9vgOjTzbDrQ+6//cFNwT43uAba7n1K8Xjitu2/O+F2oW1OuDCvElUvyY3tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760223166; c=relaxed/simple;
	bh=GVmOG10TROUdeXmJov1L7XMMndm0Uh+AWCht1noS0Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2RFh1Wk2vG2JndhzVY5Tvjxu+361VKgJnco73640ktKUPlgiH9dCcaeSnOWi82oGkmF8Ddzk80j1kvoDRJt1M+/blR/XfGYSZA8+1twj9m5voezv7tleBTXaTWwu3RNCL7N71siCHinlw8XJLhXbYNxiG6aPZgoeSop51PVwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFYmur2F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFYmur2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760223165; x=1791759165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GVmOG10TROUdeXmJov1L7XMMndm0Uh+AWCht1noS0Ts=;
  b=oFYmur2F/EWScoprUOuOMOQNpQ0E0C3CTKXWIg9FpoGtqTw1uEXsnO+P
   ZExRMQ9ev+nvdtI2tIOji3qYNR8K048vSX9kx0s+QEWMgk+OfffyOQQLb
   0PZm0SHKaEP76E6e85al3IU9fT3Yzdb/G+LAdGa/dr6arhEKdQ9RPJ23/
   Zp2rt/e8qZn7F8XQTaOxlMNMpkyQDqgYrZivjgmSdsrD53YYFYOvJ025o
   vPoRkV3EJxIZbCn3MSMFviM6/ru9AwePIUY/R3oKmnyd5NR0do/2xtsyW
   y4Ici5gQjfmiC4Ffg/38QSfypK+OVOGB2jvsYNXM5J+0tQEIKeq9gEaK4
   A==;
X-CSE-ConnectionGUID: 39GJtDZ8S76JhuRRlLci5A==
X-CSE-MsgGUID: mUqW83jlR8KtTFNl54uBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="80045083"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="80045083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 15:52:44 -0700
X-CSE-ConnectionGUID: nQuqMc/sT76CwsSU/yNfug==
X-CSE-MsgGUID: 6LVI2JFbRTmGaB+sfAiRJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="186548731"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 15:52:41 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7iS7-000427-1M;
	Sat, 11 Oct 2025 22:52:39 +0000
Date: Sun, 12 Oct 2025 06:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>, Frank Li <frank.li@nxp.com>,
	arm-scmi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/2] firmware: imx: sm-misc: Dump syslog info
Message-ID: <202510120607.1JmlmOTI-lkp@intel.com>
References: <20251011-sm-syslog-v2-1-v2-2-f43a3f6b32e4@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011-sm-syslog-v2-1-v2-2-f43a3f6b32e4@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2b763d4652393c90eaa771a5164502ec9dd965ae]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/firmware-arm_scmi-imx-Support-getting-syslog-of-MISC-protocol/20251011-193459
base:   2b763d4652393c90eaa771a5164502ec9dd965ae
patch link:    https://lore.kernel.org/r/20251011-sm-syslog-v2-1-v2-2-f43a3f6b32e4%40nxp.com
patch subject: [PATCH v2 2/2] firmware: imx: sm-misc: Dump syslog info
config: i386-buildonly-randconfig-001-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120607.1JmlmOTI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120607.1JmlmOTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120607.1JmlmOTI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/sm-misc.c:55:17: warning: unused variable 'dev' [-Wunused-variable]
      55 |         struct device *dev = file->private;
         |                        ^~~
   1 warning generated.


vim +/dev +55 drivers/firmware/imx/sm-misc.c

    50	
    51	static int syslog_show(struct seq_file *file, void *priv)
    52	{
    53		/* 4KB is large enough for syslog */
    54		void *syslog __free(kfree) = kmalloc(SZ_4K, GFP_KERNEL);
  > 55		struct device *dev = file->private;
    56		/* syslog API use num words, not num bytes */
    57		u16 size = SZ_4K / 4;
    58		int ret;
    59	
    60		if (!ph)
    61			return -ENODEV;
    62	
    63		ret = imx_misc_ctrl_ops->misc_syslog(ph, &size, syslog);
    64		if (ret)
    65			return ret;
    66	
    67		seq_hex_dump(file, " ", DUMP_PREFIX_NONE, 16, sizeof(u32), syslog, size * 4, false);
    68		seq_putc(file, '\n');
    69	
    70		return 0;
    71	}
    72	DEFINE_SHOW_ATTRIBUTE(syslog);
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
