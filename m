Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B43522E;
	Sun, 25 Feb 2024 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708857204; cv=none; b=c4IT8BpFrLCNRNNX9p/mAY5z4u4pZvhW4oKKVznJWS5gYq3QaPlXMzb+7xe/FEKiswjK0FmhumuMWABKthSUnatnHBrPa+do8I4ZkAL9KxQFqXuXr4875+nGG7qnsVWfS/fzWCCCiE6ZhnKHVLdvgdG0u8ZTC7iZIdts4Bon0B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708857204; c=relaxed/simple;
	bh=MIS2OZVcK2enIc5OkRuwOBRBa4Ya0fZw0aE+RzWGebw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VwdGJhJPKogFPYk4Kx3e2Ee9p1zzhUXax1p9zUW51Ld6xr+ay5Xt4kwENFjm2YBjCj8jDAf3IQar/scLn65c7XHNt1veOnXg6zoycd2kwOV6Tphyu4CPGcdATQU8AASCn0B9FPqJ0qDCRkY75LCra5SuVR2cYBOLeOA6E8zUN8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhjW5BFO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhjW5BFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708857203; x=1740393203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MIS2OZVcK2enIc5OkRuwOBRBa4Ya0fZw0aE+RzWGebw=;
  b=DhjW5BFO5iL0j2eU8lwozqQsZ4cxqXaBruGTOhiZLKYF5OnJDRBkcDEJ
   EV5rkp/ft/mE2Y7rcSxvcSy+B9Lr+IN2PB2l+/0YrAO8E4MfCZqXO97RQ
   0S6EVQU6fai7jWFNp+54tGbxXUNDj4weDh3AcOefzTWzWtMAmqRilEZdq
   j3ROIOgFZBUKGBLc4RLPtCsC673EX5bwmUED0B57k3BEYe6gHCoF9VWep
   DlqMLXEJaYrUjrGE3ibHA/KYkCkk4G0BOpxJnJq8oSYex2GUhjX9IlFTx
   rKsqB2CrvvPqYhrxIC7bKKCIVUGfIYalyigMhClER+pljfZOvtQMWQttR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3285528"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3285528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 02:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="11061266"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2024 02:33:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reBoX-0009Sw-2q;
	Sun, 25 Feb 2024 10:32:59 +0000
Date: Sun, 25 Feb 2024 18:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 17/36] lib/kfifo.c:500:9: error: unterminated
 function-like macro invocation
