Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00714691C;
	Fri,  2 Feb 2024 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706890615; cv=none; b=C8/VvjkKOFalglVsCNUJMxsk0L33gJMqxQoFhpiofmjSkZHHzQhQ/qdqtxLz3cvZSuW6D5N//Lu2Gr2PZHS7miU/A1jAIvC//sIT0tIdbdfEG1szAFKRP3i2w0M17qn+1cuxWeGJEFKbkorCEtDICyoLQgNrYzrbu9ftVpfoYGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706890615; c=relaxed/simple;
	bh=HFFVq6BHEm9VWNBNMcWUFKGq7i+SLbybg0FOj3MGKfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YH2TzByQb/aTI+WT6BtNEh3IlLOE53eBHIpH3eHsh1fiHKd3oX+uAQB6EjOh5KzDvuYsYn+JUYmjxxjYNhowrwa3GLwy3IvYIsdGpIOexl055rIUbXl6LZpszpyFtIrySL7iFA7yuAmMB2gqAIyiSRLPH+Mcfr4XPgd19s4yTDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8dQxhKT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8dQxhKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706890609; x=1738426609;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HFFVq6BHEm9VWNBNMcWUFKGq7i+SLbybg0FOj3MGKfk=;
  b=H8dQxhKT+AmJhl3vQG31JcVMlyM2lcJ+i4hOtjnioDjTGngDmEiqwGMR
   IDtnHE4upbHha9NxzYbD5Pr4i9yyzpn/sjAvSvBrg9wQbEBympJGHiXU/
   WI+Akw9R1+/VyXio/ziyG7oL7wrRV9JB4B0Y3ilnkLGPbtwCyHZS+QKzq
   9Upx/mkfdYxh3FQ0L/tXPkAvRMtYXG3aPXsvFJ4S0A9SqzEmNxR4QYKQB
   GJFltjnihgTZgdqNQaY3W7otD1SMNhTsPNDjMwlvylAWVs5zLmULWpb91
   wTrdDZU/nicolxFNBo3HcGDqZBK5wnwZXu8bXgmp8DtIENzh8OYRWwI+0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11285148"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="11285148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 08:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4726683"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2024 08:16:45 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVwDb-00042K-1F;
	Fri, 02 Feb 2024 16:16:43 +0000
Date: Sat, 3 Feb 2024 00:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux1394-devel@lists.sourceforge.net,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [ieee1394-linux1394:for-next 1/2]
 drivers/firewire/core-device.c:369:13: error: use of undeclared identifier
 'bufsize'
Message-ID: <202402030039.WUvpNQi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git for-next
head:   7e9ce9dfce1695b96ed299217ec07db6b6374127
commit: 67a5a58c04438e13db391249330bb5e43cecf5fb [1/2] firewire: Kill unnecessary buf check in device_attribute.show
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240203/202402030039.WUvpNQi2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030039.WUvpNQi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030039.WUvpNQi2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firewire/core-device.c:369:13: error: use of undeclared identifier 'bufsize'
     369 |                                                bufsize);
         |                                                ^
   1 error generated.


vim +/bufsize +369 drivers/firewire/core-device.c

7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  327  
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  328  #define IMMEDIATE_ATTR(name, key)				\
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  329  	{ __ATTR(name, S_IRUGO, show_immediate, NULL), key }
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  330  
53dca51175cc2f drivers/firewire/fw-device.c   Stefan Richter    2008-12-14  331  static ssize_t show_text_leaf(struct device *dev,
53dca51175cc2f drivers/firewire/fw-device.c   Stefan Richter    2008-12-14  332  			      struct device_attribute *dattr, char *buf)
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  333  {
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  334  	struct config_rom_attribute *attr =
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  335  		container_of(dattr, struct config_rom_attribute, attr);
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  336  	const u32 *directories[] = {NULL, NULL};
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  337  	int i, ret = -ENOENT;
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  338  
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  339  	down_read(&fw_device_rwsem);
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  340  
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  341  	if (is_fw_unit(dev)) {
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  342  		directories[0] = fw_unit(dev)->directory;
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  343  	} else {
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  344  		const u32 *root_directory = fw_device(dev)->config_rom + ROOT_DIR_OFFSET;
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  345  		const u32 *vendor_directory = search_directory(root_directory, CSR_VENDOR);
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  346  
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  347  		if (!vendor_directory) {
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  348  			directories[0] = root_directory;
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  349  		} else {
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  350  			// Legacy layout of configuration ROM described in Annex 1 of
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  351  			// 'Configuration ROM for AV/C Devices 1.0 (December 12, 2000, 1394
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  352  			// Trading Association, TA Document 1999027)'.
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  353  			directories[0] = root_directory;
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  354  			directories[1] = vendor_directory;
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  355  		}
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  356  	}
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  357  
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  358  	for (i = 0; i < ARRAY_SIZE(directories) && !!directories[i]; ++i) {
67a5a58c04438e drivers/firewire/core-device.c Li Zhijian        2024-01-22  359  		int result = fw_csr_string(directories[i], attr->key, buf,
67a5a58c04438e drivers/firewire/core-device.c Li Zhijian        2024-01-22  360  					   PAGE_SIZE - 1);
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  361  		// Detected.
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  362  		if (result >= 0) {
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  363  			ret = result;
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  364  		} else if (i == 0 && attr->key == CSR_VENDOR) {
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  365  			// Sony DVMC-DA1 has configuration ROM such that the descriptor leaf entry
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  366  			// in the root directory follows to the directory entry for vendor ID
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  367  			// instead of the immediate value for vendor ID.
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  368  			result = fw_csr_string(directories[i], CSR_DIRECTORY | attr->key, buf,
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01 @369  					       bufsize);
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  370  			if (result >= 0)
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  371  				ret = result;
2eab8bc0f0c80d drivers/firewire/core-device.c Takashi Sakamoto  2023-12-25  372  		}
47dc55181dcbee drivers/firewire/core-device.c Takashi Sakamoto  2024-02-01  373  	}
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  374  
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  375  	if (ret >= 0) {
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  376  		/* Strip trailing whitespace and add newline. */
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  377  		while (ret > 0 && isspace(buf[ret - 1]))
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  378  			ret--;
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  379  		strcpy(buf + ret, "\n");
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  380  		ret++;
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  381  	}
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  382  
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  383  	up_read(&fw_device_rwsem);
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  384  
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  385  	return ret;
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  386  }
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  387  

:::::: The code at line 369 was first introduced by commit
:::::: 47dc55181dcbee69fc84c902e7fb060213b9b8a5 firewire: core: search descriptor leaf just after vendor directory entry in root directory

:::::: TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
:::::: CC: Takashi Sakamoto <o-takashi@sakamocchi.jp>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
