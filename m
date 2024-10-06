Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85099320B;
	Sun,  6 Oct 2024 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728185871; cv=none; b=U3U0tMOudryMI8coq3f4qVf4pwH+iIuxdwJKakDg/l5X2EWX537bYMEizMgT+r+/+z2sWj0x9nVouHNd5BFIUrNUcZEcHhzU7/5EiTjLbBCRhXFodYqC5uoQWBrr4zd+r8X4HniOlR95Hy3+xUNg/jhRF04zdmigel3Ekhh2bms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728185871; c=relaxed/simple;
	bh=QC3JwY02bCAjO8PHACtlvrkPNXgzBH288ECEF7raCDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnE/ydxLrsOqSJu/OppotIWGUjGjUTaAufDlxY7Fne9xm/qpi/ORxOOTTOTvfPuprJ2SOdCzq3dvukdRBoTdp6tlP1GVyK0I+DawhtdcfGVc8/Pm6LWwVU0xrMLrGnQrhGnaEjCqxPdLeCaYKj4cULBHRTab+WlOJhwWNiC28yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKtPplEW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKtPplEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728185866; x=1759721866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QC3JwY02bCAjO8PHACtlvrkPNXgzBH288ECEF7raCDE=;
  b=UKtPplEWCMIqKtAPKnNccP+NtCOA/3RFuhNNhMlo1ws27ihJXxpdgDlK
   JQoD+XzSCzfDKnB4Y7Sn7EkIEp+wF6f3s5asPp1wryIzXZ+GzjmDT+st/
   V0OD/YltgAGIfMDaUlQQXCXGD1KKVoUuaLPboAkaf7US7vKP/nL9a/G0S
   HYTxWH5z6aOgG1Yp3qaQGTKladDC82gNKL+dctgtApX6fHoU8AwKmSXcF
   2w30R5kn8uR/7mFF6W01AuLPWWXhlPmmGrbAde5Tdoea+EGV0BfZ04t9J
   e6ST7QYoeJ+l4MDT0Jg8NsXS3XUuVmm4gSfAATQFLnRlyaPOLTHu+TT8C
   Q==;
X-CSE-ConnectionGUID: q/hZ+zf7QTyHd27tL2cpbQ==
X-CSE-MsgGUID: gZWjq/Z5Q9mshFs42d5x3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="31248144"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="31248144"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 20:37:46 -0700
X-CSE-ConnectionGUID: npUm3P6NRCS89lnEMvp2iw==
X-CSE-MsgGUID: GJM+TSrfQt6eyohYgihT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79887664"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2024 20:37:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxI5W-0003a0-1C;
	Sun, 06 Oct 2024 03:37:42 +0000
Date: Sun, 6 Oct 2024 11:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [cel:nfsd-5.10.y 104/169] drivers/i2c/i2c-core-base.c:101:31: error:
 passing 'const struct device *' to parameter of type 'struct device *'
 discards qualifiers
Message-ID: <202410061127.DJKet1me-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.10.y
head:   515eb04a8b0667cd6d18d68b08ef33afbd02845b
commit: 485dd5c359970c7a431596bcd8c4469362915eba [104/169] i2c: Add i2c_get_match_data()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241006/202410061127.DJKet1me-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061127.DJKet1me-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061127.DJKet1me-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.c:101:31: error: passing 'const struct device *' to parameter of type 'struct device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     101 |         data = device_get_match_data(&client->dev);
         |                                      ^~~~~~~~~~~~
   include/linux/property.h:382:50: note: passing argument to parameter 'dev' here
     382 | const void *device_get_match_data(struct device *dev);
         |                                                  ^
   1 error generated.


vim +101 drivers/i2c/i2c-core-base.c

    94	
    95	const void *i2c_get_match_data(const struct i2c_client *client)
    96	{
    97		struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
    98		const struct i2c_device_id *match;
    99		const void *data;
   100	
 > 101		data = device_get_match_data(&client->dev);
   102		if (!data) {
   103			match = i2c_match_id(driver->id_table, client);
   104			if (!match)
   105				return NULL;
   106	
   107			data = (const void *)match->driver_data;
   108		}
   109	
   110		return data;
   111	}
   112	EXPORT_SYMBOL(i2c_get_match_data);
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
