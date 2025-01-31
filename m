Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C2F9FE;
	Fri, 31 Jan 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738360286; cv=none; b=gCwFIBe61w10rLTerRTDUWp7LUBmzX0T/StW5LFunWyAYYEUcDLHF328zJBksHlu55EYkmMpL0HDH3WeiR/EC9uRUdSDWleyOLGPywBh9qI290yYFJlgQH375cx+SY2ywGIEpKF6mU3TuBhg47BWM5QcApGH1YQndI96oK/nfjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738360286; c=relaxed/simple;
	bh=oV7m9mCHY5qOTl4DvSLEx80+A3Vl32dz+XiHA3RBadY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nl4Byh+o1K4ASsVKnXYTT4oZdHJxae40rHkd///EuEU5WF+W8iSQ1m5Buot/f7e0aI0uij5U4VdRVuJpH6+sKJ2CBiJgHmqSNMTnN4au0hVSvkc1xqlINeo1TTt8es06qUjAdJJGs4IkJImjvaMrOBZn7Q4+sMNcNSmxrjM+N0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UupMOWBB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UupMOWBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738360285; x=1769896285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oV7m9mCHY5qOTl4DvSLEx80+A3Vl32dz+XiHA3RBadY=;
  b=UupMOWBBMmE97bNsQ3AxtD3MOJx4FahKfIWNikGj5UOzHH99f3Dl6org
   upAJrhg9D/0zeccig2iJj7Mu29kXHVoTwiqxR9X9pZ3TJif3EKKE6YhTw
   71Lpohm8cDRlwLPg4KSouddZuUzEaAJamlpXZ/2fJcj6w9k6hlQUSOZnp
   DJZuvC3F+1RdSQ98RKayEtCG0oaGIAxK4DQ+BH1yQ9LmRljiu85kdJcLt
   2sqa5Fmr0ft9KyBJfHE+poARBelOBtnzIY1hDqYJXuRzYItFevA7/+DH1
   4lUjqufRrAL0ZXIR3mtj2qQ5w4uaZEwTIo34jFYIFJ6Ik9yicMPFJzbYx
   A==;
X-CSE-ConnectionGUID: hkFmOGamQAypTXZYywbnHA==
X-CSE-MsgGUID: KKRxsr40Q56ItbITDwgwxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39077924"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="39077924"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 13:51:24 -0800
X-CSE-ConnectionGUID: fI7imHPRT8uIebJxC6x7vg==
X-CSE-MsgGUID: iU6i5L7FTPuf46YvsyD0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132995507"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2025 13:51:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdyv2-000nGn-0Y;
	Fri, 31 Jan 2025 21:51:20 +0000
Date: Sat, 1 Feb 2025 05:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 33/33] fs/afs/cm_security.c:253:10:
 warning: format specifies type 'size_t' (aka 'unsigned int') but the
 argument has type 'unsigned long'
Message-ID: <202502010518.LCA4OLR3-lkp@intel.com>
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
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250201/202502010518.LCA4OLR3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010518.LCA4OLR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010518.LCA4OLR3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/cm_security.c:253:10: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     252 |                 pr_err("Appdata size incorrect %zx != %zx\n",
         |                                                ~~~
         |                                                %lx
     253 |                        (unsigned long)xdr - (unsigned long)token, adatasize);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/afs/cm_security.c:170:2: warning: variable 'toksize' is uninitialized when used here [-Wuninitialized]
     170 |         toksize += keysize + 8 + 4 + 4 + 8 + xdr_len_object(authsize);
         |         ^~~~~~~
   fs/afs/cm_security.c:131:45: note: initialize the variable 'toksize' to silence this warning
     131 |         size_t keysize, uuidsize, authsize, toksize, encsize, contsize, adatasize, offset;
         |                                                    ^
         |                                                     = 0
   2 warnings generated.


