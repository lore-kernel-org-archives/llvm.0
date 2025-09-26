Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660810FD;
	Fri, 26 Sep 2025 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901444; cv=none; b=OiS3UIiGrzEOMoH6qD0UyaUFfF0p+ExLVU2KRb9jdjXc3qHImS3M3HMPqbPQzC+Q4SDJcb386aA+1cuu3FOl3kkIIkIZ54VpDbPNRQUP5v/ShUi8ZFFluk6iiI8543zkDl+TY1tkVtiKRCHBlLM1GksdGEtdx/dV3OC1R1DRt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901444; c=relaxed/simple;
	bh=KrFHYS000e/atb+UXTsqQIPzMGvQL/wJ1Q0Fg5BR+eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqxUl++zQbQTJR0S/MCXX6FAWjzJDlWI7tIEtE7tHY38alF9w6AbduFgUECrHUBMXfrOkv0UjsLSePYaZ0NmHE/8utPb2h7aKMciS/ubh9FlI0+Zn4wvDPRM/Bxfrz5ppBEPoEckDkszIctHQVnPAyMD+hugYRx7CqIbplidUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeqtM1Fz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeqtM1Fz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758901442; x=1790437442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrFHYS000e/atb+UXTsqQIPzMGvQL/wJ1Q0Fg5BR+eI=;
  b=FeqtM1FzAxXOOKD3G9pVr6hX4rzorvuICLOvxA/r0RWwKk1hyi3fW6cT
   5gPQ64GggLnUSZm0IUZTbC2hBnisgyK5LihFN0hu5849xDAjNkPVRKnrE
   QZFURCbrhP9884hDVDj8g3y2rPZ+GUayzt4LWydYFw6QWCzeBxJBql1YY
   E/eHsB+b4v3Kywx912GVQcty/614TLdDqwqqjqDNFiLll0ZZokcLVcHfB
   ompRkwWrP4uBcyzGD1+rtBPWFzswnANwpX7Buo74r+dFGFhBMwFx4VTLX
   +kmoqSTRkaIX7DDx4zZElsax2vNVkk1DJvOJQaY/vFt/7BoSWv8nxtyDO
   w==;
X-CSE-ConnectionGUID: /aZgKV50RRyZalvWS8qM6w==
X-CSE-MsgGUID: PQQwWfoKS5mtnUCwvfYMWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60274914"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="60274914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 08:44:01 -0700
X-CSE-ConnectionGUID: 1h3MiBORRjGUmn+o96KvzQ==
X-CSE-MsgGUID: W6xLYoPkRlKK+WBc1iknuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="182047538"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2025 08:43:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Abj-0006NL-0h;
	Fri, 26 Sep 2025 15:43:42 +0000
Date: Fri, 26 Sep 2025 23:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@ownmail.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 09/11] VFS/ovl/smb: introduce start_renaming_dentry()
Message-ID: <202509262345.LLJy17UN-lkp@intel.com>
References: <20250926025015.1747294-10-neilb@ownmail.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926025015.1747294-10-neilb@ownmail.net>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on next-20250925]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus viro-vfs/for-next linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-rename-end_creating-to-debugfs_end_creating/20250926-105302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250926025015.1747294-10-neilb%40ownmail.net
patch subject: [PATCH 09/11] VFS/ovl/smb: introduce start_renaming_dentry()
config: x86_64-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262345.LLJy17UN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262345.LLJy17UN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509262345.LLJy17UN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/super.c:609:7: warning: variable 'dest' is uninitialized when used here [-Wuninitialized]
     609 |         dput(dest);
         |              ^~~~
   fs/overlayfs/super.c:559:21: note: initialize the variable 'dest' to silence this warning
     559 |         struct dentry *dest;
         |                            ^
         |                             = NULL
   1 warning generated.


vim +/dest +609 fs/overlayfs/super.c

