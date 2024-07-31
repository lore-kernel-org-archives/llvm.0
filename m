Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B11AED54;
	Wed, 31 Jul 2024 11:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424120; cv=none; b=tsdryrREFG7Lx9mIziydhs6g55GYJG1aGQa/VObTmI+OUqLy7qyWr2/+F3x32Ddzstc5f9qNiy5i2UhAc3j2mDKMgJkczVGslKtivlnyCXNKEkKyFPCjd7noxbaYxcXr1fnpsl5aatBQCxEF437hyW3z7dWMKHPaPJvnZfdFINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424120; c=relaxed/simple;
	bh=eQjwMDoouIP/4AjpJ4tXStd0emno6a87yQ35Lc2dPaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQB8I33SltvnEqvDkRXBUEzxEM6P5NrTshrAnfgORXNw16jrr8GJ1F+mCisG27i1sLBH+JRxxZZdJbejha71B2qCBIGC9ZtUcq4mWw5n77uqxzdtqJxkqiwVNnG/T3Vsk57KUQjNYB/xAphrGZXyn7ks3NB0kM37l4Sd+gOzHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGP+VxvQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGP+VxvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722424119; x=1753960119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQjwMDoouIP/4AjpJ4tXStd0emno6a87yQ35Lc2dPaM=;
  b=WGP+VxvQ4KEkieOFC/qhKLPPrsS+LvgXokLmStD9oHPCdcmYX8fhTXXr
   bfj78Rgmnj6CN85Js1yr/8/CKjcGcvEk7MxP7V6et9xwlLTiyErkVNCkd
   19P1LyK4TsNoTdpE1P05UDNHtHePEg63c0QqBtuI85o/U9YqdYaCkeg2M
   e4cyX10wHZFym7Al87l4KpYRdXPRoXoCATTRRMzd6RGr0gZmMLQW2iPXB
   2OSxujWOseKKylmmIEt6CaKXac0HBWNbJ3uJ3bTY+vgnMw3BgdcYAbT2r
   lNZdHbFp7qyJIQzvh7f9PZAWxgU6wCLJgrigueIReJ7f7xUfFXrlcHtD7
   w==;
X-CSE-ConnectionGUID: tjTkT20aRtaPBgIflvCNnw==
X-CSE-MsgGUID: AXZrgVqHSPmZXvU5U40VOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37766436"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="37766436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 04:08:35 -0700
X-CSE-ConnectionGUID: 8s5y3RJmTi+EVYgF4CSSyw==
X-CSE-MsgGUID: n2sHKpAiRZqeaArgt8NUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54646211"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2024 04:08:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ7C2-000uAU-0h;
	Wed, 31 Jul 2024 11:08:30 +0000
Date: Wed, 31 Jul 2024 19:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org
Subject: [rafael-pm:thermal-core-testing 25/28]
 drivers/thermal/thermal_of.c:321:28: error: use of undeclared identifier
 'map_np'
Message-ID: <202407311944.iOv9zv1c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal-core-testing
head:   41bf1a2a2fc20676ee073bbcb20fdd0bccc62245
commit: 0c361ef704f9e22f6f062b73542c845440c2c043 [25/28] thermal/of: Use the .should_bind() thermal zone callback
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240731/202407311944.iOv9zv1c-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311944.iOv9zv1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311944.iOv9zv1c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/thermal_of.c:321:28: error: use of undeclared identifier 'map_np'
                   tr_np = of_parse_phandle(map_np, "trip", 0);
                                            ^
   1 error generated.


vim +/map_np +321 drivers/thermal/thermal_of.c

   297	
   298	static bool thermal_of_should_bind(struct thermal_zone_device *tz,
   299					   const struct thermal_trip *trip,
   300					   struct thermal_cooling_device *cdev,
   301					   struct cooling_spec *c)
   302	{
   303		struct device_node *tz_np, *cm_np, *child;
   304		bool result = false;
   305	
   306		tz_np = thermal_of_zone_get_by_name(tz);
   307		if (IS_ERR(tz_np)) {
   308			pr_err("Failed to get node tz by name\n");
   309			return false;
   310		}
   311	
   312		cm_np = of_get_child_by_name(tz_np, "cooling-maps");
   313		if (!cm_np)
   314			goto out;
   315	
   316		/* Look up the trip and the cdev in the cooling maps. */
   317		for_each_child_of_node(cm_np, child) {
   318			struct device_node *tr_np;
   319			int count, i;
   320	
 > 321			tr_np = of_parse_phandle(map_np, "trip", 0);
   322			if (tr_np != trip->priv) {
   323				of_node_put(child);
   324				continue;
   325			}
   326	
   327			/* The trip has been found, look up the cdev. */
   328			count = of_count_phandle_with_args(child, "cooling-device", "#cooling-cells");
   329			if (count <= 0)
   330				pr_err("Add a cooling_device property with at least one device\n");
   331	
   332			for (i = 0; i < count; i++) {
   333				result = thermal_of_get_cooling_spec(child, i, cdev, c);
   334				if (result)
   335					break;
   336			}
   337	
   338			of_node_put(child);
   339			break;
   340		}
   341	
   342		of_node_put(cm_np);
   343	out:
   344		of_node_put(tz_np);
   345	
   346		return result;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
