Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A732905;
	Fri, 10 Jan 2025 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736495963; cv=none; b=TdkjWqrsYKfdQBeA7xMdRSXjYWqZ7ZBQEWK2SbgXYqXUSoK06VJUjaOMby/agFIcR8Epsgy8EIXHc//wGtzEBUiWd3litDcCmkGFDiD5B3F8NBU0+zeGN3Dq8fFo4Q2f/iRVopXE4I2uVuq5ZrNhKNQoaXQ44+ihwKICkd1+4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736495963; c=relaxed/simple;
	bh=CL+9NSfE86phmorBspVEklgwaQ1XY7oI27A5P1AtJI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IfYVbcq+4PG5yfFVTXUTMQ65Y6CJ8LhPKpmlUnoDzCz0t5P/3fhBlaN8cEOiku60ppZxKX9GduAlUgbmHO61DcDed1YXYcIlX4EdGmScPJ8CPm8pUIlMHaiAUeBErpf2JasfEoEwfx+JtOW8TegLOa1YVlnfuxXxdD7/+Fdol2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcDsrgqA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcDsrgqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736495961; x=1768031961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CL+9NSfE86phmorBspVEklgwaQ1XY7oI27A5P1AtJI0=;
  b=kcDsrgqApz3aCOy/7QpxF2UL7EKcNsGSFIKw25wTWVCIJRhtx+N8H+V7
   bCZrdVeWZxsSMUF/vQHgUhz1N0Wkydz+hBny9UbWlI6FRgZZZaZZRjbxN
   fDyQlqtP3YUgAm5zsBD2H7IwycXjrw3hUqTPS9+2uOpFTSPcHMcIrqxlW
   a+qV+YYxsnfPO3F2n2NxvPWSiKWqCOYFAbBqu9ZrA9D1j+eRMhMat/o+m
   pPo7X9Eqiwnw6u2H/oaM+bOkkuGFdJ4OwcO23OkU08JA/f6rMrPKVhpmB
   ZO9v/gCJjWZ3dduQf2Mg6qLebK/5wMRhZOlap1LL8gxIpRW6Zr7I/rx6x
   w==;
X-CSE-ConnectionGUID: 9dJ+TWO4Rl2wDurqcK8Gpg==
X-CSE-MsgGUID: kJiV9z19QV2+hLwJudl3Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47356868"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47356868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:59:20 -0800
X-CSE-ConnectionGUID: 1sPwJTWuQK28n3TXMp182A==
X-CSE-MsgGUID: NemNl9ldQ8udfo5gmcOh8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104543911"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 23:59:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW9vH-000Il5-2o;
	Fri, 10 Jan 2025 07:59:15 +0000
Date: Fri, 10 Jan 2025 15:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 7/8] net/rxrpc/rxgk.c:273:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202501101527.4qvP3A25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ad756dd9570d147bf6f5b832ac77ae6da3efd9ac
commit: fef4a8151b43e59534979d2cfa6cb2e56e967c04 [7/8] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501101527.4qvP3A25-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101527.4qvP3A25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101527.4qvP3A25-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rxrpc/rxgk.c:10:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> net/rxrpc/rxgk.c:273:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     273 |         if (!req)
         |             ^~~~
   net/rxrpc/rxgk.c:310:9: note: uninitialized use occurs here
     310 |         return ret;
         |                ^~~
   net/rxrpc/rxgk.c:273:2: note: remove the 'if' if its condition is always false
     273 |         if (!req)
         |         ^~~~~~~~~
     274 |                 goto error_gk;
         |                 ~~~~~~~~~~~~~
   net/rxrpc/rxgk.c:267:9: note: initialize the variable 'ret' to silence this warning
     267 |         int ret;
         |                ^
         |                 = 0
   net/rxrpc/rxgk.c:435:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     435 |         if (!req)
         |             ^~~~
   net/rxrpc/rxgk.c:494:9: note: uninitialized use occurs here
     494 |         return ret;
         |                ^~~
   net/rxrpc/rxgk.c:435:2: note: remove the 'if' if its condition is always false
     435 |         if (!req)
         |         ^~~~~~~~~
     436 |                 goto error_gk;
         |                 ~~~~~~~~~~~~~
   net/rxrpc/rxgk.c:429:9: note: initialize the variable 'ret' to silence this warning
     429 |         int ret;
         |                ^
         |                 = 0
   5 warnings generated.


vim +273 net/rxrpc/rxgk.c

   253	
   254	/*
   255	 * wholly encrypt a packet (level 2 security)
   256	 */
   257	static int rxgk_secure_packet_encrypted(const struct rxrpc_call *call,
   258						struct rxgk_context *gk,
   259						struct rxrpc_txbuf *txb)
   260	{
   261		struct rxrpc_wire_header *whdr = txb->kvec[0].iov_base;
   262		struct aead_request *req;
   263		struct rxgk_header *hdr;
   264		struct scatterlist sg[1];
   265		size_t data_offset, data_len;
   266		void *payload = whdr + 1;
   267		int ret;
   268	
   269		_enter("%x", txb->len);
   270	
   271		req = kzalloc(sizeof(*req) + crypto_aead_reqsize(gk->tx_crypto),
   272			      GFP_NOFS);
 > 273		if (!req)
   274			goto error_gk;
   275	
   276		data_len = sizeof(*hdr) + txb->len;
   277		txb->pkt_len = crypto_krb5_how_much_buffer(gk->krb5, KRB5_ENCRYPT_MODE,
   278							   data_len, &data_offset);
   279	
   280		/* Insert the header into the buffer. */
   281		hdr = payload + txb->crypto_header;
   282		hdr->epoch	 = htonl(call->conn->proto.epoch);
   283		hdr->cid	 = htonl(call->cid);
   284		hdr->call_number = htonl(call->call_id);
   285		hdr->seq	 = htonl(txb->seq);
   286		hdr->sec_index	 = htonl(call->security_ix);
   287		hdr->data_len	 = htonl(txb->len);
   288	
   289		sg_init_one(&sg[0], payload, txb->pkt_len);
   290		ret = crypto_krb5_confound_buffer(gk->krb5, sg, 1, NULL, 0, 0);
   291		if (ret < 0)
   292			goto error;
   293	
   294		aead_request_set_tfm(req, gk->tx_crypto);
   295		aead_request_set_crypt(req, sg, sg, data_offset + data_len, NULL);
   296	
   297		ret = crypto_aead_encrypt(req);
   298		if (ret < 0)
   299			goto error;
   300	
   301		if (txb->pkt_len == RXRPC_JUMBO_DATALEN)
   302			txb->jumboable = true;
   303		gk->bytes_remaining -= txb->pkt_len;
   304	
   305	error:
   306		aead_request_free(req);
   307	error_gk:
   308		rxgk_put(gk);
   309		_leave(" = %d", ret);
   310		return ret;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
