Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCDBA95E;
	Sun,  9 Jun 2024 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717896944; cv=none; b=BYwaxGfgDLSxFxXK2wSy2QckP+qkfRL48Mp1VQeR6FOicSySHlzZTLfONXKHS5Zj5rOC1xPi022Bzyw2yifCcBlU+v5T63MJYIPTezyRQRAq+jBU58ZO5LgBv2q2LISGgopAW3a9/lAY4b31GQ02gL//mP5tj5OJ5n+zIBwO9gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717896944; c=relaxed/simple;
	bh=uuVNQBEbGHZU8TAMitouVvc/s+dScyMtALH78R/ZsgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFkiCd/rHKxCEPNNkvDa1vl3XY/32ovjWZHra1bSrEucvvjXj2yXGjDQ8uwZtOMUCL0bjHFe9AwX/k8O/cTjphijUwOEdJPBvKiJPPAotCMoV3byAMUGvo11EX9pP95Zwh0OigLg37BxoZwATHvyXnhe2Qx1a4F7MTVqIEqjllg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtO52xLi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtO52xLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717896942; x=1749432942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uuVNQBEbGHZU8TAMitouVvc/s+dScyMtALH78R/ZsgA=;
  b=gtO52xLidn4b/jyOYwnKYwv38z6G9DLfwaSXbd7f9sfiD8/lyovY5KpL
   A2fY1TIsww4vCeTiZ1F8ngwuN1q6KFinODnV7aUX7MCYCvzwTZI5aRMAQ
   vefevJr5a533j4pjXRdNMKsjUw5AW3kIphsI3T6a0iLQ/APBLi7Bz8pdt
   8u67Aqla+xjQeV7E1XACK2t1p8cWjy+QXTzTZ9j+40m2j3KMyHhNrG/nA
   mR4MxczipxIen3L9wfQ9PrOFdXQyJFTx1RF3s1IxVxzcQ65pYFh/D0gow
   TUE5/XA1HS7Yb10WRhE5Ujv0KxgVJiUxC7yyN4i0zhAL79fCbtER4WCtq
   g==;
X-CSE-ConnectionGUID: ujdLLsH5QOe7TZFIBJ7MpA==
X-CSE-MsgGUID: /DYFP5PDTxGPMFdFgNrk2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25162530"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="25162530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 18:35:42 -0700
X-CSE-ConnectionGUID: Uy+YTGRITdiRj8jqpSDYRg==
X-CSE-MsgGUID: NiQMr05vR2SEI8vtLGHx8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43129201"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2024 18:35:36 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG7T3-0000jX-1K;
	Sun, 09 Jun 2024 01:35:33 +0000
Date: Sun, 9 Jun 2024 09:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>, rostedt@goodmis.org, martin.lau@linux.dev,
	shuah@kernel.org, song@kernel.org, mhiramat@kernel.org,
	ast@kernel.org, andrii@kernel.org, pabeni@redhat.com,
	ebiggers@kernel.org, tytso@mit.edu, vadim.fedorenko@linux.dev,
	eddyz87@gmail.com, davem@davemloft.net, edumazet@google.com,
	daniel@iogearbox.net, hawk@kernel.org, kuba@kernel.org,
	john.fastabend@gmail.com, olsajiri@gmail.com, quentin@isovalent.com,
	alan.maguire@oracle.com, acme@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com,
	haoluo@google.com, jolsa@kernel.org, mathieu.desnoyers@efficios.com,
	mykolal@fb.com, fsverity@lists.linux.dev
Subject: Re: [PATCH bpf-next v4 09/12] bpf: treewide: Align kfunc signatures
 to prog point-of-view
Message-ID: <202406090949.IpHo1F5q-lkp@intel.com>
References: <677377439845fcb9135151d1dac1102ed3d6c924.1717881178.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677377439845fcb9135151d1dac1102ed3d6c924.1717881178.git.dxu@dxuuu.xyz>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/kbuild-bpf-Tell-pahole-to-DECL_TAG-kfuncs/20240609-052326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/677377439845fcb9135151d1dac1102ed3d6c924.1717881178.git.dxu%40dxuuu.xyz
patch subject: [PATCH bpf-next v4 09/12] bpf: treewide: Align kfunc signatures to prog point-of-view
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240609/202406090949.IpHo1F5q-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090949.IpHo1F5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090949.IpHo1F5q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/verity/measure.c:121: warning: Function parameter or struct member 'digest_p' not described in 'bpf_get_fsverity_digest'
>> fs/verity/measure.c:121: warning: Excess function parameter 'digest_ptr' description in 'bpf_get_fsverity_digest'
--
>> kernel/trace/bpf_trace.c:1384: warning: Function parameter or struct member 'data_p' not described in 'bpf_verify_pkcs7_signature'
>> kernel/trace/bpf_trace.c:1384: warning: Function parameter or struct member 'sig_p' not described in 'bpf_verify_pkcs7_signature'
>> kernel/trace/bpf_trace.c:1384: warning: Excess function parameter 'data_ptr' description in 'bpf_verify_pkcs7_signature'
>> kernel/trace/bpf_trace.c:1384: warning: Excess function parameter 'sig_ptr' description in 'bpf_verify_pkcs7_signature'
>> kernel/trace/bpf_trace.c:1459: warning: Function parameter or struct member 'value_p' not described in 'bpf_get_file_xattr'
>> kernel/trace/bpf_trace.c:1459: warning: Excess function parameter 'value_ptr' description in 'bpf_get_file_xattr'


