Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D5131E841;
	Tue, 17 Mar 2026 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770186; cv=none; b=XffWepLJoFxt4xg+j9cvsCFtluDBaeyZlr/kPlQjpN0QnyIWWuauZeSKc1A5qMo3bXRYOKfZi+c8ygCjiC/7go7AKdbDDf2lrlOciKB2EeMvtCndK1k9sx8l0kOq03ZLfRTdoGEGDeKcMlGj5PKpHwPyIjYfa5OtMu2dFZBkLzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770186; c=relaxed/simple;
	bh=oeoeZ1TsBNUyhMWJyS66KyJ4V0L4Gjw+0F740YbxJ7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IGxaEBxhBpsevs6cydiGqY6A38xFB/FghYETuGauhJd0ZMv6tjcaFw/8ToD+pSnRwlEDt9EBRtY10ModHP1aM5W0ukllepjBDLZ6/8bT5G2W1rYJk1H65sUuVeH8BiTD7J/ukHmMwjP94Xckr+2UuHi56kqSIDFWRJYX5dtjYts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Htb2ZG4p; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Htb2ZG4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773770185; x=1805306185;
  h=date:from:to:cc:subject:message-id;
  bh=oeoeZ1TsBNUyhMWJyS66KyJ4V0L4Gjw+0F740YbxJ7M=;
  b=Htb2ZG4pnLO9hXrBGhU+x7m9VQTKuJlHPQ18B2Pg+VRWH0LUH4uBda/j
   eMVkVGZZUQp8hUOe21cK6AZ9SSp/i3+j8SDs10qpnAC8qXYYiPSNMzF1X
   TimPsXfLSR32gvtVZgKQ8MuxLKXrhBVHo3quxDMHzfqp5ROAwrlRJdX+f
   IhvSUiYSLnScBffQphht32wzPgT0wVakqFO8r02wOnvCG4QPeZ5M5JOb8
   swvZtPjuRGzjC6n7kppQEUdYbO9eC1J23zQ93Bk6wVoVAfa45Oct3LoID
   bvtR9j0yxegLM4zQH474Qm3cf8Ov1xN4745YHYSh7RHdhrg+vnaWTQmUr
   A==;
X-CSE-ConnectionGUID: KbHAglEOS9CseHHRXMojqQ==
X-CSE-MsgGUID: Ttt1jniuSLaXot5zfuM4Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74934806"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74934806"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:56:25 -0700
X-CSE-ConnectionGUID: buwq+U02Q0CrGMKg775T1Q==
X-CSE-MsgGUID: pyJgd8HqScSOmuixig1unQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="246974909"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 10:56:22 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2YeS-000000001jZ-0GuO;
	Tue, 17 Mar 2026 17:56:20 +0000
Date: Wed, 18 Mar 2026 01:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Asim Viladi Oglu Manizada <manizada@pm.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 11/12]
 fs/smb/server/smb2pdu.c:5723:3: warning: variable 'pntsd' is uninitialized
 when used here
