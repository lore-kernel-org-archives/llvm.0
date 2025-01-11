Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D692517A5BE;
	Sat, 11 Jan 2025 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736593723; cv=none; b=a96CUBSVNnCGynREF0kzswI7PMsKtOZhHah+Vh47VPiWUBGOCX3RjPuzXdtDMCwgW7G2/b8MC1vI61UXjSdXpX1u8oZjHo/YU3F+2/wuZrzZTlGLVGgh5m3+zZx1PMd054e3tKW4WphPMPXZqX46zwcN4W76fqosmMd4fGu5RmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736593723; c=relaxed/simple;
	bh=lMLO0dcUORssrKr9qrPFKNLYppk/gH1MfFcMjt+CV+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdJj2Y3G6rOZIDJgypHPRBdA/lV91iEQ1Nv/9Ds9IAH0U9uM3S0e1wZSKB62NPhJ0fsoB80MZAGS+1Xq0GxuA+3OoFCulwB74HG3rr9Nwuaf53RcKuG+rHjJ5xZdn3bwVgVluILTXq9rycN8R8Xlwdmdfz0AGJ939gEENIMkjGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVtGEGer; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVtGEGer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736593721; x=1768129721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lMLO0dcUORssrKr9qrPFKNLYppk/gH1MfFcMjt+CV+8=;
  b=IVtGEGerHRZ9r7cH815n6kbry8ccpsLa2edwPdZd3w/MzgpogMXDmEZ+
   0RdvYRNfqq7T2NXhPDtaZkfheV90e6NvEBOU5FLyYNZeg0sZhgJ/UXUM+
   NMFPXue3a4XHwkHN1jj5xFUo5F/TiL4IxkVlHIUKOML/brka5xBzQ6eVj
   sTt0C3CFdqmHJSYHKTEP/KzRYlYFpb+DjgHlMttYqn/l2pyCFLJjcoD0r
   D8KkN2AMaIgj3M83Qf2sQNodwxq04d+pTKEFxCrvBj7WVhwdRlqFQKjso
   oaIXpVh4l5H2uT9y+F643hIRdFo3lqLd+IanxVtmw1OQaHzNjubtKafxs
   Q==;
X-CSE-ConnectionGUID: 5On1ypo5Sxa5/VKZHxbN1w==
X-CSE-MsgGUID: TzUbNtVRSA2zVesuAu8bgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24489598"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="24489598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 03:08:40 -0800
X-CSE-ConnectionGUID: fyu+Ga14SZuN9rWEqVVHdQ==
X-CSE-MsgGUID: okqjJf/JTsKU9sZfmLzrsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104486946"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2025 03:08:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZM4-000KZ3-0h;
	Sat, 11 Jan 2025 11:08:36 +0000
Date: Sat, 11 Jan 2025 19:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:lkp_test 267/504]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:312:6: warning: stack frame
 size (1032) exceeds limit (1024) in 'xlnx_hdcp2x_tx_compute_hprime'
