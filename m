Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF537605D;
	Sun,  3 Mar 2024 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709493602; cv=none; b=WE99eim7IikAFWfDR5YNc8cvLQ9z0pBRCdfGYAALEkwW576HzSdsK4orNZFrClfyw06nFgMk2KqJoiDwDo/5eXsQjUqW2U9SCz+9wFbVwtQZiTtg6aBDNJaD+uc7rMnvTWMT+sLALkagzTiSzhBMfwYB1RHht7FJdGu2XAcc1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709493602; c=relaxed/simple;
	bh=XYuTpOAJYVVXnggyhf3xrYZrOyAkLmolyVKmPjBRI04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsZmAVPpP0z1rEEZOyjED2IyjnmCt+/loFlhvJSZLegfNcih5L+uo4hJi3wbe0gZthzankpNOk7GjCBB8Np7UV3j1Nd+tsbil5yJDNasGTd/BNleUSEzxsRsuKag/aCim8J/vQ4HuvxZXnIkOfKBXDmHklnZUKsDP+K9vLo5jYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUcXJQLa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUcXJQLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709493601; x=1741029601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYuTpOAJYVVXnggyhf3xrYZrOyAkLmolyVKmPjBRI04=;
  b=IUcXJQLaiV1vrqP/eg/bfobk6/yBDLLPJ7/KWSiWtFHTV2Fp4vY1FhoQ
   uY2ySnM4s8s6e7Mo8OwKyKVZQR52OPCV2oiMdjkx1zE7fPAboSd08COoY
   g/Ztx5bORpYJ8r63EIdO9PjqRVikkDhAGb3COGBeocUD7hizu+FeTXQpl
   c5mF0BVt6NyWoZkR5lVsGudVi0yNfhrV0ErWXkxV9fq3ezkX5PkCYvQXp
   Ns5rV/ekQ+axx2vQ+ZlMtPwoKHLmgP9IVggO/RRPH5JEuQhVP2CvLZPCl
   yKa+9NEnWjEalqKMPzY8f1YiuM4R7DTFEgwe3Xs0NR4spAJP+FV7p4z+L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15414029"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="15414029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 11:20:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="31930252"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2024 11:19:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgrNM-000232-2S;
	Sun, 03 Mar 2024 19:19:56 +0000
Date: Mon, 4 Mar 2024 03:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:notmuch-cover.1708709155.git.john@groves.net 9/23]
 drivers/dax/bus.c:1437:9: warning: variable 'len' set but not used
Message-ID: <202403040347.bxTTY9j2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux notmuch-cover.1708709155.git.john@groves.net
head:   c8318dd2a63c230e5e731bc14750a466d7891ddc
commit: b1dbe325e1e88d07cf2f245da33393842ff842bc [9/23] dev_dax_iomap: Add CONFIG_DEV_DAX_IOMAP kernel build parameter
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240304/202403040347.bxTTY9j2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040347.bxTTY9j2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040347.bxTTY9j2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/bus.c:1437:9: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1437 |         size_t len, off;
         |                ^
   1 warning generated.


vim +/len +1437 drivers/dax/bus.c

2e58e20034e6b0 John Groves 2024-02-23  1433  
2e58e20034e6b0 John Groves 2024-02-23  1434  static size_t dev_dax_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
2e58e20034e6b0 John Groves 2024-02-23  1435  		void *addr, size_t bytes, struct iov_iter *i)
2e58e20034e6b0 John Groves 2024-02-23  1436  {
2e58e20034e6b0 John Groves 2024-02-23 @1437  	size_t len, off;
2e58e20034e6b0 John Groves 2024-02-23  1438  
2e58e20034e6b0 John Groves 2024-02-23  1439  	off = offset_in_page(addr);
2e58e20034e6b0 John Groves 2024-02-23  1440  	len = PFN_PHYS(PFN_UP(off + bytes));
2e58e20034e6b0 John Groves 2024-02-23  1441  
2e58e20034e6b0 John Groves 2024-02-23  1442  	return _copy_from_iter_flushcache(addr, bytes, i);
2e58e20034e6b0 John Groves 2024-02-23  1443  }
2e58e20034e6b0 John Groves 2024-02-23  1444  

:::::: The code at line 1437 was first introduced by commit
:::::: 2e58e20034e6b0d8e6f04e6002c6f684dd1a35bd dev_dax_iomap: Add dax_operations for use by fs-dax on devdax

:::::: TO: John Groves <John@Groves.net>
:::::: CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
