Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C278F44;
	Tue, 13 May 2025 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116562; cv=none; b=QKcjPzMkgqxOd99nMjW2wzFjhKwSa/3ruVfn8JuVqkqav2dco9bfVB05QmegqLM1avi63OFQN+YnRuQWJCp4x9nB5rvLSkiTcUqE8NG8aeevlG4HYJqAiDgZ5W59BO9ALYujXeAfy3gFuqmO3LUYCef+FHDUh/dr90W7sSJmF8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116562; c=relaxed/simple;
	bh=7Shj3TynYH3Ax3WVtWO7/ahsDboc5cBLI7lZsL/U5x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx68CkuswvvqYbDiPP668qdTPRMD30YrKtpS/iUV+tuSOSUnX2CFZEAlKLYtbshVjtnhK/u6bxOfvCW2/2ywIwSzdXOU9RnNpEkqlMWGkmCPPZHV6jABcFT+vhmtZX4inqa9aWpwbofzAJB3nS3589a2Ym3GnzUAc5s6P1xVAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ki87WZZ9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ki87WZZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747116560; x=1778652560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Shj3TynYH3Ax3WVtWO7/ahsDboc5cBLI7lZsL/U5x4=;
  b=ki87WZZ9EEmOaG30NVWlrxGShyXT2ANMnZkes0AQbwb7IYqb2MYdwuTy
   S0RBqtWxZHuf1WtMAN/wbFRebvdVa+k/dGwEa/d3EAOmklya1D9x1xDYt
   m90qz2UjY+Fu8uf3+VEjhZzDIs6vfF04ui18+qifRybZk6IDoifeDZiZ4
   gX7OqDy7dJeO8auS11ELt/ijt3zQtsgR26gEW1Yuda9bgVyRojFiqbmIg
   5kzIqNMfwplUhfQzOPlWAMoWPneimXZOeZjKycwrjrEBwQjG6DVNZ6SqA
   WoRzTNtYuzw8hVNebarQIrAcxlMtX5UFP30krbeG1eoLttJveXGaSWSkl
   g==;
X-CSE-ConnectionGUID: cyUzmLoqQ/a/SZKv5Y4Brg==
X-CSE-MsgGUID: D1/OZ/XXSYCC9+yG7VUUFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59946148"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="59946148"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 23:09:18 -0700
X-CSE-ConnectionGUID: F/RkKAVdR+uEqg+kpHIj9w==
X-CSE-MsgGUID: aBk6m8uIRu+yed48tgUznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="160866799"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2025 23:09:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEipE-000FlJ-1L;
	Tue, 13 May 2025 06:09:12 +0000
Date: Tue, 13 May 2025 14:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: Re: [PATCH v9 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
Message-ID: <202505131340.eLNt4D5G-lkp@intel.com>
References: <20250508235217.12256-7-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508235217.12256-7-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build errors:

[auto build test ERROR on amd-pstate/linux-next]
[also build test ERROR on amd-pstate/bleeding-edge linus/master v6.15-rc6 next-20250512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-Add-lenovo-wmi-driver-Documentation/20250509-075718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20250508235217.12256-7-derekjohn.clark%40gmail.com
patch subject: [PATCH v9 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
config: i386-randconfig-002-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131340.eLNt4D5G-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131340.eLNt4D5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131340.eLNt4D5G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/lenovo-wmi-other.c:510:8: error: call to undeclared function 'MKDEV'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     510 |                                           MKDEV(0, 0), NULL, "%s-%u",
         |                                           ^
   1 error generated.


vim +/MKDEV +510 drivers/platform/x86/lenovo-wmi-other.c

   493	
   494	/**
   495	 * lwmi_om_fw_attr_add() - Register all firmware_attributes_class members
   496	 * @priv: The Other Mode driver data.
   497	 *
   498	 * Return: Either 0, or an error code.
   499	 */
   500	static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
   501	{
   502		unsigned int i;
   503		int err;
   504	
   505		priv->ida_id = ida_alloc(&lwmi_om_ida, GFP_KERNEL);
   506		if (priv->ida_id < 0)
   507			return priv->ida_id;
   508	
   509		priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
 > 510						  MKDEV(0, 0), NULL, "%s-%u",
   511						  LWMI_OM_FW_ATTR_BASE_PATH,
   512						  priv->ida_id);
   513		if (IS_ERR(priv->fw_attr_dev)) {
   514			err = PTR_ERR(priv->fw_attr_dev);
   515			goto err_free_ida;
   516		}
   517	
   518		priv->fw_attr_kset = kset_create_and_add("attributes", NULL,
   519							 &priv->fw_attr_dev->kobj);
   520		if (!priv->fw_attr_kset) {
   521			err = -ENOMEM;
   522			goto err_destroy_classdev;
   523		}
   524	
   525		for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
   526			err = sysfs_create_group(&priv->fw_attr_kset->kobj,
   527						 cd01_attr_groups[i].attr_group);
   528			if (err)
   529				goto err_remove_groups;
   530	
   531			cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
   532		}
   533		return 0;
   534	
   535	err_remove_groups:
   536		while (i--)
   537			sysfs_remove_group(&priv->fw_attr_kset->kobj,
   538					   cd01_attr_groups[i].attr_group);
   539	
   540		kset_unregister(priv->fw_attr_kset);
   541	
   542	err_destroy_classdev:
   543		device_unregister(priv->fw_attr_dev);
   544	
   545	err_free_ida:
   546		ida_free(&lwmi_om_ida, priv->ida_id);
   547		return err;
   548	}
   549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
