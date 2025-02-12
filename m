Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142993398A;
	Wed, 12 Feb 2025 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377938; cv=none; b=NR+q2XLGzT3MQbU/C9UQfv2PPV1U1UZRL3BHvZOgylv5dreLm88cPMD0dHlYpw2cBgYWAhiiK99oQH1w0HArCzQjWJnWEe5T9b0aWCBQY29SYbTd+WqAptmhgsToazyqCqWWRUPwjRF+3TkTYj+0d/CnctkmbHo4qI5Azui5yyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377938; c=relaxed/simple;
	bh=Bvn1mMn+6CR+DYTc5GkR3Nu2PQxawcgRs4qKN47wDTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGoh7iQxc50iZgPXcQJckvJaBb4iYtxd1WoMTohdA2k98YO5mLXKSCLQHL30gzfS3db0K5JlVaup5+afQMMmoiOrDivdr5xMCh27mNMjv/ghZRroC3qPVdDG7OQNSmJZm8dj6TApZ1CDc57KxGe5OGhE81QOd9/hdcNL6AYHMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhgfxM5p; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhgfxM5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739377937; x=1770913937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bvn1mMn+6CR+DYTc5GkR3Nu2PQxawcgRs4qKN47wDTE=;
  b=NhgfxM5pV7z57kLSY53ik8HT/4uNgbmvwYbXb2/1kscPvWmOt8+tjg8S
   ip7XH0oZMc5fbry3ghYt6CL+iZ4NP98udKKFTPkyf39DRSHmc+/gpiOxC
   HNPhaBJhth251dQR+/8OQ+dX/quAHcrxM1v1s2poiWYtu/qXai0BTL2Xo
   39yfvUolvTpdb3uLWClYYG/sFMHuDZZPT8gC3MQ7Kmjp4kgP12yy8ryja
   sZluxvB6kI9fm0O0Aswh4cjS7Hm5YfQTLY9WKdITpzbxQelucOxq3wnkC
   p3cjHYNVw7XVvoO78+8Xod0IW88GwoGp8n1cW1jRHGybs3E/NbqnAZ2JJ
   Q==;
X-CSE-ConnectionGUID: BK16kY3SSsqxiArtZYHfgg==
X-CSE-MsgGUID: 0x3ZqDE9RaWmMOa0GhgfiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39968931"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39968931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:32:16 -0800
X-CSE-ConnectionGUID: akbWJTUbT6abxNt3pQrlnQ==
X-CSE-MsgGUID: bb/5u6+xRnW6u5bxCY8mMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="112726578"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Feb 2025 08:32:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiFem-0015qd-2H;
	Wed, 12 Feb 2025 16:32:12 +0000
Date: Thu, 13 Feb 2025 00:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 25/35] net/rxrpc/rxgk_kdf.c:222: undefined
 reference to `crypto_krb5_find_enctype'
Message-ID: <202502130005.Gejidzvc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   1df5ee14458290f1dc72aeba8770ba56a94e5c15
commit: 8b667ac5d90083111d3579d5b53e4d6a0cc0a7af [25/35] rxrpc: rxgk: Provide infrastructure and key derivation
config: um-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250213/202502130005.Gejidzvc-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130005.Gejidzvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130005.Gejidzvc-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: net/rxrpc/rxgk_kdf.o: in function `rxgk_generate_transport_key':
>> net/rxrpc/rxgk_kdf.c:222: undefined reference to `crypto_krb5_find_enctype'
>> /usr/bin/ld: net/rxrpc/rxgk_kdf.c:86: undefined reference to `crypto_krb5_calc_PRFplus'
>> /usr/bin/ld: net/rxrpc/rxgk_kdf.c:119: undefined reference to `crypto_krb5_prepare_encryption'
>> /usr/bin/ld: net/rxrpc/rxgk_kdf.c:162: undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:135: undefined reference to `crypto_krb5_prepare_checksum'
>> /usr/bin/ld: net/rxrpc/rxgk_kdf.c:(.text+0x81b): undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.o: in function `rxgk_set_up_token_cipher':
   net/rxrpc/rxgk_kdf.c:276: undefined reference to `crypto_krb5_find_enctype'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:280: undefined reference to `crypto_krb5_prepare_encryption'
   clang-16: error: linker command failed with exit code 1 (use -v to see invocation)


