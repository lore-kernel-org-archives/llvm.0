Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3542049;
	Fri,  2 Jan 2026 05:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767330177; cv=none; b=klEyAYAtEYLlsb2mQ1DBHrgYtVcX/y66ypPpIldPTbCcI8p7jqfj4ZJTpfJiG/A1gEujZXTrMa7mhWSByQ1ri0kV4nbHhILy4GMI7imcqmbcbOwpjg92P8Qn3QXRPkeBKR88Ev6EhDUuDiBoNzdP7KuEvZzx6TbDBHv2y2FdZ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767330177; c=relaxed/simple;
	bh=rHZ+7N/VbUXOtkaQkty4JevJiNQ7gsLBEYD9SiRp9XQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qFA4sHmvD/yvBEPdxtDHkTJ5bSPLjeN06uNbmhQFppUL+EogMZwFQISjo1TcRjtHvUMEtcXTcMMQIJoaT9PaDVU9OZkQ/qVQR/MpdpuR2U8/rs055LewxqYZcXCvrU9/3oDFhV/jNh39Mpv5e3Vfz5cZ9TVhNutbIZkEAFmF6Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VleXziK8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VleXziK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767330176; x=1798866176;
  h=date:from:to:cc:subject:message-id;
  bh=rHZ+7N/VbUXOtkaQkty4JevJiNQ7gsLBEYD9SiRp9XQ=;
  b=VleXziK85Dix8DLaZsN0QFumjRo7Vd73IWE5+nrTT3QtU8pkn530pxHX
   xDbeUIMNfnVirpo28Fl1TQZQ0F9MwcNpgDSqz7XjJ8ZtI8TjP5Q8KTNdK
   vrUP/Gz9JgmLNpeBfJh3cms9ILDwvJzPN7oeAy54UBsLZO5VTuMu6ywbI
   KYYoZK8X39irqzi3wyQ8jeEIHcQhSJI4nocg6LaET7SCYMpOmEquBTUPU
   Ol+OX44jDhb+PWpVDn1wyPa7YP3DPlsqintPx2iad0SyZxIMuBOPXSWDi
   kHdQS56/CcNgIMlzphlUDCJOVOPXKwwdO9X5TQnQvr9SFbIp3G7MrDSFD
   A==;
X-CSE-ConnectionGUID: IiRcfQIxRyu55/DMJKNwwA==
X-CSE-MsgGUID: 3/J71PdbSbSDhItU0/9whw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79557182"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="79557182"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 21:02:55 -0800
X-CSE-ConnectionGUID: cFkJBLz+SxydynO+8KEQ5Q==
X-CSE-MsgGUID: fCv5bCq2SzSZsuCgxXwr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="201380975"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jan 2026 21:02:54 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbXJL-0000000028D-3Ia2;
	Fri, 02 Jan 2026 05:02:51 +0000
Date: Fri, 02 Jan 2026 13:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/dovec_consolidate 12/17]
 kernel/sysctl.c:689:56: error: too few arguments to function call, expected
 5, have 4
