Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441BDF44;
	Sun, 28 Jan 2024 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706423242; cv=none; b=YX5kdc+yWYP8EyGxaSBLok23KMzXcU0TS+rr9vhz8WE/AQGgisBgWv78x0u5g/TQBnLU+O4NV8ktIne0BuT98FoK/8CJMq4Qr6h/jpBugOSpbRmmU240DEAiagZhZeLVJ5dKLIXw+9yJfyiOtqscWZrKVM70F9phsaK2W+HCLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706423242; c=relaxed/simple;
	bh=/4cBnVToVLQ8927Gyogc9jU9/eVrtAK9hYpYQq21uAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8B07ZqzmsT8Haa/rfBn7FjpowRKLi/UbaaVDJViMXOHgRq802U1u5Q0UYq2eMjbb4NgxRj90uvG9Xj9kSt6fpQlo9ZioTHGm4B2NmqEkQaqXnS5Ndwmahk8Qht2704huD85kTbjcpSAAKvcOPZjti38ufr2gOVAKEjl18aG53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuB0P9YU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuB0P9YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706423239; x=1737959239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/4cBnVToVLQ8927Gyogc9jU9/eVrtAK9hYpYQq21uAM=;
  b=JuB0P9YUegCseWTUpUSnTktsOs38dQFMGy+xAsnBg4Lvk4pyxLb7d1PU
   N27fjoVZLHNHR86RtquSpNqlI31PvZ015TlhBiyxsZ9az+h9RJZOQHdCk
   iK5nrYlmC3u+2Ij73jLaQvglJ8Cn16NfTni3F04xG+VYmc3BEy4Vwrg6R
   GFQokAqUdrO0iTxJhG0R4odDjnmUajJYAzbOe8VnhQRkzDlWLuDIQEGq7
   vEu9NzMMIbsLGSLqfRrSOEjR/ihnKlr9IhzXF78CpCvv5Dc+lZgpO9ZtD
   vkBuSE9nhyDIjXKk316JZhwyvWoB/7eG9JygxzYYWQBwUZ1vB9hcOodSc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9398459"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9398459"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 22:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="737071251"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="737071251"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Jan 2024 22:27:16 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTydO-00039y-0t;
	Sun, 28 Jan 2024 06:27:14 +0000
Date: Sun, 28 Jan 2024 14:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 13/17]
 drivers/platform/x86/amd/hsmp.c:405:8: error: call to undeclared function
 'acpi_device_uid'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202401281437.aus91srb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   d04e52b47ab62cf36fddaa0feb1c5508e420e48d
commit: d6200c4e95eecd59fedb7c64a4ad7a201191b0b6 [13/17] platform/x86/amd/hsmp: Add support for ACPI based probing
config: x86_64-buildonly-randconfig-003-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281437.aus91srb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281437.aus91srb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/amd/hsmp.c:405:8: error: call to undeclared function 'acpi_device_uid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     405 |         uid = acpi_device_uid(ACPI_COMPANION(dev));
         |               ^
   drivers/platform/x86/amd/hsmp.c:405:8: note: did you mean 'pci_device_add'?
   include/linux/pci.h:1163:6: note: 'pci_device_add' declared here
    1163 | void pci_device_add(struct pci_dev *dev, struct pci_bus *bus);
         |      ^
>> drivers/platform/x86/amd/hsmp.c:405:6: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
     405 |         uid = acpi_device_uid(ACPI_COMPANION(dev));
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/amd/hsmp.c:417:8: error: call to undeclared function 'acpi_dev_resource_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |                 if (!acpi_dev_resource_memory(res, &r))
         |                      ^
>> drivers/platform/x86/amd/hsmp.c:797:15: error: call to undeclared function 'acpi_match_device_ids'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     797 |         if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
         |                      ^
   drivers/platform/x86/amd/hsmp.c:797:15: note: did you mean 'acpi_match_device'?
   include/linux/acpi.h:933:44: note: 'acpi_match_device' declared here
     933 | static inline const struct acpi_device_id *acpi_match_device(
         |                                            ^
   4 errors generated.


vim +/acpi_device_uid +405 drivers/platform/x86/amd/hsmp.c

   395	
   396	static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
   397	{
   398		char *uid;
   399	
   400		/*
   401		 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
   402		 * read it and strip the "ID" part of it and convert the remaining
   403		 * bytes to integer.
   404		 */
 > 405		uid = acpi_device_uid(ACPI_COMPANION(dev));
   406	
   407		return kstrtou16(uid + 2, 10, sock_ind);
   408	}
   409	
   410	static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
   411	{
   412		struct hsmp_socket *sock = data;
   413		struct resource r;
   414	
   415		switch (res->type) {
   416		case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
 > 417			if (!acpi_dev_resource_memory(res, &r))
   418				return AE_ERROR;
   419			if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
   420				return AE_ERROR;
   421			sock->mbinfo.base_addr = r.start;
   422			sock->mbinfo.size = resource_size(&r);
   423			break;
   424		case ACPI_RESOURCE_TYPE_END_TAG:
   425			break;
   426		default:
   427			return AE_ERROR;
   428		}
   429	
   430		return AE_OK;
   431	}
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
