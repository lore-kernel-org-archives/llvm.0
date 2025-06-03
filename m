Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3C7262A;
	Tue,  3 Jun 2025 00:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748911811; cv=none; b=fToIP5q4LeKp6Jp8gGr4TkPatk1eHEAFf6DzU5WDwdlyudrmGvU4CnYx79YhwPrIthTg6YXxEPpuCRyDoNT0X6JIqtftRssX7UjWCW4yHZIuseQlNLLgRFUsxbxoIE7Kk4l8gkkIVBA3bfiNOHz4vQSqIbp0dIgdLDJBFNB8PGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748911811; c=relaxed/simple;
	bh=AUYmy3MR11EakJLB44RL4VR3uijKAeLXkFyj4B57fvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCowsepzs9kc9SxmdUjGX/JYwSEytGMlxBNTHtk1vMOM/IuXtOTKWYenKdwnY1wH4ZD/F4hdPuNj6rp7upsyGICDcJJf4gNYkRg9X3Sd4/QzXwsSOkm/zpTaqSB5NgY7eUuEg0zL90KY1tvLbmAliqE07+rDd7tYCzL7OeOLGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jj1yiECk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jj1yiECk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748911810; x=1780447810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUYmy3MR11EakJLB44RL4VR3uijKAeLXkFyj4B57fvA=;
  b=Jj1yiECkye/0dURcH6foe14P6UDQLLaTelInyk2hCCtRD/6UQ+n3jZRh
   B78ydS488i6VBjQ/ePpmxWKRdXJ4llDNQrFiO/dqbQpnEeCU8/fGUNMTY
   PwdQE42Yy56KlBqYyvOJyHrPFeexmUn4sXGXklw7XaZcAWwzpp/bo1aRQ
   UU2svxcXQLtF4LwwtBHhNHm4K7bZq278zBRmwZ6o+CCO1HWGEQWGsPL6N
   nUxceOJz9KIrZfK4zyt4/KFcZz3xksU8GiRt5anOBwXfZl+xqlftPblZP
   UT2Lxw4BGinUBkLa2FEMwe76OoZ73QxPwxxHqaAd3IPACmQY+k/jxNelY
   w==;
X-CSE-ConnectionGUID: OE3qUhGLRK2LKLw6l2H5Bw==
X-CSE-MsgGUID: g1fH/1FmT5ClTg+QG1pHgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68488111"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="68488111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 17:50:09 -0700
X-CSE-ConnectionGUID: zp2kJ9MfRRiZHeqHUnA1wQ==
X-CSE-MsgGUID: P5rWScFHR5S0QvxwZB0phw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="145309463"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2025 17:50:08 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMFqv-0001OY-1R;
	Tue, 03 Jun 2025 00:50:05 +0000
Date: Tue, 3 Jun 2025 08:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Bates <sbates@raithlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sbates130272-p2pmem:dev/amd-dma-buf 3/3]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:412: warning: Function parameter
 or struct member 'dmabuf' not described in 'amdgpu_dma_buf_rw_file'
Message-ID: <202506030816.1uTP3kcg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sbates130272/linux-p2pmem.git dev/amd-dma-buf
head:   bbb07dc00a3bb220aa0570177a0716d7b48bac7e
commit: bbb07dc00a3bb220aa0570177a0716d7b48bac7e [3/3] amdgpu_dma_buf: Add a rwfile dma_buf callback for file IO.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250603/202506030816.1uTP3kcg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030816.1uTP3kcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030816.1uTP3kcg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:412: warning: Function parameter or struct member 'dmabuf' not described in 'amdgpu_dma_buf_rw_file'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:412: warning: Function parameter or struct member 'back' not described in 'amdgpu_dma_buf_rw_file'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:412: warning: Excess function parameter 'dma_buf' description in 'amdgpu_dma_buf_rw_file'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:412: warning: Excess function parameter 'dma_buf_rw_file' description in 'amdgpu_dma_buf_rw_file'


vim +412 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c

   395	
   396	/**
   397	 * amdgpu_dma_buf_rw_file - &dma_buf_ops.rw_file implementation
   398	 * @dma_buf: Shared DMA buffer
   399	 * @dma_buf_rw_file: Struct with info on backing file
   400	 *
   401	 * This is a callback to enable both buffered and O_DIRECT IO between
   402	 * an AMD GPU generated dma_buf and a file on any standard (VFS
   403	 * supported) filesystem. Note that the backing-object associated with
   404	 * the dma-buf is managed by this driver and thus this driver has full
   405	 * control over the location and mappings.
   406	 *
   407	 * Returns:
   408	 * 0 on success or a negative error code on failure.
   409	 */
   410	static int amdgpu_dma_buf_rw_file(struct dma_buf *dmabuf,
   411	                                  struct dma_buf_rw_file *back)
 > 412	{
   413		int ret = 0;
   414		__u32 op = back->flags & DMA_BUF_RW_FLAGS_OP_MASK;
   415		bool direct_io = back->flags & DMA_BUF_RW_FLAGS_DIRECT;
   416		struct file *filp;
   417	
   418		if (op != DMA_BUF_RW_FLAGS_READ && op != DMA_BUF_RW_FLAGS_WRITE)
   419			return -EINVAL;
   420		if (direct_io) {
   421			if (!PAGE_ALIGNED(back->file_offset) ||
   422			    !PAGE_ALIGNED(back->buf_offset) ||
   423			    !PAGE_ALIGNED(back->buf_len))
   424				return -EINVAL;
   425		}
   426		if (!back->buf_len || back->buf_len > dmabuf->size ||
   427			back->buf_offset >= dmabuf->size ||
   428			back->buf_offset + back->buf_len > dmabuf->size)
   429			return -EINVAL;
   430		if (back->file_offset + back->buf_len < back->file_offset)
   431			return -EINVAL;
   432	
   433		filp = fget(back->fd);
   434		if (!filp)
   435			return -EBADF;
   436	
   437		ret = amdgpu_rw_file(dmabuf, op == DMA_BUF_RW_FLAGS_READ,
   438				     direct_io, filp, back->file_offset,
   439				     back->buf_offset, back->buf_len);
   440	
   441		fput(filp);
   442		return ret;
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
