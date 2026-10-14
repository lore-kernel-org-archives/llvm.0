Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD041DDF2;
	Wed, 14 Oct 2026 22:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792015321; cv=none; b=DzjjeJlO7Imt20JR2hxd1tskGuTwVoysMokvTWJty6LmJ3Zj29crx0oqsqHTfdoKhVju6x+qOFTRMliP4VVwto83aIt6Ggt30/XfrFTvLyQDMOpWPq7sucTQmGd4HDV+iY5ctHY/9n+gsXaerFmHfDOcwncpOEIWtvX2NZLUEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792015321; c=relaxed/simple;
	bh=Vlxco360C0BJmJ7JYlB1Wtrwq/21kxAL2JsKc/iYk8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPXRpDb8aBxq1BPJnLa9dFc+xi13qY1CfYsto29ptSv7d/ouPSz4kirhZT7gbrxhhzort4S+8L0JQr3v+3LdBw1wDPyfQmMQTQTNfF2Dew+93AoXrWvHoNEyXU+iLcBnGh9x57at3QQhwd62U1VpqswJJWHZ6dmqiQPzkBY/LY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZ3KFolb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZ3KFolb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792015320; x=1823551320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vlxco360C0BJmJ7JYlB1Wtrwq/21kxAL2JsKc/iYk8Y=;
  b=iZ3KFolblwEu6arr2s44RpG7FwpQQE6QkA2losYzhmO2yqDBg3edgI6i
   TqpmkdBlfGEvqU9Dhbv6ejR2d8sTnb6kFQIRYzJLUoHm8uRvex5xt7oGC
   nQI0dZkRdbNQW5Pgdsfc75dn87UpdMapMnWI3yB1nZoh8es5CtWkGX6ZA
   sqryyffRHpEqEu509i7LMB0VnD6+NAvfX6VYpBNf5LEtyhWtMGnLQl6kJ
   IpJbFYqhs6Z6yWw8H5cqkISDm1F/wT3mooUbk1v2sQb+dq30eUpZfW7OE
   nZmqjEBU/8umWW6+ziIh6oYWRRObbBeL7tlPeMP27Ft3jReD1C3eORkba
   A==;
X-CSE-ConnectionGUID: RG+0ARCDQx2CMTgQk7vnLA==
X-CSE-MsgGUID: 0CT96YkwQqaBM4akvdd84Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="672861"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="672861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:01:59 -0700
X-CSE-ConnectionGUID: eGfGD1xSTSCLBJHa6GYw7A==
X-CSE-MsgGUID: r4k/XD24SrmpqgAucRRn3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1612018"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2026 15:01:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH72m-00000000FF9-3cyv;
	Wed, 14 Oct 2026 22:01:52 +0000
Date: Thu, 15 Oct 2026 06:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 01/13] media: imx678: Rework into generic Starvis 2
 sensor driver.
Message-ID: <202610150522.QgryNORG-lkp@intel.com>
References: <20261013-media-starvis2-v2-1-3670722d250a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-media-starvis2-v2-1-3670722d250a@raspberrypi.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on sailus-media-tree/master]
[also build test ERROR on linuxtv-media-pending/master media-tree/master next-20261012]
[cannot apply to robh/for-next linus/master sailus-media-tree/streams v7.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/media-sony-starvis2-Reorder-link-frequencies-to-remove-lookup/20261013-161701
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20261013-media-starvis2-v2-1-3670722d250a%40raspberrypi.com
patch subject: [PATCH v2 01/13] media: imx678: Rework into generic Starvis 2 sensor driver.
config: hexagon-randconfig-1000-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150522.QgryNORG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150522.QgryNORG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150522.QgryNORG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/media/i2c/imx678.o', needed by 'drivers/media/i2c/built-in.a'.
   make[6]: Target 'drivers/media/i2c/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
