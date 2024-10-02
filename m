Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3D1946C7;
	Wed,  2 Oct 2024 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854208; cv=none; b=kn7nafiq5gLZIUSehKJadXmzlnETyXMAK/MxlhJAa2vpaoWIHXyB8Le/B2Is1tJBpji9kAb6mq0bR3ORmOrenx4aKpQ2Pp73Whi4mW7JxGYOeoCTtZrYvylY/M+Owu0qpKvwebk8NySd/0OH72q+hSLKNCJYQmDmVzYElmcFyZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854208; c=relaxed/simple;
	bh=qinLTKnsoAKzOY2kUNQgEIFWFBznJMW36+EzH7afWHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DsAh/EUel6Xj0Scs7hdH4SfXmlvtVJe/UR2Rm9WTCSyIbP+I/KrwLeupU9r2A10O4SlmGBEgykWRPFWNYm29P8IpOGA1JhFXk9zMZWuQBJPKDD847xpiJz4Irqz9kTyLv2kyroy8VDiyamK+JNvnNcOoPqLAhkqW9TBhO1mfANk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5cO3jox; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5cO3jox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727854206; x=1759390206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qinLTKnsoAKzOY2kUNQgEIFWFBznJMW36+EzH7afWHY=;
  b=K5cO3jox2yGaPRnlcKvUREEHkTZuJiLAXmaIxl2DPP+ZE9LvdoRt7p6d
   Ty8D/gj4nLz+0rH7NlMYAK03CeE5Bt9PEfjS0DFgzCUDFeXo7Ugg/BAeG
   rnc2+TyJH7rSNiyrwWlN9rUhXqfcahq1ydEkLbz/7nYP51MBlAwisw4ah
   nBzteo/a0ONS2BM6JPctQTbolRVoAnyivO++jqkWMrZMtj6h9nvBdwYF9
   UE7M49nXKxomgLQPbtrPHYLZk/DEepS5w6X/pYQsCn4qL9NWcnzc1Vu4L
   Yr37D0oi6c/LrXbpj9cH5DJIGyM2rhUZPr8ZiUjWGLiQv4DyYAKzTrdmz
   w==;
X-CSE-ConnectionGUID: RiYbzHdtT9efWsYfFTFIxg==
X-CSE-MsgGUID: BbSrkU0OTaywPJV3fQexhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37601698"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="37601698"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 00:30:03 -0700
X-CSE-ConnectionGUID: GvX3k3ecQC2q4zEG8E4J5w==
X-CSE-MsgGUID: IU4qurKKQyyv8gLYepsoAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="74726109"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2024 00:30:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svto8-000RjR-0w;
	Wed, 02 Oct 2024 07:30:00 +0000
Date: Wed, 2 Oct 2024 15:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 10/37] fs/smb/client/cifssmb.c:1269:2:
 error: call to undeclared function 'netfs_read_subreq_terminated'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202410021541.XyfZxho9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   c8e953c706efd3d98534690febad481e0f4900f3
commit: 7a5c94c6c57219cee3eaf94eb299436abacf9078 [10/37] Revert "netfs: Speed up buffered reading"
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241002/202410021541.XyfZxho9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021541.XyfZxho9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021541.XyfZxho9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/cifssmb.c:1269:2: error: call to undeclared function 'netfs_read_subreq_terminated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1269 |         netfs_read_subreq_terminated(&rdata->subreq, rdata->result, true);
         |         ^
   fs/smb/client/cifssmb.c:1269:2: note: did you mean 'netfs_subreq_terminated'?
   include/linux/netfs.h:425:6: note: 'netfs_subreq_terminated' declared here
     425 | void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
         |      ^
   1 error generated.


vim +/netfs_read_subreq_terminated +1269 fs/smb/client/cifssmb.c

^1da177e4c3f41 fs/cifs/cifssmb.c       Linus Torvalds  2005-04-16  1263  
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1264  static void cifs_readv_worker(struct work_struct *work)
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1265  {
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1266  	struct cifs_io_subrequest *rdata =
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1267  		container_of(work, struct cifs_io_subrequest, subreq.work);
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1268  
e8fae9521d5072 fs/smb/client/cifssmb.c Leon Romanovsky 2024-09-25 @1269  	netfs_read_subreq_terminated(&rdata->subreq, rdata->result, true);
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1270  }
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1271  

:::::: The code at line 1269 was first introduced by commit
:::::: e8fae9521d507286f66374a1e1718588ddf0f4c3 Revert "cifs: Fix cifs readv callback merge resolution issue"

:::::: TO: Leon Romanovsky <leon@kernel.org>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