Message-ID: <202501111807.GgRdE5tE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 6c8caf3eeadd38ffab47f6cfb7dba45556256143 [267/504] drm: xlnx: Add HDCP2X TX support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111807.GgRdE5tE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111807.GgRdE5tE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111807.GgRdE5tE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:312:6: warning: stack frame size (1032) exceeds limit (1024) in 'xlnx_hdcp2x_tx_compute_hprime' [-Wframe-larger-than]
     312 | void xlnx_hdcp2x_tx_compute_hprime(const u8 *r_rx, const u8 *rxcaps,
         |      ^
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:380:6: warning: stack frame size (1040) exceeds limit (1024) in 'xlnx_hdcp2x_tx_compute_lprime' [-Wframe-larger-than]
     380 | void xlnx_hdcp2x_tx_compute_lprime(const u8 *rn, const u8 *km,
         |      ^
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:411:6: warning: stack frame size (1192) exceeds limit (1024) in 'xlnx_hdcp2x_tx_compute_v' [-Wframe-larger-than]
     411 | void xlnx_hdcp2x_tx_compute_v(const u8 *rn, const u8 *r_rx, const u8 *rx_info,
         |      ^
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:446:6: warning: stack frame size (1216) exceeds limit (1024) in 'xlnx_hdcp2x_tx_compute_m' [-Wframe-larger-than]
     446 | void xlnx_hdcp2x_tx_compute_m(const u8 *rn, const u8 *r_rx, const u8 *r_tx,
         |      ^
   4 warnings generated.


vim +/xlnx_hdcp2x_tx_compute_hprime +312 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c

   311	
 > 312	void xlnx_hdcp2x_tx_compute_hprime(const u8 *r_rx, const u8 *rxcaps,
   313					   const u8 *r_tx, const u8 *txcaps,
   314					   const u8 *km, u8 *hprime)
   315	{
   316		u8 kd[HDCP2X_TX_DKEY_SIZE * HDCP2X_TX_AES128_SIZE] = {0};
   317		u8 aes_iv[HDCP2X_TX_AES128_SIZE] = {0};
   318		u8 aes_key[HDCP2X_TX_AES128_SIZE] = {0};
   319		u8 hash_input[HDCP_2_2_RTX_LEN + HDCP_2_2_RXCAPS_LEN +
   320					HDCP2X_TX_TXCAPS_SIZE] = {0};
   321		int idx = 0;
   322	
   323		memcpy(aes_key, km, HDCP2X_TX_KM_SIZE);
   324		memcpy(aes_iv, r_tx, HDCP_2_2_RTX_LEN);
   325		memcpy(&aes_iv[HDCP_2_2_RTX_LEN], r_rx, HDCP_2_2_RRX_LEN);
   326	
   327		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, kd);
   328	
   329		/* Determine dkey1, counter is 1: Rrx | 0x01. */
   330	
   331		/*
   332		 * Reference: Section 2.7.1: Key derivation
   333		 * https://www.digital-cp.com/sites/default/files/HDCP%20on%20DisplayPort%20Specification%20Rev2_3.pdf
   334		 */
   335		aes_iv[HDCP2X_TX_DKEY] ^= HDCP2X_TX_DKEY_CTR1;
   336	
   337		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, &kd[HDCP2X_TX_KM_SIZE]);
   338		memcpy(hash_input, r_tx, HDCP_2_2_RTX_LEN);
   339		idx += HDCP_2_2_RTX_LEN;
   340		memcpy(&hash_input[idx], rxcaps, HDCP_2_2_RXCAPS_LEN);
   341		idx += HDCP_2_2_RXCAPS_LEN;
   342		memcpy(&hash_input[idx], txcaps, HDCP2X_TX_TXCAPS_SIZE);
   343	
   344		xlnx_hdcp2x_cmn_hmac_sha256_hash(hash_input, sizeof(hash_input), kd,
   345						 sizeof(kd), hprime);
   346	}
   347	
   348	void xlnx_hdcp2x_tx_compute_edkey_ks(const u8 *rn, const u8 *km, const u8 *ks,
   349					     const u8 *r_rx, const u8 *r_tx,
   350					     u8 *encrypted_ks)
   351	{
   352		u8 aes_iv[HDCP2X_TX_AES128_SIZE] = {0};
   353		u8 aes_key[HDCP2X_TX_AES128_SIZE] = {0};
   354		u8 dkey2[HDCP2X_TX_AES128_SIZE] = {0};
   355	
   356		memcpy(&aes_key[HDCP_2_2_RN_LEN], rn, HDCP_2_2_RN_LEN);
   357	
   358		xlnx_hdcp2x_tx_memxor(aes_key, aes_key, km, HDCP2X_TX_KM_SIZE);
   359	
   360		/* Determine dkey2. */
   361		/* Add m = Rtx || Rrx. */
   362		memcpy(aes_iv, r_tx, HDCP_2_2_RTX_LEN);
   363		memcpy(&aes_iv[HDCP_2_2_RTX_LEN], r_rx, HDCP_2_2_RRX_LEN);
   364	
   365		aes_iv[HDCP2X_TX_DKEY] ^= HDCP2X_TX_DKEY_CTR2;
   366	
   367		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, dkey2);
   368	
   369		/* EdkeyKs = Ks XOR (Dkey2 XOR Rrx). */
   370		/* Rrx XOR Dkey2. */
   371		memset(encrypted_ks, 0, HDCP_2_2_E_DKEY_KS_LEN);
   372	
   373		memcpy(&encrypted_ks[HDCP_2_2_E_DKEY_KS_LEN - HDCP_2_2_RRX_LEN], r_rx,
   374		       HDCP_2_2_RRX_LEN);
   375	
   376		xlnx_hdcp2x_tx_memxor(encrypted_ks, encrypted_ks, dkey2, HDCP2X_TX_AES128_SIZE);
   377		xlnx_hdcp2x_tx_memxor(encrypted_ks, encrypted_ks, ks, HDCP2X_TX_KS_SIZE);
   378	}
   379	
 > 380	void xlnx_hdcp2x_tx_compute_lprime(const u8 *rn, const u8 *km,
   381					   const u8 *r_rx, const u8 *r_tx,
   382					   u8 *lprime)
   383	{
   384		u8 hash_key[HDCP2X_TX_SHA256_HASH_SIZE] = {0};
   385		u8 aes_iv[HDCP2X_TX_AES128_SIZE] = {0};
   386		u8 aes_key[HDCP2X_TX_AES128_SIZE] = {0};
   387		u8 kd[HDCP2X_TX_DKEY_SIZE * HDCP2X_TX_AES128_SIZE] = {0};
   388	
   389		memcpy(aes_key, km, HDCP2X_TX_KM_SIZE);
   390		memcpy(aes_iv, r_tx, HDCP_2_2_RTX_LEN);
   391		memcpy(&aes_iv[HDCP_2_2_RTX_LEN], r_rx, HDCP_2_2_RRX_LEN);
   392	
   393		/* Compute Dkey0. */
   394		/* Add m = Rtx || Rrx. */
   395		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, kd);
   396	
   397		/* Compute Dkey , counter is 1: Rrx | 0x01. */
   398		aes_iv[HDCP2X_TX_DKEY] ^= HDCP2X_TX_DKEY_CTR1;
   399		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, &kd[HDCP2X_TX_KM_SIZE]);
   400	
   401		/* Create hash with HMAC-SHA256. */
   402		/* Key:	Kd XOR Rrx (least sign. 64 bits). */
   403		memcpy(&hash_key[HDCP2X_TX_SHA256_HASH_SIZE - HDCP_2_2_RRX_LEN], r_rx,
   404		       HDCP_2_2_RRX_LEN);
   405	
   406		xlnx_hdcp2x_tx_memxor(hash_key, hash_key, kd, HDCP2X_TX_SHA256_HASH_SIZE);
   407		xlnx_hdcp2x_cmn_hmac_sha256_hash(rn, HDCP_2_2_RN_LEN, hash_key,
   408						 HDCP2X_TX_SHA256_HASH_SIZE, lprime);
   409	}
   410	
 > 411	void xlnx_hdcp2x_tx_compute_v(const u8 *rn, const u8 *r_rx, const u8 *rx_info,
   412				      const u8 *r_tx, const u8 *rcvid_list, const u8 rcvid_count,
   413				      const u8 *seq_num_v, const u8 *km, u8 *hash_v)
   414	{
   415		u8 kd[HDCP2X_TX_DKEY_SIZE * HDCP2X_TX_AES128_SIZE] = {0};
   416		u8 aes_iv[HDCP2X_TX_AES128_SIZE] = {0};
   417		u8 aes_key[HDCP2X_TX_AES128_SIZE] = {0};
   418		u8 hash_input[(HDCP_2_2_MAX_DEVICE_COUNT * HDCP_2_2_RECEIVER_ID_LEN) +
   419					  HDCP_2_2_RXINFO_LEN + HDCP_2_2_SEQ_NUM_LEN];
   420		int idx = 0;
   421	
   422		memcpy(aes_key, km, HDCP2X_TX_KM_SIZE);
   423	
   424		/* Determine Dkey. */
   425		/* Add m = Rtx || Rrx. */
   426		memcpy(aes_iv, r_tx, HDCP_2_2_RTX_LEN);
   427		memcpy(&aes_iv[HDCP_2_2_RTX_LEN], r_rx, HDCP_2_2_RRX_LEN);
   428	
   429		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, kd);
   430	
   431		aes_iv[HDCP2X_TX_DKEY] ^= HDCP2X_TX_DKEY_CTR1;
   432		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, &kd[HDCP2X_TX_KM_SIZE]);
   433	
   434		/* Create hash with HMAC-SHA256. */
   435		/* Input: ReceiverID list || RxInfo || seq_num_V. */
   436		memcpy(hash_input, rcvid_list, (rcvid_count * HDCP_2_2_RECEIVER_ID_LEN));
   437		idx += (rcvid_count * HDCP_2_2_RECEIVER_ID_LEN);
   438		memcpy(&hash_input[idx], rx_info, HDCP_2_2_RXINFO_LEN);
   439		idx += HDCP_2_2_RXINFO_LEN;
   440		memcpy(&hash_input[idx], seq_num_v, HDCP_2_2_SEQ_NUM_LEN);
   441		idx += HDCP_2_2_SEQ_NUM_LEN;
   442	
   443		xlnx_hdcp2x_cmn_hmac_sha256_hash(hash_input, idx, kd, sizeof(kd), hash_v);
   444	}
   445	
 > 446	void xlnx_hdcp2x_tx_compute_m(const u8 *rn, const u8 *r_rx, const u8 *r_tx,
   447				      const u8 *stream_id_type, const u8 *k,
   448				      const u8 *seq_num_m, const u8 *km, u8 *m_hash)
   449	{
   450		u8 aes_iv[HDCP2X_TX_AES128_SIZE];
   451		u8 aes_key[HDCP2X_TX_AES128_SIZE];
   452		u8 kd[HDCP2X_TX_DKEY_SIZE * HDCP2X_TX_AES128_SIZE];
   453		u8 sha256_kd[HDCP2X_TX_SHA256_HASH_SIZE];
   454		u8 hash_input[(HDCP_2_2_MAX_DEVICE_COUNT * HDCP_2_2_RECEIVER_ID_LEN) +
   455					  HDCP_2_2_RXINFO_LEN + HDCP_2_2_SEQ_NUM_LEN];
   456		u16 stream_id_count;
   457		int idx = 0;
   458	
   459		stream_id_count  = k[0] << BITS_PER_BYTE;
   460		stream_id_count |= k[1];
   461	
   462		memcpy(aes_key, km, HDCP2X_TX_KM_SIZE);
   463		memcpy(aes_iv, r_tx, HDCP_2_2_RTX_LEN);
   464		memcpy(&aes_iv[HDCP_2_2_RTX_LEN], r_rx, HDCP_2_2_RRX_LEN);
   465	
   466		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, kd);
   467	
   468		/* Determine Dkey0. */
   469		/* Add m = Rtx || Rrx. */
   470		aes_iv[HDCP2X_TX_DKEY] ^= HDCP2X_TX_DKEY_CTR1;
   471	
   472		xlnx_hdcp2x_tx_aes128_encrypt(aes_iv, aes_key, &kd[HDCP2X_TX_KM_SIZE]);
   473	
   474		sha256(kd, sizeof(kd), sha256_kd);
   475	
   476		/* Create hash with HMAC-SHA256. */
   477		/* Input: StreamID_Type list || seq_num_M. */
   478		memcpy(hash_input, stream_id_type, (stream_id_count * HDCP2X_TX_STREAMID_TYPE_SIZE));
   479		idx += (stream_id_count * HDCP2X_TX_STREAMID_TYPE_SIZE);
   480		memcpy(&hash_input[idx], seq_num_m, HDCP_2_2_SEQ_NUM_LEN);
   481		idx += HDCP_2_2_SEQ_NUM_LEN;
   482	
   483		/* HashKey:	SHA256(Kd) */
   484		xlnx_hdcp2x_cmn_hmac_sha256_hash(hash_input, idx, sha256_kd, sizeof(sha256_kd), m_hash);
   485	}
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
