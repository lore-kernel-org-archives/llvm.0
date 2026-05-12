Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101153B1EF0;
	Tue, 12 May 2026 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595990; cv=none; b=ECJvcF4C5ftZ41gu6BrPXOtEn85Pn6dBKVkuK2GeRRKDZttpEgtAgGInZbqs8Cdi8yIWzbk9qhyxbNUhmHFHjYIi48XFYFCQMhC1fz5pCJUe02ybtQry2rIyxlTdgC7HkJ0b73b79MiL9T8bCZSQv6Tu8AQ0OAzu2UopPldvBGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595990; c=relaxed/simple;
	bh=JGUSGo/1t1blpM4zuospUqxPhZ6FhthnNivgSxSnCoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=la4hwpnxSB/859BCoacsntnnNHqote+O5Jf7teuvssOPmNHkcIQP+pV7nFfp/tJH4xg7eB7ienuPbj/xlk1YCfE9MJPdmgHTXkKstaeIZFglmfNGhr7W65VZQDe4V45oDLLCKd/oChdVXOVOkCG7EV3VdMNvz6opbJHY3tNaIpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6qmpFmy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6qmpFmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778595988; x=1810131988;
  h=date:from:to:cc:subject:message-id;
  bh=JGUSGo/1t1blpM4zuospUqxPhZ6FhthnNivgSxSnCoU=;
  b=a6qmpFmyaQo/vTDY551JejC54Zf1A6BlwoztPNteJ/vTu/HbbyztcjdC
   gomXC6EFM3J19gREwjrQ2np3hHTL5+O1o6YA+YUkJTyTM7srgCSm6wfMb
   XdqyFURvXFf5F9AN+MiTyx1NkQ0OQGzf4ZuA2u6UwH+nTX9UeFVilewdL
   2KE5KRGzdq+5xUtt5jscGTlO8arU3EZWgHNiCI/CCkHVj7lZlQecozasA
   VSDrQsuwCQOpvpc7p/KoVh6Ct+7GAQoRDypx508SVW7FnRfRqIOQxU3S7
   IM+jzERwiHiEEneUiFOXiu91VoiEit3Duaw0SOt8DUxMC1oBcesF6LD0B
   g==;
X-CSE-ConnectionGUID: SgEIM67pSOOIPsYCrYZnUQ==
X-CSE-MsgGUID: TmxEQAhIRm64vldmp+aggA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83358416"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="83358416"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 07:26:27 -0700
X-CSE-ConnectionGUID: 2ovxivtrSmCVnqs+iIrJjA==
X-CSE-MsgGUID: 3PQqNRWDSXW/hjRfHI+/ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="233476844"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2026 07:26:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMo40-000000008HX-0xLi;
	Tue, 12 May 2026 14:26:24 +0000
Date: Tue, 12 May 2026 16:25:56 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/syscall.c:1655:1: warning: unused label 'free'
Message-ID: <202605121640.S7Uw0tDN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Extend-BPF-syscall-with-common-attributes-support/20260512-141718
head:   cf666930ba205510468d7879922c1237df7292c9
commit: 7cab8e74b4f11d29c3c1bc065fbdfc54b04ac102 bpf: Add syscall common attributes support for map_create
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260512/202605121640.S7Uw0tDN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121640.S7Uw0tDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121640.S7Uw0tDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/syscall.c:1655:1: warning: unused label 'free' [-Wunused-label]
    1655 | free:
         | ^~~~~
   1 warning generated.


vim +/free +1655 kernel/bpf/syscall.c

  1634	
  1635	static int map_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_attr *attr_common,
  1636			      bpfptr_t uattr_common, u32 size_common)
  1637	{
  1638		struct bpf_verifier_log *log;
  1639		struct bpf_log_attr attr_log;
  1640		int err, ret;
  1641	
  1642		log = bpf_log_attr_create_vlog(&attr_log, attr_common, uattr_common, size_common);
  1643		if (IS_ERR(log))
  1644			return PTR_ERR(log);
  1645	
  1646		err = __map_create(attr, uattr, log);
  1647	
  1648		ret = bpf_log_attr_finalize(&attr_log, log);
  1649		if (ret) {
  1650			if (err >= 0)
  1651				close_fd(err);
  1652			err = ret;
  1653		}
  1654	
> 1655	free:
  1656		kfree(log);
  1657		return err;
  1658	}
  1659	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
