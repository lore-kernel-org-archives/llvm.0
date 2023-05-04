Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3191386;
	Thu,  4 May 2023 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683188413; x=1714724413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TlKcmFTlJNDQFRTqKNLCnVrDrInDcddmrrNlsjK8HhY=;
  b=AIElkm/dpnx1cD8t9YPpaMd8xZ46OastTDnK+JHO6K/pU10h2mRJ1rtC
   TRB0NY7YfRretIhzK/9+sKg9t9kKzJ2NG3VxsOfXdS+UqBW9BtD2IxVLc
   qUx7HIf9TW/xuesmmgW+oQY1RJoaViBTjCGX/ODWxLIc8Ynrfx5XEo/8K
   XFjxZPFkaxNiG8PlbbNz6JxaE5VE0gkWrv5JrZ3dp3a00cLXunY79biNF
   xBBPSZKq90BLQyJKsHzfGFEYF43QM8d7WTKX8m2cHea3T4Z4sMu0tJUCV
   iGJK6H37aacWNd0k3idIILPk2Zim8chn+aynwECr3RxmATQYJlukojYxJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333238859"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="333238859"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 01:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="647224226"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="647224226"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 May 2023 01:20:11 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puUCA-0002i0-1i;
	Thu, 04 May 2023 08:20:10 +0000
Date: Thu, 4 May 2023 16:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 17/21] net/rxrpc/rxgk.c:571:9: warning:
 variable 'resp_len' set but not used
Message-ID: <202305041638.gVqnL90S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   c2bc708ea35105bd4b41269dcc6296037f0272c6
commit: 8be0de0a71d068addc309ef72528238c7ecf340e [17/21] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230504/202305041638.gVqnL90S-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=8be0de0a71d068addc309ef72528238c7ecf340e
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs crypto-krb5
        git checkout 8be0de0a71d068addc309ef72528238c7ecf340e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/ drivers/net/ethernet/mellanox/mlx5/core/ net/rxrpc/ net/wireless/./

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041638.gVqnL90S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/rxgk.c:571:9: warning: variable 'resp_len' set but not used [-Wunused-but-set-variable]
           size_t resp_len, auth_len, authx_len, auth_offset, authx_offset;
                  ^
   1 warning generated.


vim +/resp_len +571 net/rxrpc/rxgk.c

   555	
   556	/*
   557	 * Construct the response.
   558	 *
   559	 * struct RXGK_Response {
   560	 *	rxgkTime start_time;
   561	 *	RXGK_Data token;
   562	 *	opaque authenticator<RXGK_MAXAUTHENTICATOR>
   563	 * };
   564	 */
   565	static int rxgk_construct_response(struct rxrpc_connection *conn,
   566					   struct sk_buff *challenge,
   567					   const u8 *nonce)
   568	{
   569		struct rxgk_context *gk;
   570		struct rxrpc_txbuf *txb;
 > 571		size_t resp_len, auth_len, authx_len, auth_offset, authx_offset;
   572		__be32 *xdr;
   573		int ret;
   574	
   575		gk = rxgk_get_key(conn, NULL);
   576		if (IS_ERR(gk))
   577			return PTR_ERR(gk);
   578	
   579		auth_len = 20 + 4 /* appdatalen */ + 12 + (1 + 4) * 4;
   580		authx_len = crypto_krb5_how_much_buffer(gk->krb5,
   581							KRB5_ENCRYPT_MODE, true,
   582							auth_len, &auth_offset);
   583	
   584		resp_len  = 8;
   585		resp_len += 4 + xdr_round_up(gk->key->ticket.len);
   586		resp_len += 4 + xdr_round_up(authx_len);
   587	
   588		ret = -ENOMEM;
   589		txb = rxrpc_alloc_response_txbuf(conn, challenge);
   590		if (!txb)
   591			goto error_gk;
   592	
   593		txb->wire.cksum = htons(gk->key_number);
   594		xdr = (void *)txb->data;
   595	
   596		*xdr++ = htonl(upper_32_bits(conn->rxgk.start_time));
   597		*xdr++ = htonl(lower_32_bits(conn->rxgk.start_time));
   598		*xdr++ = htonl(gk->key->ticket.len);
   599		memcpy(xdr, gk->key->ticket.data, xdr_round_up(gk->key->ticket.len));
   600		xdr += xdr_round_up(gk->key->ticket.len) / sizeof(*xdr);
   601		*xdr++ = htonl(authx_len);
   602	
   603		authx_offset = (u8 *)xdr - txb->data;
   604		auth_offset += authx_offset;
   605	
   606		xdr = (void *)txb->data + auth_offset;
   607		rxgk_construct_authenticator(conn, nonce, xdr);
   608	
   609		ret = rxgk_encrypt_txb(gk->krb5, &gk->resp_enc, txb,
   610				       authx_offset, authx_len,
   611				       auth_offset, auth_len, false);
   612		if (ret < 0)
   613			goto error;
   614	
   615		txb->len = authx_offset + ret;
   616	
   617		ret = rxgk_send_response(conn, txb);
   618	error:
   619		rxrpc_put_txbuf(txb, rxrpc_txbuf_put_response_tx);
   620	error_gk:
   621		rxgk_put(gk);
   622		_leave(" = %d", ret);
   623		return ret;
   624	}
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
