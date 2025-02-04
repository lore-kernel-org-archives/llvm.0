Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D72135AC;
	Tue,  4 Feb 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683691; cv=none; b=YurvlF78nplfj9IOCQa/b67s0uzMhsEebo5/x8UexVsZm2E6/T3tqqn+dJcBNZLAXyDs24yoxaoY4WhCUJoDDr7f1Wy/7L5yuWvttDzHHNYIrAuXCM2IYlN9X9pEvgGiBZcDE+QsJ2TxIRmhIhLXtM5Ljk320oe/v1a7v94g86Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683691; c=relaxed/simple;
	bh=vsH1yEDEiUP/0p98fR/7UqdPl5n5kegziq2UkPiIE3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8pz6SV/WhUJaCH8vOy1B2W8uaCQBwdXCRk8EQzNgJN7hkqkH8FArAMSqgVyb4yvRIT2JHaCCWhA/e6fv77BKOvQgv9bIBNenfDZcIOMd9X0u4blOCFapkyngzOrfWIHZK2/H0brn2oYXRidS9coEq6Uiw6ZlH7BQdf7Xrm5H8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuCj+Im9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuCj+Im9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738683684; x=1770219684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsH1yEDEiUP/0p98fR/7UqdPl5n5kegziq2UkPiIE3A=;
  b=WuCj+Im9BBWHfFivFyOj161Qx66Ii13dXWBkfE7JT+v+11yvbLKUrl+o
   UH+S5JjSQaW5nsjabrepZSj59yHp76D27BSMA/6k59yTgXgmL9qWiTVsP
   a73zTOqp1KqDmNVQ3K6q6/CwDMPTMxhKR73rMXG5/88ImMvafqwcm4Xcb
   QXubLLstpYbRvZehGNYxY7i1iMvtP2q9kQmBfhPTwSTeLFlpl//1lhhg2
   x6I+qljCiXNqKMJyDw+ALYvCXFII18dYXxsvYizW6stlIqyXapGxeNrIu
   2bR+lVUKeXn5wEo9+wh0kHAuiYGTySGO2VfaNlzI70I5yc/ZMvtONFeHl
   A==;
X-CSE-ConnectionGUID: 6fTrvFMQQpOLaASM5/Qlaw==
X-CSE-MsgGUID: 0s+hVSzcSYSOhmoG+JnJTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49830940"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="49830940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 07:41:21 -0800
X-CSE-ConnectionGUID: N9gIT4uhQA+teZyFuiQhYQ==
X-CSE-MsgGUID: S7sF5V4AR3ySVSOnAXZfmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147835638"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2025 07:41:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfL37-000sdd-0s;
	Tue, 04 Feb 2025 15:41:17 +0000
Date: Tue, 4 Feb 2025 23:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 20/23]
 kunit-uapi-example.c:undefined reference to `puts'
Message-ID: <202502042336.1EG4c06S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   6d126c0bfc92d0e1a6bdfa63079084a712cfaad6
commit: 3bb4eba563cc71cd24e0ee6106cbd04a490a93c6 [20/23] kunit: uapi: Add example for UAPI tests
config: i386-buildonly-randconfig-005-20250204 (https://download.01.org/0day-ci/archive/20250204/202502042336.1EG4c06S-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502042336.1EG4c06S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042336.1EG4c06S-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: /tmp/kunit-uapi-example-b6af0a.o: in function `main':
>> kunit-uapi-example.c:(.text+0x10a): undefined reference to `puts'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
