Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621A3AAF60;
	Thu,  8 Oct 2026 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791478020; cv=none; b=NXQXRotLjrPWaK13etzOQgt+8/gLjJfdF8pa/P8hy9e53GEQ4xy6Y3mcxjujZ4d3RUj2GS3n+1EzHRriET0sBzKn5zcoXKtOqa5BLaspZDPEXqzkgqwpWxA7EaH4j4vVnjXXdb7TD9xbd6hTAin+RuNLRx6QzZl1XvFlHrMj+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791478020; c=relaxed/simple;
	bh=3n0CrrFvPY7xQWhnAEYjghgZP3ue8dP5TePqYp4pD2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzK9C2cgYRyKG2gkDXsB0zUWWkW9Dr3ea503VwQb3Q8+Z6GioCby7vMPO2H1zu/dThN+RqUv9+gR2zgya7ys7j7pVegnRSMeGeCHnR55iGg5DDVMHgEKrwzm/AzF3iINZwH1Z0VBYvlJBbEyyuxJcLAA0jTCF1Q8wdr1BdpuIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7NtLxzv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7NtLxzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791478019; x=1823014019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3n0CrrFvPY7xQWhnAEYjghgZP3ue8dP5TePqYp4pD2M=;
  b=j7NtLxzvb4puWHpkZtXXs1PpoNQUwAXrC6zMyKZFJwtHkirMvT/goWuD
   RbubsKApP4W5AS8+y6loZcERgwU7S0QJEH85gJRZbkV0EFNn60f99ZYlV
   ztDm/d+kQtdGBegRx3HiDB3/obxbjeC4cJFRXIfW6PYsUBMdReNtlUhH1
   cNquFvh0k04s2k1d4WsVWIG5asXUdbf3Dxn22CBk7HXX0ooUEK9CSlFI9
   zHI7KGE7YFotuh1h1gRT/lcZCr+n6rncmHNBdNKEbBWbg2uhUtEwL45uF
   VSBUiZvKQWhlC3f26U7au5Nqx+SW9wTfnbC1+89ZilV6HK33tyt9l/EYo
   A==;
X-CSE-ConnectionGUID: gcP6XXqiT6qkg72oKoC4OQ==
X-CSE-MsgGUID: /j/yJq1tSxOvwU5nM6y86w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="279762"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="279762"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:46:58 -0700
X-CSE-ConnectionGUID: JuhjDObATuqYSeGo+J1eEQ==
X-CSE-MsgGUID: R6VAn1tyQGSLnz0CLAY6dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1912919"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 08 Oct 2026 09:46:54 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xErGc-000000004ey-2nl8;
	Thu, 08 Oct 2026 16:46:50 +0000
Date: Fri, 9 Oct 2026 00:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	"Marty E. Plummer" <hanetzer@startmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Collabora Kernel Team <kernel@collabora.com>,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v13 01/15] drm/panfrost: Move shrinker initialization and
 unplug one level down
Message-ID: <202610090034.XP8OKWaV-lkp@intel.com>
References: <20261008-claude-fixes-v13-1-d6a493185860@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261008-claude-fixes-v13-1-d6a493185860@collabora.com>

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3ab04dcce43cd4fdaed94f08f4e6289be4921ea4]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panfrost-Move-shrinker-initialization-and-unplug-one-level-down/20261008-004244
base:   3ab04dcce43cd4fdaed94f08f4e6289be4921ea4
patch link:    https://lore.kernel.org/r/20261008-claude-fixes-v13-1-d6a493185860%40collabora.com
patch subject: [PATCH v13 01/15] drm/panfrost: Move shrinker initialization and unplug one level down
config: arm64-randconfig-1002-20261008 (https://download.01.org/0day-ci/archive/20261009/202610090034.XP8OKWaV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090034.XP8OKWaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090034.XP8OKWaV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c:98 function parameter 'pfdev' not described in 'panfrost_gem_shrinker_init'
>> Warning: drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c:98 Excess function parameter 'dev' description in 'panfrost_gem_shrinker_init' (did you mean one of: 'pfdev')
>> Warning: drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c:119 function parameter 'pfdev' not described in 'panfrost_gem_shrinker_fini'
>> Warning: drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c:119 expecting prototype for panfrost_gem_shrinker_cleanup(). Prototype was for panfrost_gem_shrinker_fini() instead
>> Warning: drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c:98 function parameter 'pfdev' not described in 'panfrost_gem_shrinker_init'
>> Warning: drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c:98 Excess function parameter 'dev' description in 'panfrost_gem_shrinker_init' (did you mean one of: 'pfdev')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
