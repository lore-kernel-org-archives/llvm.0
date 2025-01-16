Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106DD24A7C6;
	Thu, 16 Jan 2025 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736999789; cv=none; b=paEK5BXhKS5fFzhgh4u8Q+gE5JYgl5cCUgZ4XpMX0163hVSD0h4GIattX38MsVSjYQb7CixwOF7fVCX+h0dXlXPk+9fcosU5iOYw6dshs2SKJj/EAZvn3PsvlD+UF2BdlN68PcWJT9/Hm7aDkXhtok42x9d0l3NGctv+vXw0kS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736999789; c=relaxed/simple;
	bh=J54ktpIytbVtRYBWw4uQZbiTxH1lTOakVyVF8WeVoGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9EQXM+mGZXNm9qc0r5BpxiHJbLqizxw8lOCBvsPv+h/4nLP/CbhqNQmpiUbtQNbKcyJQaTpom1r2Acdu2a9kdMBmps1HPweLeZu6yatBqDksLI4vUGXdU712gyGDknhfChcn84MJZXBEV8NWzMwgBIH2bf5GQxQk8GruT1p/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKrns3mQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKrns3mQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736999788; x=1768535788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J54ktpIytbVtRYBWw4uQZbiTxH1lTOakVyVF8WeVoGU=;
  b=SKrns3mQgrrck1Ch6chhivP7lKNKQRmj9t2DnLyd3s8pGj7E0Rq8JND2
   p9t5jiOkf8C86skDYPcQRpIPd33vW26YQO9IfIpvmKS4Si0KeB3BylyKx
   P58KVUjH98D7LQFOL308sqtvYra51AE/4yWZeah9BlHPyD1pu3j4V1HkX
   fU0umWJI7q9cxyziOwBLBOi4dVo5wdJUe/hmFp5vJjDNpuwTzG124XgkK
   g5hTSj1dbbBrRyqrHx+Yk4MmxeMMFy7/5TDZkXtaCiepJFhZqfR1YClVK
   u5glQHBpp6BQD80Cye6Z7vL5XNmgbwc/AITRj7RfHX7uiHDMZ9xV3AAD+
   Q==;
X-CSE-ConnectionGUID: 8/IN3o4cQyqgKeF3m2Iivg==
X-CSE-MsgGUID: utHZ4w0UR9m8D60SglVGVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37281736"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="37281736"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 19:56:27 -0800
X-CSE-ConnectionGUID: b5hGilBFQLmkcFwkJ0DfNg==
X-CSE-MsgGUID: o9OfaMX0R4OIlIQEKeyFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105804492"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jan 2025 19:56:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYGzX-000RDo-04;
	Thu, 16 Jan 2025 03:56:23 +0000
Date: Thu, 16 Jan 2025 11:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jan Beulich <jbeulich@suse.com>
Subject: vmlinux.o: warning: objtool: __ubsan_handle_out_of_bounds+0x3f: RET
 before UNTRAIN
Message-ID: <202501161128.VLM1VkvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
commit: a2796dff62d6c6bfc5fbebdf2bee0d5ac0438906 x86/xen: don't do PV iret hypercall through hypercall page
date:   5 weeks ago
config: x86_64-buildonly-randconfig-005-20250116 (https://download.01.org/0day-ci/archive/20250116/202501161128.VLM1VkvF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501161128.VLM1VkvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501161128.VLM1VkvF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __static_call_update_early+0x33: call to serialize() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ubsan_handle_out_of_bounds+0x3f: RET before UNTRAIN

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
