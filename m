Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3F1CAA6;
	Sat,  1 Jun 2024 20:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717275073; cv=none; b=V+gN6ZSCcd3XWLhtQXtarSJQrCJ/efm0eVh6+WZfkjvu5VjsgpmvLWzC26jMgArUDoq3mxGfEEe0qzVC750nBC1DWZMdGW1PI2N2L0zfmzbR1Ocg25IlY1qEs5FZP91P9st+g+lFIaryJPJmFQPzePC/c78XLmPKkkKpOMwo5lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717275073; c=relaxed/simple;
	bh=NK8j9UGLpfCjTYjcM2PbmEMcNxeoo86/1fcojIA7+Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ4No+ooQQvnpU9GgUR6kMd3+rXYJmmyaihm/z3qj4xvDX47PR6wvf48tWWd5jfJnHTXKqGdntfPaaNspJw9HZbdzPuNUd2Llgkcmq9E4T/oZFuEJJoen9c9k6hiUDvVT003MJ88wRcGNv/Fnx3onJArfT7ySvLbz3jRABCwvVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK8Rz+zl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK8Rz+zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717275071; x=1748811071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NK8j9UGLpfCjTYjcM2PbmEMcNxeoo86/1fcojIA7+Uc=;
  b=kK8Rz+zlYUZXYmzUQntwGs+G+Y9OCla1ag6DpcVPqXjQXDnhnuWTTya3
   HlVwMxmnhOvO6yWnP47y4MYLoj9Mbh0VHLVHcKU5giK69tI5rjHg8mHiE
   RkDOGAGRshNPalrX7mx9xpUo0qWQimrRoJjk0lzmxpxIIyOLynX+OYaTC
   d5F46JuVPdmgD8p0AFMZdPpkwUKNO4DciXLbMB9i1YOzrHpNcmN4iSNqW
   wvc6+Rwg1mdBkTtqcV/o3RPGtGEAdphEENns507KUoUPKEDKWdGObBMZv
   /ENZoTAyP4QtElXC11vkGdxAnba5ImNy+4ZDVwrdMR303/nFmgP2YfndV
   Q==;
X-CSE-ConnectionGUID: Hn+tW0IzQkeVh9yuaEVLvA==
X-CSE-MsgGUID: CS2PmcW3TiWU0IVC2sq1mQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="13652018"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="13652018"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 13:51:10 -0700
X-CSE-ConnectionGUID: beW2idpTT3KBZYatnIHp6Q==
X-CSE-MsgGUID: YOsL1a+8RO6AoszTCTqrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="67672133"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2024 13:51:09 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDVfn-000JKh-0F;
	Sat, 01 Jun 2024 20:50:23 +0000
Date: Sun, 2 Jun 2024 04:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Radu Sabau <radu.sabau@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 1/2] hwmon: Add PEC attribute support to hardware
 monitoring core
Message-ID: <202406020416.G7zcrbxZ-lkp@intel.com>
References: <20240531084645.12935-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531084645.12935-1-radu.sabau@analog.com>

Hi Radu,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radu-Sabau/drivers-hwmon-max31827-Add-PEC-support/20240531-165035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240531084645.12935-1-radu.sabau%40analog.com
patch subject: [PATCH v6 1/2] hwmon: Add PEC attribute support to hardware monitoring core
config: arm-imxrt_defconfig (https://download.01.org/0day-ci/archive/20240602/202406020416.G7zcrbxZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020416.G7zcrbxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020416.G7zcrbxZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/hwmon.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/hwmon.c:400:7: error: call to undeclared function 'i2c_check_functionality'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     400 |             !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
         |              ^
   1 warning and 1 error generated.


vim +/i2c_check_functionality +400 drivers/hwmon/hwmon.c

   393	
   394	static int hwmon_pec_register(struct device *hdev)
   395	{
   396		struct i2c_client *client = i2c_verify_client(hdev->parent);
   397		int err;
   398	
   399		if (!client ||
 > 400		    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
   401			return 0;
   402	
   403		err = device_create_file(&client->dev, &dev_attr_pec);
   404		if (err)
   405			return err;
   406	
   407		return devm_add_action_or_reset(hdev, hwmon_remove_pec, &client->dev);
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
