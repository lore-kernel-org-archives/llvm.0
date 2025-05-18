Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3519E826;
	Sun, 18 May 2025 02:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747537069; cv=none; b=XkbSogWVxgwGQlVVL9bK6eJiQleJHmd8oTNoCfQKoxTWqNhPPyqckSRIKg2rAfH7r3OLUIazVRoOuQ1PKrxNLdhMiig2YBBUjQJbFzAxMC4YWjDjvOyb1ZFOfbccU6LWKaLm8CbMheYKmxPbDltu3l+ycFL0thXXBoE5d7lWc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747537069; c=relaxed/simple;
	bh=Do49mOhhQo4clnMVvM7WsehCS/u7W2xwS+c1fy3fxdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6GmWfMdumZG+pBAttutzjkCB7/+l7LF/Xnn6OLTIrhEbV1RVwkFpB2gjtFcqwed9Do9xJCbf6tXJ1EtN4WrgrYl8IwGU9KG6toUX+yVzSpwHCD4kiSrt5Gf8Xp2Tgdyiv5Qn5xQ5V7rrMLuv5VDueG2n/2YaF8n1lV86cM1ffo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2iGcC6H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2iGcC6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747537068; x=1779073068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Do49mOhhQo4clnMVvM7WsehCS/u7W2xwS+c1fy3fxdA=;
  b=J2iGcC6Hu/oxHlNpL+Z57tgMCgfrGaq7jQRl37UWevCYNLCVhBxSDlCC
   sICmeoqT8EKDgDfEoW1ETnPObfZ+dKjnAi82WkbIxdY/BWIU7UpQSg0bT
   45JtpIR0Fd7s4HfbGP2guGksQ5ccKcSA36lXbuifj5WJ8PiZU1ivYgYEv
   Ms+2mYOQj9Ulh6pJA92Jpf4X1TrtR2NzOlPoKD7XzBlrTohiTfKs1sgLv
   40VwIqLPEaXdDqNHLt7OXcLSc7QX4/XI/1C9QtRyIycxK1qWgyNwbK7ha
   epheX+YUhfGU1e7lJGnPY3E7hqFaZz3c2gscpPtpmvKFOIMk6W26AdqZd
   g==;
X-CSE-ConnectionGUID: wgWDgi/eSS+XmDeNoHgDHA==
X-CSE-MsgGUID: cUE0d7kCRpS6dYV5NYZbNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="67019974"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="67019974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:57:47 -0700
X-CSE-ConnectionGUID: bMpBkuDGRoGVkSyXAGXexQ==
X-CSE-MsgGUID: slP32JP8QSuBd4hgQ4C9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139444818"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2025 19:57:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGUDg-000KZv-0U;
	Sun, 18 May 2025 02:57:44 +0000
Date: Sun, 18 May 2025 10:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sven/atcphy 30/31] ld.lld: error: undefined symbol:
 drm_connector_oob_hotplug_event
Message-ID: <202505181048.9drFn91S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sven/atcphy
head:   bb58cc6399a58218b8b5204a9fadf26f07c7f0f3
commit: 10afb98e90699baea02c783a19381cb8b81c6af8 [30/31] usb: typec: tipd: Forward DP hotplug events to DRM
config: arm-randconfig-002-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181048.9drFn91S-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181048.9drFn91S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181048.9drFn91S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_connector_oob_hotplug_event
   >>> referenced by core.c
   >>>               drivers/usb/typec/tipd/core.o:(cd321x_update_work) in archive vmlinux.a
   >>> referenced by core.c
   >>>               drivers/usb/typec/tipd/core.o:(cd321x_update_work) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
