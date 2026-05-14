Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD433A4F4B;
	Thu, 14 May 2026 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729677; cv=none; b=eKOyCvaGetKxLpooo1UYE37MJt6vNNVKI+eGs7yC6dpbnJr6C2KqhNXFKiNVvfq2omUsg9su96RlzZi5jr/jSkkJ/2cc0DKsALlpX9kYlt6z/hgdQ9D+KeDlp5ympYqazeDvdk7RvHBZ07Z9du9Pz3/ZI6VSHIpR+NNYLueRLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729677; c=relaxed/simple;
	bh=3mxmo4gdeOSblWnNntG1/+LV+UhMCa+2jlTlT/fV9I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACJW/VmFARhOvKFaYxLVcbU08Y1gYuSnS+9NWvxBJESGTQmCLL5T0ubXNpOL8QmZBqmjW5xGrR+r2+/C0z6KHfsRZ/E9sf4CmPBKlqm1KrnhR5pxpglzI5bImA1Dsxq3sSZEXIpkl0BLt8EswOrhN6LU8/6uVUh/XHVHj8iRA6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikRnDrPV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikRnDrPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778729676; x=1810265676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3mxmo4gdeOSblWnNntG1/+LV+UhMCa+2jlTlT/fV9I0=;
  b=ikRnDrPVwbC4zVZfFJ6t3TElBZWB9l1p44Ms1/sXi7RdT8H+ssJcEzUq
   6z15pzWWA2YRcdwxXkui/EQYIlHZ6UbBWZlWtRIDwZ1QsPGnw1T+Q9o14
   cDQicq4oruiFyVwoQv2sgtQzPdHdEwLFUvsHslCVGOHNXUKbFb8TOnSEI
   W9fZPtVsBClNEkhlTKdYSCaSJYz0s4YFr7lvYjEqcGLkluN4KnR04doNv
   jLbVt129uE0sAfYvi8Zoc3/IbA2zGYIjb/5qufDpq1GLrHtj1RZ/wjvrj
   0RKiwNgTnwhYWSjgD0gRq+f4sVwtePYKjuvbPhrFnxHjqE1AjcaBKa4C3
   A==;
X-CSE-ConnectionGUID: Au4G5Ad1QqGaqgNThdfSmw==
X-CSE-MsgGUID: 4zln+thFRv6z8o7JnJObRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79648528"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79648528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 20:34:33 -0700
X-CSE-ConnectionGUID: 07xLSzhxQJC6BsmkAFWnyQ==
X-CSE-MsgGUID: 51apW2JcRuGuWaW0JwT1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242598641"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2026 20:34:32 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNMqC-000000005kh-1kZW;
	Thu, 14 May 2026 03:34:28 +0000
Date: Thu, 14 May 2026 11:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>,
	gregkh <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v7] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Message-ID: <202605141108.KAKaXH7X-lkp@intel.com>
References: <19e1c077ee4.2272059b46402.3689085453526247548@zohomail.in>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e1c077ee4.2272059b46402.3689085453526247548@zohomail.in>

Hi Ashwin,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashwin-Gundarapu/staging-rtl8723bs-remove-unnecessary-braces-in-rtw_mlme-c/20260514-040753
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/19e1c077ee4.2272059b46402.3689085453526247548%40zohomail.in
patch subject: [PATCH v7] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c
config: i386-buildonly-randconfig-006-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141108.KAKaXH7X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141108.KAKaXH7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141108.KAKaXH7X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_mlme.c:568:1: error: function definition is not allowed here
     568 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:582:1: error: function definition is not allowed here
     582 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:628:1: error: function definition is not allowed here
     628 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:632:1: error: function definition is not allowed here
     632 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:675:1: error: function definition is not allowed here
     675 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:774:1: error: function definition is not allowed here
     774 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:778:1: error: function definition is not allowed here
     778 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:782:1: error: function definition is not allowed here
     782 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:805:1: error: function definition is not allowed here
     805 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:823:1: error: function definition is not allowed here
     823 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:853:1: error: function definition is not allowed here
     853 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:879:1: error: function definition is not allowed here
     879 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:908:1: error: function definition is not allowed here
     908 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:920:1: error: function definition is not allowed here
     920 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:942:1: error: function definition is not allowed here
     942 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1026:1: error: function definition is not allowed here
    1026 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1073:1: error: function definition is not allowed here
    1073 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1139:1: error: function definition is not allowed here
    1139 | {
         | ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1247:1: error: function definition is not allowed here
    1247 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=m] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=m] && HAS_IOMEM [=y]


vim +568 drivers/staging/rtl8723bs/core/rtw_mlme.c

554c0a3abf216c Hans de Goede 2017-03-29  565  
554c0a3abf216c Hans de Goede 2017-03-29  566  void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork);
554c0a3abf216c Hans de Goede 2017-03-29  567  void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
554c0a3abf216c Hans de Goede 2017-03-29 @568  {
554c0a3abf216c Hans de Goede 2017-03-29  569  	update_current_network(adapter, pnetwork);
554c0a3abf216c Hans de Goede 2017-03-29  570  	rtw_update_scanned_network(adapter, pnetwork);
554c0a3abf216c Hans de Goede 2017-03-29  571  }
554c0a3abf216c Hans de Goede 2017-03-29  572  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
