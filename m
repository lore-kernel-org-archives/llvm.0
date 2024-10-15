Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D901F9413;
	Tue, 15 Oct 2024 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012966; cv=none; b=TcV0mHfvxJwqJ5/dxQ5lTIr113ssA9k3So98sesY1NcDUSZbZhuiOkpQN/o2j912PaWT9YBRFFZl4sAVHY9jEFhjH5sIAll1GSK7i9jkjcxP4Odtx5RPjMpjVX6eQMWwsJZHm0PZf0g+UG+M7oW/NIgsa6aVPiFiKcX5qwTHLLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012966; c=relaxed/simple;
	bh=Lot1+gKgQJ4DS8C3BfB5DwPPrYEDl7u6igAbiWgKgV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phomkyQVZtYnwQnxw1sVTRWrmtH2kMR9BynwRhHAgb/wxaUsHvKGC/OYe0iDTd1erxSfptCFFNV3EvBf5aaAdfb15uw8Up5hoHmX5oMahbUUFPrCfsgBff5z+FESCRhyHjUg069f0qm4Tqg/qFxVn+PA1RStlnTZ2SphCj8jfto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6Tj/F0G; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6Tj/F0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729012964; x=1760548964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lot1+gKgQJ4DS8C3BfB5DwPPrYEDl7u6igAbiWgKgV0=;
  b=h6Tj/F0G10rwCCzSZUyYh3/p4JdETD5QU219lqevuT+KHnhedhOJG4FS
   b1fEgDIqvXCncBuZNTye4bVGCX/R3EENIBLS9XKri/hWup5fEiD7C+hvz
   //zwnB5jeHrka79pxiB+LgVV4URDdzrJTEt/8GO6Ugzid+dCzLiZDG8jm
   R4N21htepHfy+jiG10uRsAN7Fy6zZ3VM17pjanuzF9LpQ+sMZr20QSRZU
   eCj2GG9T6TzIdtpele0l6plw4x/dVimKao04yLIR9keIwIxVjRsPuT/jP
   cdysIespMQiGD76StKVcra18TOQAHV09nj9pWAB9l0muMX76Xf6vJZqAp
   A==;
X-CSE-ConnectionGUID: 0xwmlB9qTha346gXw4Z9hQ==
X-CSE-MsgGUID: H8qbUOqaRVuMpDD6f5oCYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32342120"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="32342120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 10:22:42 -0700
X-CSE-ConnectionGUID: oyrji+fDSWOQBSTWfFdqww==
X-CSE-MsgGUID: wS/0al/+RIGuii96E6E9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="77627836"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Oct 2024 10:22:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0lFl-000Jf3-11;
	Tue, 15 Oct 2024 17:22:37 +0000
Date: Wed, 16 Oct 2024 01:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, chris.packham@alliedtelesis.co.nz
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v3 2/2] phy: Realtek Otto SerDes driver
Message-ID: <202410160149.TNGsZcue-lkp@intel.com>
References: <20241012134834.1306992-3-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012134834.1306992-3-markus.stockhausen@gmx.de>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/dt-bindings-phy-add-realtek-rtl8380m-serdes/20241012-214949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241012134834.1306992-3-markus.stockhausen%40gmx.de
patch subject: [PATCH v3 2/2] phy: Realtek Otto SerDes driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241016/202410160149.TNGsZcue-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160149.TNGsZcue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160149.TNGsZcue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/realtek/phy-rtk-otto-serdes.c:120:12: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     119 |         dev_info(ctrl->dev, "firmware %s: loaded with %d bytes, %d sequences\n",
         |                                                       ~~
         |                                                       %zu
     120 |                  fwname, ctrl->firmware->size, h->dirsize);
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +120 drivers/phy/realtek/phy-rtk-otto-serdes.c

    71	
    72	static int rtsds_fw_load(struct rtsds_ctrl *ctrl)
    73	{
    74		int ret;
    75		struct rtsds_fw_head *h;
    76		u32 checksum;
    77		const char *msg;
    78		const char *fwprop;
    79		char fwname[128];
    80	
    81		ret = device_property_read_string(ctrl->dev, "firmware-name", &fwprop);
    82		if (ret)
    83			snprintf(fwname, sizeof(fwname), "realtek/%s", ctrl->conf->fwname);
    84		else if (strcmp(fwprop, ""))
    85			snprintf(fwname, sizeof(fwname), "realtek/%s", fwprop);
    86		else {
    87			dev_info(ctrl->dev, "firmware deactivated, patching disabled\n");
    88			return 0;
    89		}
    90	
    91		ret = firmware_request_nowarn(&ctrl->firmware, fwname, ctrl->dev);
    92		if (ret < 0) {
    93			msg = "not found";
    94			goto error;
    95		}
    96	
    97		if (ctrl->firmware->size < 16) {
    98			msg = "size to small";
    99			goto error;
   100		}
   101	
   102		h = (struct rtsds_fw_head *)ctrl->firmware->data;
   103		if (h->magic != RTSDS_FW_MAGIC) {
   104			msg = "magic mismatch";
   105			goto error;
   106		}
   107	
   108		if (h->filesize != ctrl->firmware->size) {
   109			msg = "size mismatch";
   110			goto error;
   111		}
   112	
   113		checksum = ~crc32(0xFFFFFFFFU, ctrl->firmware->data + 8, ctrl->firmware->size - 8);
   114		if (h->checksum != checksum) {
   115			msg = "checksum mismatch";
   116			goto error;
   117		}
   118	
   119		dev_info(ctrl->dev, "firmware %s: loaded with %d bytes, %d sequences\n",
 > 120			 fwname, ctrl->firmware->size, h->dirsize);
   121	
   122		return 0;
   123	error:
   124		dev_err(ctrl->dev, "firmware %s: %s, patching disabled\n", fwname, msg);
   125		ctrl->firmware = NULL;
   126		return -EINVAL;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
