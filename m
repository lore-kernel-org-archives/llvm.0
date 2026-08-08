Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FB39A070;
	Sat,  8 Aug 2026 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786219141; cv=none; b=ZzreD5DA5nVOcVxKBHQ103YFZuwTNqLPFeItFuFR0FGjOa4ytWOpBxYoQaGofCmnZZP8yefwyVun0Jm3GVV/EfATyYAK/fRECn11HB9PSSVikeD9hsJJxhEb3hzKXFPAjTs+SqPtm0F56sTPn9d33CSsKILFUU6kmG7gKg0bDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786219141; c=relaxed/simple;
	bh=7OeScbiT9qVouqV2Bj7KCuf0KE48McmnqmUI9BvUajQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ENZgnGhg5SI6SYGgI3mleUl+vNjPwmTSskKYIBRriQUew+5axeoTuv5hG2jcgqKK6/M89TWtO/zwle0frxPpiErgfPPYtSuLUtIkkMp7G39NoG9oLcHS1uyp19dEGoBX6xqvn5ZkgAKvm2R3nIJW6VwrB3jCL4yY7rtJh7Q3ask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6Spg5aI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6Spg5aI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786219139; x=1817755139;
  h=date:from:to:cc:subject:message-id;
  bh=7OeScbiT9qVouqV2Bj7KCuf0KE48McmnqmUI9BvUajQ=;
  b=n6Spg5aI2Q/wM/rcNLmfGAhWQkZaOsgU31K5j49I4WHr5phS0BQVDBAX
   LtfeIdo90vYQkqyhksG/GVSDTQ4vyYr5zVhk2QTUhfnALlHIVuFXDehJg
   GZGXeobeUp62gtGUVYg2cS7ceUE27zlOPSOa5B00/wW/ZgqpYdv+nKao1
   /BMQlw1O6Iy5kMwLzwL1RplKJPegCjopZYH4MRJYA+JmiuV495vJMJR63
   FGx5j2BvvZ0Fb/wAGhq9c8hLyJs5vModn6hC8TJVL/JuyMGyn7W+4yZ0H
   8n/EGVDc7gEv/9L3r0oJjEtlGlihtN5WBpVCLkCbH5MXcnV8XVVkdEm4s
   Q==;
X-CSE-ConnectionGUID: fQy6g4dyTdSPThnhfu5/Vg==
X-CSE-MsgGUID: duFUOh45TT+e8b5ttQ6R5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86802046"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="86802046"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 12:58:58 -0700
X-CSE-ConnectionGUID: LQcn1vwKTEaw7FzOa8BvaA==
X-CSE-MsgGUID: 3iYcxO7lQZSXuSw8F9TTQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="287371928"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2026 12:58:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsnC2-00000000Kiv-0qW9;
	Sat, 08 Aug 2026 19:58:54 +0000
Date: Sun, 09 Aug 2026 03:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 14/14]
 security/apparmor/net.c:320:41: warning: address of 'needput' will always
 evaluate to 'true'
Message-ID: <202608090314.Dklzj6Ip-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   bbb153c86dafaa6497b8a0a5372d1e79be8a7617
commit: bbb153c86dafaa6497b8a0a5372d1e79be8a7617 [14/14] apparmor: optimize current_label_crit_section() with needput
config: x86_64-randconfig-001-20260808 (https://download.01.org/0day-ci/archive/20260809/202608090314.Dklzj6Ip-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608090314.Dklzj6Ip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608090314.Dklzj6Ip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/net.c:320:41: warning: address of 'needput' will always evaluate to 'true' [-Wpointer-bool-conversion]
     320 |         end_current_label_crit_section(label, &needput);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~~~~
   1 warning generated.


vim +320 security/apparmor/net.c

   307	
   308	int aa_sk_perm(const char *op, u32 request, struct sock *sk)
   309	{
   310		struct aa_label *label;
   311		bool needput;
   312		int error;
   313	
   314		AA_BUG(!sk);
   315		AA_BUG(in_interrupt());
   316	
   317		/* TODO: switch to begin_current_label ???? */
   318		label = begin_current_label_crit_section(&needput);
   319		error = aa_label_sk_perm(current_cred(), label, op, request, sk);
 > 320		end_current_label_crit_section(label, &needput);
   321	
   322		return error;
   323	}
   324	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
