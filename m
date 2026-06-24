Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA31145B11;
	Wed, 24 Jun 2026 04:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782274080; cv=none; b=guN51BFU6AY1R7jj+EWCK2AagKICuzdohvKGNbxBpHWnF79AFXPTDj6N9Ku3pNaN5olcFh09GImv8Kz+RDXnhK8h402OtKNiZjWklJ1BeLMVOVo7SopYtHS9Zzl0AMSCVRIhyWOFomv1QOwQiqfiYyEgj25ulSDJH/X852N07y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782274080; c=relaxed/simple;
	bh=3ff+pX8LFq5N2CWd8BXGK0mylOkDN/3RGIobjIZkVsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OXizfQJXhUg+HKX+S75uItMiZ61qg3Gn/ZJRBU/HTfY8fED1P4tAoseXuK/xetWGcMw9lbqTfheYybCc0OlhU12SNz4n+hiNWMWKW0eGnuAxUP2Z3+Dxmf+Wf2GfIxTBxCTlXcVmTcv3Zj0XGaK8WINQZ4Xy+A0UMOPvrqmd7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VK5y8VxC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VK5y8VxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782274078; x=1813810078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ff+pX8LFq5N2CWd8BXGK0mylOkDN/3RGIobjIZkVsg=;
  b=VK5y8VxC49l+qSUa5dP3VZUReKd5T/4jh5SyKAdDo8eM6BZS6SZLjt6g
   0lOEBOyafZikp3LbT0BOjt6mbyDWNfQdoxMXDYvhZ1Gve2dA2LmaWNkut
   dEqPU9/jvKJrPiLMwLyUaanA/wzql6Ny6R+7h1KSUnWQABXIjNrS9Dwry
   QZej68ErDW1PdXQPe/IBL3iEQS7VRtI1WURexzZMku54VQlAH9VEGmmG7
   0Ztl0OaoYUB4QSVtSfa6DWkrb4SShZouGaaw8oF6xxqR3PlElvpL9b0q5
   TbwUIn9+sdptSNXsFZWtiGTW+yImWCghEwn80dW6XdL5+e/9enrK6nO8D
   Q==;
X-CSE-ConnectionGUID: hKG6Y4bYTNCHMV1Dv6PuhQ==
X-CSE-MsgGUID: s42k1EWcSv2KDOuRnExONg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86928799"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86928799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 21:07:57 -0700
X-CSE-ConnectionGUID: cSRKeKxQQM2ZR1xeyRbMDQ==
X-CSE-MsgGUID: s24kCbmdRk+rE3be8vDNrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249814964"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 21:07:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcEu1-0000000036j-2aZ6;
	Wed, 24 Jun 2026 04:07:53 +0000
Date: Wed, 24 Jun 2026 12:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-prep-easy 57/57]
 drivers/pci/hotplug/pci_hotplug_core.c:255:63: warning: variable 'slot' is
 uninitialized when used here
Message-ID: <202606241242.MfC5ItwK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-prep-easy
head:   67a3c6abb9033d2ce2a9ac12d4cfb9530148b38f
commit: 67a3c6abb9033d2ce2a9ac12d4cfb9530148b38f [57/57] hotplug
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606241242.MfC5ItwK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241242.MfC5ItwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241242.MfC5ItwK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/pci_hotplug_core.c:255:63: warning: variable 'slot' is uninitialized when used here [-Wuninitialized]
     255 |         if (attr == &hotplug_slot_attr_power.attr && !has_power_file(slot))
         |                                                                      ^~~~
   drivers/pci/hotplug/pci_hotplug_core.c:253:27: note: initialize the variable 'slot' to silence this warning
     253 |         struct hotplug_slot *slot;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +/slot +255 drivers/pci/hotplug/pci_hotplug_core.c

   250	
   251	static umode_t hotplug_slot_attr_is_visible(struct kobject *kobj, const struct attribute *attr, int idx)
   252	{
   253		struct hotplug_slot *slot;
   254	
 > 255		if (attr == &hotplug_slot_attr_power.attr && !has_power_file(slot))
   256			return 0;
   257	
   258		if (attr == &hotplug_slot_attr_attention.attr && !has_attention_file(slot))
   259			return 0;
   260	
   261		if (attr == &hotplug_slot_attr_latch.attr && !has_latch_file(slot))
   262			return 0;
   263	
   264		if (attr == &hotplug_slot_attr_presence.attr && !has_adapter_file(slot))
   265			return 0;
   266	
   267		if (attr == &hotplug_slot_attr_test.attr && !has_test_file(slot))
   268			return 0;
   269	
   270		return attr->mode;
   271	}
   272	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
