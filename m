Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD6C125;
	Sat,  2 Nov 2024 05:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730525060; cv=none; b=nKW3cE+xif87Ph6Iybv+Se2TDxQm4F2+kFnk3SeaHqY3Nimikk1QrAyKfJ5p179uUnARpFUundemo6SuzWP66J3cJ1tqH3HQP5VpyRJGTw09QY0S727/Dk2+9dWic6+FaStb7O1bVsqlf5qZRZKmsf/riBWWiMtPfYEZiAEJ728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730525060; c=relaxed/simple;
	bh=0KmM/0DXaV+MfNkcyjQqqPrmAoyaQNBB7ognZHkrbQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvfPGqKTPPDjJttWsTM1JN4TuJziCnKeqQFSJO9c8TKyq4F3Psy1D7b23G1lwGw1I2M6pHTqCE2pmJtQB9TZlg2tcfVKwXHPnhSj0xJClOPm+oyE7SCy0u69RpzU1W6//VjulnsfWqQp45wYR9N6wZqw8nG3XD1AW93yH3o60TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUg/E0YU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUg/E0YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730525058; x=1762061058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0KmM/0DXaV+MfNkcyjQqqPrmAoyaQNBB7ognZHkrbQQ=;
  b=SUg/E0YUuDkKE1VqZDn0yPwnbhltehaPxLnnSoEBTwPFx2eunYf0lF40
   J1AARtfqpIzLmPKV2oNvAek1I4+khPI5DMtfvwSLlRA5NPiJDczlMWGEH
   ntKjuUHxNDRG73Wd+yXpQuXNFabi69ZqXK7lLkDitsbHBiKAgZ7GGGdCW
   m/2GbO3GuhFpfTGGE9IN75Qg5K8nudowF7R4ePEbQYML9jk4wczR19SqK
   h1tYenTa384787Vv1aklLLz6GFC0LNZHw9QmYKz/5ZMM+TI8t9lNiToPy
   ABbYmOrbUSfENCyB2Z8Iy9aUf0kFd4LzKe/epUC1hV7FX6HrRKUwCZb0d
   A==;
X-CSE-ConnectionGUID: ANBlJAouTIu/ByleSVaTNA==
X-CSE-MsgGUID: fdq19SXvQ8a8ep9A8LL5Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="40924404"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="40924404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 22:24:18 -0700
X-CSE-ConnectionGUID: bAeEtVbQQ7ioFQDszy1IsA==
X-CSE-MsgGUID: 34RMNg1zQpa2G4F0a6Iomw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83603794"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2024 22:24:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t76cQ-000iSL-1O;
	Sat, 02 Nov 2024 05:24:14 +0000
Date: Sat, 2 Nov 2024 13:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next fanotify 4/5] fanotify: Enable bpf based fanotify
 fastpath handler
Message-ID: <202411021334.BYbBTg4G-lkp@intel.com>
References: <20241029231244.2834368-5-song@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029231244.2834368-5-song@kernel.org>

Hi Song,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]
[also build test ERROR on jack-fs/fsnotify linus/master v6.12-rc5]
[cannot apply to bpf-next/master next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/fanotify-Introduce-fanotify-fastpath-handler/20241030-071530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20241029231244.2834368-5-song%40kernel.org
patch subject: [RFC bpf-next fanotify 4/5] fanotify: Enable bpf based fanotify fastpath handler
config: i386-randconfig-013-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021334.BYbBTg4G-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021334.BYbBTg4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021334.BYbBTg4G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/notify/fanotify/fanotify_fastpath.c:4:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/notify/fanotify/fanotify_fastpath.c:217:7: error: call to undeclared function 'bpf_tracing_btf_ctx_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     217 |         if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
         |              ^
   1 warning and 1 error generated.


vim +/bpf_tracing_btf_ctx_access +217 fs/notify/fanotify/fanotify_fastpath.c

   211	
   212	static bool bpf_fanotify_fastpath_is_valid_access(int off, int size,
   213							  enum bpf_access_type type,
   214							  const struct bpf_prog *prog,
   215							  struct bpf_insn_access_aux *info)
   216	{
 > 217		if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
   218			return false;
   219	
   220		return true;
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