vim +222 net/rxrpc/rxgk_kdf.c

    48	
    49	/*
    50	 * Transport key derivation function.
    51	 *
    52	 *      TK = random-to-key(PRF+(K0, L,
    53	 *                         epoch || cid || start_time || key_number))
    54	 *      [tools.ietf.org/html/draft-wilkinson-afs3-rxgk-11 sec 8.3]
    55	 */
    56	static int rxgk_derive_transport_key(struct rxrpc_connection *conn,
    57					     struct rxgk_context *gk,
    58					     const struct rxgk_key *rxgk,
    59					     struct krb5_buffer *TK,
    60					     gfp_t gfp)
    61	{
    62		const struct krb5_enctype *krb5 = gk->krb5;
    63		struct krb5_buffer conn_info;
    64		unsigned int L = krb5->key_bytes;
    65		__be32 *info;
    66		u8 *buffer;
    67		int ret;
    68	
    69		_enter("");
    70	
    71		conn_info.len = sizeof(__be32) * 5;
    72	
    73		buffer = kzalloc(round16(conn_info.len), gfp);
    74		if (!buffer)
    75			return -ENOMEM;
    76	
    77		conn_info.data = buffer;
    78	
    79		info = (__be32 *)conn_info.data;
    80		info[0] = htonl(conn->proto.epoch);
    81		info[1] = htonl(conn->proto.cid);
    82		info[2] = htonl(conn->rxgk.start_time >> 32);
    83		info[3] = htonl(conn->rxgk.start_time >>  0);
    84		info[4] = htonl(gk->key_number);
    85	
  > 86		ret = crypto_krb5_calc_PRFplus(krb5, &rxgk->key, L, &conn_info, TK, gfp);
    87		kfree_sensitive(buffer);
    88		_leave(" = %d", ret);
    89		return ret;
    90	}
    91	
    92	/*
    93	 * Set up the ciphers for the usage keys.
    94	 */
    95	static int rxgk_set_up_ciphers(struct rxrpc_connection *conn,
    96				       struct rxgk_context *gk,
    97				       const struct rxgk_key *rxgk,
    98				       gfp_t gfp)
    99	{
   100		const struct krb5_enctype *krb5 = gk->krb5;
   101		struct crypto_shash *shash;
   102		struct crypto_aead *aead;
   103		struct krb5_buffer TK;
   104		bool service = rxrpc_conn_is_service(conn);
   105		int ret;
   106		u8 *buffer;
   107	
   108		buffer = kzalloc(krb5->key_bytes, gfp);
   109		if (!buffer)
   110			return -ENOMEM;
   111	
   112		TK.len = krb5->key_bytes;
   113		TK.data = buffer;
   114	
   115		ret = rxgk_derive_transport_key(conn, gk, rxgk, &TK, gfp);
   116		if (ret < 0)
   117			goto out;
   118	
 > 119		aead = crypto_krb5_prepare_encryption(krb5, &TK, RXGK_CLIENT_ENC_RESPONSE, gfp);
   120		if (IS_ERR(aead))
   121			goto aead_error;
   122		gk->resp_enc = aead;
   123	
   124		if (crypto_aead_blocksize(gk->resp_enc) != krb5->block_len ||
   125		    crypto_aead_authsize(gk->resp_enc) != krb5->cksum_len) {
   126			pr_notice("algo inconsistent with krb5 table %u!=%u or %u!=%u\n",
   127				  crypto_aead_blocksize(gk->resp_enc), krb5->block_len,
   128				  crypto_aead_authsize(gk->resp_enc), krb5->cksum_len);
   129			return -EINVAL;
   130		}
   131	
   132		if (service) {
   133			switch (conn->security_level) {
   134			case RXRPC_SECURITY_AUTH:
   135				shash = crypto_krb5_prepare_checksum(
   136					krb5, &TK, RXGK_SERVER_MIC_PACKET, gfp);
   137				if (IS_ERR(shash))
   138					goto hash_error;
   139				gk->tx_Kc = shash;
   140				shash = crypto_krb5_prepare_checksum(
   141					krb5, &TK, RXGK_CLIENT_MIC_PACKET, gfp);
   142				if (IS_ERR(shash))
   143					goto hash_error;
   144				gk->rx_Kc = shash;
   145				break;
   146			case RXRPC_SECURITY_ENCRYPT:
   147				aead = crypto_krb5_prepare_encryption(
   148					krb5, &TK, RXGK_SERVER_ENC_PACKET, gfp);
   149				if (IS_ERR(aead))
   150					goto aead_error;
   151				gk->tx_enc = aead;
   152				aead = crypto_krb5_prepare_encryption(
   153					krb5, &TK, RXGK_CLIENT_ENC_PACKET, gfp);
   154				if (IS_ERR(aead))
   155					goto aead_error;
   156				gk->rx_enc = aead;
   157				break;
   158			}
   159		} else {
   160			switch (conn->security_level) {
   161			case RXRPC_SECURITY_AUTH:
 > 162				shash = crypto_krb5_prepare_checksum(
   163					krb5, &TK, RXGK_CLIENT_MIC_PACKET, gfp);
   164				if (IS_ERR(shash))
   165					goto hash_error;
   166				gk->tx_Kc = shash;
   167				shash = crypto_krb5_prepare_checksum(
   168					krb5, &TK, RXGK_SERVER_MIC_PACKET, gfp);
   169				if (IS_ERR(shash))
   170					goto hash_error;
   171				gk->rx_Kc = shash;
   172				break;
   173			case RXRPC_SECURITY_ENCRYPT:
   174				aead = crypto_krb5_prepare_encryption(
   175					krb5, &TK, RXGK_CLIENT_ENC_PACKET, gfp);
   176				if (IS_ERR(aead))
   177					goto aead_error;
   178				gk->tx_enc = aead;
   179				aead = crypto_krb5_prepare_encryption(
   180					krb5, &TK, RXGK_SERVER_ENC_PACKET, gfp);
   181				if (IS_ERR(aead))
   182					goto aead_error;
   183				gk->rx_enc = aead;
   184				break;
   185			}
   186		}
   187	
   188		ret = 0;
   189	out:
   190		kfree_sensitive(buffer);
   191		return ret;
   192	aead_error:
   193		ret = PTR_ERR(aead);
   194		goto out;
   195	hash_error:
   196		ret = PTR_ERR(shash);
   197		goto out;
   198	}
   199	
   200	/*
   201	 * Derive a transport key for a connection and then derive a bunch of usage
   202	 * keys from it and set up ciphers using them.
   203	 */
   204	struct rxgk_context *rxgk_generate_transport_key(struct rxrpc_connection *conn,
   205							 const struct rxgk_key *key,
   206							 unsigned int key_number,
   207							 gfp_t gfp)
   208	{
   209		struct rxgk_context *gk;
   210		unsigned long lifetime;
   211		int ret = -ENOPKG;
   212	
   213		_enter("");
   214	
   215		gk = kzalloc(sizeof(*gk), GFP_KERNEL);
   216		if (!gk)
   217			return ERR_PTR(-ENOMEM);
   218		refcount_set(&gk->usage, 1);
   219		gk->key		= key;
   220		gk->key_number	= key_number;
   221	
 > 222		gk->krb5 = crypto_krb5_find_enctype(key->enctype);
   223		if (!gk->krb5)
   224			goto err_tk;
   225	
   226		ret = rxgk_set_up_ciphers(conn, gk, key, gfp);
   227		if (ret)
   228			goto err_tk;
   229	
   230		/* Set the remaining number of bytes encrypted with this key that may
   231		 * be transmitted before rekeying.  Note that the spec has been
   232		 * interpreted differently on this point...
   233		 */
   234		switch (key->bytelife) {
   235		case 0:
   236		case 63:
   237			gk->bytes_remaining = LLONG_MAX;
   238			break;
   239		case 1 ... 62:
   240			gk->bytes_remaining = 1LL << key->bytelife;
   241			break;
   242		default:
   243			gk->bytes_remaining = key->bytelife;
   244			break;
   245		}
   246	
   247		/* Set the time after which rekeying must occur */
   248		if (key->lifetime) {
   249			lifetime = min_t(u64, key->lifetime, INT_MAX / HZ);
   250			lifetime *= HZ;
   251		} else {
   252			lifetime = MAX_JIFFY_OFFSET;
   253		}
   254		gk->expiry = jiffies + lifetime;
   255		return gk;
   256	
   257	err_tk:
   258		rxgk_put(gk);
   259		_leave(" = %d", ret);
   260		return ERR_PTR(ret);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
