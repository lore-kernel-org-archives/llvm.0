Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4D1798F;
	Tue,  3 Jun 2025 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748972731; cv=none; b=mnxrKBu+vMB0HkACg/2lVGQJnxVObj9IAyt4ZtAgUT+0i9tcBqvGbjR9P2p7g+WJw2HdGxXsoUDr9V6B4EvzIUx5BSJn0AbPQ7IJR8noKToy28LFhRyhKVqUu7OaNSpvi26uHQ2FuQxIiCYAlIyXmn7xs/5jNo8W5VHLSUiTiH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748972731; c=relaxed/simple;
	bh=C1nt+rgVaz+vzlnGktzNqVEJS8WSJwMhUd7XuD/t+eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d83NIzsufe+Kxi6fPcrp0/vWe3lktF/U/A4qOcvU0tzs2WP9+7r1yUIH62DZs+smbTqLudlEfVSKmLkc7TY0qtlLsy5VkAIukDeCDBskTPsg9tMiNlFk6nPsTZA/nrgG+GWo9YkLCB3ml+ZhTghzOE9R4XhyW/aWvaXYTmkBjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqccKCFu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqccKCFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748972730; x=1780508730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1nt+rgVaz+vzlnGktzNqVEJS8WSJwMhUd7XuD/t+eQ=;
  b=PqccKCFuubyh+PZUODGUgjAC8kbvjS0HI2TqP2acR9X/CMsevy2MV78y
   qMeQMnlJnYadiYvKeV8NcHAmDv9L00+VcrGOjhhKyA3XM0m7lFp5+HxYV
   GuAGFQzQiwjv9Reru4blX2JKAG7CsltLiKE3R+e7QsUi0XCW9AO+fTWgo
   czkEIeeX/9GFfkRl6Rs6AkdIVfy5DZA0A9frrT13WttuY2GN8NcUa4281
   OVyuAlmBbkdKWz/xqhOm/k4FLuiwcyteMgtacw3JISDa5Py97qhVGUdef
   DNZAYDBcFnDAWX+M5XY97T52xKnkQihLPkkt10exiTFG0ZVrJoS3DAvEd
   A==;
X-CSE-ConnectionGUID: cpqqc4cKQoidFFDy3H5ATw==
X-CSE-MsgGUID: jNcZN15ESPqPQehd/cSkTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51127167"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="51127167"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 10:45:29 -0700
X-CSE-ConnectionGUID: Q/1E0B2rQZSTUenKIcmUOg==
X-CSE-MsgGUID: 1qKWkInuTxKYAzTZjN1QZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="148772705"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jun 2025 10:45:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMVhV-0002cb-2W;
	Tue, 03 Jun 2025 17:45:25 +0000
Date: Wed, 4 Jun 2025 01:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Bates <sbates@raithlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sbates130272-p2pmem:dev/amd-dma-buf 3/3]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:412: warning: Function parameter
 or struct member 'dmabuf' not described in 'amdgpu_dma_buf_rw_file'
Message-ID: <202506040309.Ly2VPBjS-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250604/202506040309.Ly2VPBjS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506040309.Ly2VPBjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506040309.Ly2VPBjS-lkp@intel.com/

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
