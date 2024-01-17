Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B525626;
	Wed, 17 Jan 2024 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705529063; cv=none; b=UKIqRVMJZjx1kchQI/PIa9XE/O0V7wBLD5r6c3iChHzQyrDr56DTDovunF/gDMUU7UGJcp9nd02aB2UoqcOsIE18+w5ddKmak/o8MO2gvbBLhW8MgFqqP1me00hM+nb0rL1NiXKSyZNNLZD2rJ5gyr/8xV9gDLH03hWVm0JGC9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705529063; c=relaxed/simple;
	bh=t9laiL5QjGYRlOgL2prqe0wKAEW4zp2uP3wi/PxcvMk=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=dX2/tgXw4Sz7Cs0kGLPcteinpuEtu1yrAZQShgV9w+Aww2zE9Dkfgy4bcDSl6+zPlwL/mjX8iunlCK0SebqbNtAV+LF/fYoXk7/Yt9X5zbIaoLAIOcp/tHkJ2rwHrRLvHM0QnV59553aezx9Hi61t5u5QTJPaMXF0heyPN0iCAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZZjdMQq; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZZjdMQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705529061; x=1737065061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t9laiL5QjGYRlOgL2prqe0wKAEW4zp2uP3wi/PxcvMk=;
  b=GZZjdMQqrgu7LWhRek3vIhrpD8QN3gtst90Ou+EVodYNz1igYa+KC+ZI
   wSPB5R53FDo1Bk1K7/b1SLXSLiXoBPas7hhSyHs98MNq4rA2/+HrojauD
   fb5fRnJ8mKyOuVCJKEhsYEvD7V/AxWMHiHOSLBklDkax4GczcPugiVnQJ
   2oxmIm67EL7n4j+fNrE23FEtftLPlUNiJs/o+FywU9JAb8MZMtrLPEjoP
   izJASoEovWrHSvi4ELG7+wWHXXZaJvuXbH3nBQ8VjtVhDEr+GrfeiPGTS
   XTfXGGp9lAMCovnctakuZHhycTvfQRTF4PdyO5sjmtSKw3UGWHGkdxyxX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399948958"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="399948958"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 14:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="198997"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jan 2024 14:04:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQE1B-0002Ms-1U;
	Wed, 17 Jan 2024 22:04:17 +0000
Date: Thu, 18 Jan 2024 06:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 77/105] fs/ceph/xattr.c:1415:16: error: no
 member named 'length' in 'struct ceph_databuf'
Message-ID: <202401180545.om4l6lkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 5f8e8cf45a6f84108c392fdf99ccab5c44d5bb79 [77/105] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240118/202401180545.om4l6lkx-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180545.om4l6lkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180545.om4l6lkx-lkp@intel.com/

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
