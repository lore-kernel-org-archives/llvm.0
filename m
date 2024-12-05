Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B951C3050;
	Thu,  5 Dec 2024 07:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733384985; cv=none; b=gKyXqlpaL9jRVCWAKTnKu9TV/b9ODsVSO41/oor3v3K0VvY5aaGkcEZSE5kx5Ru+wA2oAcc/GDRmjpgFFX9Z+lLPKXmm+eLpdSKaLw05JPShOjMBFC+RcJhDIZ4lpWYDW9xaYIAEOKvQJt+KCx9wSmFoUbSsquOye2lGLPfw+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733384985; c=relaxed/simple;
	bh=v/NGVM2mVB413+xKdRcL6pDchULiswHB/AOoR3s6Vsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l90EFNCQlghrOwY/A9pFvVRyUGxB2PJVBivJLvdwDMubk4q6j5GyCLSsoZgAjc41OgRT0keDoqQzptRNN1R+8hXXA5J1jLFRQQX8utnNrR9HNdHW4bGdqL2XEJyEi3OaoyNR4OzjACSRzrUQtZh607ADBCRPdiwZSowcETp3h8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhAlTDeE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhAlTDeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733384984; x=1764920984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v/NGVM2mVB413+xKdRcL6pDchULiswHB/AOoR3s6Vsg=;
  b=lhAlTDeEwjwdIS2S5TnGpgfxT2YAWo6B47HGwBZOTEnVM6je7x1dce53
   aYzq4kglC7ZNhGfkQk2NyNQXO+4Ev2O8uGFVYVuhc3H747TG8ojLC1J32
   6sak8PCZEW94/x3TPc2UOGZbyzX3Yd219t/0BLblKhSvJFGMTq0fdqUV4
   1uPnnwKLgHZwWydkf7cbCAahrt8PbNTIvhm3PwWZYLLMnIPpZSqKwUimf
   Iz5lVomDyG5J/tcQX6ZS4burGq5oSwlmu9KO8RTIHpyKCLtZcwS3kojnz
   cd07TCo6dEG+QOHLVG9HSRYkJ7lV0Cezxi7yUpFwqHuVpjSNQR95AkSdm
   w==;
X-CSE-ConnectionGUID: TLZpPYZgR+GNPKryZkEMYQ==
X-CSE-MsgGUID: 48QEc+F3TnaS0rPSIWSlNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51215597"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51215597"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:49:43 -0800
X-CSE-ConnectionGUID: w4REs25XTPytRAzCAF/rkg==
X-CSE-MsgGUID: C0nIgHLAS/mMBN9VEKUMJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98466878"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2024 23:49:44 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ6cG-0003x3-1J;
	Thu, 05 Dec 2024 07:49:40 +0000
Date: Thu, 5 Dec 2024 15:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 18/21] platform-x86: Add header file for alienware-wmi
Message-ID: <202412051511.kNVhfP83-lkp@intel.com>
References: <20241205004647.2186826-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205004647.2186826-2-kuurtb@gmail.com>

Hi Kurt,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kurt-Borja/alienware-wmi-Modify-parse_rgb-signature/20241205-085007
base:   linus/master
patch link:    https://lore.kernel.org/r/20241205004647.2186826-2-kuurtb%40gmail.com
patch subject: [RFC PATCH 18/21] platform-x86: Add header file for alienware-wmi
config: i386-buildonly-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051511.kNVhfP83-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051511.kNVhfP83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051511.kNVhfP83-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: alienfx_wmi_init+0x37 (section: .text) -> __platform_create_bundle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wmax_wmi_probe+0x7d (section: .text) -> __platform_create_bundle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: legacy_wmi_probe+0x6c (section: .text) -> __platform_create_bundle (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