Message-ID: <202603180118.ClDWNtId-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   a58d8c8b3d5daee33fb03f4d41ea278ae6e6ffc9
commit: 095198efe2c86423f647b242687c50e34e355d3a [11/12] ksmbd: fix heap OOB write in QUERY_INFO for compound requests
config: arm-randconfig-003-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180118.ClDWNtId-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180118.ClDWNtId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180118.ClDWNtId-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/smb2pdu.c:5723:3: warning: variable 'pntsd' is uninitialized when used here [-Wuninitialized]
    5723 |                 pntsd->revision = cpu_to_le16(1);
         |                 ^~~~~
   fs/smb/server/smb2pdu.c:5708:24: note: initialize the variable 'pntsd' to silence this warning
    5708 |         struct smb_ntsd *pntsd, *ppntsd = NULL;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +/pntsd +5723 fs/smb/server/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5701  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5702  static int smb2_get_info_sec(struct ksmbd_work *work,
64b39f4a2fd293 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-30  5703  			     struct smb2_query_info_req *req,
cb4517201b8acd fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-11-03  5704  			     struct smb2_query_info_rsp *rsp)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5705  {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5706  	struct ksmbd_file *fp;
4609e1f18e19c3 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-01-13  5707  	struct mnt_idmap *idmap;
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5708  	struct smb_ntsd *pntsd, *ppntsd = NULL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5709  	struct smb_fattr fattr = {{0}};
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5710  	struct inode *inode;
8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-08-02  5711  	__u32 secdesclen = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5712  	unsigned int id = KSMBD_NO_FID, pid = KSMBD_NO_FID;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5713  	int addition_info = le32_to_cpu(req->AdditionalInformation);
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5714  	int rc = 0, ppntsd_size = 0, max_len;
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5715  	size_t scratch_len;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5716  
e294f78d347851 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-06-28  5717  	if (addition_info & ~(OWNER_SECINFO | GROUP_SECINFO | DACL_SECINFO |
e294f78d347851 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-06-28  5718  			      PROTECTED_DACL_SECINFO |
e294f78d347851 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-06-28  5719  			      UNPROTECTED_DACL_SECINFO)) {
8e537d1465e740 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-11-21  5720  		ksmbd_debug(SMB, "Unsupported addition info: 0x%x)\n",
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5721  		       addition_info);
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5722  
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27 @5723  		pntsd->revision = cpu_to_le16(1);
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5724  		pntsd->type = cpu_to_le16(SELF_RELATIVE | DACL_PROTECTED);
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5725  		pntsd->osidoffset = 0;
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5726  		pntsd->gsidoffset = 0;
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5727  		pntsd->sacloffset = 0;
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5728  		pntsd->dacloffset = 0;
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5729  
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5730  		secdesclen = sizeof(struct smb_ntsd);
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5731  		rsp->OutputBufferLength = cpu_to_le32(secdesclen);
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5732  
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5733  		return 0;
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5734  	}
ced2b26a76cd1d fs/cifsd/smb2pdu.c      Sebastian Gottschall      2021-04-27  5735  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5736  	if (work->next_smb2_rcv_hdr_off) {
2d004c6cae567e fs/ksmbd/smb2pdu.c      Paulo Alcantara           2022-03-21  5737  		if (!has_file_id(req->VolatileFileId)) {
3867369ef8f760 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-07-08  5738  			ksmbd_debug(SMB, "Compound request set FID = %llu\n",
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5739  				    work->compound_fid);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5740  			id = work->compound_fid;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5741  			pid = work->compound_pfid;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5742  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5743  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5744  
3867369ef8f760 fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-07-08  5745  	if (!has_file_id(id)) {
2d004c6cae567e fs/ksmbd/smb2pdu.c      Paulo Alcantara           2022-03-21  5746  		id = req->VolatileFileId;
2d004c6cae567e fs/ksmbd/smb2pdu.c      Paulo Alcantara           2022-03-21  5747  		pid = req->PersistentFileId;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5748  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5749  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5750  	fp = ksmbd_lookup_fd_slow(work, id, pid);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5751  	if (!fp)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5752  		return -ENOENT;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5753  
4609e1f18e19c3 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-01-13  5754  	idmap = file_mnt_idmap(fp->filp);
ab0b263b749ade fs/ksmbd/smb2pdu.c      Namjae Jeon               2021-06-29  5755  	inode = file_inode(fp->filp);
e67fe63341b811 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-01-13  5756  	ksmbd_acls_fattr(&fattr, idmap, inode);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5757  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5758  	if (test_share_config_flag(work->tcon->share_conf,
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5759  				   KSMBD_SHARE_FLAG_ACL_XATTR))
4609e1f18e19c3 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-01-13  5760  		ppntsd_size = ksmbd_vfs_get_sd_xattr(work->conn, idmap,
8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-08-02  5761  						     fp->filp->f_path.dentry,
8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-08-02  5762  						     &ppntsd);
8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-08-02  5763  
8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-08-02  5764  	/* Check if sd buffer size exceeds response buffer size */
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5765  	max_len = smb2_calc_max_out_buf_len(work,
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5766  			offsetof(struct smb2_query_info_rsp, Buffer),
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5767  			le32_to_cpu(req->OutputBufferLength));
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5768  	if (max_len < 0) {
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5769  		rc = -EINVAL;
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5770  		goto out;
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5771  	}
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5772  
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5773  	scratch_len = smb_acl_sec_desc_scratch_len(&fattr, ppntsd,
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5774  			ppntsd_size, addition_info);
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5775  	pntsd = kvmalloc(scratch_len, KSMBD_DEFAULT_GFP);
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5776  	if (!pntsd) {
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5777  		rc = -ENOMEM;
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5778  		goto out;
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5779  	}
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5780  
4d7ca4090184c1 fs/ksmbd/smb2pdu.c      Christian Brauner         2023-01-13  5781  	rc = build_sec_desc(idmap, pntsd, ppntsd, ppntsd_size,
8f0541186e9ad1 fs/ksmbd/smb2pdu.c      Namjae Jeon               2022-08-02  5782  			addition_info, &secdesclen, &fattr);
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5783  
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5784  out:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5785  	posix_acl_release(fattr.cf_acls);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5786  	posix_acl_release(fattr.cf_dacls);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5787  	kfree(ppntsd);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5788  	ksmbd_fd_put(work, fp);
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5789  	if (rc) {
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5790  		kvfree(pntsd);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5791  		return rc;
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5792  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5793  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5794  	rsp->OutputBufferLength = cpu_to_le32(secdesclen);
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5795  	return ksmbd_iov_pin_rsp_read(work, (void *)rsp,
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5796  			offsetof(struct smb2_query_info_rsp, Buffer),
095198efe2c864 fs/smb/server/smb2pdu.c Asim Viladi Oglu Manizada 2026-03-16  5797  			pntsd, secdesclen);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5798  }
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon               2021-03-16  5799  

:::::: The code at line 5723 was first introduced by commit
:::::: ced2b26a76cd1db0b6ccb39e0bc873177c9bda21 cifsd: Fix regression in smb2_get_info

:::::: TO: Sebastian Gottschall <s.gottschall@dd-wrt.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
