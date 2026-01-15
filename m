Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3D30AD0C;
	Thu, 15 Jan 2026 21:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768510999; cv=none; b=un7pPxAy/jFZufxi3QPqEU/TWf807w29f0R9BRYEg/G8QZ8U2n/5p2LYjCUxj3SvWALXyn6mDlORoGnxWtCSUrcY6cxJSaNxrsqug2la195DjOzr+m4Pz0r4u14WYeCyyRFoyWG4Ry9tzjeatvGqiLkHeXAIVwWISGIJHppbVfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768510999; c=relaxed/simple;
	bh=urb+EOFiCz5HexwbmH0CRi3fADfmhtCrzamd2i7EuOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSJALBL6H5Q92RsmwGegwZa5l3se5i8YqMJpUElI+a2JCN6tQ1ZTH5byDl64wQ7eH3QTX2P1X+yCX5A5f6g3EvvdjfLx7K5gQFulBIIcDuJSM+2FTQMOgQUHJKadURAEhOQUCrBRgdXEIhMRENGap/yZiTd2UurWkBMIucwAx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8FyGfph; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8FyGfph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768510999; x=1800046999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=urb+EOFiCz5HexwbmH0CRi3fADfmhtCrzamd2i7EuOQ=;
  b=P8FyGfphR7jVhFTX66Op2khAQwGtwIqQjhzs8Mxg8Grge+CrRlX1eseI
   dbhrubC5k9ShLCLj+HkSfNX+ShmgLZw25btLzDRqo7bbCtitgVWQBKvU+
   7ianjPqm3xH6W0C1s7+RujmIQ00lBo7d2lBiNuSJ11NL3l7GEXGz7OtRn
   UZ/NUjINcagQoHkWZGgRvyDuNxF0FPlw1Um5S3elXl6Yxo0NHQ+vtrfgA
   UchUKgsikQzgL5drGqNJXGDcMeIgaRH1Bynb7eIv8V8RAygRgXDY3n0vk
   EMdrpofd4EQlowL+OpSafpbnRVTNtxK89mVU/uUnv95lXyIDglr7oBTgH
   A==;
X-CSE-ConnectionGUID: pZkpZPkZQh6H+zBWlcOTOQ==
X-CSE-MsgGUID: culzPvvvSu+frm0on1RaRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69725158"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69725158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 13:03:18 -0800
X-CSE-ConnectionGUID: pN/GGFWUSFuSxZBvDkRZ6g==
X-CSE-MsgGUID: g0lLf2KTSHqL2lbZPwKWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="205113351"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jan 2026 13:03:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgUUr-00000000Jzo-0eid;
	Thu, 15 Jan 2026 21:03:13 +0000
Date: Fri, 16 Jan 2026 05:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: raoxu <raoxu@uniontech.com>, mathias.nyman@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
	raoxu@uniontech.com, zhanjun@uniontech.com, kenny@panix.com
Subject: Re: [PATCH v7] usb:xhci:route device to secondary interrupters
Message-ID: <202601160403.qyf0XUkV-lkp@intel.com>
References: <097C424DFD34E837+20260115082608.743707-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <097C424DFD34E837+20260115082608.743707-1-raoxu@uniontech.com>

Hi raoxu,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raoxu/usb-xhci-route-device-to-secondary-interrupters/20260115-162956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/097C424DFD34E837%2B20260115082608.743707-1-raoxu%40uniontech.com
patch subject: [PATCH v7] usb:xhci:route device to secondary interrupters
config: loongarch-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160403.qyf0XUkV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160403.qyf0XUkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160403.qyf0XUkV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xhci_msix_set_handler_data" [drivers/usb/host/xhci-hcd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
