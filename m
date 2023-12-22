Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162BF5390;
	Fri, 22 Dec 2023 02:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+IFMPRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703213170; x=1734749170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xf/mMH0ST+yWfggvC5/2irardo9FhDwinjdTsrUUo7k=;
  b=L+IFMPRZISXrD7rFbUIE9Uit/5sIFQqAfJrt2xdyQDjnH/jKhzR+uoaj
   eH9lwqlKdvliv2XklZwUTUC+wqZiezty72OtsEjGKEWaf39V03MGahQ9U
   NOgKL+UJ/InNZI1/hq4xSPavLWIOyviD2JY8Hrc5x9s0aW3nIVCGRsOI/
   moYgQrt6rabo/cdw9H6ezYr+sCHmCs9aKZTHPoEB/VlvlT3k7qoImmsnG
   54IoPKNKEoghxfYe0IUHz7fXEJRgGL3RdULpIgXbSUs8h+vajNdjqSPdB
   HR2m7ixd0juv2hzVhIdcELXX9D6V2B8QnqbpQazyjelK3CoXYDpDXhgiW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482247260"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="482247260"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 18:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="900299118"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="900299118"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Dec 2023 18:46:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGVXW-000905-3A;
	Fri, 22 Dec 2023 02:45:42 +0000
Date: Fri, 22 Dec 2023 10:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 20/21] net/rxrpc/rxgk.c:571:9: warning:
 variable 'resp_len' set but not used
Message-ID: <202312221032.BPpSks5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ebd44e15422341724b06a3a13590ea80244ebbd6
commit: 02c20ee3703d16be4432d0632130d7b8c9ea6558 [20/21] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231222/202312221032.BPpSks5L-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312221032.BPpSks5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312221032.BPpSks5L-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
