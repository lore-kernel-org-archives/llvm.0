Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18A14F9FF;
	Thu,  8 Aug 2024 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723142089; cv=none; b=QP0xTdWl+WKQraaswjE1dEYKjDSuRuxuGmCw+0PkHojvn01kns4GyAa5oTgaCwTVzB6/gB8duiwo9g/+6VD/nj1J+hyh1zBN5NRXm119W83zZIH+GaLTKjNF2zYnUCkb/X5OaKCYSRMn6TNiqPipI/0OzrWw7lpponx5GcMcX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723142089; c=relaxed/simple;
	bh=UWfi8KcPKzyyQxS6Gue8Sxfv+JSPXiTdtmasmU+Kdl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GjPu5Vsx6f/0SCURdPZ54rlrikMQyv98OvMnWiqu73X8hx0Ij1gXIkgu9mjlMdmEDTs42xTlwNZJT5Ll6LE1lOB5gQboFpffYwUazWVkED9p7c75Rzl+fU/Z0EcyB7tuemu7+Eg4DObfba7tIdQcjOXP6h7MNkT9tQHa4094L7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvjTFarZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvjTFarZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723142089; x=1754678089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWfi8KcPKzyyQxS6Gue8Sxfv+JSPXiTdtmasmU+Kdl0=;
  b=lvjTFarZTXlOx8mph/hv+4tsVGIYIxxENCQh0V+Qn2QykfkO1C3iqa1C
   TCON/RSBe0kKlVXGojms017xEpMjrWQSSlzMgeEQ7ZysySYd1Kkekivui
   r7t7e0CCG+w2KpaiYIT4QJnsFEa3bJPSMbVYyOuYD7VyHMd47ho9WlfRy
   mrYmaJMHgo7HTqkoJZBvLCPUaXYynNdrueMilvCF0IvmR0kyi3xURIoHm
   TQYuslijiQ5EP27dsZIw9pCvCDAfRvgq33k/qvOBJkkBqKfXfDU5weIQr
   0jsLScaKCf3xNQjI3L1dfK58q97K8WdGJwFUsYGdHUakqnCoJbKGkLHH8
   g==;
X-CSE-ConnectionGUID: hcoiIex2TRS5wCbWgJ6BEw==
X-CSE-MsgGUID: /5v9nW+0RDqD4uLcCjTEqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38749276"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="38749276"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 11:34:45 -0700
X-CSE-ConnectionGUID: reVBstWaQAGN+FRDvGM3JA==
X-CSE-MsgGUID: mJhckQywRR6TmbJ/h4MBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="58018226"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Aug 2024 11:34:43 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc7yC-0006Pa-1L;
	Thu, 08 Aug 2024 18:34:40 +0000
Date: Fri, 9 Aug 2024 02:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v4-2024-08-07 18/26] drivers/cxl/core/mbox.c:1151:55:
 warning: variable 'rc' is uninitialized when used here
Message-ID: <202408090233.Iozhsk8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 94e4d34504479b5a02b03f0bdbbc29bf0903b174 [18/26] cxl/extent: Process DCD events and realize region extents
config: i386-buildonly-randconfig-004-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090233.Iozhsk8z-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090233.Iozhsk8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090233.Iozhsk8z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:1151:55: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
    1151 |                 dev_dbg(dev, "Failed to release %par; %d\n", range, rc);
         |                                                                     ^~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/cxl/core/mbox.c:1140:8: note: initialize the variable 'rc' to silence this warning
    1140 |         int rc;
         |               ^
         |                = 0
   1 warning generated.


vim +/rc +1151 drivers/cxl/core/mbox.c

  1135	
  1136	void memdev_release_extent(struct cxl_memdev_state *mds, struct range *range)
  1137	{
  1138		struct device *dev = mds->cxlds.dev;
  1139		struct xarray extent_list;
  1140		int rc;
  1141	
  1142		struct cxl_extent extent = {
  1143			.start_dpa = cpu_to_le64(range->start),
  1144			.length = cpu_to_le64(range_len(range)),
  1145		};
  1146	
  1147		dev_dbg(dev, "Releasing extent %par\n", range);
  1148	
  1149		xa_init(&extent_list);
  1150		if (xa_insert(&extent_list, 0, &extent, GFP_KERNEL)) {
> 1151			dev_dbg(dev, "Failed to release %par; %d\n", range, rc);
  1152			goto error;
  1153		}
  1154	
  1155		rc = cxl_send_dc_response(mds, CXL_MBOX_OP_RELEASE_DC, &extent_list, 1);
  1156		if (rc)
  1157			dev_dbg(dev, "Failed to release %par; %d\n", range, rc);
  1158	
  1159	error:
  1160		xa_destroy(&extent_list);
  1161	}
  1162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
