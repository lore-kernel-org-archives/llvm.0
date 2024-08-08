Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5A1474A5;
	Thu,  8 Aug 2024 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723142702; cv=none; b=cgj6VAUqpMEOtSB9o0zVQ2G1Hc1nBjz6JqElQ7njzQRfA9Ne79aqWdq5nxxkzyEQ9bbGMvPysHbElYG9C+m0D+5e0n6KuQxsn9kGtqDpR0Lc9eTEl1uIL9jc7a2bB4PL6K2ISV8ofMCUiWKISa/dAQa8kyvXnacn0tgnnVm0dck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723142702; c=relaxed/simple;
	bh=r0ZhTNzOP1agXGemyLuigwrRTNe3MWey8x2YH9mXEjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niKiEqXyctBfQrC9dV12fRCXWj2O0Lov2TIIRyVSqb8B1appTA4MiTVsva0mJFwFF4VhOshr2Th/oZigkBzNr5JPx9vJdAYVu8FgiTV1V3Asuh3MOwxxGwukgOxCnMqqXXRi7RC6Vk4emhl4XliJewk5RlTXntXHfwvC1msrUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1rKEWx1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1rKEWx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723142701; x=1754678701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r0ZhTNzOP1agXGemyLuigwrRTNe3MWey8x2YH9mXEjM=;
  b=a1rKEWx18bbG5k0rTiqK8cQve1jYhsl6elwWLddyzn/EmYLywz3d9bnh
   oVy96gCwA3lDLo+vm5tOPl0pSrk91MhWt1X1z5Gl4beBnMBL4a+VrdlX8
   T3t5Iz8H3qgentrti7GgQgAjsihsHqKeciwQT1/k2/hFu5s7aUPI3hJeq
   lDqFr20I4p2s/qimpcaMXZVqc6Oc62Pq7yuzFgLL+hIHAD/AKpvDTxGou
   rp6Yj8sPXoFlPyJZ2dFeFgcJlOmXZ6evJX7BJSsRzbHLRlFfwJoGN6UgD
   j4xa6sTSn6KWM8486zwQPn3Hgv/y9tZUZMD4RBtJwbllUALhbdo1tq35v
   A==;
X-CSE-ConnectionGUID: SFAONJduTzSDwr8aPJZPXA==
X-CSE-MsgGUID: rkDk2+nFSBCJk21BP0jtwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921784"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="31921784"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 11:45:00 -0700
X-CSE-ConnectionGUID: xRlmvjBdQJCjv0ns0WXCpQ==
X-CSE-MsgGUID: RmqM06BDRZW0dySbI9WBww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57870142"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2024 11:44:58 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc87y-0006Q2-0O;
	Thu, 08 Aug 2024 18:44:50 +0000
Date: Fri, 9 Aug 2024 02:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v4-2024-08-07 22/26] drivers/dax/bus.c:380:1: error:
 conflicting types for 'dax_avail_size'
Message-ID: <202408090208.rkZELnym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 1874987c4cb741ce38fdb344fac74222296dd55d [22/26] dax/region: Create resources on sparse DAX regions
config: i386-buildonly-randconfig-001-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090208.rkZELnym-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090208.rkZELnym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090208.rkZELnym-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/bus.c:380:1: error: conflicting types for 'dax_avail_size'
     380 | dax_avail_size(struct resource *dax_resource)
         | ^
   drivers/dax/dax-private.h:37:20: note: previous declaration is here
      37 | unsigned long long dax_avail_size(struct resource *dax_resource);
         |                    ^
   1 error generated.


vim +/dax_avail_size +380 drivers/dax/bus.c

   354	
   355	static ssize_t region_size_show(struct device *dev,
   356			struct device_attribute *attr, char *buf)
   357	{
   358		struct dax_region *dax_region = dev_get_drvdata(dev);
   359	
   360		return sysfs_emit(buf, "%llu\n",
   361				  (unsigned long long)resource_size(&dax_region->res));
   362	}
   363	static struct device_attribute dev_attr_region_size = __ATTR(size, 0444,
   364			region_size_show, NULL);
   365	
   366	static ssize_t region_align_show(struct device *dev,
   367			struct device_attribute *attr, char *buf)
   368	{
   369		struct dax_region *dax_region = dev_get_drvdata(dev);
   370	
   371		return sysfs_emit(buf, "%u\n", dax_region->align);
   372	}
   373	static struct device_attribute dev_attr_region_align =
   374			__ATTR(align, 0400, region_align_show, NULL);
   375	
   376	#define for_each_child_resource(extent, res) \
   377		for (res = (extent)->child; res; res = res->sibling)
   378	
   379	resource_size_t
 > 380	dax_avail_size(struct resource *dax_resource)
   381	{
   382		resource_size_t rc;
   383		struct resource *used_res;
   384	
   385		rc = resource_size(dax_resource);
   386		for_each_child_resource(dax_resource, used_res)
   387			rc -= resource_size(used_res);
   388		return rc;
   389	}
   390	EXPORT_SYMBOL_GPL(dax_avail_size);
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
