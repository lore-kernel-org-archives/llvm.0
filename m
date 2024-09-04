Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A91D221F;
	Wed,  4 Sep 2024 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725450674; cv=none; b=TfbIZZmO6sAd1pyH2BAiTTqIoMUwd+6Bcj3mSUNPl0vRnxt2E/DNAuhdooAFHxfjsAQ7nYtZ5wIZovK13+UCKvhjFf1tRckuoYWlcl4+WzgXj6MQO+wMecTca4i2vXCKHTnqWknDkWH2SHZM/FjRRu+I1LQrZP44X6t94x+akp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725450674; c=relaxed/simple;
	bh=HXGQhTAqocN6z9p9HIwtZXBI4DsHLIt3fijtAaQbV/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5El6qszy/mMlf/qO49VqYG7wPYnA/rcLXQuW/0mNjAg/+wdUuPd9uHPWpyP9kuJDijfjzG5EGyVosRJzdHr2k/Tg0ZiJpdRybcxAXNskvvRhMEdyoWzmV+kXbHc+8O3y/glc+pT+TT+1P8d/I3ksDEPYFXZhdfbXKvGxHFDqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO9qGNCL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO9qGNCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725450672; x=1756986672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HXGQhTAqocN6z9p9HIwtZXBI4DsHLIt3fijtAaQbV/Y=;
  b=ZO9qGNCLeEJC75iK2hm/0CqtvTdP2XlOtBmvqQe6Y0gLyH9lvbp1yU/x
   MApd7x55/st0u4wd4V2+iaTWVeSI0wL3M/aoF3J4+c1+RUVJV945S9svo
   yl4kzVOLHKKaq9fLyGgvfF+5ksltaq51Xz2yOfSjvoJFDlzXsRiUTo/Zb
   n4CpbsYjP2IU45gPW57/xSa++2sptwl9PbIv5CyPD1/ON3a11hkpjfY07
   vPqYasAYUiCFDDS/ediy5j31BimWzPBgyIJ8EEYLqqUEKJ4+Mx78XfCmm
   MEGGnKB1+e3k4TnJnF9ZfXhe3o3mKlnxht34U1QE1CPUUCJ4DhDGCtdIL
   Q==;
X-CSE-ConnectionGUID: Fn262V+KQUWRBPA43p0GwQ==
X-CSE-MsgGUID: TOrNRAv7Qpqr3H+Lx8a5Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35466280"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35466280"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 04:51:11 -0700
X-CSE-ConnectionGUID: RbcptEcPTOC7ADdqh33/MA==
X-CSE-MsgGUID: wWLrqEY6QDeGi4WIWO7rxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="95976478"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Sep 2024 04:51:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sloXU-0007vl-2W;
	Wed, 04 Sep 2024 11:51:08 +0000
Date: Wed, 4 Sep 2024 19:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:deleg-ace 1/1] fs/nfsd/nfs4xdr.c:4147:45: error: member
 reference type 'struct nfs4_stid' is not a pointer; did you mean to use '.'?
Message-ID: <202409041912.zb11j9yK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git deleg-ace
head:   f9306e1825450ef6983cf1ae3cf03cfe115424ba
commit: f9306e1825450ef6983cf1ae3cf03cfe115424ba [1/1] nfsd: add a real ACE to the returned delegation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240904/202409041912.zb11j9yK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041912.zb11j9yK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041912.zb11j9yK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4xdr.c:4147:45: error: member reference type 'struct nfs4_stid' is not a pointer; did you mean to use '.'?
    4147 |         struct inode *inode = open->op_stp->st_stid->sc_file->fi_inode;
         |                               ~~~~~~~~~~~~~~~~~~~~~^~
         |                                                    .
>> fs/nfsd/nfs4xdr.c:4151:20: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
    4151 |         if (inode->i_mode & S_IRUGO == S_IRUGO)
         |                           ^~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c:4151:20: note: place parentheses around the '==' expression to silence this warning
    4151 |         if (inode->i_mode & S_IRUGO == S_IRUGO)
         |                           ^ ~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c:4151:20: note: place parentheses around the & expression to evaluate it first
    4151 |         if (inode->i_mode & S_IRUGO == S_IRUGO)
         |             ~~~~~~~~~~~~~~^~~~~~~~~
>> fs/nfsd/nfs4xdr.c:4152:12: error: use of undeclared identifier 'ACE4_READ_DATA'; did you mean 'D_REAL_DATA'?
    4152 |                 *mask |= ACE4_READ_DATA;
         |                          ^~~~~~~~~~~~~~
         |                          D_REAL_DATA
   include/linux/dcache.h:134:2: note: 'D_REAL_DATA' declared here
     134 |         D_REAL_DATA,
         |         ^
>> fs/nfsd/nfs4xdr.c:4153:31: error: use of undeclared identifier 'OPEN4_SHARE_ACCESS_WRITE'
    4153 |         if ((open->op_share_access & OPEN4_SHARE_ACCESS_WRITE) &&
         |                                      ^
   fs/nfsd/nfs4xdr.c:4154:20: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
    4154 |             inode->i_mode & S_IWUGO == S_IWUGO)
         |                           ^~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c:4154:20: note: place parentheses around the '==' expression to silence this warning
    4154 |             inode->i_mode & S_IWUGO == S_IWUGO)
         |                           ^ ~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c:4154:20: note: place parentheses around the & expression to evaluate it first
    4154 |             inode->i_mode & S_IWUGO == S_IWUGO)
         |             ~~~~~~~~~~~~~~^~~~~~~~~