vim +253 fs/afs/cm_security.c

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
   170		toksize += keysize + 8 + 4 + 4 + 8 + xdr_len_object(authsize);
   171	
   172		offset = 0;
   173		encsize = crypto_krb5_how_much_buffer(krb5, KRB5_ENCRYPT_MODE, toksize, &offset);
   174	
   175		/* struct RXGK_TokenContainer {
   176		 *	afs_int32	kvno;
   177		 *	afs_int32	enctype;
   178		 *	opaque		encrypted_token<>;
   179		 * };
   180		 */
   181		contsize = 4 + 4 + xdr_len_object(encsize);
   182	
   183		/*
   184		 * struct RXGK_Authenticator_AFSAppData {
   185		 *	afsUUID client_uuid;
   186		 *	RXGK_Data cb_tok;
   187		 *	RXGK_Data cb_key;
   188		 *	afs_int32 enctype;
   189		 *	afsUUID target_uuid;
   190		 * };
   191		 */
   192		adatasize = 44 + xdr_len_object(contsize) + xdr_len_object(krb5->key_len) + 4 + 44;
   193	
   194		ret = -ENOMEM;
   195		token = kzalloc(adatasize, GFP_KERNEL);
   196		if (!token)
   197			goto out;
   198		xdr = token;
   199	
   200		xdr[0] = net->uuid.time_low;	/* appdata.client_uuid */
   201		xdr[1] = htonl(ntohs(net->uuid.time_mid));
   202		xdr[2] = htonl(ntohs(net->uuid.time_hi_and_version));
   203		xdr[3] = htonl((s8) net->uuid.clock_seq_hi_and_reserved);
   204		xdr[4] = htonl((s8) net->uuid.clock_seq_low);
   205		for (int loop = 0; loop < 6; loop++)
   206			xdr[loop + 5] = htonl((s8)net->uuid.node[loop]);
   207		xdr += 11;
   208	
   209		*xdr++ = htonl(contsize);		/* appdata.cb_tok.len */
   210		*xdr++ = htonl(1);			/* cont.kvno */
   211		*xdr++ = htonl(krb5->etype);		/* cont.enctype */
   212		*xdr++ = htonl(encsize);		/* cont.encrypted_token.len */
   213	
   214		encxdr = xdr;
   215		xdr += offset / 4;
   216		*xdr++ = htonl(krb5->etype);		/* token.K0.enctype */
   217		*xdr++ = htonl(krb5->key_len);		/* token.K0.key.len */
   218		K0 = xdr;
   219		get_random_bytes(K0, krb5->key_len);	/* token.K0.key.data */
   220		xdr += xdr_round_up(krb5->key_len) / 4;
   221	
   222		*xdr++ = htonl(RXRPC_SECURITY_ENCRYPT);	/* token.level */
   223		*xdr++ = htonl(0);			/* token.starttime */
   224		*xdr++ = htonl(0);			/* " */
   225		*xdr++ = htonl(0);			/* token.lifetime */
   226		*xdr++ = htonl(0);			/* token.bytelife */
   227		*xdr++ = htonl(0);			/* token.expirationtime */
   228		*xdr++ = htonl(0);			/* " */
   229		*xdr++ = htonl(1);			/* token.identities.count */
   230		*xdr++ = htonl(0);			/* token.identities[0].kind */
   231		*xdr++ = htonl(uuidsize);		/* token.identities[0].data.len */
   232		memcpy(xdr, &server->uuid, uuidsize);
   233		xdr += xdr_round_up(uuidsize) / 4;
   234		*xdr++ = htonl(0);			/* token.identities[0].display.len */
   235	
   236		xdr = encxdr + xdr_round_up(encsize);
   237	
   238		*xdr++ = htonl(krb5->key_len);		/* appdata.cb_key.len */
   239		memcpy(xdr, K0, krb5->key_len);		/* appdata.cb_key.data */
   240		xdr += xdr_round_up(krb5->key_len) / 4;
   241		*xdr++ = htonl(krb5->etype);		/* appdata.enctype */
   242		xdr[0] = server->_uuid.time_low;	/* appdata.target_uuid */
   243		xdr[1] = htonl(ntohs(server->_uuid.time_mid));
   244		xdr[2] = htonl(ntohs(server->_uuid.time_hi_and_version));
   245		xdr[3] = htonl((s8) server->_uuid.clock_seq_hi_and_reserved);
   246		xdr[4] = htonl((s8) server->_uuid.clock_seq_low);
   247		for (int loop = 0; loop < 6; loop++)
   248			xdr[loop + 5] = htonl((s8)server->_uuid.node[loop]);
   249		xdr += 11;
   250	
   251		if ((unsigned long)xdr - (unsigned long)token != adatasize)
   252			pr_err("Appdata size incorrect %zx != %zx\n",
 > 253			       (unsigned long)xdr - (unsigned long)token, adatasize);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