Message-ID: <202601021233.ttBxRu9m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/dovec_consolidate
head:   d49958cf1ef4a4c967cdfab48de1c7ee689227fd
commit: 4067ce3ab91bcf2efeb4018c11b7d523efe60f67 [12/17] sysctl: Add negp parameter to douintvec converter functions
config: x86_64-randconfig-006-20260102 (https://download.01.org/0day-ci/archive/20260102/202601021233.ttBxRu9m-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601021233.ttBxRu9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601021233.ttBxRu9m-lkp@intel.com/

Note: the joel-granados/jag/dovec_consolidate HEAD d49958cf1ef4a4c967cdfab48de1c7ee689227fd builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:689:56: error: too few arguments to function call, expected 5, have 4
     689 |         if (conv(&lval, (unsigned int *) table->data, 1, table)) {
         |             ~~~~                                              ^
>> kernel/sysctl.c:923:6: error: incompatible function pointer types passing 'int (ulong *, uint *, int, const struct ctl_table *)' (aka 'int (unsigned long *, unsigned int *, int, const struct ctl_table *)') to parameter of type 'int (*)(bool *, ulong *, uint *, int, const struct ctl_table *)' (aka 'int (*)(_Bool *, unsigned long *, unsigned int *, int, const struct ctl_table *)') [-Wincompatible-function-pointer-types]
     923 |                                  do_proc_uint_conv_minmax);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:741:15: note: passing argument to parameter 'conv' here
     741 |                              int (*conv)(bool *negp, ulong *u_ptr, uint *k_ptr,
         |                                    ^
   kernel/sysctl.c:967:5: error: incompatible function pointer types passing 'int (ulong *, uint *, int, const struct ctl_table *)' (aka 'int (unsigned long *, unsigned int *, int, const struct ctl_table *)') to parameter of type 'int (*)(bool *, ulong *, uint *, int, const struct ctl_table *)' (aka 'int (*)(_Bool *, unsigned long *, unsigned int *, int, const struct ctl_table *)') [-Wincompatible-function-pointer-types]
     967 |                                 do_proc_uint_conv_minmax);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:741:15: note: passing argument to parameter 'conv' here
     741 |                              int (*conv)(bool *negp, ulong *u_ptr, uint *k_ptr,
         |                                    ^
   3 errors generated.


vim +689 kernel/sysctl.c

f461d2dcd511c0 Christoph Hellwig 2020-04-24  654  
ee581c0e3acd6b Joel Granados     2025-10-02  655  static int do_proc_douintvec_w(const struct ctl_table *table, void *buffer,
f461d2dcd511c0 Christoph Hellwig 2020-04-24  656  			       size_t *lenp, loff_t *ppos,
4067ce3ab91bcf Joel Granados     2025-12-10  657  			       int (*conv)(bool *negp, unsigned long *u_ptr,
551bf184502765 Joel Granados     2025-10-03  658  					   unsigned int *k_ptr, int dir,
6ca07a9b63ff4a Joel Granados     2025-10-01  659  					   const struct ctl_table *table))
^1da177e4c3f41 Linus Torvalds    2005-04-16  660  {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  661  	unsigned long lval;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  662  	int err = 0;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  663  	size_t left;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  664  	bool neg;
32927393dc1ccd Christoph Hellwig 2020-04-24  665  	char *p = buffer;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  666  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  667  	left = *lenp;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  668  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  669  	if (proc_first_pos_non_zero_ignore(ppos, table))
f461d2dcd511c0 Christoph Hellwig 2020-04-24  670  		goto bail_early;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  671  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  672  	if (left > PAGE_SIZE - 1)
f461d2dcd511c0 Christoph Hellwig 2020-04-24  673  		left = PAGE_SIZE - 1;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  674  
bce9332220bd67 Linus Torvalds    2022-12-05  675  	proc_skip_spaces(&p, &left);
f461d2dcd511c0 Christoph Hellwig 2020-04-24  676  	if (!left) {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  677  		err = -EINVAL;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  678  		goto out_free;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  679  	}
f461d2dcd511c0 Christoph Hellwig 2020-04-24  680  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  681  	err = proc_get_long(&p, &left, &lval, &neg,
f461d2dcd511c0 Christoph Hellwig 2020-04-24  682  			     proc_wspace_sep,
f461d2dcd511c0 Christoph Hellwig 2020-04-24  683  			     sizeof(proc_wspace_sep), NULL);
f461d2dcd511c0 Christoph Hellwig 2020-04-24  684  	if (err || neg) {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  685  		err = -EINVAL;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  686  		goto out_free;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  687  	}
f461d2dcd511c0 Christoph Hellwig 2020-04-24  688  
ee581c0e3acd6b Joel Granados     2025-10-02 @689  	if (conv(&lval, (unsigned int *) table->data, 1, table)) {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  690  		err = -EINVAL;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  691  		goto out_free;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  692  	}
f461d2dcd511c0 Christoph Hellwig 2020-04-24  693  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  694  	if (!err && left)
bce9332220bd67 Linus Torvalds    2022-12-05  695  		proc_skip_spaces(&p, &left);
f461d2dcd511c0 Christoph Hellwig 2020-04-24  696  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  697  out_free:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  698  	if (err)
f461d2dcd511c0 Christoph Hellwig 2020-04-24  699  		return -EINVAL;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  700  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  701  	return 0;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  702  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  703  bail_early:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  704  	*ppos += *lenp;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  705  	return err;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  706  }
f461d2dcd511c0 Christoph Hellwig 2020-04-24  707  

:::::: The code at line 689 was first introduced by commit
:::::: ee581c0e3acd6b59e36c1d990090c699c5ba6735 sysctl: Remove superfluous tbl_data param from "dovec" functions

:::::: TO: Joel Granados <joel.granados@kernel.org>
:::::: CC: Joel Granados <joel.granados@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
