Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03B335975;
	Mon, 16 Feb 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771204275; cv=none; b=RTBVy/gwnwNxOMV3IswmJuCnaX7YiSAGu38Hq2IeZzOGoFo9b35jP3uBstvRrA5V/k5kYEx80/aR81AhfKtNWsNTU18R2eczpd/5Oinv0bLJFUu4Sjo8kdsOjTuj47ArOb0HitSlOSXGRcqp++GVORuw5it8p9uyt0v6z7TIpz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771204275; c=relaxed/simple;
	bh=iJRDg8owRtYQEg+KwVjkquG0ZNVsW/iLS80x6Lwrc2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj9WNI9xwP/YAknUFSb9TEcogQHcRQ3qc//vSe5yjyyGJ7DawpVdd8vc3/Onr8IpEVa19TcxpLMlzgreFFf672iR9a2SShW3yvp4OwbUCQWvtSnxX0N9GXc4hZAG8Y/Gw6rABsCSh7jcQ9brcgFICEOCQ0qm9roy5qOQr6Qcemg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBPBzmzO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBPBzmzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771204274; x=1802740274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iJRDg8owRtYQEg+KwVjkquG0ZNVsW/iLS80x6Lwrc2s=;
  b=fBPBzmzOzU+YEeUA0rUnxFtKJVZEE8fHhDwnNIyw7pzaLVpfw1Yo3Y1a
   zgF+fQNh6ZHDIeDuh4o9Ums2yOFG9LLQiY6Uxx0RRDpNlxhBLcJy4Gtd/
   mKy2XcjzCIPrGZ/B0aYOcJLbAJd0RkE7OTvyCW2FN/OrCPYqZClBEGj9+
   PmSnoFUqjuV2szdpwoVPlu+utp/I4e3lEHFvzOwAEpJZ5JJ5pflXSSIBI
   bSD4j3Lvuwm8MLchayKn8QRP/kJH5x0IqhZaZkongUJBUQ5Egz6L36ag2
   InmwsmOnhVRS5fk152+2hmQC+AmbPsj3CAVqi4JkD7LxEhmaqkLBkq2PM
   g==;
X-CSE-ConnectionGUID: F3v36enjQLOy/SyabnpAhA==
X-CSE-MsgGUID: 8l7jZyh5SAKjK8uULQvhGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72003454"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72003454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:11:14 -0800
X-CSE-ConnectionGUID: o6Q0O0ZPRGq7x9OyvsfFyg==
X-CSE-MsgGUID: Jek49/bASpi9GqYTDDwEaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212575233"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Feb 2026 17:11:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrn8o-00000000zHw-0VbD;
	Mon, 16 Feb 2026 01:11:10 +0000
Date: Mon, 16 Feb 2026 09:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v4 2/4] decoder: Add V4L2 stateless H.264 decoder
 driver
Message-ID: <202602160930.VXZCKJbv-lkp@intel.com>
References: <20260213-b4-s4-vdec-upstream-v4-2-c7112d00d662@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-b4-s4-vdec-upstream-v4-2-c7112d00d662@amlogic.com>

Hi Zhentao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 9845cf73f7db6094c0d8419d6adb848028f4a921]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhentao-Guo-via-B4-Relay/media-dt-bindings-Add-Amlogic-V4L2-video-decoder/20260213-131503
base:   9845cf73f7db6094c0d8419d6adb848028f4a921
patch link:    https://lore.kernel.org/r/20260213-b4-s4-vdec-upstream-v4-2-c7112d00d662%40amlogic.com
patch subject: [PATCH RFC v4 2/4] decoder: Add V4L2 stateless H.264 decoder driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260216/202602160930.VXZCKJbv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160930.VXZCKJbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160930.VXZCKJbv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: load_firmware
   >>> defined at aml_vdec_hw.c:131 (drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:131)
   >>>            drivers/media/platform/amlogic/vdec/aml_vdec_hw.o:(load_firmware) in archive vmlinux.a
   >>> defined at firmware.c:1622 (drivers/infiniband/hw/hfi1/firmware.c:1622)
   >>>            drivers/infiniband/hw/hfi1/firmware.o:(.text+0x2e40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_load_firmware
   >>> defined at aml_vdec_hw.c:0 (drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:0)
   >>>            drivers/media/platform/amlogic/vdec/aml_vdec_hw.o:(__cfi_load_firmware) in archive vmlinux.a
   >>> defined at firmware.c:1597 (drivers/infiniband/hw/hfi1/firmware.c:1597)
   >>>            drivers/infiniband/hw/hfi1/firmware.o:(.text+0x2e00) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
