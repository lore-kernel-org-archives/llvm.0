Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96C48CCD;
	Wed, 20 Mar 2024 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710945496; cv=none; b=g3QRN0CIYDnynWFVsLLK4uv7EktASyXZDPJqTZlCKxsc+y4aq7RhpEbegATNYn0WpHXpU7FkYk4mym+uQOy2vBFVrr4xR5zBiV7XLOHRGdrPMmNdn32hRDRAXdRbZqfAd+ypu5dbAKPjOE66yXa9jsTwMaZQiWySUXUrYP1yLXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710945496; c=relaxed/simple;
	bh=EGWVwRwti68tkUZ1YBSbalx/BqzPhzttz4rmd64YTBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZEUmt0P0rUF8kvSXfFDAYIiDnryRuVG3icuko8utFG7bKWBcoGWhj9AvcHYuxhDvk+JlOqnjCbaaqpQLpiqKeDHMFfhl1dPaqNNBKXEhxREXQPe1ePD5kDpl5i2cA3tICMScuIuB4dh2FzCOYyixnmlWwkXeAkVlSr2OCz5yBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ho5h8+on; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ho5h8+on"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710945494; x=1742481494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGWVwRwti68tkUZ1YBSbalx/BqzPhzttz4rmd64YTBg=;
  b=ho5h8+onCIItArn74a9XwC4fzC7GE+icJx/AR3/SNHinSHppaiPX+ohS
   3VRSoOzDJFF2nfMlCzDde9/SlnOTsfqEfzBK9svGK+hi+LZ81txbnAkFe
   I78LcOk9BgQITVjrQ8kjzCyRKBn6i9wIUfZ0M+3jqv711UK6kr2aMexmO
   CoeARlqdFlsRgSwmGmI+WIWeSHPwu80p3uS6R2aaVRKyZRrmuW82wEit4
   7mc3YzcNPRpvPnyvYi9aAqvC7b462pBMNUQYIAiiBcNjomy9i6Pxzwypa
   MYbQkWHFcVWdw+BfegSGEzy37Nq2IVdt8UkpJyvt5tm4Fr2/E4cmz6DDN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5811385"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5811385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 07:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14256313"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Mar 2024 07:38:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmx4z-000IgJ-3A;
	Wed, 20 Mar 2024 14:38:09 +0000
Date: Wed, 20 Mar 2024 22:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 2/25] fs/nfsd/nfs4xdr.c:5670:28: error: use of
 undeclared identifier 'nfsd4_encode_get_dir_delegation'; did you mean
 'nfsd4_decode_get_dir_delegation'?