vim +121 fs/verity/measure.c

67814c00de3161 Song Liu  2023-11-29  110  
67814c00de3161 Song Liu  2023-11-29  111  /**
67814c00de3161 Song Liu  2023-11-29  112   * bpf_get_fsverity_digest: read fsverity digest of file
67814c00de3161 Song Liu  2023-11-29  113   * @file: file to get digest from
67814c00de3161 Song Liu  2023-11-29  114   * @digest_ptr: (out) dynptr for struct fsverity_digest
67814c00de3161 Song Liu  2023-11-29  115   *
67814c00de3161 Song Liu  2023-11-29  116   * Read fsverity_digest of *file* into *digest_ptr*.
67814c00de3161 Song Liu  2023-11-29  117   *
67814c00de3161 Song Liu  2023-11-29  118   * Return: 0 on success, a negative value on error.
67814c00de3161 Song Liu  2023-11-29  119   */
ec3b75c0e6eb53 Daniel Xu 2024-06-08  120  __bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr *digest_p)
67814c00de3161 Song Liu  2023-11-29 @121  {
ec3b75c0e6eb53 Daniel Xu 2024-06-08  122  	struct bpf_dynptr_kern *digest_ptr = (struct bpf_dynptr_kern *)digest_p;
67814c00de3161 Song Liu  2023-11-29  123  	const struct inode *inode = file_inode(file);
67814c00de3161 Song Liu  2023-11-29  124  	u32 dynptr_sz = __bpf_dynptr_size(digest_ptr);
67814c00de3161 Song Liu  2023-11-29  125  	struct fsverity_digest *arg;
67814c00de3161 Song Liu  2023-11-29  126  	const struct fsverity_info *vi;
67814c00de3161 Song Liu  2023-11-29  127  	const struct fsverity_hash_alg *hash_alg;
67814c00de3161 Song Liu  2023-11-29  128  	int out_digest_sz;
67814c00de3161 Song Liu  2023-11-29  129  
67814c00de3161 Song Liu  2023-11-29  130  	if (dynptr_sz < sizeof(struct fsverity_digest))
67814c00de3161 Song Liu  2023-11-29  131  		return -EINVAL;
67814c00de3161 Song Liu  2023-11-29  132  
67814c00de3161 Song Liu  2023-11-29  133  	arg = __bpf_dynptr_data_rw(digest_ptr, dynptr_sz);
67814c00de3161 Song Liu  2023-11-29  134  	if (!arg)
67814c00de3161 Song Liu  2023-11-29  135  		return -EINVAL;
67814c00de3161 Song Liu  2023-11-29  136  
67814c00de3161 Song Liu  2023-11-29  137  	if (!IS_ALIGNED((uintptr_t)arg, __alignof__(*arg)))
67814c00de3161 Song Liu  2023-11-29  138  		return -EINVAL;
67814c00de3161 Song Liu  2023-11-29  139  
67814c00de3161 Song Liu  2023-11-29  140  	vi = fsverity_get_info(inode);
67814c00de3161 Song Liu  2023-11-29  141  	if (!vi)
67814c00de3161 Song Liu  2023-11-29  142  		return -ENODATA; /* not a verity file */
67814c00de3161 Song Liu  2023-11-29  143  
67814c00de3161 Song Liu  2023-11-29  144  	hash_alg = vi->tree_params.hash_alg;
67814c00de3161 Song Liu  2023-11-29  145  
67814c00de3161 Song Liu  2023-11-29  146  	arg->digest_algorithm = hash_alg - fsverity_hash_algs;
67814c00de3161 Song Liu  2023-11-29  147  	arg->digest_size = hash_alg->digest_size;
67814c00de3161 Song Liu  2023-11-29  148  
67814c00de3161 Song Liu  2023-11-29  149  	out_digest_sz = dynptr_sz - sizeof(struct fsverity_digest);
67814c00de3161 Song Liu  2023-11-29  150  
67814c00de3161 Song Liu  2023-11-29  151  	/* copy digest */
67814c00de3161 Song Liu  2023-11-29  152  	memcpy(arg->digest, vi->file_digest,  min_t(int, hash_alg->digest_size, out_digest_sz));
67814c00de3161 Song Liu  2023-11-29  153  
67814c00de3161 Song Liu  2023-11-29  154  	/* fill the extra buffer with zeros */
67814c00de3161 Song Liu  2023-11-29  155  	if (out_digest_sz > hash_alg->digest_size)
67814c00de3161 Song Liu  2023-11-29  156  		memset(arg->digest + arg->digest_size, 0, out_digest_sz - hash_alg->digest_size);
67814c00de3161 Song Liu  2023-11-29  157  
67814c00de3161 Song Liu  2023-11-29  158  	return 0;
67814c00de3161 Song Liu  2023-11-29  159  }
67814c00de3161 Song Liu  2023-11-29  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
