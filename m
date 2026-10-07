Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AE23A6B8D;
	Wed,  7 Oct 2026 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389575; cv=none; b=KgF1yI3Z3Y5/rJkcCi882LwrwrtxfEqU/znHmUXgUmHvBTyKrm6wd3uIhgjCXet4gUFh3QHZCe6uQVN0jhDnGv3xX+C6pxaCZFpcryCSXIAwYZKzEOakpcMKL71RK81ty9KLs2QP3Hqrarc9mymZRMk8SfCjGhtdBGe/c2ALDS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389575; c=relaxed/simple;
	bh=+rPRKC9umesGDdCt2yETq7Z4hnDy6Z3LHceoUeY/+TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIwd27l130LTsr2fiNkbXz+6QLzJ2ABw9mvzqLxLKRzusTZfVOrpgK2FlQJCOXoU91smRHX+aWCjf3Zp889JDJ6UEnTwo6IrCd/lE2bO/IXI+9Wo1ydSlHnpE9aB8oPySrS1jMWIoqDecdoiIQGz4BS6PQheX7c97LMDDpKpTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIw2pCnf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIw2pCnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791389575; x=1822925575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+rPRKC9umesGDdCt2yETq7Z4hnDy6Z3LHceoUeY/+TI=;
  b=UIw2pCnfXv9GTPm/FMjk3dcIi/VGranamldvMiVzFsWbc8Vfz4Xqh/KL
   HqSpggNAgfh7NQhWQ1PP0Cgzb1r9WbTmQEus3g5IAlOMH0mbZtkfPrUn6
   9fPsgvJLabXEF4/H7fq4a4uVnJSG2rUDzaT3mgRNXXbKx1AxE1RtFqBc+
   k+YoudBe1H+E3IZ0pGCHcDkQ+TRkI0oD4S9urhHGOhjCfFrm0v6SG3MBy
   Rp85FRbUnODLOIS9ZW+3wjbfqg8VRKGAbmmDcKMdvEjtOIZGl5q8zIGUC
   Eaa2roszola/7JBE443JfFxdfzOtQ+upyfpsecFfyTTd43UrUqWMm9oq9
   g==;
X-CSE-ConnectionGUID: Sed4DPvcTMS9OHxPdnEGIw==
X-CSE-MsgGUID: Wp73K950QrqWSDIlHXLTbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="161556"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="161556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 09:12:54 -0700
X-CSE-ConnectionGUID: AQIp6U06QQmC36F2L9srOw==
X-CSE-MsgGUID: jpN8VxnlTGWo+FfH4ja4Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285575091"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2026 09:12:52 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEUG9-000000003FA-45Yc;
	Wed, 07 Oct 2026 16:12:49 +0000
Date: Thu, 8 Oct 2026 00:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Isma=EFl?= Bahloul <i.bahloul01@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v6 7/8] ALSA: usb: babyfacepro: add the hardware DSP
 EQ
Message-ID: <202610080058.z8dKl0F8-lkp@intel.com>
References: <20261003194137.86176-8-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261003194137.86176-8-i.bahloul01@gmail.com>

Hi Ismaïl,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v7.3-rc6 next-20261006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Isma-l-Bahloul/ALSA-usb-add-RME-Babyface-Pro-driver-core-probe-PCM-stream/20261003-214130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20261003194137.86176-8-i.bahloul01%40gmail.com
patch subject: [RFC PATCH v6 7/8] ALSA: usb: babyfacepro: add the hardware DSP EQ
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261008/202610080058.z8dKl0F8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080058.z8dKl0F8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080058.z8dKl0F8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: sound/usb/babyfacepro/snd-usb-babyface-pro.ko: symbol '__hexagon_udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
