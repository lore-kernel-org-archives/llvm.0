Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665C82AF10;
	Wed,  2 Apr 2025 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743570113; cv=none; b=ipEEmpZOoTU4TpXUT/7LKnw2e0K4tL6s9SDTMtaWsJeQQT21pRb8tdO9G5HA4ro8KF7gIKSlTBqOvxEUOOI/A4721EJk1D903P4QlY69GRRLyo+5G7fmtmlFVd5hgLuFsxIVt+GfDIRou2I4hQwtSaBFF3ghsrXQILCqDz3/AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743570113; c=relaxed/simple;
	bh=mvJxFdVy6mLYsAIEb+MX289tUsPjcSRRh2bxJ9Tz5DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QA2NBV0hJLPelrFvQJnD4I2lHrFiTMBR+V9UlNStnQSwGZshOowxIu5vRKGBNzMovHKL7DCYeF5mRY1ntlfS7Y1PArs03mdASAO3ntcBn+hesYeQWQVj14DT7IZcLJ1ySOwNg+oqeNJ3qxh44QHTkpAKKIxhYsILo1X9Tyhs2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuiszTgX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuiszTgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743570111; x=1775106111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvJxFdVy6mLYsAIEb+MX289tUsPjcSRRh2bxJ9Tz5DQ=;
  b=YuiszTgXvwk7GR+W43wkxTKLmRKO/E4LmTpg4KtAbDy35wefQYexxcui
   JkfOMAT9a6C7DaxlvBlYdle3LrsOb2SWBYEHbnMwlhgpxCMsneC6GNA2x
   G/xZdSKpibbYHe/fgl1PDDhaO4TVLcWD2eI5B9K1BaPBHbGNdNHOW3IGO
   +9P2LK6NPGB2ZoLczhaUhEHHk5/sPV1uBgEo7PtXjacl765Qe60Ua0wEe
   LxmncHTkV27dnQXg27TumYjtJ5bSWsPbPKajaJ9Gzawsx4j706Qi5D1st
   qnMiOGJMTvgX1M9Ekcj27181Mc+nqUTlWl9fgj39Ag6eDTr2vd4y6YBXq
   Q==;
X-CSE-ConnectionGUID: Zc+b0dCrQ5WhJRNLdiM3aQ==
X-CSE-MsgGUID: xEX8xUHKSnGaaUriYgjfpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55110836"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="55110836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 22:01:51 -0700
X-CSE-ConnectionGUID: g9YxekvDQX+fuEM6SQ6KjA==
X-CSE-MsgGUID: OuEd/JmARUWiQ4Xh++y29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131307885"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 22:01:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzqEU-000ATy-34;
	Wed, 02 Apr 2025 05:01:46 +0000
Date: Wed, 2 Apr 2025 13:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_pfs_parent_v2 1/2]
 drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c:68:55: error: too many
 arguments to function call, expected 3, have 4
Message-ID: <202504021206.MNPtSadQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent_v2
head:   7f1e9aee5ae311c2f5c2296ce444f08dfa8b6ff0
commit: ef188d299e790f2dbfd6d5272e26fb1f1a543d4a [1/2] net/mlx5: Introduce shared devlink instance for PFs on same chip
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250402/202504021206.MNPtSadQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021206.MNPtSadQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021206.MNPtSadQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c:68:55: error: too many arguments to function call, expected 3, have 4
      68 |         faux_dev = faux_device_create(THIS_MODULE, sn, NULL, &mlx5_shd_faux_ops);
         |                    ~~~~~~~~~~~~~~~~~~                        ^~~~~~~~~~~~~~~~~~
   include/linux/device/faux.h:50:21: note: 'faux_device_create' declared here
      50 | struct faux_device *faux_device_create(const char *name,
         |                     ^                  ~~~~~~~~~~~~~~~~~
      51 |                                        struct device *parent,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~
      52 |                                        const struct faux_device_ops *faux_ops);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +68 drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c

    62	
    63	static struct mlx5_shd *mlx5_shd_create(const char *sn)
    64	{
    65		struct faux_device *faux_dev;
    66		struct mlx5_shd *shd;
    67	
  > 68		faux_dev = faux_device_create(THIS_MODULE, sn, NULL, &mlx5_shd_faux_ops);
    69		if (!faux_dev)
    70			return NULL;
    71		shd = faux_device_get_drvdata(faux_dev);
    72		if (!shd)
    73			return NULL;
    74		list_add_tail(&shd->list, &shd_list);
    75		shd->sn = sn;
    76		INIT_LIST_HEAD(&shd->dev_list);
    77		shd->faux_dev = faux_dev;
    78		return shd;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
