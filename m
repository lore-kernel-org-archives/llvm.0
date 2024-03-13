Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1D124A0D;
	Wed, 13 Mar 2024 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710323447; cv=none; b=lLzI/jyoq4NIdR0jfr2cqg8v3V9JjybozBmRE61GA3TDzVzmye/aZHNCdkHV8QVp6N7SJk56u4o+KR2YkqoRZaY4JUnUpz6aALDIFNg//aZ4vxVt/imjwwJqabHZaRuZGH+1h4TcHhNDlVCYiI8IPIOJIEkjLevNQT18ZFrpAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710323447; c=relaxed/simple;
	bh=eKO/v/xU8m6xsYEv45zMhsxJ3tJG5oqSxIv+QmW+0T4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8jltUSEijY7V/6ESV0Ul86VIDwchjfjJmg8t+Tukeq5y40JyRAHWLxgrSxUeAc7lDrYnKszMdgYRjIceXjysh8cW2BkwkLJDy0SR6z8SHUw4q6iLca2m5mynA6Vw1o8RcxdocyxtzGzheMheLqaC8MnqyqK32wMJdyqETfTVbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LK87Mz/5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LK87Mz/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710323446; x=1741859446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eKO/v/xU8m6xsYEv45zMhsxJ3tJG5oqSxIv+QmW+0T4=;
  b=LK87Mz/5/MkA1+4sOaiHjQpEbMzBTyDL8WsPnpmxFwKZxE/C1ZRcI/3n
   1XeJhFiRbgLjFu4/7uP7F6pB9cYVgJTGlIEGUvKbNA+erPvD836L8AeDI
   yBo+wVzVtiM7/rK9wjRrngZaIiEYx/4rHy8z0D4FjYGE/PQF7yf9q4QYm
   Uew1nMV34qJOhyhYrHmO/phpg4nFjwVk/xbyK/JXOHL8K0o9z2Mkfpp62
   JkgVCnK+mUdqlm47TUZXHgNlwb5u93YIr/NLSepSpBS/ekcvexnhas39c
   Znoroqd6h8K1+JaFa+GLeTbofmepqQD8X6pd8gy3Qh8vGTsw4wUD+EwDw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8884985"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8884985"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 02:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11929075"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2024 02:50:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkLFx-000CFZ-1o;
	Wed, 13 Mar 2024 09:50:41 +0000
Date: Wed, 13 Mar 2024 17:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 28/32] fs/nfs/nfs4proc.c:4478:7: warning: variable
 'op' is uninitialized when used here
Message-ID: <202403131738.6MRAVx51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   244db11a7d6835249946adae4255d53cb0edf7f6
commit: 794e11b83f62df1c9e75c3411254f60df074a261 [28/32] nfs: try to get a dir delegation with every lookup
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240313/202403131738.6MRAVx51-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131738.6MRAVx51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131738.6MRAVx51-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/nfs4proc.c:38:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/nfs/nfs4proc.c:4478:7: warning: variable 'op' is uninitialized when used here [-Wuninitialized]
    4478 |                 if (op == NFSPROC4_CLNT_GDD_LOOKUP && res.nf_status == GDD4_OK)
         |                     ^~
   fs/nfs/nfs4proc.c:4437:16: note: initialize the variable 'op' to silence this warning
    4437 |         int status, op;
         |                       ^
         |                        = 0
   fs/nfs/nfs4proc.c:9331:12: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    9331 |         unsigned *ptr;
         |                   ^
   3 warnings generated.


vim +/op +4478 fs/nfs/nfs4proc.c

  4431	
  4432	static int _nfs4_proc_lookup(struct rpc_clnt *clnt, struct inode *dir,
  4433			struct dentry *dentry, struct nfs_fh *fhandle,
  4434			struct nfs_fattr *fattr)
  4435	{
  4436		struct nfs_server *server = NFS_SERVER(dir);
  4437		int status, op;
  4438	
  4439		struct nfs4_lookup_arg args = {
  4440			.bitmask = server->attr_bitmask,
  4441			.dir_fh = NFS_FH(dir),
  4442			.name = &dentry->d_name,
  4443		};
  4444		struct nfs4_lookup_res res = {
  4445			.server = server,
  4446			.fattr = fattr,
  4447			.fh = fhandle,
  4448		};
  4449		struct rpc_message msg = {
  4450			.rpc_argp = &args,
  4451			.rpc_resp = &res,
  4452		};
  4453		unsigned short task_flags = 0;
  4454	
  4455		if (nfs_server_capable(dir, NFS_CAP_MOVEABLE))
  4456			task_flags = RPC_TASK_MOVEABLE;
  4457	
  4458		/* Is this is an attribute revalidation, subject to softreval? */
  4459		if (nfs_lookup_is_soft_revalidate(dentry))
  4460			task_flags |= RPC_TASK_TIMEOUT;
  4461		args.bitmask = nfs4_bitmask(server, fattr->label);
  4462	
  4463		nfs_fattr_init(fattr);
  4464		dprintk("NFS call  lookup %pd2\n", dentry);
  4465	retry:
  4466		if (nfs_server_capable(dir, NFS_CAP_GET_DIR_DELEG) &&
  4467		    !rcu_access_pointer(NFS_I(dir)->delegation))
  4468			msg.rpc_proc = &nfs4_procedures[NFSPROC4_CLNT_GDD_LOOKUP];
  4469		else
  4470			msg.rpc_proc = &nfs4_procedures[NFSPROC4_CLNT_LOOKUP];
  4471	
  4472		nfs4_init_sequence(&args.seq_args, &res.seq_res, 0, 0);
  4473		status = nfs4_do_call_sync(clnt, server, &msg,
  4474				&args.seq_args, &res.seq_res, task_flags);
  4475	
  4476		switch (status) {
  4477		case 0:
> 4478			if (op == NFSPROC4_CLNT_GDD_LOOKUP && res.nf_status == GDD4_OK)
  4479				status = nfs_inode_set_delegation(dir, current_cred(), FMODE_READ,
  4480								  &res.deleg, 0);
  4481			break;
  4482		case -ENOTSUPP:
  4483			/* If the server doesn't support GET_DIR_DELEGATION, retry without it */
  4484			if (op == NFSPROC4_CLNT_GDD_LOOKUP) {
  4485				server->caps &= ~NFS_CAP_GET_DIR_DELEG;
  4486				goto retry;
  4487			}
  4488		}
  4489		dprintk("NFS reply lookup: %d\n", status);
  4490		return status;
  4491	}
  4492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
