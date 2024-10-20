Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169E746E;
	Sun, 20 Oct 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729419822; cv=none; b=WzbVjLykKjemFiVh/hUDj5Ibvop8Jf+5tWVhpec7ZKNQZgXWZkqrMPzeFcatmOk/2cd4rk8FFswKxOZwo/UROYJUrAA1wmXYQ+nVcBMJHbWxVrv5xLruJvYaAXs2CXEQg2n3MA8XH1jfXVrRV4tgxZW6sujEsIOxNYXez7eNnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729419822; c=relaxed/simple;
	bh=t1sjoxj/ZlwXoBK71kdZbxG6cQlsnq6kUB93/1OMWDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYQj5RqPU8ntRbXIb42/wTJWyKM9RH3B20kxq1weJnkgvE1JdjfPwuQ474HwOKpEpvJPPQQBDNNy10cSdKMiLZrTMhey/S04yLI6r/V1fdE6MYp9uPHLrRAS1j4XZvQz1QmwSpR58HP9ooOBIoW+U2thF5hrHgIt/Y/Z68Pw6eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO0GoRky; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO0GoRky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729419820; x=1760955820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t1sjoxj/ZlwXoBK71kdZbxG6cQlsnq6kUB93/1OMWDM=;
  b=DO0GoRky9gWT/fGUMckndfhfdgupVoPnODK2ktK6wwAfHBt/lzgppOrK
   QZcWhJHQhXZv1g5508Yw2AVStC3w7wE8O/zrs1cPSbxAEjcCgYoliULyo
   Sgzaere9mJINRqpFwE6QtEmxhH4Suf/VygqV2ZDALERiSEIjbEdm0UEUO
   TR5VLOdgk2qy742WkxzGw1t7ZpouqrnDj4kjfo5pPRY+6ZZFMv2Jz7+a1
   O4VahXVPCK8s2QxdSZYK7y02Y6InPXrdzRhat6EY7HVH7GEk2iEBYm8IV
   hD1x+mFMY9Do6En+qRz2C2sv2dT1YGq8pJYBZ+L2lStuD2QqMCekzN2Ko
   w==;
X-CSE-ConnectionGUID: D20e77rcRKSzt9NEcVhdDA==
X-CSE-MsgGUID: hL8YGgp8TDm0PB3zE28FNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="29032227"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="29032227"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 03:23:39 -0700
X-CSE-ConnectionGUID: jFBmoOFQRwizWspG5a8GRw==
X-CSE-MsgGUID: On6Cs7WCQYOr/+49eLdZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="83233905"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Oct 2024 03:23:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2T5z-000QCn-2j;
	Sun, 20 Oct 2024 10:23:35 +0000
Date: Sun, 20 Oct 2024 18:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/3] crypto: Add Mediatek EIP-93 crypto engine
 support
Message-ID: <202410201854.K5B2EZoH-lkp@intel.com>
References: <20241017004335.27471-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017004335.27471-3-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master tip/locking/core robh/for-next linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-crypto-Add-Inside-Secure-SafeXcel-EIP-93-crypto-engine/20241017-084636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241017004335.27471-3-ansuelsmth%40gmail.com
patch subject: [RFC PATCH v2 3/3] crypto: Add Mediatek EIP-93 crypto engine support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241020/202410201854.K5B2EZoH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201854.K5B2EZoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201854.K5B2EZoH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/inside-secure/eip93/eip93-common.c:392:6: warning: variable 'ndesc_cdr' set but not used [-Wunused-but-set-variable]
     392 |         int ndesc_cdr = 0, err;
         |             ^
>> drivers/crypto/inside-secure/eip93/eip93-common.c:563:8: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     563 |                         if (!rctx->sa_state_ctr)
         |                             ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-common.c:632:9: note: uninitialized use occurs here
     632 |         return err;
         |                ^~~
   drivers/crypto/inside-secure/eip93/eip93-common.c:563:4: note: remove the 'if' if its condition is always false
     563 |                         if (!rctx->sa_state_ctr)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
     564 |                                 goto free_sa_state;
         |                                 ~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-common.c:518:23: note: initialize the variable 'err' to silence this warning
     518 |         int offsetin = 0, err;
         |                              ^
         |                               = 0
   2 warnings generated.
