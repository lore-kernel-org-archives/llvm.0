Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66A12837D;
	Wed, 27 Mar 2024 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711539747; cv=none; b=r+icKGmGhUFMLGmNW9SdcMcmiFHGo1E6niCcLlz1XywkXcUCBaC+wrv98QI6CTS5sVp7LPIRp5kaxg7O78G3Pf2hwckG5UiYdi+sLDI7dWimG/CqMrnbbH22UDRxMDxa7jtnZ6I15X+Maf88LGn7yfOy+kpGGswLOWg9+yjCGRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711539747; c=relaxed/simple;
	bh=PWzDEl5oi1sC/iz5WVqfL6+HJghndDKJjDp+YkqGS9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ap8UtVHiy30HpYUkzsOjFFyN+j11/Df9APfsAah6bgdQHq3FHqznBaLKnWdxuJFWJCkmXYugSPKOiSzVmGFKsAPlSTZ3uTdxHLVRKcsPlu+bqj+7PXk2+iNxt1aK/LBJ32kU0vfcGlNZPth5mQg6hCWQ6mfVFPduOycCIPZfXYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8f05f/k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8f05f/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711539746; x=1743075746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PWzDEl5oi1sC/iz5WVqfL6+HJghndDKJjDp+YkqGS9o=;
  b=A8f05f/kJ1j38RsThe3qJ9g46iBV/3AfsQcpk5vIf2+0H135x7KVEPkk
   4Vw3pJX9Ms4v7gD0Dq3s33nhELcFEJv3QHTEIt/bVSLlpBECQWZXl3HIR
   zhSE+OvXv2qU37kSPZ3KWtq0pUiNlsjsXtHXPxmccoB+wR7JajI+FUhIN
   PksuY5PNSTQRjkdRIyGpSfhspN6kp46L+mOppNlfZgze7UQpQXj4QWFnC
   4dhlaMsDU5G1i+m/ekhBcpErurFIq/YnW9oGIyasd7J3OtnyLqpxdGWuX
   rKXKut1I5Eee85bkpmhmFAc/Rdwph2Le2bSyqzuk7H2IHSYFMc8ze13IW
   A==;
X-CSE-ConnectionGUID: ua4PLu2nTYmQSB479nwR5g==
X-CSE-MsgGUID: GO+FOFy3QTqObeRBhjcf6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6571291"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6571291"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 04:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="47283635"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2024 04:42:24 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpRfh-00010w-1m;
	Wed, 27 Mar 2024 11:42:21 +0000
Date: Wed, 27 Mar 2024 19:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1915/2169]
 sound/soc/codecs/rk3308_codec.c:956:34: warning: unused variable
 'rk3308_codec_of_match'
Message-ID: <202403271905.BYbGJiPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26074e1be23143b2388cacb36166766c235feb7c
commit: 4ed0915f5bc4bcc81bca783a5b984f3d81e9764e [1915/2169] ASoC: codecs: Add RK3308 internal audio codec driver
config: i386-buildonly-randconfig-005-20240327 (https://download.01.org/0day-ci/archive/20240327/202403271905.BYbGJiPi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271905.BYbGJiPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271905.BYbGJiPi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rk3308_codec.c:956:34: warning: unused variable 'rk3308_codec_of_match' [-Wunused-const-variable]
     956 | static const struct of_device_id rk3308_codec_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/rk3308_codec_of_match +956 sound/soc/codecs/rk3308_codec.c

   955	
 > 956	static const struct of_device_id rk3308_codec_of_match[] = {
   957		{ .compatible = "rockchip,rk3308-codec", },
   958		{},
   959	};
   960	MODULE_DEVICE_TABLE(of, rk3308_codec_of_match);
   961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
