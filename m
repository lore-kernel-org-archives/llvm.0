Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189FA200CB;
	Sat,  7 Sep 2024 23:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725750093; cv=none; b=i9o/0Ts8ZIuo5rdiCk0CKEFfE4LQnshLChQX9kwxkySugPUpFj5B0RUIX1+ek/biPe0/M1zwXoNuxYfKS9itJtqj2vnI7lro/Rsgcl7LgWhmT0xMGttEmK4B/Rr0NacE33752eFA37beFyoR6VdNgAE5mD6k8qsKMIGlskLTEX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725750093; c=relaxed/simple;
	bh=Tr3zToX+wS6rxSKyRxVil/z2E/CF00dZlRHAA+L86LM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuZ6NTylDnvrmkwVcMIT21eWtbMKynaLLvb5ZrTKVYVj8rnJFrrKTjVK0gCiy2MED2BXU8LRHLLF5KjojLph1s9Ft1zFFV6whpMxnyRIRVeF6ciAzmDkr+yUEj/4sTvCOTBE+UOz3tFIKpuwNjfCpt4Rw7NT84yeyN8XblVL4Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKBNYUKh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKBNYUKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725750092; x=1757286092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tr3zToX+wS6rxSKyRxVil/z2E/CF00dZlRHAA+L86LM=;
  b=BKBNYUKhg53XOk20Gs20/IrUalcf4MKbV2ehLC4yC+aIaPOwzavy2hNv
   B6s9usFdbhdPw4wdgOsI+dprTLsWnSwY1xWTb5B0ysV7vzQf0wOyXpASo
   cOAFq3cejn+b79v03ZLpQRH3/VUSKeN0QWM5an47hC3/a3QgXet4LrFDN
   vQErdbA4cLotxyE8PGnm+MHvOiSmqHLBc+DfuDJwgfILIeAJnWopFwFlK
   pj/2tUFUrywUZ4W55D51+P1WjBdPwABsUxIRnl9pmr8xvNLY4L54ny1L3
   AEZ7zBM0aIHF8yt2mToouJTcFKM5v7JuNq7hPygcQPcEoE+VpyPTIg9MM
   Q==;
X-CSE-ConnectionGUID: DaLg1nlWQ+KAawskhYqfnA==
X-CSE-MsgGUID: uKEckWxzSWSe8K+7uyu8zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="49888944"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="49888944"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 16:01:31 -0700
X-CSE-ConnectionGUID: 6995Vgy2Q+S3UEDd2zMGtA==
X-CSE-MsgGUID: zJSsKkcvRMqTlxYZxEE3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="65982067"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Sep 2024 16:01:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn4Qq-000D5X-0s;
	Sat, 07 Sep 2024 23:01:28 +0000
Date: Sun, 8 Sep 2024 07:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Danielle Ratson <danieller@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/39] net/ethtool/cmis_cdb.c:574:40:
 warning: variable 'bytes_written' is uninitialized when used here
Message-ID: <202409080656.dUNiF2ts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   1e442c563723a4ecdef463c14b10ba919b27acdf
commit: 74c5ee4c97461509353a6a12028906809fe2c208 [23/39] net: ethtool: Add support for writing firmware blocks using EPL payload
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240908/202409080656.dUNiF2ts-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080656.dUNiF2ts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080656.dUNiF2ts-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethtool/cmis_cdb.c:574:40: warning: variable 'bytes_written' is uninitialized when used here [-Wuninitialized]
     574 |              page <= CMIS_CDB_EPL_PAGE_END && bytes_written < epl_len; page++) {
         |                                               ^~~~~~~~~~~~~
   net/ethtool/cmis_cdb.c:569:19: note: initialize the variable 'bytes_written' to silence this warning
     569 |         u32 bytes_written;
         |                          ^
         |                           = 0
   1 warning generated.


vim +/bytes_written +574 net/ethtool/cmis_cdb.c

   562	
   563	static int
   564	ethtool_cmis_cdb_execute_epl_cmd(struct net_device *dev,
   565					 struct ethtool_cmis_cdb_cmd_args *args,
   566					 struct ethtool_module_eeprom *page_data)
   567	{
   568		u16 epl_len = be16_to_cpu(args->req.epl_len);
   569		u32 bytes_written;
   570		u8 page;
   571		int err;
   572	
   573		for (page = CMIS_CDB_EPL_PAGE_START;
 > 574		     page <= CMIS_CDB_EPL_PAGE_END && bytes_written < epl_len; page++) {
   575			u16 offset = CMIS_CDB_EPL_FW_BLOCK_OFFSET_START;
   576	
   577			while (offset <= CMIS_CDB_EPL_FW_BLOCK_OFFSET_END &&
   578			       bytes_written < epl_len) {
   579				u32 bytes_left = epl_len - bytes_written;
   580				u16 space_left, bytes_to_write;
   581	
   582				space_left = CMIS_CDB_EPL_FW_BLOCK_OFFSET_END - offset + 1;
   583				bytes_to_write = min_t(u16, bytes_left,
   584						       min_t(u16, space_left,
   585							     args->read_write_len_ext));
   586	
   587				err = __ethtool_cmis_cdb_execute_cmd(dev, page_data,
   588								     page, offset,
   589								     bytes_to_write,
   590								     args->req.epl + bytes_written);
   591				if (err < 0)
   592					return err;
   593	
   594				offset += bytes_to_write;
   595				bytes_written += bytes_to_write;
   596			}
   597		}
   598		return 0;
   599	}
   600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
