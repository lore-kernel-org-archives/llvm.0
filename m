Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD1F56773;
	Sun,  7 Jul 2024 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720390971; cv=none; b=mL8D0kMDruiqhIi939cgfPOJzTvUP/Q4O1abvUnGCuJgP9pKKXFXVzOmWFYX4IULVEb1Eyu5RfX5g1xU8sWCcYiy6b43SMLcvakE5g4G15Ta/dSr+nXplE6NMQAN4oa7Wj0iXSQcTaeBOLBP+lQRs1S2vhMcUYFyNIgWC1v0Haw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720390971; c=relaxed/simple;
	bh=98u504Gu/hQJ3jYkKc4S3uNEBdxO1PKUAZ7U+QLe6Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOw8N7FCidSFza0aoiF9TgxCs8So+mI5U2XTjm4ZD6+kC4zex9nrRLFqtk1XxiY9qW2IEvKcXmDRxi7YshIy/Tds9mjTLpEJkHrD/jcAn13w02vr2t/D5jp0EdzFZt1qLY/tFmmsp6WAvCe4VD3eidClyCiq/OjPRzC6BvcHQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndgY8NA3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndgY8NA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720390969; x=1751926969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98u504Gu/hQJ3jYkKc4S3uNEBdxO1PKUAZ7U+QLe6Fo=;
  b=ndgY8NA3uhHP5ZbButJwi1h5FDRrEpg34AQtTsZmNCFDA2JsxA2/EdON
   jQiyeCoMzRJKGv8mWHdvJukDG//PKU9FjJynHJIhqoU2I2186QbOyxypf
   BxGhKW/APdqcpbfj0LRDG4BorMOKTMOG5SvlSWYiYr+c+7I3SwXdeB7vj
   wMObN/oVHCbNOzOvUN4X3KC2gyBonj4fxnFUQITfFfhjVKPyZ+ZPo5RvH
   CmkT8N3DKmYYsTZT3y6ZJreMOwkUSzvUEwpqh0Cm6TIsRSI7b+2qviDyo
   TC9nA05vIz8kLpNrUYbMN0Uvj4+M1KK1yMOfNEKxs99LW2LSxb23cpWU3
   w==;
X-CSE-ConnectionGUID: PFIY6b5yTXCK0x/wrOVuDw==
X-CSE-MsgGUID: qoXAxenRR9qn6+r29uO92w==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17399102"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17399102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 15:22:47 -0700
X-CSE-ConnectionGUID: vKzqC/cNRHyXyqrEBx0YmQ==
X-CSE-MsgGUID: 6eV1rcM4R3y5Yz2/WGI6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47096845"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jul 2024 15:22:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQaHL-000VJe-2V;
	Sun, 07 Jul 2024 22:22:43 +0000
Date: Mon, 8 Jul 2024 06:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
	hdegoede@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	carlosmiguelferreira.2003@gmail.com
Subject: Re: [PATCH v3 1/1] HP: wmi: added support for 4 zone keyboard rgb
Message-ID: <202407080657.XLHI1WRv-lkp@intel.com>
References: <20240707175613.27529-2-carlosmiguelferreira.2003@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707175613.27529-2-carlosmiguelferreira.2003@gmail.com>

Hi Carlos,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Ferreira/HP-wmi-added-support-for-4-zone-keyboard-rgb/20240708-015808
base:   linus/master
patch link:    https://lore.kernel.org/r/20240707175613.27529-2-carlosmiguelferreira.2003%40gmail.com
patch subject: [PATCH v3 1/1] HP: wmi: added support for 4 zone keyboard rgb
config: i386-randconfig-001-20240708 (https://download.01.org/0day-ci/archive/20240708/202407080657.XLHI1WRv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080657.XLHI1WRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080657.XLHI1WRv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/hp/hp-wmi.c:1590:28: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1590 |         buff[25 + zone * 3]     = FIELD_GET(FOURZONE_COLOR_R, color);
         |                                   ^
>> drivers/platform/x86/hp/hp-wmi.c:1609:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1609 |                 colors[i] = FIELD_PREP(FOURZONE_COLOR_R, buff[25 + i * 3])
         |                             ^
   2 errors generated.


vim +/FIELD_GET +1590 drivers/platform/x86/hp/hp-wmi.c

  1579	
  1580	static int fourzone_set_colors(u32 color, size_t zone)
  1581	{
  1582		u8 buff[128];
  1583		int ret;
  1584	
  1585		ret = hp_wmi_perform_query(HPWMI_FOURZONE_COLOR_GET, HPWMI_FOURZONE,
  1586			&buff, sizeof(buff), sizeof(buff));
  1587		if (ret != 0)
  1588			return -EINVAL;
  1589	
> 1590		buff[25 + zone * 3]     = FIELD_GET(FOURZONE_COLOR_R, color);
  1591		buff[25 + zone * 3 + 1] = FIELD_GET(FOURZONE_COLOR_G, color);
  1592		buff[25 + zone * 3 + 2] = FIELD_GET(FOURZONE_COLOR_B, color);
  1593	
  1594		return hp_wmi_perform_query(HPWMI_FOURZONE_COLOR_SET, HPWMI_FOURZONE,
  1595			&buff, sizeof(buff), sizeof(buff));
  1596	}
  1597	
  1598	static int fourzone_get_colors(u32 *colors)
  1599	{
  1600		u8 buff[128];
  1601		int ret;
  1602	
  1603		ret = hp_wmi_perform_query(HPWMI_FOURZONE_COLOR_GET, HPWMI_FOURZONE,
  1604			&buff, sizeof(buff), sizeof(buff));
  1605		if (ret != 0)
  1606			return -EINVAL;
  1607	
  1608		for (int i = 0; i < 4; i++) {
> 1609			colors[i] = FIELD_PREP(FOURZONE_COLOR_R, buff[25 + i * 3])
  1610				  | FIELD_PREP(FOURZONE_COLOR_G, buff[25 + i * 3 + 1])
  1611				  | FIELD_PREP(FOURZONE_COLOR_B, buff[25 + i * 3 + 2]);
  1612		}
  1613	
  1614		return 0;
  1615	}
  1616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
