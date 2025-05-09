Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EE6265CAA;
	Fri,  9 May 2025 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746833413; cv=none; b=MWzQxj7vata1j9TazZnhX6jZtvqY4LJweOXV/8U06NErQNXMAw9HkHJY7WXl3bvQgcuAChKGMc1+F+7ld/hRpyWIlhY6r/7M2tJeh9yZfS69DFzodftzfPrqVb138yT6dDaSyazaDyXW6j2s8NzPpRn0wdUnaikoeCgA7eo0mnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746833413; c=relaxed/simple;
	bh=HAAhDRJhhuhYZc2dJoetKYoEMANGid4zmwZMuOvZkd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X05PvNaMdJDrrNnqZo1iq9YQwUZFIqcKYN0R1Qxg2Fi5GqeQ/3yOMj1NSGg/s2d3HTTNJ2vCKkboSnyPP4mNXkE3f4nc0oxE2PHasEaMDxbbLi9ezmTjAZVRFxqK2i7dgfVDjRyEISGsbmdfIteJJOsu61nd+lLophi0p4snxoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCynyLdd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCynyLdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746833411; x=1778369411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HAAhDRJhhuhYZc2dJoetKYoEMANGid4zmwZMuOvZkd4=;
  b=GCynyLddvz/cweDLDEloPZFrM+glG38gW8GL8xlrZ5iYYq90YUyrSVgR
   z5tHBYAsQkNUj9b77WN2YelTIDchJ4E+w6RrK7Og44thQv56a72LNn2ua
   p6vgKA2YjE14qpxaA4kARHwd22xvTwENTFnn9YDHV1+wVwwuEs5Qhx3dw
   +UYOk59BcOtIQebdMzbXrMOgFa4w6w/PLJPzk2lU77UuxTFSreXUa+sCI
   eC6vZnUduIczmNHzulP2oBT4qgLPl3HJVlozcea3FxlOb9kIzZNtxc0hB
   MO+0P16txOufKKSCMuLRH8geUTJoI88d7Ak5TcSC6CFiHFhkIyH2zVorp
   w==;
X-CSE-ConnectionGUID: ICsNHE/QRya4D+9B7xGChQ==
X-CSE-MsgGUID: cFC6IdzIQ2eoqF+NwYKD6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48756023"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48756023"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 16:30:10 -0700
X-CSE-ConnectionGUID: yGY3qarmRP+J0629uPTCJw==
X-CSE-MsgGUID: zip9U9pCTeCFY20WajzSfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141530313"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 16:30:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDXAN-000CZH-0U;
	Fri, 09 May 2025 23:30:07 +0000
Date: Sat, 10 May 2025 07:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/5] platform/x86: firmware_attributes_class: Add
 device initialization methods
Message-ID: <202505100723.ZomnEYhR-lkp@intel.com>
References: <20250509-fw-attrs-api-v1-1-258afed65bfa@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-fw-attrs-api-v1-1-258afed65bfa@gmail.com>

Hi Kurt,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3c415b1df95c06ae4f9bdb166541ab366b862cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Kurt-Borja/platform-x86-firmware_attributes_class-Add-device-initialization-methods/20250509-155504
base:   3c415b1df95c06ae4f9bdb166541ab366b862cc2
patch link:    https://lore.kernel.org/r/20250509-fw-attrs-api-v1-1-258afed65bfa%40gmail.com
patch subject: [PATCH RFC 1/5] platform/x86: firmware_attributes_class: Add device initialization methods
config: x86_64-buildonly-randconfig-006-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100723.ZomnEYhR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100723.ZomnEYhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100723.ZomnEYhR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/firmware_attributes_class.c:88:58: error: call to undeclared function 'MKDEV'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      88 |         dev = device_create(&firmware_attributes_class, parent, MKDEV(0, 0),
         |                                                                 ^
   1 error generated.


vim +/MKDEV +88 drivers/platform/x86/firmware_attributes_class.c

    58	
    59	/**
    60	 * fwat_device_register - Create and register a firmware-attributes class
    61	 *			  device
    62	 * @parent: Parent device
    63	 * @name: Name of the class device
    64	 * @data: Drvdata of the class device
    65	 * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
    66	 *
    67	 * NOTE: @groups are attached to the .attrs_kobj of the new fwat_device which
    68	 * has a custom ktype, which makes use of `struct fwat_attribute` to embed
    69	 * attributes.
    70	 *
    71	 * Return: pointer to the new fwat_device on success, ERR_PTR on failure
    72	 */
    73	struct fwat_device *
    74	fwat_device_register(struct device *parent, const char *name, void *data,
    75			     const struct attribute_group **groups)
    76	{
    77		struct fwat_device *fadev;
    78		struct device *dev;
    79		int ret;
    80	
    81		if (!parent || !name)
    82			return ERR_PTR(-EINVAL);
    83	
    84		fadev = kzalloc(sizeof(*fadev), GFP_KERNEL);
    85		if (!fadev)
    86			return ERR_PTR(-ENOMEM);
    87	
  > 88		dev = device_create(&firmware_attributes_class, parent, MKDEV(0, 0),
    89				    data, "%s", name);
    90		if (IS_ERR(dev)) {
    91			kfree(fadev);
    92			return ERR_CAST(dev);
    93		}
    94	
    95		ret = kobject_init_and_add(&fadev->attrs_kobj, &fwat_attrs_ktype, &dev->kobj,
    96					   "attributes");
    97		if (ret)
    98			goto out_kobj_put;
    99	
   100		if (groups) {
   101			ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
   102			if (ret)
   103				goto out_kobj_unregister;
   104		}
   105	
   106		fadev->dev = dev;
   107		fadev->groups = groups;
   108	
   109		kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
   110	
   111		return fadev;
   112	
   113	out_kobj_unregister:
   114		kobject_del(&fadev->attrs_kobj);
   115	
   116	out_kobj_put:
   117		kobject_put(&fadev->attrs_kobj);
   118		device_unregister(dev);
   119	
   120		return ERR_PTR(ret);
   121	}
   122	EXPORT_SYMBOL_GPL(fwat_device_register);
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
