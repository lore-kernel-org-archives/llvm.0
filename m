Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3B82D66;
	Wed,  7 Aug 2024 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723064871; cv=none; b=uUWLQJ8zpNxn3v9Kf8etY65T78GrG1QEONL1ROD5Ejc3a/PBzoE8DyxgE/6aNw4Zcn3mCHjR8rBMd6gmpkIjmhICs1RunJe+ZZoBPCTNMX76eNIKJ+rDUmPDgJsUNFEaHHiL+138Cer4pOMdIAYNCRAuFxDnPgvXUR+FVlnSndo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723064871; c=relaxed/simple;
	bh=dFRUfB33anfCFyL4h8ESlttOH2daWnjcOppGNgv9nJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Grk2CD5y9436SwR+7M/wpjx1OeA2hdK2yxjT9zYKuZL7DFcRLOW3vrv/dPNOQJVOu/lovAFFuT5SsOuvOrxweMpyNXj+U+9mQQeF9KSA9NBCdYaJjHm9LM+Cr9iKVb83NVHOrNI39FdgcLHJr8d4LA+7qUxavNhTIN9p3F6XOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdNHc8p1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdNHc8p1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723064870; x=1754600870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFRUfB33anfCFyL4h8ESlttOH2daWnjcOppGNgv9nJo=;
  b=QdNHc8p1lxKo5rfGKX2Wbv4//VwaofzRTLNaeIx1fumXqtGZwSg5dN9P
   iGVDztoguZgk1DgsyQMwtN0kujNO222bM15dgs252VqWnXvcdDSs9k69j
   iF6HKBcboTDOQqalgDn/+20YImXAGh6OoH93hprsD/BaQedynpCd2t8cD
   Ni+yn+cpKMkWqqBLywovg0WNNq3v2e/FYmgbVtfDCQGPKrVApdMuAh5lz
   mxO2C+wcN5KhQBDIO/GP20lwqiKJaTj3dyXvvt5iD0JUd3ht4LNtbkw7T
   6KpFejHyIbqZkL6uISz2OCbS+NJE8NzbZ8vWO9XU7LMl1KaOi0BG3a/xI
   A==;
X-CSE-ConnectionGUID: 2vAaHtMFQbK1iWMe7vfCcw==
X-CSE-MsgGUID: Pavjbs6QTruolMBPfwNUOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21041297"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="21041297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 14:07:49 -0700
X-CSE-ConnectionGUID: AmGfznGSSXmD592ajz6EvQ==
X-CSE-MsgGUID: 1m77iFtaTeCqhg0zN4YclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56668675"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 14:07:48 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbnsn-0005ig-1L;
	Wed, 07 Aug 2024 21:07:45 +0000
Date: Thu, 8 Aug 2024 05:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [srini-nvmem:for-next 3/6] drivers/nvmem/imx-ocotp-ele.c:97:12:
 warning: bitwise or with non-zero value always evaluates to true
Message-ID: <202408080514.wuSJ2V3A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   641d6abbe15f96a4d2cce5dc48940fd22916d15e
commit: 04d372dd5562ed8aed4cdbb1004fe33a3bc4fa24 [3/6] nvmem: imx-ocotp-ele: support i.MX95
config: i386-buildonly-randconfig-005-20240808 (https://download.01.org/0day-ci/archive/20240808/202408080514.wuSJ2V3A-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080514.wuSJ2V3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080514.wuSJ2V3A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/imx-ocotp-ele.c:97:12: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
      97 |                 if (type | FUSE_ECC)
         |                     ~~~~~^~~~~~~~~~
   1 warning generated.


vim +97 drivers/nvmem/imx-ocotp-ele.c

    64	
    65	static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, size_t bytes)
    66	{
    67		struct imx_ocotp_priv *priv = context;
    68		void __iomem *reg = priv->base + priv->data->reg_off;
    69		u32 count, index, num_bytes;
    70		enum fuse_type type;
    71		u32 *buf;
    72		void *p;
    73		int i;
    74	
    75		index = offset;
    76		num_bytes = round_up(bytes, 4);
    77		count = num_bytes >> 2;
    78	
    79		if (count > ((priv->data->size >> 2) - index))
    80			count = (priv->data->size >> 2) - index;
    81	
    82		p = kzalloc(num_bytes, GFP_KERNEL);
    83		if (!p)
    84			return -ENOMEM;
    85	
    86		mutex_lock(&priv->lock);
    87	
    88		buf = p;
    89	
    90		for (i = index; i < (index + count); i++) {
    91			type = imx_ocotp_fuse_type(context, i);
    92			if (type == FUSE_INVALID || type == FUSE_ELE) {
    93				*buf++ = 0;
    94				continue;
    95			}
    96	
  > 97			if (type | FUSE_ECC)
    98				*buf++ = readl_relaxed(reg + (i << 2)) & GENMASK(15, 0);
    99			else
   100				*buf++ = readl_relaxed(reg + (i << 2));
   101		}
   102	
   103		memcpy(val, (u8 *)p, bytes);
   104	
   105		mutex_unlock(&priv->lock);
   106	
   107		kfree(p);
   108	
   109		return 0;
   110	};
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
