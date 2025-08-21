Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546252EDD50;
	Thu, 21 Aug 2025 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787818; cv=none; b=RX5YQSRyNbbZ0n4N5dsNLFH7It80YLepEfDuSl8Q2XtHXytqWsxVTLNtq1FGdpsCmVp2EvBmIvxak6iHleprkK6DP53/0X2FdVOIMB5V9LSaKgZDFW1AZpwEi+sR1xEPi0+ZOaKvMkDyvrCsBicbxdVggJGNM49AUxEzKIHCPqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787818; c=relaxed/simple;
	bh=Q0Wu9ihtAo85VjwUco91TyJFgRnst+dve+BQ30Xa8Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpeaUliMYbJjpjPJz/F2sdyrxqPoIKX9cBu5Ps3v4xP/372cEMAOq7c+TPi90Mn0SqkGDCph0tnWsBNEux7BOparTLXx3dFSZmDTawjzKI119OjxdwZH+DfrjOnfBIcpbw+8e2zedPij43XTQvS8/KVDttnlpl7DeRCD+RUWjbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGKkNb8x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGKkNb8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755787817; x=1787323817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q0Wu9ihtAo85VjwUco91TyJFgRnst+dve+BQ30Xa8Ec=;
  b=QGKkNb8xCnf5bEdewRy90WCcW1Y8mmVB2HswujNoFgBNJnkZb9XEj8Xo
   brnefK5mJHUpV24n+/wc0bTCW4iGuPVftH5b6WkcKhhG2GbdPxcec+AcU
   tCKK+qQtJP0jSzJB41RU2qJhLOh/T4yeBJN87cBdhyjA6tWi/LO16td0r
   E1qhNwsEQ9pUbjddvjjG3wPCaIaYNAfaAFTlpGgHcexWqIOxlP5lHm8BT
   RIxzjl5Qzy+5yXRVffB46iYvu+MS02Ox4yjs/iln3hmrn290Jto2Zxyah
   sm9kzmIFCKO5zDCTL0/ng/elleN8VRyP1z/r6LDVe0L/pOkiLgUodCgFH
   g==;
X-CSE-ConnectionGUID: 0Jb+REjyS5GGXmZJ1Ci4cQ==
X-CSE-MsgGUID: lbUP0JqsSSeUq7EWb3G8uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61909917"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61909917"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 07:50:17 -0700
X-CSE-ConnectionGUID: Ev+5DonIQgawwqxkzgzv9w==
X-CSE-MsgGUID: hxPVIaoDQ3inTr3FUgMyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199412051"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2025 07:50:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up6cE-000KNv-0z;
	Thu, 21 Aug 2025 14:50:10 +0000
Date: Thu, 21 Aug 2025 22:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: i2c: add Sony IMX111 CMOS camera sensor
 driver
Message-ID: <202508212225.vjOOcDtc-lkp@intel.com>
References: <20250819120428.83437-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819120428.83437-3-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master krzk-dt/for-next linus/master v6.17-rc2 next-20250821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-media-i2c-document-Sony-IMX111-CMOS-sensor/20250819-200757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250819120428.83437-3-clamor95%40gmail.com
patch subject: [PATCH v1 2/2] media: i2c: add Sony IMX111 CMOS camera sensor driver
config: x86_64-randconfig-074-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212225.vjOOcDtc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212225.vjOOcDtc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212225.vjOOcDtc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx111.c:1596:34: warning: unused variable 'imx111_of_match' [-Wunused-const-variable]
    1596 | static const struct of_device_id imx111_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/imx111_of_match +1596 drivers/media/i2c/imx111.c

  1595	
> 1596	static const struct of_device_id imx111_of_match[] = {
  1597		{ .compatible = "sony,imx111", },
  1598		{ /* sentinel */ }
  1599	};
  1600	MODULE_DEVICE_TABLE(of, imx111_of_match);
  1601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