Message-ID: <202402251854.AwWKaepA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   e82f2321b99bd2f2be296a5b11b13e4f93ccff16
commit: 645f6bd2ca34618d51230ba60cc508b26131a814 [17/36] kfifo: add kfifo_out_linear{,_ptr}()
config: i386-buildonly-randconfig-003-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251854.AwWKaepA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251854.AwWKaepA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251854.AwWKaepA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/kfifo.c:500:9: error: unterminated function-like macro invocation
     500 |         return min(n, __kfifo_peek_n(fifo, recsize);
         |                ^
   include/linux/minmax.h:85:9: note: macro 'min' defined here
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |         ^
>> lib/kfifo.c:612:1: error: expected expression
     612 | 
         | ^
>> lib/kfifo.c:612:1: error: expected '}'
   lib/kfifo.c:493:1: note: to match this '{'
     493 | {
         | ^
   3 errors generated.


vim +500 lib/kfifo.c

   490	
   491	unsigned int __kfifo_out_linear_r(struct __kfifo *fifo,
   492			unsigned int *tail, unsigned int n, size_t recsize)
   493	{
   494		if (fifo->in == fifo->out)
   495			return 0;
   496	
   497		if (tail)
   498			*tail = fifo->out + recsize;
   499	
 > 500		return min(n, __kfifo_peek_n(fifo, recsize);
   501	}
   502	EXPORT_SYMBOL(__kfifo_out_linear_r);
   503	
   504	unsigned int __kfifo_out_r(struct __kfifo *fifo, void *buf,
   505			unsigned int len, size_t recsize)
   506	{
   507		unsigned int n;
   508	
   509		if (fifo->in == fifo->out)
   510			return 0;
   511	
   512		len = kfifo_out_copy_r(fifo, buf, len, recsize, &n);
   513		fifo->out += n + recsize;
   514		return len;
   515	}
   516	EXPORT_SYMBOL(__kfifo_out_r);
   517	
   518	void __kfifo_skip_r(struct __kfifo *fifo, size_t recsize)
   519	{
   520		unsigned int n;
   521	
   522		n = __kfifo_peek_n(fifo, recsize);
   523		fifo->out += n + recsize;
   524	}
   525	EXPORT_SYMBOL(__kfifo_skip_r);
   526	
   527	int __kfifo_from_user_r(struct __kfifo *fifo, const void __user *from,
   528		unsigned long len, unsigned int *copied, size_t recsize)
   529	{
   530		unsigned long ret;
   531	
   532		len = __kfifo_max_r(len, recsize);
   533	
   534		if (len + recsize > kfifo_unused(fifo)) {
   535			*copied = 0;
   536			return 0;
   537		}
   538	
   539		__kfifo_poke_n(fifo, len, recsize);
   540	
   541		ret = kfifo_copy_from_user(fifo, from, len, fifo->in + recsize, copied);
   542		if (unlikely(ret)) {
   543			*copied = 0;
   544			return -EFAULT;
   545		}
   546		fifo->in += len + recsize;
   547		return 0;
   548	}
   549	EXPORT_SYMBOL(__kfifo_from_user_r);
   550	
   551	int __kfifo_to_user_r(struct __kfifo *fifo, void __user *to,
   552		unsigned long len, unsigned int *copied, size_t recsize)
   553	{
   554		unsigned long ret;
   555		unsigned int n;
   556	
   557		if (fifo->in == fifo->out) {
   558			*copied = 0;
   559			return 0;
   560		}
   561	
   562		n = __kfifo_peek_n(fifo, recsize);
   563		if (len > n)
   564			len = n;
   565	
   566		ret = kfifo_copy_to_user(fifo, to, len, fifo->out + recsize, copied);
   567		if (unlikely(ret)) {
   568			*copied = 0;
   569			return -EFAULT;
   570		}
   571		fifo->out += n + recsize;
   572		return 0;
   573	}
   574	EXPORT_SYMBOL(__kfifo_to_user_r);
   575	
   576	unsigned int __kfifo_dma_in_prepare_r(struct __kfifo *fifo,
   577		struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
   578	{
   579		BUG_ON(!nents);
   580	
   581		len = __kfifo_max_r(len, recsize);
   582	
   583		if (len + recsize > kfifo_unused(fifo))
   584			return 0;
   585	
   586		return setup_sgl(fifo, sgl, nents, len, fifo->in + recsize);
   587	}
   588	EXPORT_SYMBOL(__kfifo_dma_in_prepare_r);
   589	
   590	void __kfifo_dma_in_finish_r(struct __kfifo *fifo,
   591		unsigned int len, size_t recsize)
   592	{
   593		len = __kfifo_max_r(len, recsize);
   594		__kfifo_poke_n(fifo, len, recsize);
   595		fifo->in += len + recsize;
   596	}
   597	EXPORT_SYMBOL(__kfifo_dma_in_finish_r);
   598	
   599	unsigned int __kfifo_dma_out_prepare_r(struct __kfifo *fifo,
   600		struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
   601	{
   602		BUG_ON(!nents);
   603	
   604		len = __kfifo_max_r(len, recsize);
   605	
   606		if (len + recsize > fifo->in - fifo->out)
   607			return 0;
   608	
   609		return setup_sgl(fifo, sgl, nents, len, fifo->out + recsize);
   610	}
   611	EXPORT_SYMBOL(__kfifo_dma_out_prepare_r);
 > 612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