Message-ID: <202403202241.TGkoPfFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f13f8d4a78153ebfaa225dcc13c1eec66e62b18f
commit: b1878d4cae9cf47ed8bce6c4129d9997c2afdaef [2/25] nfsd: trivial GET_DIR_DELEGATION support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240320/202403202241.TGkoPfFJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202241.TGkoPfFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202241.TGkoPfFJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs4xdr.c:5670:28: error: use of undeclared identifier 'nfsd4_encode_get_dir_delegation'; did you mean 'nfsd4_decode_get_dir_delegation'?
    5670 |         [OP_GET_DIR_DELEGATION] = nfsd4_encode_get_dir_delegation,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   nfsd4_decode_get_dir_delegation
   fs/nfsd/nfs4xdr.c:1736:1: note: 'nfsd4_decode_get_dir_delegation' declared here
    1736 | nfsd4_decode_get_dir_delegation(struct nfsd4_compoundargs *argp,
         | ^
>> fs/nfsd/nfs4xdr.c:5670:28: error: incompatible function pointer types initializing 'const nfsd4_enc' (aka 'unsigned int (*const)(struct nfsd4_compoundres *, unsigned int, union nfsd4_op_u *)') with an expression of type '__be32 (struct nfsd4_compoundargs *, union nfsd4_op_u *)' (aka 'unsigned int (struct nfsd4_compoundargs *, union nfsd4_op_u *)') [-Wincompatible-function-pointer-types]
    5670 |         [OP_GET_DIR_DELEGATION] = nfsd4_encode_get_dir_delegation,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +5670 fs/nfsd/nfs4xdr.c

  5618	
  5619	/*
  5620	 * Note: nfsd4_enc_ops vector is shared for v4.0 and v4.1
  5621	 * since we don't need to filter out obsolete ops as this is
  5622	 * done in the decoding phase.
  5623	 */
  5624	static const nfsd4_enc nfsd4_enc_ops[] = {
  5625		[OP_ACCESS]		= nfsd4_encode_access,
  5626		[OP_CLOSE]		= nfsd4_encode_close,
  5627		[OP_COMMIT]		= nfsd4_encode_commit,
  5628		[OP_CREATE]		= nfsd4_encode_create,
  5629		[OP_DELEGPURGE]		= nfsd4_encode_noop,
  5630		[OP_DELEGRETURN]	= nfsd4_encode_noop,
  5631		[OP_GETATTR]		= nfsd4_encode_getattr,
  5632		[OP_GETFH]		= nfsd4_encode_getfh,
  5633		[OP_LINK]		= nfsd4_encode_link,
  5634		[OP_LOCK]		= nfsd4_encode_lock,
  5635		[OP_LOCKT]		= nfsd4_encode_lockt,
  5636		[OP_LOCKU]		= nfsd4_encode_locku,
  5637		[OP_LOOKUP]		= nfsd4_encode_noop,
  5638		[OP_LOOKUPP]		= nfsd4_encode_noop,
  5639		[OP_NVERIFY]		= nfsd4_encode_noop,
  5640		[OP_OPEN]		= nfsd4_encode_open,
  5641		[OP_OPENATTR]		= nfsd4_encode_noop,
  5642		[OP_OPEN_CONFIRM]	= nfsd4_encode_open_confirm,
  5643		[OP_OPEN_DOWNGRADE]	= nfsd4_encode_open_downgrade,
  5644		[OP_PUTFH]		= nfsd4_encode_noop,
  5645		[OP_PUTPUBFH]		= nfsd4_encode_noop,
  5646		[OP_PUTROOTFH]		= nfsd4_encode_noop,
  5647		[OP_READ]		= nfsd4_encode_read,
  5648		[OP_READDIR]		= nfsd4_encode_readdir,
  5649		[OP_READLINK]		= nfsd4_encode_readlink,
  5650		[OP_REMOVE]		= nfsd4_encode_remove,
  5651		[OP_RENAME]		= nfsd4_encode_rename,
  5652		[OP_RENEW]		= nfsd4_encode_noop,
  5653		[OP_RESTOREFH]		= nfsd4_encode_noop,
  5654		[OP_SAVEFH]		= nfsd4_encode_noop,
  5655		[OP_SECINFO]		= nfsd4_encode_secinfo,
  5656		[OP_SETATTR]		= nfsd4_encode_setattr,
  5657		[OP_SETCLIENTID]	= nfsd4_encode_setclientid,
  5658		[OP_SETCLIENTID_CONFIRM] = nfsd4_encode_noop,
  5659		[OP_VERIFY]		= nfsd4_encode_noop,
  5660		[OP_WRITE]		= nfsd4_encode_write,
  5661		[OP_RELEASE_LOCKOWNER]	= nfsd4_encode_noop,
  5662	
  5663		/* NFSv4.1 operations */
  5664		[OP_BACKCHANNEL_CTL]	= nfsd4_encode_noop,
  5665		[OP_BIND_CONN_TO_SESSION] = nfsd4_encode_bind_conn_to_session,
  5666		[OP_EXCHANGE_ID]	= nfsd4_encode_exchange_id,
  5667		[OP_CREATE_SESSION]	= nfsd4_encode_create_session,
  5668		[OP_DESTROY_SESSION]	= nfsd4_encode_noop,
  5669		[OP_FREE_STATEID]	= nfsd4_encode_noop,
> 5670		[OP_GET_DIR_DELEGATION]	= nfsd4_encode_get_dir_delegation,
  5671	#ifdef CONFIG_NFSD_PNFS
  5672		[OP_GETDEVICEINFO]	= nfsd4_encode_getdeviceinfo,
  5673		[OP_GETDEVICELIST]	= nfsd4_encode_noop,
  5674		[OP_LAYOUTCOMMIT]	= nfsd4_encode_layoutcommit,
  5675		[OP_LAYOUTGET]		= nfsd4_encode_layoutget,
  5676		[OP_LAYOUTRETURN]	= nfsd4_encode_layoutreturn,
  5677	#else
  5678		[OP_GETDEVICEINFO]	= nfsd4_encode_noop,
  5679		[OP_GETDEVICELIST]	= nfsd4_encode_noop,
  5680		[OP_LAYOUTCOMMIT]	= nfsd4_encode_noop,
  5681		[OP_LAYOUTGET]		= nfsd4_encode_noop,
  5682		[OP_LAYOUTRETURN]	= nfsd4_encode_noop,
  5683	#endif
  5684		[OP_SECINFO_NO_NAME]	= nfsd4_encode_secinfo_no_name,
  5685		[OP_SEQUENCE]		= nfsd4_encode_sequence,
  5686		[OP_SET_SSV]		= nfsd4_encode_noop,
  5687		[OP_TEST_STATEID]	= nfsd4_encode_test_stateid,
  5688		[OP_WANT_DELEGATION]	= nfsd4_encode_noop,
  5689		[OP_DESTROY_CLIENTID]	= nfsd4_encode_noop,
  5690		[OP_RECLAIM_COMPLETE]	= nfsd4_encode_noop,
  5691	
  5692		/* NFSv4.2 operations */
  5693		[OP_ALLOCATE]		= nfsd4_encode_noop,
  5694		[OP_COPY]		= nfsd4_encode_copy,
  5695		[OP_COPY_NOTIFY]	= nfsd4_encode_copy_notify,
  5696		[OP_DEALLOCATE]		= nfsd4_encode_noop,
  5697		[OP_IO_ADVISE]		= nfsd4_encode_noop,
  5698		[OP_LAYOUTERROR]	= nfsd4_encode_noop,
  5699		[OP_LAYOUTSTATS]	= nfsd4_encode_noop,
  5700		[OP_OFFLOAD_CANCEL]	= nfsd4_encode_noop,
  5701		[OP_OFFLOAD_STATUS]	= nfsd4_encode_offload_status,
  5702		[OP_READ_PLUS]		= nfsd4_encode_read_plus,
  5703		[OP_SEEK]		= nfsd4_encode_seek,
  5704		[OP_WRITE_SAME]		= nfsd4_encode_noop,
  5705		[OP_CLONE]		= nfsd4_encode_noop,
  5706	
  5707		/* RFC 8276 extended atributes operations */
  5708		[OP_GETXATTR]		= nfsd4_encode_getxattr,
  5709		[OP_SETXATTR]		= nfsd4_encode_setxattr,
  5710		[OP_LISTXATTRS]		= nfsd4_encode_listxattrs,
  5711		[OP_REMOVEXATTR]	= nfsd4_encode_removexattr,
  5712	};
  5713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
