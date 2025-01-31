Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F0A1C174E;
	Fri, 31 Jan 2025 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347109; cv=none; b=ERJMdCB9DtyZwtnAtaP+EPAnRNjavJRc2EO2bqd45NBnLkgHLo+BZYf8O6z2Ylqt2WdJMUKlEEoO0JFGpkrxmEzDXrOvKCeJT45nJXi446tfbQ8TFUST7A7oC85NOV2oErq/3ZK6yk9SsOuXWKh2WfTucq7r0rezyUQij/yYbIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347109; c=relaxed/simple;
	bh=7da/aHIWgTdm63iO3F8uh1hJc8G01gfqvFzxAtp7sL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJIuw5Xn28IUZqpE6RnW92WWmaxYmfDu/ZffHzWiYGXOjtwXSWwwTUUCwZdymcoEd9fS7V3XeozXLzeKbjLTwH4RRScY9OtRUy1iZRtwE9jbXvGZnVNZtxxwYUaN+IZNwmN4XxtCOLIpWXlEPj4NExyp0G6PlC3Gfqy2Ih858MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft9zEmm6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft9zEmm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738347107; x=1769883107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7da/aHIWgTdm63iO3F8uh1hJc8G01gfqvFzxAtp7sL0=;
  b=Ft9zEmm6zUvuzgnNF+FwIJcmkv7PUebR+R//y/VKqyfeQOE7oMgtGp05
   pIMNmYp1Kx9up7dm8Z/6op1I5jbBujSAgy5vfNQSGSs+GfsXhWRSjmyeM
   tmkWJvTJKT/Gfb8zZGA6e0V0qJLaUFA7MvHQ4rQ25h+/X6Wqq0t/MJv1+
   J/RpdD85CVqNwhq0iBZOY0K7SzFGj4bRqptgOD4LZxVbg0LZr3jDOoP3O
   aoGBCGKwcWP38g2ooQnqf3aUiF+QR06XJtaT3+ha6KNKTg742I3vq9kgp
   MLMry3VvWTDsznNEL063Z0tqKcug2nQKjHeX9GqhrQqePxkt550cQyiVF
   g==;
X-CSE-ConnectionGUID: VG4C9EZkRNa64PpMGD3fXA==
X-CSE-MsgGUID: 9e1ek6NuTyCpSP+E6ZqInQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49582473"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="49582473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 10:11:46 -0800
X-CSE-ConnectionGUID: vdXx0/ZJR/iEdvDLAu4G+g==
X-CSE-MsgGUID: kCN5QvecSVih/LoT5eg7IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132949006"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2025 10:11:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdvUV-000miL-0s;
	Fri, 31 Jan 2025 18:11:43 +0000
Date: Sat, 1 Feb 2025 02:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 33/33] fs/afs/cm_security.c:170:2: warning:
 variable 'toksize' is uninitialized when used here
Message-ID: <202502010215.qB2jXApL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   3108d67c535aa3ea00a95b1daf8efdc15bb074b4
commit: 3108d67c535aa3ea00a95b1daf8efdc15bb074b4 [33/33] afs: Use rxgk RESPONSE to pass token for callback channel
config: x86_64-buildonly-randconfig-005-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010215.qB2jXApL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010215.qB2jXApL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010215.qB2jXApL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/cm_security.c:170:2: warning: variable 'toksize' is uninitialized when used here [-Wuninitialized]
     170 |         toksize += keysize + 8 + 4 + 4 + 8 + xdr_len_object(authsize);
         |         ^~~~~~~
   fs/afs/cm_security.c:131:45: note: initialize the variable 'toksize' to silence this warning
     131 |         size_t keysize, uuidsize, authsize, toksize, encsize, contsize, adatasize, offset;
         |                                                    ^
         |                                                     = 0
   1 warning generated.


vim +/toksize +170 fs/afs/cm_security.c

   119	
   120	/*
   121	 * Create an RxGK GSS token to use as a ticket to the specified fileserver.
   122	 */
   123	int afs_create_cm_token(struct afs_server *server)
   124	{
   125		const struct krb5_enctype *krb5;
   126		const struct krb5_buffer *server_key;
   127		struct crypto_aead *aead;
   128		struct scatterlist sg;
   129		struct afs_net *net = server->cell->net;
   130		const struct key *key = net->fs_cm_token_key;
   131		size_t keysize, uuidsize, authsize, toksize, encsize, contsize, adatasize, offset;
   132		__be32 *xdr;
   133		void *token, *K0, *encxdr;
   134		int ret;
   135	
   136		if (!key)
   137			return -ENOKEY;
   138	
   139		krb5 = crypto_krb5_find_enctype(KRB5_ENCTYPE_AES128_CTS_HMAC_SHA1_96);
   140		if (!krb5)
   141			return -ENOPKG;
   142		server_key = (const void *)&key->payload.data[2];
   143	
   144		/* struct rxgk_key {
   145		 *	afs_uint32	enctype;
   146		 *	opaque		key<>;
   147		 * };
   148		 */
   149		keysize = 4 + xdr_len_object(krb5->key_len);
   150	
   151		/* struct RXGK_AuthName {
   152		 *	afs_int32	kind;
   153		 *	opaque		data<AUTHDATAMAX>;
   154		 *	opaque		display<AUTHPRINTABLEMAX>;
   155		 * };
   156		 */
   157		uuidsize = sizeof(server->uuid);
   158		authsize = 4 + xdr_len_object(uuidsize) + xdr_len_object(0);
   159	
   160		/* struct RXGK_Token {
   161		 *	rxgk_key		K0;
   162		 *	RXGK_Level		level;
   163		 *	rxgkTime		starttime;
   164		 *	afs_int32		lifetime;
   165		 *	afs_int32		bytelife;
   166		 *	rxgkTime		expirationtime;
   167		 *	struct RXGK_AuthName	identities<>;
   168		 * };
   169		 */
 > 170		toksize += keysize + 8 + 4 + 4 + 8 + xdr_len_object(authsize);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
