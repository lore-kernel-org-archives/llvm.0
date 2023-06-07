Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58119E48;
	Wed,  7 Jun 2023 20:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686170504; x=1717706504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uftjOoHEVHjSt5xFq/Lh6vx4HKxsNGcPu8TUt7fTMiM=;
  b=STtOlUmhblQXGSLjkXJeTL3Jmceg86It3R427UXxPwkt3d09addqd2VK
   aqnEaVVaqS9UxtzQ7OPy5svsPxW1xsdvFT/tFJ+N35DPZNFtYO9iKBXIb
   k9g3PtVJAoATvKvHbbmy83b8Vhw9DhGOtrbU+1L9x/lPsAtWrJ9RlJc84
   BOkuIHSxsCTOob1gsRLW7OPeC9MODDb6H9eZdI3q886syXbPdYA2kk4Pl
   Rb4IOB8MGU7eoxULwVOP8eepL6ha7FmSnoNnlsR7iGau1Zw1n2j6Pvqfh
   HgyEJszmlAbTHIFOVXP2OqIsJ6CKmIut1/Cb+UVfXkuT5XydzK2Md2g8G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357113640"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="357113640"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739421898"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="739421898"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 13:41:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6zyP-0006tn-27;
	Wed, 07 Jun 2023 20:41:41 +0000
Date: Thu, 8 Jun 2023 04:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 18/19] net/rxrpc/rxgk.c:571:9: warning:
 variable 'resp_len' set but not used
Message-ID: <202306080410.sd36jHfY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   5b181cb5852b03279d830e9d98cdc20ae1ca6e8e
commit: 0a4f5f1d27250fe42cd28c0729377a5351a07e5b [18/19] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230608/202306080410.sd36jHfY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=0a4f5f1d27250fe42cd28c0729377a5351a07e5b
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs crypto-krb5
        git checkout 0a4f5f1d27250fe42cd28c0729377a5351a07e5b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash net/rxrpc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080410.sd36jHfY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/rxgk.c:571:9: warning: variable 'resp_len' set but not used [-Wunused-but-set-variable]
     571 |         size_t resp_len, auth_len, authx_len, auth_offset, authx_offset;
         |                ^
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
https://github.com/intel/lkp-tests/wiki
