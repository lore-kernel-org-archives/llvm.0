Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C373918BC26;
	Sat, 18 Jan 2025 21:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737237491; cv=none; b=RADhwC1vYBYZjmlq4/xe5XDOfMK57tuLGq+AU2iHCH4OhK+RDHbp7vNHFaGR6kkX0l8L/XADQM+NkuaXD9kYocTnnGlgjYqFtBLf0GYTJ5UAuRXtNPtPjWhH7ldbja7A7XS14mOstwd9Gl/G4aTNQsa/9JAFdOZITKHhRygH8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737237491; c=relaxed/simple;
	bh=Uf1YixS27d4NtYwA4hyDD766mbXQbbMNpVkkqIEz3O8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLh6BzKaNFbddoE+2/vQO6VDbv0iyGfYN8nJ3HeBU5zDtDInyUh31a7y1nuoNpjuxpbjdSo/jBGa+JfKcP7xmhAdV6JQm4sUAT6ooWQRVM8xI2ZoxDeZpmgFEYdzg9QnvDb+Gq/g50tWygTdl3GNIOoo8NTmNbq4kqltWaerpV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Do9ySfCw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Do9ySfCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737237490; x=1768773490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uf1YixS27d4NtYwA4hyDD766mbXQbbMNpVkkqIEz3O8=;
  b=Do9ySfCwIm0BtA59fBDHP/fLrzay7J1AXT/i7j3IykMMNGSrAFqZtHu2
   gVA11Ez5c9+lSV2J3ceCCutSg+/VKzU+YTYMKyQzbF4EP5ugZjPsRj9Md
   kkG54DZu/eMsTIvyVTDIOOFQqq3iSs+5lRuaGEoCsB21ZEbgDiUCvpyrM
   ye/D7foP3vCNuLLfurbKeotFmnY6Wc8ZBLfcVD/jidHAYfJBQAiXd5wR5
   36CrvHTP49k5aRZlIShgwaxr/6i41ZdtXN4FODibFJE6KXLhuTzM3taW9
   qLQgo773+wDlijAti8xaY9Ms1+omlLmK5Pu41xBfVHwFBu5KmPkIImBnQ
   Q==;
X-CSE-ConnectionGUID: F5ShBfDhTDOERs8Ms666Vg==
X-CSE-MsgGUID: GDcBS8tESr6vn6pUHMMksg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48232390"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="48232390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 13:58:09 -0800
X-CSE-ConnectionGUID: qRIZwUGwQmKjH5FW+5LmYQ==
X-CSE-MsgGUID: 3wjsizlZRIiVIA6xvHDPrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="111105855"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jan 2025 13:58:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZGpQ-000UqZ-2r;
	Sat, 18 Jan 2025 21:58:04 +0000
Date: Sun, 19 Jan 2025 05:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 2/19] security/apparmor/lib.c:93:
 warning: Function parameter or struct member 'size' not described in
 'val_mask_to_str'
Message-ID: <202501190501.bzqRRdwK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   e6b087676954e36a7b1ed51249362bb499f8c1c2
commit: 71e6cff3e0dde6f6a3355d6c73ca3e176567995e [2/19] apparmor: Improve debug print infrastructure
config: i386-buildonly-randconfig-005-20250119 (https://download.01.org/0day-ci/archive/20250119/202501190501.bzqRRdwK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190501.bzqRRdwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190501.bzqRRdwK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/lib.c:93: warning: Function parameter or struct member 'size' not described in 'val_mask_to_str'
>> security/apparmor/lib.c:93: warning: Function parameter or struct member 'table' not described in 'val_mask_to_str'
>> security/apparmor/lib.c:93: warning: expecting prototype for aa_mask_to_str(). Prototype was for val_mask_to_str() instead


vim +93 security/apparmor/lib.c

    83	
    84	/**
    85	 * aa_mask_to_str - convert a perm mask to its short string
    86	 * @str: character buffer to store string in (at least 10 characters)
    87	 * @str_size: size of the @str buffer
    88	 * @chrs: NUL-terminated character buffer of permission characters
    89	 * @mask: permission mask to convert
    90	 */
    91	static int val_mask_to_str(char *str, size_t size,
    92				   const struct val_table_ent *table, u32 mask)
  > 93	{
    94		const struct val_table_ent *ent;
    95		int total = 0;
    96	
    97		for (ent = table; ent->str; ent++) {
    98			if (ent->value && (ent->value & mask) == ent->value) {
    99				int len = scnprintf(str, size, "%s%s", total ? "," : "",
   100						    ent->str);
   101				size -= len;
   102				str += len;
   103				total += len;
   104				mask &= ~ent->value;
   105			}
   106		}
   107	
   108		return total;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