6ee8acf0f72b89 Miklos Szeredi    2017-11-09  550  
cad218ab332078 Amir Goldstein    2020-02-20  551  /*
cad218ab332078 Amir Goldstein    2020-02-20  552   * Returns 1 if RENAME_WHITEOUT is supported, 0 if not supported and
cad218ab332078 Amir Goldstein    2020-02-20  553   * negative values if error is encountered.
cad218ab332078 Amir Goldstein    2020-02-20  554   */
576bb263450bbb Christian Brauner 2022-04-04  555  static int ovl_check_rename_whiteout(struct ovl_fs *ofs)
cad218ab332078 Amir Goldstein    2020-02-20  556  {
576bb263450bbb Christian Brauner 2022-04-04  557  	struct dentry *workdir = ofs->workdir;
cad218ab332078 Amir Goldstein    2020-02-20  558  	struct dentry *temp;
cad218ab332078 Amir Goldstein    2020-02-20  559  	struct dentry *dest;
cad218ab332078 Amir Goldstein    2020-02-20  560  	struct dentry *whiteout;
cad218ab332078 Amir Goldstein    2020-02-20  561  	struct name_snapshot name;
18cc48cabac8b0 NeilBrown         2025-09-26  562  	struct renamedata rd = {};
18cc48cabac8b0 NeilBrown         2025-09-26  563  	char name2[OVL_TEMPNAME_SIZE];
cad218ab332078 Amir Goldstein    2020-02-20  564  	int err;
cad218ab332078 Amir Goldstein    2020-02-20  565  
576bb263450bbb Christian Brauner 2022-04-04  566  	temp = ovl_create_temp(ofs, workdir, OVL_CATTR(S_IFREG | 0));
cad218ab332078 Amir Goldstein    2020-02-20  567  	err = PTR_ERR(temp);
cad218ab332078 Amir Goldstein    2020-02-20  568  	if (IS_ERR(temp))
d2c995581c7c5d NeilBrown         2025-07-16  569  		return err;
cad218ab332078 Amir Goldstein    2020-02-20  570  
18cc48cabac8b0 NeilBrown         2025-09-26  571  	rd.mnt_idmap = ovl_upper_mnt_idmap(ofs);
18cc48cabac8b0 NeilBrown         2025-09-26  572  	rd.old_parent = workdir;
18cc48cabac8b0 NeilBrown         2025-09-26  573  	rd.new_parent = workdir;
18cc48cabac8b0 NeilBrown         2025-09-26  574  	rd.flags = RENAME_WHITEOUT;
18cc48cabac8b0 NeilBrown         2025-09-26  575  	ovl_tempname(name2);
18cc48cabac8b0 NeilBrown         2025-09-26  576  	err = start_renaming_dentry(&rd, 0, temp, &QSTR(name2));
d2c995581c7c5d NeilBrown         2025-07-16  577  	if (err) {
d2c995581c7c5d NeilBrown         2025-07-16  578  		dput(temp);
d2c995581c7c5d NeilBrown         2025-07-16  579  		return err;
d2c995581c7c5d NeilBrown         2025-07-16  580  	}
cad218ab332078 Amir Goldstein    2020-02-20  581  
cad218ab332078 Amir Goldstein    2020-02-20  582  	/* Name is inline and stable - using snapshot as a copy helper */
cad218ab332078 Amir Goldstein    2020-02-20  583  	take_dentry_name_snapshot(&name, temp);
18cc48cabac8b0 NeilBrown         2025-09-26  584  	err = ovl_do_rename_rd(&rd);
18cc48cabac8b0 NeilBrown         2025-09-26  585  	end_renaming(&rd);
cad218ab332078 Amir Goldstein    2020-02-20  586  	if (err) {
cad218ab332078 Amir Goldstein    2020-02-20  587  		if (err == -EINVAL)
cad218ab332078 Amir Goldstein    2020-02-20  588  			err = 0;
cad218ab332078 Amir Goldstein    2020-02-20  589  		goto cleanup_temp;
cad218ab332078 Amir Goldstein    2020-02-20  590  	}
cad218ab332078 Amir Goldstein    2020-02-20  591  
09d56cc88c2470 NeilBrown         2025-07-16  592  	whiteout = ovl_lookup_upper_unlocked(ofs, name.name.name,
09d56cc88c2470 NeilBrown         2025-07-16  593  					     workdir, name.name.len);
cad218ab332078 Amir Goldstein    2020-02-20  594  	err = PTR_ERR(whiteout);
cad218ab332078 Amir Goldstein    2020-02-20  595  	if (IS_ERR(whiteout))
cad218ab332078 Amir Goldstein    2020-02-20  596  		goto cleanup_temp;
cad218ab332078 Amir Goldstein    2020-02-20  597  
bc8df7a3dc0359 Alexander Larsson 2023-08-23  598  	err = ovl_upper_is_whiteout(ofs, whiteout);
cad218ab332078 Amir Goldstein    2020-02-20  599  
cad218ab332078 Amir Goldstein    2020-02-20  600  	/* Best effort cleanup of whiteout and temp file */
cad218ab332078 Amir Goldstein    2020-02-20  601  	if (err)
fe4d3360f9cbb5 NeilBrown         2025-07-16  602  		ovl_cleanup(ofs, workdir, whiteout);
cad218ab332078 Amir Goldstein    2020-02-20  603  	dput(whiteout);
cad218ab332078 Amir Goldstein    2020-02-20  604  
cad218ab332078 Amir Goldstein    2020-02-20  605  cleanup_temp:
fe4d3360f9cbb5 NeilBrown         2025-07-16  606  	ovl_cleanup(ofs, workdir, temp);
cad218ab332078 Amir Goldstein    2020-02-20  607  	release_dentry_name_snapshot(&name);
cad218ab332078 Amir Goldstein    2020-02-20  608  	dput(temp);
cad218ab332078 Amir Goldstein    2020-02-20 @609  	dput(dest);
cad218ab332078 Amir Goldstein    2020-02-20  610  
cad218ab332078 Amir Goldstein    2020-02-20  611  	return err;
cad218ab332078 Amir Goldstein    2020-02-20  612  }
cad218ab332078 Amir Goldstein    2020-02-20  613  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
