Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A575F15665D;
	Sat, 28 Sep 2024 04:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727497685; cv=none; b=a5rknsnnpJxO+cEr9Oa3GZ4b8om+YcHhF6+wypn1gZvzd2JUjxeT66PYu4BWwGuwHqmqd6VKUkODxgD36flz+utvm3Gbvx16MiDQqJOPKlxll+NwgI0BNdJa9pEJDWPZkfEAk2LW8GBk6tjg51ML8Hpfgs+4vPSNjAFzbByV/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727497685; c=relaxed/simple;
	bh=3Va6m4aP32feiSS3Bwmiq96mkkCGpqjkUnk4TUYjfyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EY5To0cmb/C/nITBmEIMimAQautsPhRFK3hoFpUr4Cxj3EsjXlujFR5bAxqHsJYeJP+9fHDc1JRz7Fv6ymt9kh5P2XdgYlVAiteStoj3lEHzLMIMEX7n9Vd34ec4pMB9WQ5VioO6EjXiVncy3S2AY1Llgjo4Uj01H5nrOtFZ91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdNgMa3J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdNgMa3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727497684; x=1759033684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Va6m4aP32feiSS3Bwmiq96mkkCGpqjkUnk4TUYjfyE=;
  b=bdNgMa3JRKRIKySHC/O1mPfRHykpoymaWIi7FxjZzwlAqRFmTYB5BArL
   v/x2wOc0eQm2px/mSbtJN8ZO1jzDYgv8AHlC0YZGhulQwROoFrtPUAjPX
   Bvx/oHvmqVh6BhO8GJr1hc5WKkCxI14fQlSgsac9uHziMVYYiam+v/eZh
   YUYB0l0agUyDSVpGnT5dPP9qdXITBl0n2/TP9VDVX32XMbbjloBHwgtYV
   CceVIq+PVsUZtH1fXg2g2KmXGn8ga0HZDLTLneRnwheHjk4Np5EJCyjDQ
   hDjEmCFe4efGUU8MtuVlg7CRpXeANwJN4K2ohYse9J+ZmFippeq32vRyH
   Q==;
X-CSE-ConnectionGUID: ZAvZdvnCSJW5ZIlGkH23/Q==
X-CSE-MsgGUID: yEtfLW29Ql+aF8afHS0DoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="29530981"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="29530981"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 21:28:02 -0700
X-CSE-ConnectionGUID: mHUk22eXRO+YX+RW8moBRw==
X-CSE-MsgGUID: unMTifetTLe6509csDHvpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73050718"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 21:27:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suP3l-000Mut-0o;
	Sat, 28 Sep 2024 04:27:57 +0000
Date: Sat, 28 Sep 2024 12:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	heikki.krogerus@linux.intel.com, tzungbi@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jthies@google.com,
	pmalani@chromium.org, akuchynski@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] platform/chrome: cros_ec_typec: Displayport support
Message-ID: <202409281250.dtPQ2TrT-lkp@intel.com>
References: <20240925092505.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>

Hi Abhishek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chrome-platform/for-next]
[also build test WARNING on chrome-platform/for-firmware-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Pandit-Subedi/usb-typec-Add-driver-for-Thunderbolt-3-Alternate-Mode/20240926-002931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20240925092505.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800%40changeid
patch subject: [PATCH 6/8] platform/chrome: cros_ec_typec: Displayport support
config: i386-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281250.dtPQ2TrT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281250.dtPQ2TrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281250.dtPQ2TrT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/chrome/cros_ec_typec.c:21:
>> drivers/platform/chrome/cros_typec_altmode.h:21:1: warning: no previous prototype for function 'cros_typec_register_displayport' [-Wmissing-prototypes]
      21 | cros_typec_register_displayport(struct cros_typec_port *port,
         | ^
   drivers/platform/chrome/cros_typec_altmode.h:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | struct typec_altmode *
         | ^
         | static 
>> drivers/platform/chrome/cros_typec_altmode.h:28:5: warning: no previous prototype for function 'cros_typec_displayport_status_update' [-Wmissing-prototypes]
      28 | int cros_typec_displayport_status_update(struct typec_altmode *altmode,
         |     ^
   drivers/platform/chrome/cros_typec_altmode.h:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | int cros_typec_displayport_status_update(struct typec_altmode *altmode,
         | ^
         | static 
   2 warnings generated.


vim +/cros_typec_register_displayport +21 drivers/platform/chrome/cros_typec_altmode.h

    10	
    11	#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
    12	struct typec_altmode *
    13	cros_typec_register_displayport(struct cros_typec_port *port,
    14					struct typec_altmode_desc *desc,
    15					bool ap_mode_entry);
    16	
    17	int cros_typec_displayport_status_update(struct typec_altmode *altmode,
    18						 struct typec_displayport_data *data);
    19	#else
    20	struct typec_altmode *
  > 21	cros_typec_register_displayport(struct cros_typec_port *port,
    22					struct typec_altmode_desc *desc,
    23					bool ap_mode_entry)
    24	{
    25		return typec_port_register_altmode(port->port, desc);
    26	}
    27	
  > 28	int cros_typec_displayport_status_update(struct typec_altmode *altmode,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
