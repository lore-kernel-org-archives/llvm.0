Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9761ECC;
	Sun, 28 Jul 2024 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722148439; cv=none; b=jG4PbD3ZnJ0Pq5gNM9LIHkQjwhHXyxYxik9IhEDclcO1p5hTNlKMnzpqsBJSHD/25nu4EzNpu0YpmX4xqH7qehftFl5HDXrt0lF7lqQzR+G7U+Pa8aM9neRJAP6ov3Usrdy/BLnW5kIob+0p0KIoR2XmFKK8kj2QQywVg+AUQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722148439; c=relaxed/simple;
	bh=WG6WXg3ZC6xkRy0XWfSmNbKW0lLuxxW4zqjctvTRyvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fnRpxPB+UQkaoUe1ke7CaVyEjzBBm3j/xX2c1ipWItYo0yiEfm9Xs+3jzBiDQaY4T4OYhPdK5W0TMVlcvyPjz/01l1eCPO+m2GG8BoT6V20NoXGZxE/pcxupgDXuCNSCsjpqLuIitgZA3+NVuzC30TlfRbTjESF4kTfo+oW5baQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MA/AR99u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MA/AR99u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722148437; x=1753684437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WG6WXg3ZC6xkRy0XWfSmNbKW0lLuxxW4zqjctvTRyvw=;
  b=MA/AR99uDW7tURxsysXYgHDGmoxkM34PERJtceMttV5Hnw3l48TdmkNG
   nrZxpGD7lILOMkVxjf5ybDbQAED2YekojZtPLq2yWX0ydCVkxO7RZA0Uu
   qd3XH8ubp7Mep3gYHOHUpEsMfyqjOHcBq60Hf08lNolGVDnPXnoTpSSJW
   ip0GrcNi2054fGJ0ObSMClCoWapHxPX5lliuiblms8Skm37AsUEdahkgG
   qP6feNt2QQMExcbvFrFcNvvNzXZu6WtR4QeRsJglRfIpHIt1tPziwOjOe
   vI9CbEdAONShJpl/rMy3NNglgHoCwlzUzuC7DzCuK9NhKHi4FboYeQmiN
   Q==;
X-CSE-ConnectionGUID: P81ll5hFSAOoUUMezayNhA==
X-CSE-MsgGUID: 3m2c1BleT4SaLm7K4RveKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="37408609"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="37408609"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 23:33:56 -0700
X-CSE-ConnectionGUID: eXb3QWYJQMiJq2XEyPwv0A==
X-CSE-MsgGUID: AQWJwrscR4OfhiFjRb8Xvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="53640697"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jul 2024 23:33:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXxTc-000qaQ-1Q;
	Sun, 28 Jul 2024 06:33:52 +0000
Date: Sun, 28 Jul 2024 14:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Li <fei1.li@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wenlingz <wenling.zhang@intel.com>
Subject: [acrn:acrn_6.1.80 31/33] drivers/virt/acrn/hvlog.c:127:13: error:
 expected parameter declarator
Message-ID: <202407281427.SHTjTbz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/projectacrn/acrn-kernel acrn_6.1.80
head:   51b9a968e5ab57edbc20ecf1740ab54fd4f97ce0
commit: f528146c92c545c17a21206b87e70c7087247f88 [31/33] virt: acrn: add acrn hypervisor log back
config: x86_64-randconfig-001-20240728 (https://download.01.org/0day-ci/archive/20240728/202407281427.SHTjTbz4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281427.SHTjTbz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281427.SHTjTbz4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virt/acrn/hvlog.c:127:13: error: expected parameter declarator
     127 | early_param("hvlog", early_hvlog);
         |             ^
>> drivers/virt/acrn/hvlog.c:127:13: error: expected ')'
   drivers/virt/acrn/hvlog.c:127:12: note: to match this '('
     127 | early_param("hvlog", early_hvlog);
         |            ^
>> drivers/virt/acrn/hvlog.c:127:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     127 | early_param("hvlog", early_hvlog);
         | ^
         | int
>> drivers/virt/acrn/hvlog.c:127:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     127 | early_param("hvlog", early_hvlog);
         |            ^                    
         |                                 void
   4 errors generated.


vim +127 drivers/virt/acrn/hvlog.c

   103	
   104	static int __init early_hvlog(char *p)
   105	{
   106		int ret;
   107	
   108		pr_debug("%s(%s)\n", __func__, p);
   109		hvlog_buf_size = memparse(p, &p);
   110		if (*p != '@')
   111			return 0;
   112		hvlog_buf_phyaddr_base = memparse(p + 1, &p);
   113	
   114		if (!!hvlog_buf_phyaddr_base && !!hvlog_buf_size) {
   115			ret = memblock_reserve(hvlog_buf_phyaddr_base, hvlog_buf_size);
   116			if (ret) {
   117				pr_err("%s: Error reserving hvlog memblock\n",
   118					__func__);
   119				hvlog_buf_phyaddr_base = 0;
   120				hvlog_buf_size = 0;
   121				return ret;
   122			}
   123		}
   124	
   125		return 0;
   126	}
 > 127	early_param("hvlog", early_hvlog);
   128	
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
