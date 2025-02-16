Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0EE154C05;
	Sun, 16 Feb 2025 18:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739730523; cv=none; b=jhtz2HrmJHxRBLLuDR0wplRos/pFI/qeh4qWRZmFHlJnsd5W9uXqYIL4nIEkzjaEoALwv8op8PWgewaYfWvdPW/6Si3BYLR7+ZDu1g4anIFwmAa9OJ7CD8nxbPdetfuwHGA7p/LJXPADcqtZNBkYXKCS2XbyNfJCAgBbuDiBt/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739730523; c=relaxed/simple;
	bh=4p+sWXc1UlFEaOook4oWRBRcyJ9go0qw78k7rMhjcXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdC+9vj5dUY0ZUOkxalwQ1L/GY7TgS4q/VBAxoPKenYu7OszTChzlkFc06bi/pNBCe56hfLoO1WEkzAvpa3sewg+SR4l4vGhEOK7045164KPLT7+rn3SBTYtd403usn+YQp0W8tFW8yr98KKodUdxwk5uZNsXawIxzAzkxQu+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IndYVk/K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IndYVk/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739730521; x=1771266521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4p+sWXc1UlFEaOook4oWRBRcyJ9go0qw78k7rMhjcXc=;
  b=IndYVk/KfWORryuAn73Iy2UpIiX31/pRimXxsczlHguEYLj2GT3N6uhj
   sUU5r1aEMMf3VjI3j3IwAGR3JDRuaOEOQCQP3WENnsJl4Isp6s1Tf1MOn
   CGWDzJzH7tV8lY2/3SDA/Zxnv5tJkTNgj6N89IEP4L+/YKzGheX8aIOgJ
   UQwcKBlVXx13ExKrugVP3vG7hlWWf4MFvoYV53iCsoVfsdteBLdD8lM65
   pyU4hGclzufP6PP6sos9qzKAtwprf1EyGvIZlTE7rX8lpCKVZnsSMEU6X
   NYo99PmoAvJrvaWW5ywgRNrdT8rXSL+6tn93zWrOcaOnkosjvWDJFcpLQ
   w==;
X-CSE-ConnectionGUID: tuqi/wb2S8i8XjFdEz1Ubw==
X-CSE-MsgGUID: A2PBQZl1R26juzb0jgja3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="44070428"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="44070428"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 10:28:40 -0800
X-CSE-ConnectionGUID: M3X9w+AcQ8O+hoCINir4kg==
X-CSE-MsgGUID: ygSpUKPCReWXkzRMB64dsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="118945071"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2025 10:28:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjjNc-001C8p-1z;
	Sun, 16 Feb 2025 18:28:36 +0000
Date: Mon, 17 Feb 2025 02:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [v2 PATCH 11/11] fsverity: improve performance by using
 multibuffer hashing
Message-ID: <202502170225.YjYWM8fo-lkp@intel.com>
References: <dd11ea3e7231fb46f68d902ba38a5b688e378bfe.1739674648.1.git.herbert@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd11ea3e7231fb46f68d902ba38a5b688e378bfe.1739674648.1.git.herbert@gondor.apana.org.au>

Hi Herbert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20250214]
[cannot apply to herbert-crypto-2.6/master brauner-vfs/vfs.all linus/master v6.14-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-ahash-Only-save-callback-and-data-in-ahash_save_req/20250216-150941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/dd11ea3e7231fb46f68d902ba38a5b688e378bfe.1739674648.1.git.herbert%40gondor.apana.org.au
patch subject: [v2 PATCH 11/11] fsverity: improve performance by using multibuffer hashing
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250217/202502170225.YjYWM8fo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170225.YjYWM8fo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170225.YjYWM8fo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/verity/verify.c:295:1: warning: stack frame size (1312) exceeds limit (1024) in 'fsverity_verify_pending_blocks' [-Wframe-larger-than]
     295 | fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
         | ^
   1 warning generated.


vim +/fsverity_verify_pending_blocks +295 fs/verity/verify.c

   293	
   294	static bool
 > 295	fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
   296	{
   297		struct inode *inode = ctx->inode;
   298		struct fsverity_info *vi = ctx->vi;
   299		const struct merkle_tree_params *params = &vi->tree_params;
   300		SYNC_HASH_REQUESTS_ON_STACK(reqs, FS_VERITY_MAX_PENDING_DATA_BLOCKS, params->hash_alg->tfm);
   301		struct ahash_request *req;
   302		int i;
   303		int err;
   304	
   305		if (ctx->num_pending == 0)
   306			return true;
   307	
   308		req = sync_hash_requests(reqs, 0);
   309		for (i = 0; i < ctx->num_pending; i++) {
   310			struct ahash_request *reqi = sync_hash_requests(reqs, i);
   311	
   312			ahash_request_set_callback(reqi, CRYPTO_TFM_REQ_MAY_SLEEP,
   313						   NULL, NULL);
   314			ahash_request_set_virt(reqi, ctx->pending_blocks[i].data,
   315					       ctx->pending_blocks[i].real_hash,
   316					       params->block_size);
   317			if (i)
   318				ahash_request_chain(reqi, req);
   319			if (!params->hashstate)
   320				continue;
   321	
   322			err = crypto_ahash_import(reqi, params->hashstate);
   323			if (err) {
   324				fsverity_err(inode, "Error %d importing hash state", err);
   325				return false;
   326			}
   327		}
   328	
   329		if (params->hashstate)
   330			err = crypto_ahash_finup(req);
   331		else
   332			err = crypto_ahash_digest(req);
   333		if (err) {
   334			fsverity_err(inode, "Error %d computing block hashes", err);
   335			return false;
   336		}
   337	
   338		for (i = 0; i < ctx->num_pending; i++) {
   339			if (!verify_data_block(inode, vi, &ctx->pending_blocks[i],
   340					       ctx->max_ra_pages))
   341				return false;
   342		}
   343	
   344		fsverity_clear_pending_blocks(ctx);
   345		return true;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