>> fs/nfsd/nfs4xdr.c:4155:12: error: use of undeclared identifier 'ACE4_WRITE_DATA'
    4155 |                 *mask |= ACE4_WRITE_DATA;
         |                          ^
   fs/nfsd/nfs4xdr.c:4168:13: error: use of undeclared identifier 'ACE4_READ_DATA'; did you mean 'D_REAL_DATA'?
    4168 |         u32 mask = ACE4_READ_DATA;
         |                    ^~~~~~~~~~~~~~
         |                    D_REAL_DATA
   include/linux/dcache.h:134:2: note: 'D_REAL_DATA' declared here
     134 |         D_REAL_DATA,
         |         ^
   fs/nfsd/nfs4xdr.c:4182:11: error: use of undeclared identifier 'ACE4_WRITE_DATA'
    4182 |                 mask |= ACE4_WRITE_DATA;
         |                         ^
>> fs/nfsd/nfs4xdr.c:4207:38: error: too few arguments to function call, expected 2, have 1
    4207 |         return nfsd4_encode_open_nfsace4(xdr);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~    ^
   fs/nfsd/nfs4xdr.c:4166:1: note: 'nfsd4_encode_open_nfsace4' declared here
    4166 | nfsd4_encode_open_nfsace4(struct xdr_stream *xdr, struct nfsd4_open *open)
         | ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c:4238:38: error: too few arguments to function call, expected 2, have 1
    4238 |         return nfsd4_encode_open_nfsace4(xdr);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~    ^
   fs/nfsd/nfs4xdr.c:4166:1: note: 'nfsd4_encode_open_nfsace4' declared here
    4166 | nfsd4_encode_open_nfsace4(struct xdr_stream *xdr, struct nfsd4_open *open)
         | ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 8 errors generated.


vim +4147 fs/nfsd/nfs4xdr.c

  4143	
  4144	static int
  4145	nfsd4_open_nfsace4_type_and_mask(struct nfsd4_open *open, u32 *mask)
  4146	{
> 4147		struct inode *inode = open->op_stp->st_stid->sc_file->fi_inode;
  4148		struct svc_rqst *rqstp = open->op_rqstp;
  4149	
  4150		*mask = 0;
> 4151		if (inode->i_mode & S_IRUGO == S_IRUGO)
> 4152			*mask |= ACE4_READ_DATA;
> 4153		if ((open->op_share_access & OPEN4_SHARE_ACCESS_WRITE) &&
  4154		    inode->i_mode & S_IWUGO == S_IWUGO)
> 4155			*mask |= ACE4_WRITE_DATA;
  4156	
  4157		if (*mask)
  4158			return NFS4_ACL_WHO_EVERYONE;
  4159	}
  4160	
  4161	/*
  4162	 * This implementation does not yet support returning an ACE in an
  4163	 * OPEN that offers a delegation.
  4164	 */
  4165	static __be32
  4166	nfsd4_encode_open_nfsace4(struct xdr_stream *xdr, struct nfsd4_open *open)
  4167	{
  4168		u32 mask = ACE4_READ_DATA;
  4169		__be32 status;
  4170	
  4171		/* type */
  4172		status = nfsd4_encode_acetype4(xdr, NFS4_ACE_ACCESS_ALLOWED_ACE_TYPE);
  4173		if (status != nfs_ok)
  4174			return nfserr_resource;
  4175		/* flag */
  4176		status = nfsd4_encode_aceflag4(xdr, 0);
  4177		if (status != nfs_ok)
  4178			return nfserr_resource;
  4179	
  4180		/* access mask */
  4181		if (open->op_share_access & NFS4_SHARE_ACCESS_WRITE)
  4182			mask |= ACE4_WRITE_DATA;
  4183	
  4184		status = nfsd4_encode_acemask4(xdr, mask);
  4185		if (status != nfs_ok)
  4186			return nfserr_resource;
  4187		/* who - empty for now */
  4188		if (xdr_stream_encode_u32(xdr, 0) != XDR_UNIT)
  4189			return nfserr_resource;
  4190		return nfs_ok;
  4191	}
  4192	
  4193	static __be32
  4194	nfsd4_encode_open_read_delegation4(struct xdr_stream *xdr, struct nfsd4_open *open)
  4195	{
  4196		__be32 status;
  4197	
  4198		/* stateid */
  4199		status = nfsd4_encode_stateid4(xdr, &open->op_delegate_stateid);
  4200		if (status != nfs_ok)
  4201			return status;
  4202		/* recall */
  4203		status = nfsd4_encode_bool(xdr, open->op_recall);
  4204		if (status != nfs_ok)
  4205			return status;
  4206		/* permissions */
> 4207		return nfsd4_encode_open_nfsace4(xdr);
  4208	}
  4209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
