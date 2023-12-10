Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2C1CAA8;
	Sun, 10 Dec 2023 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK/+KD7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702244052; x=1733780052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1umBWUOFwoNuNotTmpKm+zCdmQAB9yysbORkPwyEEk=;
  b=KK/+KD7UnOS/SRHCq3B8yWCPE22YrHVe5YZ3vzZSak5fS88rtraedfKy
   COxp6CzUns9416rio5wup8ihkkZ3q61x1kaYQgSfGgUIgb7JG4AN7VJSD
   mOLquH6T/WSp/rQwf9bNMUYd07ikzVVhT87vUX2DyGmNkWhrucHiK8pQ2
   rqlfwuH3bT9zoBwyfEjpElsEfU64Owp+ZdbmgeslWU3M6ekIS1FMIwI77
   D2rP/qJoPUc5gOS3av4YEiO1Lb98V8HwuzgfyA+VoYlyZHd1+5SP4VFye
   pksI741vVR9rYZ817CTcmwx23MWKIA6jovTGRDsOL4GLM2afU4nrO5rCP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379569377"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="379569377"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 13:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722528180"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="722528180"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Dec 2023 13:34:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCRR9-000HHq-0W;
	Sun, 10 Dec 2023 21:34:07 +0000
Date: Mon, 11 Dec 2023 05:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-qtg 9/20] lib/fw_table.c:236:22: error: use of
 undeclared identifier 'cdat_table_parse'; did you mean 'acpi_table_parse'?
Message-ID: <202312110552.D6nSP8Y5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   2d34ef1dba862ef38a027e8135475bb317894702
commit: 8e96a43deade4e1db56f3386c7a3c185f22310f7 [9/20] cxl: Add callback to parse the DSMAS subtables from CDAT
config: arm64-randconfig-002-20231211 (https://download.01.org/0day-ci/archive/20231211/202312110552.D6nSP8Y5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110552.D6nSP8Y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110552.D6nSP8Y5-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/fw_table.c:29:39: error: expected ';' after top level declarator
   static unsigned long __init_or_acpilib
                                         ^
                                         ;
>> lib/fw_table.c:236:22: error: use of undeclared identifier 'cdat_table_parse'; did you mean 'acpi_table_parse'?
   EXPORT_SYMBOL_NS_GPL(cdat_table_parse, CXL);
                        ^~~~~~~~~~~~~~~~
                        acpi_table_parse
   include/linux/export.h:89:55: note: expanded from macro 'EXPORT_SYMBOL_NS_GPL'
   #define EXPORT_SYMBOL_NS_GPL(sym, ns)   __EXPORT_SYMBOL(sym, "GPL", __stringify(ns))
                                                           ^
   include/linux/export.h:75:16: note: expanded from macro '__EXPORT_SYMBOL'
           __ADDRESSABLE(sym)                                      \
                         ^
   include/linux/compiler.h:214:17: note: expanded from macro '__ADDRESSABLE'
           ___ADDRESSABLE(sym, __section(".discard.addressable"))
                          ^
   include/linux/compiler.h:212:55: note: expanded from macro '___ADDRESSABLE'
                   __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                                                                       ^
   include/linux/acpi.h:908:19: note: 'acpi_table_parse' declared here
   static inline int acpi_table_parse(char *id,
                     ^
   2 errors generated.


vim +236 lib/fw_table.c

3c31bb75ec8d40 Dave Jiang 2023-05-24  217  
3c31bb75ec8d40 Dave Jiang 2023-05-24  218  int cdat_table_parse(enum acpi_cdat_type type,
3c31bb75ec8d40 Dave Jiang 2023-05-24  219  		     acpi_tbl_entry_handler_arg handler_arg, void *arg,
3c31bb75ec8d40 Dave Jiang 2023-05-24  220  		     struct acpi_table_cdat *table_header)
3c31bb75ec8d40 Dave Jiang 2023-05-24  221  {
3c31bb75ec8d40 Dave Jiang 2023-05-24  222  	struct acpi_subtable_proc proc = {
3c31bb75ec8d40 Dave Jiang 2023-05-24  223  		.id		= type,
3c31bb75ec8d40 Dave Jiang 2023-05-24  224  		.handler_arg	= handler_arg,
3c31bb75ec8d40 Dave Jiang 2023-05-24  225  		.arg		= arg,
3c31bb75ec8d40 Dave Jiang 2023-05-24  226  	};
3c31bb75ec8d40 Dave Jiang 2023-05-24  227  
3c31bb75ec8d40 Dave Jiang 2023-05-24  228  	if (!table_header)
3c31bb75ec8d40 Dave Jiang 2023-05-24  229  		return -EINVAL;
3c31bb75ec8d40 Dave Jiang 2023-05-24  230  
3c31bb75ec8d40 Dave Jiang 2023-05-24  231  	return acpi_parse_entries_array(ACPI_SIG_CDAT,
3c31bb75ec8d40 Dave Jiang 2023-05-24  232  					sizeof(struct acpi_table_cdat),
3c31bb75ec8d40 Dave Jiang 2023-05-24  233  					(union fw_table_header *)table_header,
3c31bb75ec8d40 Dave Jiang 2023-05-24  234  					&proc, 1, 0);
3c31bb75ec8d40 Dave Jiang 2023-05-24  235  }
3c31bb75ec8d40 Dave Jiang 2023-05-24 @236  EXPORT_SYMBOL_NS_GPL(cdat_table_parse, CXL);

:::::: The code at line 236 was first introduced by commit
:::::: 3c31bb75ec8d4007bb99dc34ad5efbb1ffe6ff3b lib/firmware_table: tables: Add CDAT table parsing support

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
