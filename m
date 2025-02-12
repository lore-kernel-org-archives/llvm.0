Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02221E097;
	Wed, 12 Feb 2025 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739383529; cv=none; b=DhsLwU69rtC/ES2FL++k6+2MfRaOVBRI16cdi+MpOiWG3bYRVPAppJ8iPxQ2PNNjRI2PGDaG3zSIvBwKBv3c+iqZKjpSwpO2DC1gA7xDlaijLlucwSph7HkgfBQC/9V5/6NFgoDNyurUaGBONWWQEiycnu17RCRcUwic02FpAXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739383529; c=relaxed/simple;
	bh=RV2cLmZGAArsHsGdAXhus8p1rraOzCJhve1FZzYK4eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCf/ezYDw++tN+PbGGV3ju6P5Js7WfURl9q9u8zUADWfGmbenZJeXUUXnlexns6LNU8cX9csSmA+d6IEkJZEksVh5HTcUWKgFIUCQKvjD9rgsh8g+cOdOokz07yMTGIIO8vsGiFUNKQzbH3sU16RWe019mGQzzrLcAskCEzeWgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAodhzxJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAodhzxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739383527; x=1770919527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RV2cLmZGAArsHsGdAXhus8p1rraOzCJhve1FZzYK4eM=;
  b=hAodhzxJITK7VTKiiTHQd23fUTW4+f0XP0SFAP5lDDB6oa/9gVTjawg6
   ou5jPbl9OWpwHVlxPuSrJZWrtqPhdC9HxqkAUhbTB7Ahyc4MFR63bWKNA
   SC6rTSj2TlyBxFHM191G13VxHyYin8ysU13kv984a/i/lhw0oUuM8cuYj
   1Y3I6nM6Y+qb5GP+Hsyxv0HSiXXX/D+nE7Y4SEVEfrpDmURoJyjhih6W3
   VW1Y8tampOkTZSHc9xwadJpEqvVAQnisLAkoc1vXAylvy8Wxs6/mklwC2
   3NZ9kms7s+cAV1UwFA/Ol//13cn3raptzfvCyYX5h7Lj4Q1gaPUkQjvLv
   Q==;
X-CSE-ConnectionGUID: LNtkpynYSK6A3japaqoxIg==
X-CSE-MsgGUID: amxXGifzTvqp0TxHhGEZsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51451608"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51451608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 10:05:27 -0800
X-CSE-ConnectionGUID: qAdNEkDSQamHC4YunivStw==
X-CSE-MsgGUID: q8HNT0vPSE+KUvi3T89TTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="113097370"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Feb 2025 10:05:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiH6x-0015yT-0h;
	Wed, 12 Feb 2025 18:05:23 +0000
Date: Thu, 13 Feb 2025 02:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 26/35] net/rxrpc/rxgk.c:775: undefined
 reference to `crypto_krb5_how_much_buffer'
Message-ID: <202502130128.JOpAphQO-lkp@intel.com>
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
commit: c6399639cff4828254a86da8a82edfdcf3945e88 [26/35] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: um-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250213/202502130128.JOpAphQO-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130128.JOpAphQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130128.JOpAphQO-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_respond_to_challenge':
>> net/rxrpc/rxgk.c:775: undefined reference to `crypto_krb5_how_much_buffer'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_encrypt_authenticator':
>> net/rxrpc/rxgk.c:746: undefined reference to `crypto_krb5_encrypt'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_preparse_server_key':
>> net/rxrpc/rxgk.c:36: undefined reference to `crypto_krb5_find_enctype'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_alloc_txbuf':
>> net/rxrpc/rxgk.c:164: undefined reference to `crypto_krb5_how_much_data'
>> /usr/bin/ld: net/rxrpc/rxgk.c:168: undefined reference to `crypto_krb5_how_much_buffer'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_secure_packet':
   net/rxrpc/rxgk.c:265: undefined reference to `crypto_krb5_encrypt'
>> /usr/bin/ld: net/rxrpc/rxgk.c:224: undefined reference to `crypto_krb5_get_mic'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_verify_packet':
>> net/rxrpc/rxgk.c:334: undefined reference to `crypto_krb5_where_is_the_data'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_decrypt_skb':
>> net/rxrpc/rxgk_common.h:84: undefined reference to `crypto_krb5_decrypt'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_verify_mic_skb':
>> net/rxrpc/rxgk_common.h:123: undefined reference to `crypto_krb5_verify_mic'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_decrypt_skb':
>> net/rxrpc/rxgk_common.h:84: undefined reference to `crypto_krb5_decrypt'
   /usr/bin/ld: net/rxrpc/rxgk_app.o: in function `rxgk_decrypt_skb':
>> net/rxrpc/rxgk_common.h:84: undefined reference to `crypto_krb5_decrypt'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.o: in function `rxgk_generate_transport_key':
   net/rxrpc/rxgk_kdf.c:222: undefined reference to `crypto_krb5_find_enctype'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:86: undefined reference to `crypto_krb5_calc_PRFplus'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:119: undefined reference to `crypto_krb5_prepare_encryption'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:162: undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:135: undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:(.text+0x81b): undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.o: in function `rxgk_set_up_token_cipher':
   net/rxrpc/rxgk_kdf.c:276: undefined reference to `crypto_krb5_find_enctype'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:280: undefined reference to `crypto_krb5_prepare_encryption'
   clang-16: error: linker command failed with exit code 1 (use -v to see invocation)


