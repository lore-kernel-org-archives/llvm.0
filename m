Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90756D53B;
	Thu, 25 Jul 2024 01:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721870928; cv=none; b=beX2vMYrI+EXzdumuFE+9+9UoV2FM3kWVaB9X2Aq0WVJh/pQMNJxDX+dOSo71hgANv9C2gw0K2XLzgDbDWlLLwsT0WG+WXo785XVi8FPheDafij7fqH1BwbhqQBKhVrDkQtFZxF/Q07gvtPZzPyMTKUBPYJ6IKnAfS7rh/mMybQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721870928; c=relaxed/simple;
	bh=C5UqzjqzCZ35PlQN5LEmuhR6qEkCLUJAorrsBr1ASmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AABEmrnkdhIqtdx0dbCnFpcygPk3fVMpTCZzPKtgsww8VlMvU7m03znu7CKFJ8e7pQp4g34dxH66vz0uDBvhiwXTHZjiB9iLEJ+XBb+8v5oZzEi7Tgn7sFd0ju5ND8U/xL1FtAOZOjzbTsYRw+Iwi8FzciP1LirBGMQ2R2USD6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahsl9PEH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahsl9PEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721870927; x=1753406927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5UqzjqzCZ35PlQN5LEmuhR6qEkCLUJAorrsBr1ASmk=;
  b=ahsl9PEHv0Uw6DIK/7TUDspVdUw7W8JKPId/qinuanB09rWw9I5r2V5f
   YHDLYLYZjO15gH40cUJI2dckqsSRY/7KEiTvMK9o7z8H58n3ftk/OjkEa
   zw1u5zxBmk9yqRFz59/ckfL+99INH6DIL0xddY3QKRceBctZhVLEbH2kD
   vqhNpY3hpQvbdEnoxDsv0eHwKZp6xKI7CPaflU/krTZRwlIwHc5Pte8bL
   kxSEMyVUUbFzGFByt+WMF3wHdE/X294z/JJtDOaOIV8WcieCmzj8S0Ixr
   Okqramef+RHAbX/UIymU3qOSp7fWK7Q+2q9VLBVKvgdRAkzmfxSEwTla4
   A==;
X-CSE-ConnectionGUID: 9kwacX9RRHiymDJwLZJgZQ==
X-CSE-MsgGUID: EZyHYyY1SEeICVtZ0aam9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30204026"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="30204026"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 18:28:46 -0700
X-CSE-ConnectionGUID: h6ANiHnKRzaVHRocpMQZgw==
X-CSE-MsgGUID: YUMNDhBeSMe9DIfMtrZx1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="90225541"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jul 2024 18:28:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWnHe-000ne4-1j;
	Thu, 25 Jul 2024 01:28:42 +0000
Date: Thu, 25 Jul 2024 09:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-testing 9/9] fs/nfsd/nfs4proc.c:1622:40: warning: unused
 variable 'nfsd4_cb_offload_ops'
Message-ID: <202407250956.N03o4BlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   4e7058acdd17cdaaeedf1ace203e539dd08a2689
commit: 4e7058acdd17cdaaeedf1ace203e539dd08a2689 [9/9] NFSD: Drop CB_OFFLOAD Calls
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240725/202407250956.N03o4BlA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250956.N03o4BlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250956.N03o4BlA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4proc.c:1622:40: warning: unused variable 'nfsd4_cb_offload_ops' [-Wunused-const-variable]
    1622 | static const struct nfsd4_callback_ops nfsd4_cb_offload_ops = {
         |                                        ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/nfsd4_cb_offload_ops +1622 fs/nfsd/nfs4proc.c

e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1621  
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20 @1622  static const struct nfsd4_callback_ops nfsd4_cb_offload_ops = {
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1623  	.release = nfsd4_cb_offload_release,
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1624  	.done = nfsd4_cb_offload_done
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1625  };
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1626  

:::::: The code at line 1622 was first introduced by commit
:::::: e0639dc5805a9d4faaa2c07ad98fa853b9529dd3 NFSD introduce async copy feature

:::::: TO: Olga Kornievskaia <kolga@netapp.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
