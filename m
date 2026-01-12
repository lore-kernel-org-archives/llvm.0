Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518AF318EC1;
	Mon, 12 Jan 2026 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245594; cv=none; b=mKEPuGrv337d6zcZsBNfYiPlx+6riSLCRvc+ilE+GM6Clq1o/wWz2E5vOf1AxSjpXhJF4WPjsaw5dnleoBKABHu2eRgcMzav/83RLU9vfbnoZi5a4GOLx/d6+V5oqJo3mwkIKiNmnsRrVx47i3VozOfeVAbqpjfB2ScLrGGIkbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245594; c=relaxed/simple;
	bh=i2o5OSwgZxueKsGzvOapUi10A7iexUAqUjRdR47rGNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un4a0uvGRJira2Z/40+ypg20dhaZM3a63yuVHgSg3GDkt/iyFS8Y0wNCvyiEfHW9FdTdWQmRuHka9GGCMI8swof1zTEhxgD36MvzN92o3Bx5d8+a7iLZ/s0fSX5H4LdigpQ3AqU0NCD2I/Xx2KwbyPuvuzdzkyyeCrO41wf5t5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oi3QVI3h; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oi3QVI3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768245591; x=1799781591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i2o5OSwgZxueKsGzvOapUi10A7iexUAqUjRdR47rGNE=;
  b=Oi3QVI3helfH/yfHKrwfy6h95/Igpk5mLWVdiutkFskg2mf4PI51jY0P
   UC9Cg7y38dcQlaqSEnvezxJwnrwIavQbzBd43Gd5q1o9Hh8pMgqXGcUIT
   I9WEMEXEwvEG+Q2WnLJxkAeW0jwBdTX0wayw26D7K+EnWwzUybq+G4EZQ
   GjdCbci56vJhszFbCQGRTlQfOjQehykRnMsvX64mpGRWN5maLD46zkLhA
   wOGkU/Ou/GYwPhQ+yXRN/CelVi8p+7lPITgtz04FCWaf40pI+1IitrHMT
   sQF9jclM9l8EWmY64R7Zm9WaJWdzvkA/eLlu1JI4UX2XHoBDiou1baUZI
   g==;
X-CSE-ConnectionGUID: WP6fv/7cTWimZBDHbl9JIA==
X-CSE-MsgGUID: 1gkdd9a8ST6tjgAWwClfFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69259347"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69259347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:19:50 -0800
X-CSE-ConnectionGUID: x11Kegm6RCS/lIPaSO/jAQ==
X-CSE-MsgGUID: voSqYQ6ITIexQAlXSQrEwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="235411264"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2026 11:19:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfNS6-00000000Dmg-1YO0;
	Mon, 12 Jan 2026 19:19:46 +0000
Date: Tue, 13 Jan 2026 03:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Nocera <hadess@hadess.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Bluetooth: btusb: Use pm_ptr instead of #ifdef CONFIG_PM
Message-ID: <202601130334.mSDifI9D-lkp@intel.com>
References: <20260112105127.3664608-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112105127.3664608-1-hadess@hadess.net>

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on bluetooth/master linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/Bluetooth-btusb-Use-pm_ptr-instead-of-ifdef-CONFIG_PM/20260112-185450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20260112105127.3664608-1-hadess%40hadess.net
patch subject: [PATCH] Bluetooth: btusb: Use pm_ptr instead of #ifdef CONFIG_PM
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130334.mSDifI9D-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130334.mSDifI9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130334.mSDifI9D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btusb.c:4640:20: error: use of undeclared identifier 'btusb_suspend'
    4640 |         .suspend        = pm_ptr(btusb_suspend),
         |                                  ^
>> drivers/bluetooth/btusb.c:4641:20: error: use of undeclared identifier 'btusb_resume'; did you mean 'btusb_reset'?
    4641 |         .resume         = pm_ptr(btusb_resume),
         |                                  ^~~~~~~~~~~~
         |                                  btusb_reset
   include/linux/pm.h:472:53: note: expanded from macro 'pm_ptr'
     472 | #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
         |                                                     ^
   include/linux/util_macros.h:136:38: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   drivers/bluetooth/btusb.c:979:13: note: 'btusb_reset' declared here
     979 | static void btusb_reset(struct hci_dev *hdev)
         |             ^
   2 errors generated.


vim +/btusb_suspend +4640 drivers/bluetooth/btusb.c

  4635	
  4636	static struct usb_driver btusb_driver = {
  4637		.name		= "btusb",
  4638		.probe		= btusb_probe,
  4639		.disconnect	= btusb_disconnect,
> 4640		.suspend	= pm_ptr(btusb_suspend),
> 4641		.resume		= pm_ptr(btusb_resume),
  4642		.id_table	= btusb_table,
  4643		.supports_autosuspend = 1,
  4644		.disable_hub_initiated_lpm = 1,
  4645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
