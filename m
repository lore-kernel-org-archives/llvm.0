Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269424214;
	Sat, 10 Feb 2024 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707559215; cv=none; b=NWqdugizIq65vZc0F1Nb/sWG9C05XKmw8BIEp5dI8GC1hnwZuyRO23AQ0cvDENze4b20EG7TpX7/P7/ksya8HEus19QrZeTpJMYOmBir3HDZJnXq9pYiJf0tnx5GAKSFOIYGiOMOdxaSfEvKNmpjBvccQVCc2963ugDy1pqQCOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707559215; c=relaxed/simple;
	bh=CoAqM7RoLCnliWmyCSvT2VkZVOhWSAmReh/EQOoi8rE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XY25+548M0VrtO2n/5ulWGg4Bg5SxNDUIZw6769IgSXigWbMlA13j+oBj1n2xlQzt5fYMJ2vcSnhGCIQVPaU5+5benPkizB20ocDdomhctsHTOn4fFG8pDZ44KZeZQP39MmiwlwTemg/BJAPDtXjVSWDvD7IC2qrof6BxHQEnz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8k8bpey; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8k8bpey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707559214; x=1739095214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CoAqM7RoLCnliWmyCSvT2VkZVOhWSAmReh/EQOoi8rE=;
  b=C8k8bpeyzivwZF6PpxB9fXmap+jr0RN3F3/JomBoreOyD+ltp+olU0D6
   4UVisqHcOg0EA/pqM3CyU4vvru5OUbsfXpkLsWmMXf20/sW55VCz6IDtR
   gac5XVchIUbpBgUyG3NmhWsOHjSDZ9B00d+nk6GjPXewZpKRJmXa1X1c7
   MDjAZLc/KudvWZO1AhDXhdWoEPIuQlBGtzCrlL9MlofJoaAaoMTxEUh1L
   ExBUEU3LoXGQ9KTJZx1EDvsv4qcUygbFHVoUS67dUhU1VcT6M+k1wdZNh
   AQekkQthx+o3NyP8v/jnAcFQKsdHKLhcy4L2wm3FB50gySyRaQm8Pxc4d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1431518"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1431518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 02:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="6798170"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2024 02:00:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYk9Z-0005YI-12;
	Sat, 10 Feb 2024 10:00:09 +0000
Date: Sat, 10 Feb 2024 17:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jmondi:pispbe/media-staging/be-upstream 7/8]
 ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:13: warning: //
 comments are not allowed in this language
Message-ID: <202402101729.UFInmoVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   728775b95062efdecedad4df4013a8db5382d470
commit: fb7be10e2d1176b9cdd3bbf901d7795a27837b6f [7/8] media: raspberrypi: Add support for PiSP BE
config: i386-buildonly-randconfig-006-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101729.UFInmoVQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101729.UFInmoVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101729.UFInmoVQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:13: warning: // comments are not allowed in this language [-Wcomment]
     476 |         __u8 edge; // enum pisp_tile_edge
         |                    ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