--
>> drivers/crypto/inside-secure/eip93/eip93-hash.c:75:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      75 |                 u32 sha256_init[] = { SHA256_H0, SHA256_H1, SHA256_H2, SHA256_H3,
         |                 ^
   drivers/crypto/inside-secure/eip93/eip93-hash.c:81:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      81 |                 u32 sha224_init[] = { SHA224_H0, SHA224_H1, SHA224_H2, SHA224_H3,
         |                 ^
   drivers/crypto/inside-secure/eip93/eip93-hash.c:87:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      87 |                 u32 sha1_init[] = { SHA1_H0, SHA1_H1, SHA1_H2, SHA1_H3, SHA1_H4 };
         |                 ^
   drivers/crypto/inside-secure/eip93/eip93-hash.c:92:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      92 |                 u32 md5_init[] = { MD5_H0, MD5_H1, MD5_H2, MD5_H3 };
         |                 ^
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/ndesc_cdr +392 drivers/crypto/inside-secure/eip93/eip93-common.c

   370	
   371	/*
   372	 * Poor mans Scatter/gather function:
   373	 * Create a Descriptor for every segment to avoid copying buffers.
   374	 * For performance better to wait for hardware to perform multiple DMA
   375	 */
   376	static int eip93_scatter_combine(struct eip93_device *mtk,
   377					 struct eip93_cipher_reqctx *rctx,
   378					 u32 datalen, u32 split, int offsetin)
   379	{
   380		struct eip93_descriptor *cdesc = rctx->cdesc;
   381		struct scatterlist *sgsrc = rctx->sg_src;
   382		struct scatterlist *sgdst = rctx->sg_dst;
   383		unsigned int remainin = sg_dma_len(sgsrc);
   384		unsigned int remainout = sg_dma_len(sgdst);
   385		dma_addr_t saddr = sg_dma_address(sgsrc);
   386		dma_addr_t daddr = sg_dma_address(sgdst);
   387		dma_addr_t state_addr;
   388		u32 src_addr, dst_addr, len, n;
   389		bool nextin = false;
   390		bool nextout = false;
   391		int offsetout = 0;
 > 392		int ndesc_cdr = 0, err;
   393	
   394		if (IS_ECB(rctx->flags))
   395			rctx->sa_state_base = 0;
   396	
   397		if (split < datalen) {
   398			state_addr = rctx->sa_state_ctr_base;
   399			n = split;
   400		} else {
   401			state_addr = rctx->sa_state_base;
   402			n = datalen;
   403		}
   404	
   405		do {
   406			if (nextin) {
   407				sgsrc = sg_next(sgsrc);
   408				remainin = sg_dma_len(sgsrc);
   409				if (remainin == 0)
   410					continue;
   411	
   412				saddr = sg_dma_address(sgsrc);
   413				offsetin = 0;
   414				nextin = false;
   415			}
   416	
   417			if (nextout) {
   418				sgdst = sg_next(sgdst);
   419				remainout = sg_dma_len(sgdst);
   420				if (remainout == 0)
   421					continue;
   422	
   423				daddr = sg_dma_address(sgdst);
   424				offsetout = 0;
   425				nextout = false;
   426			}
   427			src_addr = saddr + offsetin;
   428			dst_addr = daddr + offsetout;
   429	
   430			if (remainin == remainout) {
   431				len = remainin;
   432				if (len > n) {
   433					len = n;
   434					remainin -= n;
   435					remainout -= n;
   436					offsetin += n;
   437					offsetout += n;
   438				} else {
   439					nextin = true;
   440					nextout = true;
   441				}
   442			} else if (remainin < remainout) {
   443				len = remainin;
   444				if (len > n) {
   445					len = n;
   446					remainin -= n;
   447					remainout -= n;
   448					offsetin += n;
   449					offsetout += n;
   450				} else {
   451					offsetout += len;
   452					remainout -= len;
   453					nextin = true;
   454				}
   455			} else {
   456				len = remainout;
   457				if (len > n) {
   458					len = n;
   459					remainin -= n;
   460					remainout -= n;
   461					offsetin += n;
   462					offsetout += n;
   463				} else {
   464					offsetin += len;
   465					remainin -= len;
   466					nextout = true;
   467				}
   468			}
   469			n -= len;
   470	
   471			cdesc->src_addr = src_addr;
   472			cdesc->dst_addr = dst_addr;
   473			cdesc->state_addr = state_addr;
   474			cdesc->pe_length_word = FIELD_PREP(EIP93_PE_LENGTH_HOST_PE_READY,
   475							   EIP93_PE_LENGTH_HOST_READY);
   476			cdesc->pe_length_word |= FIELD_PREP(EIP93_PE_LENGTH_LENGTH, len);
   477	
   478			if (n == 0) {
   479				n = datalen - split;
   480				split = datalen;
   481				state_addr = rctx->sa_state_base;
   482			}
   483	
   484			if (n == 0)
   485				cdesc->user_id |= FIELD_PREP(EIP93_PE_USER_ID_DESC_FLAGS,
   486							     EIP93_DESC_LAST);
   487	
   488			/*
   489			 * Loop - Delay - No need to rollback
   490			 * Maybe refine by slowing down at EIP93_RING_BUSY
   491			 */
   492	again:
   493			err = eip93_put_descriptor(mtk, cdesc);
   494			if (err) {
   495				usleep_range(EIP93_RING_BUSY_DELAY,
   496					     EIP93_RING_BUSY_DELAY * 2);
   497				goto again;
   498			}
   499			/* Writing new descriptor count starts DMA action */
   500			writel(1, mtk->base + EIP93_REG_PE_CD_COUNT);
   501	
   502			ndesc_cdr++;
   503		} while (n);
   504	
   505		return -EINPROGRESS;
   506	}
   507	
   508	int eip93_send_req(struct crypto_async_request *async,
   509			   const u8 *reqiv, struct eip93_cipher_reqctx *rctx)
   510	{
   511		struct eip93_crypto_ctx *ctx = crypto_tfm_ctx(async->tfm);
   512		struct eip93_device *mtk = ctx->mtk;
   513		struct scatterlist *src = rctx->sg_src;
   514		struct scatterlist *dst = rctx->sg_dst;
   515		struct sa_state *sa_state;
   516		struct eip93_descriptor cdesc;
   517		u32 flags = rctx->flags;
   518		int offsetin = 0, err;
   519		u32 datalen = rctx->assoclen + rctx->textsize;
   520		u32 split = datalen;
   521		u32 start, end, ctr, blocks;
   522		u32 iv[AES_BLOCK_SIZE / sizeof(u32)];
   523		int crypto_async_idr;
   524	
   525		rctx->sa_state_ctr = NULL;
   526		rctx->sa_state = NULL;
   527	
   528		if (IS_ECB(flags))
   529			goto skip_iv;
   530	
   531		memcpy(iv, reqiv, rctx->ivsize);
   532	
   533		rctx->sa_state = kzalloc(sizeof(*rctx->sa_state), GFP_KERNEL);
   534		if (!rctx->sa_state)
   535			return -ENOMEM;
   536	
   537		sa_state = rctx->sa_state;
   538	
   539		memcpy(sa_state->state_iv, iv, rctx->ivsize);
   540		if (IS_RFC3686(flags)) {
   541			sa_state->state_iv[0] = ctx->sa_nonce;
   542			sa_state->state_iv[1] = iv[0];
   543			sa_state->state_iv[2] = iv[1];
   544			sa_state->state_iv[3] = cpu_to_be32(1);
   545		} else if (!IS_HMAC(flags) && IS_CTR(flags)) {
   546			/* Compute data length. */
   547			blocks = DIV_ROUND_UP(rctx->textsize, AES_BLOCK_SIZE);
   548			ctr = be32_to_cpu(iv[3]);
   549			/* Check 32bit counter overflow. */
   550			start = ctr;
   551			end = start + blocks - 1;
   552			if (end < start) {
   553				split = AES_BLOCK_SIZE * -start;
   554				/*
   555				 * Increment the counter manually to cope with
   556				 * the hardware counter overflow.
   557				 */
   558				iv[3] = 0xffffffff;
   559				crypto_inc((u8 *)iv, AES_BLOCK_SIZE);
   560	
   561				rctx->sa_state_ctr = kzalloc(sizeof(*rctx->sa_state_ctr),
   562							     GFP_KERNEL);
 > 563				if (!rctx->sa_state_ctr)
   564					goto free_sa_state;
   565	
   566				memcpy(rctx->sa_state_ctr->state_iv, reqiv, rctx->ivsize);
   567				memcpy(sa_state->state_iv, iv, rctx->ivsize);
   568	
   569				rctx->sa_state_ctr_base = dma_map_single(mtk->dev, rctx->sa_state_ctr,
   570									 sizeof(*rctx->sa_state_ctr),
   571									 DMA_TO_DEVICE);
   572				err = dma_mapping_error(mtk->dev, rctx->sa_state_ctr_base);
   573				if (err)
   574					goto free_sa_state_ctr;
   575			}
   576		}
   577	
   578		rctx->sa_state_base = dma_map_single(mtk->dev, rctx->sa_state,
   579						     sizeof(*rctx->sa_state), DMA_TO_DEVICE);
   580		err = dma_mapping_error(mtk->dev, rctx->sa_state_base);
   581		if (err)
   582			goto free_sa_state_ctr_dma;
   583	
   584	skip_iv:
   585	
   586		cdesc.pe_ctrl_stat_word = FIELD_PREP(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN,
   587						     EIP93_PE_CTRL_HOST_READY);
   588		cdesc.sa_addr = rctx->sa_record_base;
   589		cdesc.arc4_addr = 0;
   590	
   591		scoped_guard(spinlock_bh, &mtk->ring->idr_lock)
   592			crypto_async_idr = idr_alloc(&mtk->ring->crypto_async_idr, async, 0,
   593						     EIP93_RING_NUM - 1, GFP_ATOMIC);
   594	
   595		cdesc.user_id = FIELD_PREP(EIP93_PE_USER_ID_CRYPTO_IDR, (u16)crypto_async_idr) |
   596				FIELD_PREP(EIP93_PE_USER_ID_DESC_FLAGS, rctx->desc_flags);
   597	
   598		rctx->cdesc = &cdesc;
   599	
   600		/* map DMA_BIDIRECTIONAL to invalidate cache on destination
   601		 * implies __dma_cache_wback_inv
   602		 */
   603		if (!dma_map_sg(mtk->dev, dst, rctx->dst_nents, DMA_BIDIRECTIONAL)) {
   604			err = -ENOMEM;
   605			goto free_sa_state_ctr_dma;
   606		}
   607	
   608		if (src != dst &&
   609		    !dma_map_sg(mtk->dev, src, rctx->src_nents, DMA_TO_DEVICE)) {
   610			err = -ENOMEM;
   611			goto free_sg_dma;
   612		}
   613	
   614		return eip93_scatter_combine(mtk, rctx, datalen, split, offsetin);
   615	
   616	free_sg_dma:
   617		dma_unmap_sg(mtk->dev, dst, rctx->dst_nents, DMA_BIDIRECTIONAL);
   618	free_sa_state_ctr_dma:
   619		if (rctx->sa_state_ctr)
   620			dma_unmap_single(mtk->dev, rctx->sa_state_ctr_base,
   621					 sizeof(*rctx->sa_state_ctr),
   622					 DMA_TO_DEVICE);
   623	free_sa_state_ctr:
   624		kfree(rctx->sa_state_ctr);
   625		if (rctx->sa_state)
   626			dma_unmap_single(mtk->dev, rctx->sa_state_base,
   627					 sizeof(*rctx->sa_state),
   628					 DMA_TO_DEVICE);
   629	free_sa_state:
   630		kfree(rctx->sa_state);
   631	
   632		return err;
   633	}
   634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
