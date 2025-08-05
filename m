Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1706D227BB9;
	Tue,  5 Aug 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754394306; cv=none; b=rkKWwtinEvjolEjEVPgK8o8SCKsaOLPobyXGWtS731Qip9e7eUVuZGRqcj7qkQ1g/6S2M5gsRv8c4/UwalX1G5uEK1dhbcAqOllLzt9nSiVmt87WdxLGF7970zeAWJiPxmnhqT4mRERaTYllk88qZpI0ymvLtnZEz9CoZ4b80Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754394306; c=relaxed/simple;
	bh=xEGJpkdq/HjPFmM7SEWPmmBzMbXrsXcrXQgQ+rTHzQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Luwa2gnXDRxPUMBMLqnOrAZeLpMuf8syxI+LfNnRFY8SQPqLCieNIsWa3zd5mTZ9p0zPaUr/i4ohirJB9o1TvBHBoYpgeWf5MaZsLorZfkj1i4KoQgsWd8IwWTZLQEU+OJO5/31W+QCc7bHkersuiIEpg3Pnv0wVfl4Talrz+Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL31zjyC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL31zjyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754394305; x=1785930305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xEGJpkdq/HjPFmM7SEWPmmBzMbXrsXcrXQgQ+rTHzQU=;
  b=eL31zjyCbhq6/PJmP0Sq7jfzt3jfCBqu5rjja9px2ajQc/p6bC1dEBkV
   QXp2hpfJ+At6uxcr5bXhnvXXwFCtcujFHGEPBW1dMJES7RXW82NMPXIcf
   HazuBjLdnGk/odGYCrvBeGAv9Cbb5VtjisVC8K1l6N0qIbv1+VgKiBpxu
   vsJjFQX+qdA7aRElBckZbL8dVIh4Um/G9vNEJ4o3I58WA/Lmt/zZnXUCR
   zfQxqdlKjJBElD6iVMS1KupD8FEz6P2OmRdnl3OCrTVHzhpdmFp5JMVRf
   fUkE3nlxT9JNH6jEugOK8zA07NcVk9ZgxjlSS6oWc8z7U8peZkDhDhRZp
   Q==;
X-CSE-ConnectionGUID: dyHGti+5RAOZ9kpQjDwWMQ==
X-CSE-MsgGUID: vB8ktWQ1Rk2moLS7FoENDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56399107"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56399107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 04:45:04 -0700
X-CSE-ConnectionGUID: Gqz0v7r5RYizFe+XK7YdPQ==
X-CSE-MsgGUID: sfP8TrB7RKe3e4Ba9mF5YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="168731817"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2025 04:45:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujG6G-0000Zm-18;
	Tue, 05 Aug 2025 11:45:00 +0000
Date: Tue, 5 Aug 2025 19:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?xaBlcmlm?= Rami <ramiserifpersia@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] ALSA: usb-audio: Add support for TASCAM US-144MKII
Message-ID: <202508051921.BCOwJwkZ-lkp@intel.com>
References: <20250803203409.17005-1-ramiserifpersia@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250803203409.17005-1-ramiserifpersia@gmail.com>

Hi Šerif,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.16 next-20250805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/erif-Rami/ALSA-usb-audio-Add-support-for-TASCAM-US-144MKII/20250804-043506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20250803203409.17005-1-ramiserifpersia%40gmail.com
patch subject: [RFC PATCH v3] ALSA: usb-audio: Add support for TASCAM US-144MKII
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250805/202508051921.BCOwJwkZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051921.BCOwJwkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051921.BCOwJwkZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_umoddi3" [sound/usb/usx2y/snd-usb-us144mkii.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
