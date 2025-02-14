Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02AB20B1EC;
	Fri, 14 Feb 2025 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739517518; cv=none; b=FdZiKql6SLF2yluy4Gq4eb/gE/TxYA3IquZaLhLf/LvL2f2M0cxCgZspVfc05PV9I5eonKQ3EEQTcr8dshnKe4rHzVOn3j2xym/fKAiAhMFty/u3YwjVs2E5g2atr6k5iRJ9L3/U4EHG5L6ZJ4WiU241y5AVBniQ4JE2JoE+D7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739517518; c=relaxed/simple;
	bh=g9TgpU+3p98K8Xcq75cS2vDjNwQGk3xjRv7DtiLhL5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CuU9uWZ3XHUiHvdvpqQbvhZuZjYRIgwgMIzPHsG7Noez03Y1CB2+N0vlfixmU8F8BAapNdT41wllTQfIyeJDLbjske/W2yKsCdZzyQ0axGTlygOV5XHYV+WPlidepVwz5XKD+hfIXx8MlNaY44/CGHBGjqijOIJ/voLw1+w1/u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1jpj3AZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1jpj3AZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739517517; x=1771053517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g9TgpU+3p98K8Xcq75cS2vDjNwQGk3xjRv7DtiLhL5M=;
  b=n1jpj3AZwcnXgjbWhlxjqs/6/Otd2HW5cVq7bRoQ0r+EfiO4vj3kPvkk
   jAlf9RVL8emM82hSx28+DVLrli/thC6mPMGq1VDW0cxW36pk1JLN310lF
   S3U7+0bkSMDtxW8LU41Rx7Srs3qHVHK1aHbvrMyb8+NLBQswsxRPlzAlg
   MelB4c6NnsevNYTCrRHTx++6kHK/a9tYMlnKpIDAoFRfqqZ/HUrPXb1fp
   oAWkwWOvFyFR4lbeEMqKfOWAajI6YV3hN6CSjEEozgzQQHYPlrQoVFPQl
   vp0r+e0YB9iVetISQ7cIF8nakgUtM2A2cl/llN5oSY0F09JY23c1u9nND
   g==;
X-CSE-ConnectionGUID: MRBgnJrLS8GHoD1rUQEgtQ==
X-CSE-MsgGUID: 6k+YZOeBRHKFBixmQuVeGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="27858094"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="27858094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 23:18:34 -0800
X-CSE-ConnectionGUID: Y7Zj4xT5SJS5ShIMc6GK5g==
X-CSE-MsgGUID: CPD+ukFbSsKorQzNVfZAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150559919"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 23:18:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tipy2-0019Ct-0K;
	Fri, 14 Feb 2025 07:18:30 +0000
Date: Fri, 14 Feb 2025 15:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>
Subject: [djiang:cxl/fwctl 22/25] ./usr/include/fwctl/cxl.h:37:31: error:
 field has incomplete type 'struct cxl_mbox_set_feat_in'
Message-ID: <202502141514.r9TX1jkS-lkp@intel.com>
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
commit: c9935e6f00834729baa8db86cf6c0b94549fda01 [22/25] cxl: Add support to handle user feature commands for set feature
config: x86_64-buildonly-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141514.r9TX1jkS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141514.r9TX1jkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141514.r9TX1jkS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   ./usr/include/fwctl/cxl.h:35:36: error: field has incomplete type 'struct cxl_mbox_get_sup_feats_in'
      35 |                 struct cxl_mbox_get_sup_feats_in get_sup_feats_in;
         |                                                  ^
   ./usr/include/fwctl/cxl.h:13:8: note: forward declaration of 'struct cxl_mbox_get_sup_feats_in'
      13 | struct cxl_mbox_get_sup_feats_in;
         |        ^
   ./usr/include/fwctl/cxl.h:36:31: error: field has incomplete type 'struct cxl_mbox_get_feat_in'
      36 |                 struct cxl_mbox_get_feat_in get_feat_in;
         |                                             ^
   ./usr/include/fwctl/cxl.h:15:8: note: forward declaration of 'struct cxl_mbox_get_feat_in'
      15 | struct cxl_mbox_get_feat_in;
         |        ^
>> ./usr/include/fwctl/cxl.h:37:31: error: field has incomplete type 'struct cxl_mbox_set_feat_in'
      37 |                 struct cxl_mbox_set_feat_in set_feat_in;
         |                                             ^
   ./usr/include/fwctl/cxl.h:16:8: note: forward declaration of 'struct cxl_mbox_set_feat_in'
      16 | struct cxl_mbox_set_feat_in;
         |        ^
   ./usr/include/fwctl/cxl.h:54:37: error: field has incomplete type 'struct cxl_mbox_get_sup_feats_out'
      54 |                 struct cxl_mbox_get_sup_feats_out get_feats_out;
         |                                                   ^
   ./usr/include/fwctl/cxl.h:14:8: note: forward declaration of 'struct cxl_mbox_get_sup_feats_out'
      14 | struct cxl_mbox_get_sup_feats_out;
         |        ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
