Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE77012FB34;
	Sat,  7 Sep 2024 19:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725736406; cv=none; b=NJM4MTMeAx2gTutq3Nn29iNXxPFGHOM5ZpIZ9sQfXDusTEgNGe9wY/1PZo3E5EeECAohCG/oEIr6YMRwsrp3bLJsSEJiBrkQnvU/ct0Gn90g0YrOg8ANwX5Bae51K5EcLHO/8ZUo4/0x6OGZtSzCpqFzuPs98+C8DW/0t33x8MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725736406; c=relaxed/simple;
	bh=M7G8QhxpX8Lsn6Y9kK3wuVp4ioPvmqZ4i3GFJcWFIcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HuTlwKON6+mBCNvWNag5eoMrGGgVbdokelblq4etq3rOoQfO9JGUpuJBAjlavWaymSYf+/CmGCpQxaTQDSUALwokN83KtOPz0AHxrM5r3k311aEbxpto2WTEMKgenLAppESGGrB7TOJgGfjjUIud+hOYf/XhBfogXq0Sj4tX4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvIm16N/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvIm16N/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725736404; x=1757272404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7G8QhxpX8Lsn6Y9kK3wuVp4ioPvmqZ4i3GFJcWFIcA=;
  b=TvIm16N/GAJa6smyLYITSxSyjtxlN/nsIlA03p8qlM9OvynR1l9QJIYn
   PmrHFQt9njHdgVVMhYilLJOknpjbf0b3hinLOqsNLgFHxG5WEmPmU3xPA
   efsznpxrGLNLIXmRArzPOlXtEUwI0yd51UQTghuEDAK/zNJQUaBdyRtX9
   nBxhnvKD9vKyXf0f5h1i3zU3+cHmgt8MUFVRVd9l+iE5BL1uasGe+jiyg
   GYVA3V7qvG+dmD2mRavSNb5DJFPx6LqA4F7pbQCo4zYjiE4uwU8a6ZkO8
   3Tg2k3b3MRf7WlBk23zWgHb5JBaYjc4JLz6ZlOXoC7gaJphGEEZ4kdn4e
   A==;
X-CSE-ConnectionGUID: 5mpiUFOOQ8ekl54wUx27xA==
X-CSE-MsgGUID: oYlocIGzTTW1rSpxTB+lxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35824700"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="35824700"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 12:13:23 -0700
X-CSE-ConnectionGUID: nQuYHGvdQBalV0r43kfwUg==
X-CSE-MsgGUID: srcyW1pKSRKnDzqrfAgwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66052653"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 12:13:23 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn0s3-000Csx-1h;
	Sat, 07 Sep 2024 19:13:19 +0000
Date: Sun, 8 Sep 2024 03:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 34/61] fs/ceph/xattr.c:1415:16: error: no
 member named 'length' in 'struct ceph_databuf'
Message-ID: <202409080329.NmJOIurX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   6c59f154a1d493b31755ac17326124d804172fb2
commit: 8726f42ad95180ef7b6cafebb2098d6499a4d29b [34/61] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240908/202409080329.NmJOIurX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080329.NmJOIurX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080329.NmJOIurX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/xattr.c:1415:16: error: no member named 'length' in 'struct ceph_databuf'
    1415 |                 BUG_ON(dbuf->length <= sizeof(__le32));
         |                        ~~~~  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                             ^~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   1 error generated.


vim +1415 fs/ceph/xattr.c

  1374	
  1375	#ifdef CONFIG_CEPH_FS_SECURITY_LABEL
  1376	int ceph_security_init_secctx(struct dentry *dentry, umode_t mode,
  1377				   struct ceph_acl_sec_ctx *as_ctx)
  1378	{
  1379		struct ceph_databuf *dbuf = as_ctx->dbuf;
  1380		const char *name;
  1381		size_t name_len;
  1382		int err;
  1383	
  1384		err = security_dentry_init_security(dentry, mode, &dentry->d_name,
  1385						    &name, &as_ctx->sec_ctx,
  1386						    &as_ctx->sec_ctxlen);
  1387		if (err < 0) {
  1388			WARN_ON_ONCE(err != -EOPNOTSUPP);
  1389			err = 0; /* do nothing */
  1390			goto out;
  1391		}
  1392	
  1393		err = -ENOMEM;
  1394		if (!dbuf) {
  1395			dbuf = ceph_databuf_req_alloc(0, PAGE_SIZE, GFP_KERNEL);
  1396			if (!dbuf)
  1397				goto out;
  1398			ceph_databuf_encode_32(dbuf, 1);
  1399		}
  1400	
  1401		/*
  1402		 * FIXME: Make security_dentry_init_security() generic. Currently
  1403		 * It only supports single security module and only selinux has
  1404		 * dentry_init_security hook.
  1405		 */
  1406		name_len = strlen(name);
  1407		err = ceph_databuf_reserve(dbuf, 4 * 2 + name_len + as_ctx->sec_ctxlen,
  1408					   GFP_KERNEL);
  1409		if (err)
  1410			goto out;
  1411	
  1412		if (as_ctx->dbuf) {
  1413			/* update count of KV pairs */
  1414			__le32 *addr = kmap_ceph_databuf_page(dbuf, 0);
> 1415			BUG_ON(dbuf->length <= sizeof(__le32));
  1416			le32_add_cpu(addr, 1);
  1417			kunmap_local(addr);
  1418		} else {
  1419			as_ctx->dbuf = dbuf;
  1420		}
  1421	
  1422		ceph_databuf_encode_32(dbuf, name_len);
  1423		ceph_databuf_append(dbuf, name, name_len);
  1424	
  1425		ceph_databuf_encode_32(dbuf, as_ctx->sec_ctxlen);
  1426		ceph_databuf_append(dbuf, as_ctx->sec_ctx, as_ctx->sec_ctxlen);
  1427	
  1428		err = 0;
  1429	out:
  1430		if (dbuf && !as_ctx->dbuf)
  1431			ceph_databuf_release(dbuf);
  1432		return err;
  1433	}
  1434	#endif /* CONFIG_CEPH_FS_SECURITY_LABEL */
  1435	#endif /* CONFIG_SECURITY */
  1436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