vim +775 net/rxrpc/rxgk.c

   730	
   731	static ssize_t rxgk_encrypt_authenticator(struct rxrpc_connection *conn,
   732						  struct rxgk_context *gk,
   733						  struct sk_buff *response,
   734						  size_t offset,
   735						  size_t alloc_len,
   736						  size_t auth_offset,
   737						  size_t auth_len)
   738	{
   739		struct scatterlist sg[16];
   740		int nr_sg;
   741	
   742		sg_init_table(sg, ARRAY_SIZE(sg));
   743		nr_sg = skb_to_sgvec(response, sg, offset, alloc_len);
   744		if (unlikely(nr_sg < 0))
   745			return nr_sg;
 > 746		return crypto_krb5_encrypt(gk->krb5, gk->resp_enc, sg, nr_sg, alloc_len,
   747					   auth_offset, auth_len, false);
   748	}
   749	
   750	/*
   751	 * Construct the response.
   752	 *
   753	 * struct RXGK_Response {
   754	 *	rxgkTime start_time;
   755	 *	RXGK_Data token;
   756	 *	opaque authenticator<RXGK_MAXAUTHENTICATOR>
   757	 * };
   758	 */
   759	static int rxgk_construct_response(struct rxrpc_connection *conn,
   760					   struct sk_buff *challenge,
   761					   struct krb5_buffer *appdata)
   762	{
   763		struct rxrpc_skb_priv *csp, *rsp;
   764		struct rxgk_context *gk;
   765		struct sk_buff *response;
   766		size_t len, auth_len, authx_len, offset, auth_offset, authx_offset;
   767		__be32 tmp;
   768		int ret;
   769	
   770		gk = rxgk_get_key(conn, NULL);
   771		if (IS_ERR(gk))
   772			return PTR_ERR(gk);
   773	
   774		auth_len = 20 + (4 + appdata->len) + 12 + (1 + 4) * 4;
 > 775		authx_len = crypto_krb5_how_much_buffer(gk->krb5, KRB5_ENCRYPT_MODE,
   776							auth_len, &auth_offset);
   777		len = sizeof(struct rxrpc_wire_header) +
   778			8 + (4 + xdr_round_up(gk->key->ticket.len)) + (4 + authx_len);
   779	
   780		response = alloc_skb_with_frags(0, len, 0, &ret, GFP_NOFS);
   781		if (!response)
   782			goto error;
   783		rxrpc_new_skb(response, rxrpc_skb_new_response_rxgk);
   784		response->len = len;
   785		response->data_len = len;
   786	
   787		ret = rxgk_insert_response_header(conn, gk, response, 0);
   788		if (ret < 0)
   789			goto error;
   790		offset = ret;
   791	
   792		ret = skb_store_bits(response, offset, gk->key->ticket.data, gk->key->ticket.len);
   793		if (ret < 0)
   794			goto error;
   795		offset += gk->key->ticket.len;
   796		ret = rxgk_pad_out(response, gk->key->ticket.len, offset);
   797		if (ret < 0)
   798			goto error;
   799	
   800		authx_offset = offset + ret + 4; /* Leave a gap for the length. */
   801	
   802		ret = rxgk_construct_authenticator(conn, challenge, appdata, response,
   803						   authx_offset + auth_offset);
   804		if (ret < 0)
   805			goto error;
   806		auth_len = ret;
   807	
   808		ret = rxgk_encrypt_authenticator(conn, gk, response,
   809						 authx_offset, authx_len,
   810						 auth_offset, auth_len);
   811		if (ret < 0)
   812			goto error;
   813		authx_len = ret;
   814	
   815		tmp = htonl(authx_len);
   816		ret = skb_store_bits(response, authx_offset - 4, &tmp, 4);
   817		if (ret < 0)
   818			goto error;
   819	
   820		ret = rxgk_pad_out(response, authx_len, authx_offset + authx_len);
   821		if (ret < 0)
   822			return ret;
   823		len = authx_offset + authx_len + ret;
   824	
   825		if (len != response->len) {
   826			response->len = len;
   827			response->data_len = len;
   828		}
   829	
   830		csp = rxrpc_skb(challenge);
   831		rsp = rxrpc_skb(response);
   832		rsp->resp.len = len;
   833		rsp->resp.challenge_serial = csp->hdr.serial;
   834		rxrpc_post_response(conn, response);
   835		response = NULL;
   836		ret = 0;
   837	
   838	error:
   839		rxrpc_free_skb(response, rxrpc_skb_put_response);
   840		rxgk_put(gk);
   841		_leave(" = %d", ret);
   842		return ret;
   843	}
   844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
