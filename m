Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A41FC0FC;
	Thu,  5 Jun 2025 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749154588; cv=none; b=YRv/wexjnoeUbh0Zv9lxqPnIRvDQzKX3QfhQf/2yY/GUfusdsUm+UDBlbM38Aj9FfVmrcuwdW7P7p7KB/LYj1gkSAZJGbyMmFlCll8C8Gs4tWYQIdBhq6CNw2pXkse4pl4uej2jTE8QjHb5ASn7Y4knX0M87Lbaqlga5Jij/0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749154588; c=relaxed/simple;
	bh=ojVH6uCn2lJ1DNDC1gzMWHYwUVpXyMFhNnk4gf9i7r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugVZFeufGGSGcngxFrf2s5VxmK0JIXWrJTYSKfZWZEATO7o3KvEuWP9RSxqoEiR6r3HgNAvdiebkhsIOsM3POgcUHzn/DOoUEq4vzFpAxfsCmU7IKvTYDvawsWzgKWR9oAzhKXhhY9BIMBiq52UmgDpqAFMvA6KQWvljDtX10HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yd67XoBB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yd67XoBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749154587; x=1780690587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojVH6uCn2lJ1DNDC1gzMWHYwUVpXyMFhNnk4gf9i7r0=;
  b=Yd67XoBBmtw9R3MuEkAENFZ+rr3GnVSxT9rqsQF+uNKbfDLofeMcWs4n
   pOlyoFpLqI9UsNgXWRLF7E+6eF62R9VXp686+P8n43eYOuy/kkV3EvgL8
   zrlYAYIcw2wY1suGV7onLs5w5npcne6L86P3LOYebgjuMctSSsZQSVUj0
   4D2ulsVA8RZo+PSy6tS3R/Lyl+dZ0BdJCdHr0/dYaP1EWlbAauKZaCX+U
   KvktLtYnw/railEhPjtlEvj8gYL9Ub1xhfIL0WW5YrcGTgR9bWhfYwOXQ
   XCtpVskijeXH0WshFR4zwWNikMg9qswxe2hR5hWILuA2iDK7/kplB2rKB
   w==;
X-CSE-ConnectionGUID: 8Jpg9fZVTLWa84+DV6yrTQ==
X-CSE-MsgGUID: MMsVPiDBRTWle/dx4YPJJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51148270"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="51148270"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 13:16:26 -0700
X-CSE-ConnectionGUID: 5cROk8j0QTGx4B/0m9WK9w==
X-CSE-MsgGUID: 95MHOMmMSkmm836EdKVS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="176473922"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2025 13:16:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNH0g-0004Rp-24;
	Thu, 05 Jun 2025 20:16:22 +0000
Date: Fri, 6 Jun 2025 04:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-handle 3/3] io_uring/openclose.c:587:9: error:
 use of undeclared identifier 'IOU_OK'
Message-ID: <202506060420.OZdcUHlj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-handle
head:   7a590a5963086085ce58fee4cdf920e8fdd049f4
commit: 7a590a5963086085ce58fee4cdf920e8fdd049f4 [3/3] io_uring: add support for IORING_OP_OPEN_BY_HANDLE
config: s390-randconfig-002-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060420.OZdcUHlj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060420.OZdcUHlj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060420.OZdcUHlj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/openclose.c:587:9: error: use of undeclared identifier 'IOU_OK'
     587 |         return IOU_OK;
         |                ^
   1 error generated.


vim +/IOU_OK +587 io_uring/openclose.c

   555	
   556	int io_open_by_handle(struct io_kiocb *req, unsigned int issue_flags)
   557	{
   558		struct io_open_handle *h = io_kiocb_to_cmd(req, struct io_open_handle);
   559		const struct export_operations *eops;
   560		int ret;
   561	
   562		ret = get_path_from_fd(h->dirfd, &h->ctx.root);
   563		if (ret < 0)
   564			goto err;
   565	
   566		eops = h->ctx.root.mnt->mnt_sb->s_export_op;
   567		if (eops && eops->permission)
   568			ret = eops->permission(&h->ctx, h->open_flags);
   569		else
   570			ret = may_decode_fh(&h->ctx, h->open_flags);
   571		if (ret) {
   572			path_put(&h->ctx.root);
   573			goto err;
   574		}
   575	
   576		ret = __io_open_by_handle(req, issue_flags, eops);
   577		io_req_set_res(req, ret, 0);
   578		if (ret < 0) {
   579	err:
   580			req_set_fail(req);
   581			return ret;
   582		}
   583	
   584		kfree(req->async_data);
   585		req->async_data = NULL;
   586		req->flags &= ~REQ_F_ASYNC_DATA;
 > 587		return IOU_OK;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
