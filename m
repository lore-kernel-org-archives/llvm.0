Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFC038DD8;
	Fri, 14 Feb 2025 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739511324; cv=none; b=nwiRsyubND8YFE7mtMa6DmwWU/pFeNOMBHyCKHL5OUIDUWvzV1PKwPq3sPB6aQvJUSO3cBbP416EtGrgxJ2PMy8rb5Z4OF6U35d6jWkaFFZQCaNF2Qiv01HKtS88jmdnFHrspECK0gGaSREWTYR7OwezimhREfJGvg+JvxYYTbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739511324; c=relaxed/simple;
	bh=DU5XmaOWrTceOzRjkpgDxwzZPKuTCqYCxrp8nT4enJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KKmB1Z+Rb18mBKIUe4IeX1FuSvK6bEriR31fkyxhWXU+d+Y0Gs5ch+Ig7hMGLe0Bek1+EE0L7B+caLtxqQC4OU8SUY3I0PrgV5mx424yYilvla5lPiCRAXjaKFtSQPJvW3CKv1H+r8i29gjsmVhGjL3kUgirvN8c1xb8Ut1TyWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIhho5+A; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIhho5+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739511322; x=1771047322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DU5XmaOWrTceOzRjkpgDxwzZPKuTCqYCxrp8nT4enJg=;
  b=XIhho5+AjBXVIOLr9xobsGXDQseOljp+/mJjK8vMVDOk1hE/Gp4tgk3p
   0SyfEnuiSi5VphrLuB0t7nUKlcwod0Vq0qJNA2cKby+OP1R9bVCugf9vR
   x/m26JxJ0LDgsrLn7juFQOhizhR++mIQo1lE07XHw275LsXHE682OSzV0
   8+YjquVxYOv90JutOcy2JZtH0x5mGIVOqiVdil6fRnZfscQe4CoTpWP3F
   davdqm6ff6AbbqQjOWS2uwADC9LGDVGg8fXMGXSsc4ymKzFDFO9frC0RH
   TCicRYqRzwoJ1fa5wbwADEWGHxdX3cZWBoTEuZDd1oyYJz6D0ozPy52RB
   w==;
X-CSE-ConnectionGUID: uRP5xUJlT/K/3IY0uGPBtA==
X-CSE-MsgGUID: qlndojxsSq2MSoRs0W3hAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40110938"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="40110938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 21:35:22 -0800
X-CSE-ConnectionGUID: jEI9sXpQTRepsQ7Z32kyNw==
X-CSE-MsgGUID: za79LRBJSEW/NUdusmegmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113350376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 21:35:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tioM9-001971-2U;
	Fri, 14 Feb 2025 05:35:17 +0000
Date: Fri, 14 Feb 2025 13:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>
Subject: [djiang:cxl/fwctl 21/25] ./usr/include/fwctl/cxl.h:35:31: error:
 field has incomplete type 'struct cxl_mbox_get_feat_in'
Message-ID: <202502141313.nxBGDxqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   368060188b78ad57197303bbffb78081837a7481
commit: 4c96849fd2546afeaa7696d4d267d3889a211cf7 [21/25] cxl: Add support to handle user feature commands for get feature
config: x86_64-buildonly-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141313.nxBGDxqV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141313.nxBGDxqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141313.nxBGDxqV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   ./usr/include/fwctl/cxl.h:34:36: error: field has incomplete type 'struct cxl_mbox_get_sup_feats_in'
      34 |                 struct cxl_mbox_get_sup_feats_in get_sup_feats_in;
         |                                                  ^
   ./usr/include/fwctl/cxl.h:13:8: note: forward declaration of 'struct cxl_mbox_get_sup_feats_in'
      13 | struct cxl_mbox_get_sup_feats_in;
         |        ^
>> ./usr/include/fwctl/cxl.h:35:31: error: field has incomplete type 'struct cxl_mbox_get_feat_in'
      35 |                 struct cxl_mbox_get_feat_in get_feat_in;
         |                                             ^
   ./usr/include/fwctl/cxl.h:15:8: note: forward declaration of 'struct cxl_mbox_get_feat_in'
      15 | struct cxl_mbox_get_feat_in;
         |        ^
   ./usr/include/fwctl/cxl.h:52:37: error: field has incomplete type 'struct cxl_mbox_get_sup_feats_out'
      52 |                 struct cxl_mbox_get_sup_feats_out get_feats_out;
         |                                                   ^
   ./usr/include/fwctl/cxl.h:14:8: note: forward declaration of 'struct cxl_mbox_get_sup_feats_out'
      14 | struct cxl_mbox_get_sup_feats_out;
         |        ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
