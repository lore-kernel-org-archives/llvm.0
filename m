Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EB2331222;
	Mon, 23 Mar 2026 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307956; cv=none; b=ZVbYRp5wgVyNqdLrYInxY+QbD9eaB1ZmC6rL/+ngeBqy/6OF8Bg8nv0PaGsQGW14XYArghrCiBpmcWci0yVlfcr3lJQQopE4+asqloXYkBzUcejdCp4sW6dMK8ZXTvHJoEJh0L4YXRqL73mn7ytEvfB+vc629AjUJNjJJnbJAjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307956; c=relaxed/simple;
	bh=2lZiCeCc8SPkeJnBsKKB6eCHQ9MFJaxsrHM5lKPuCSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tgLIBxII2PUhmKB+6h6WCgt4aXR+fKwpnfYwGmQ7lYkHLLMg5XG4fV7suRUrMcFot1foHxaxEdCEVxgHIpYYG3JXujcbEvljPzCozjmb7AWkFgednyv/yGFX79QH9FboALgVZOvKcfj/jbipgPfDtkarn5jhJ2AckGgxzhKLyv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNIzZSbF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNIzZSbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774307954; x=1805843954;
  h=date:from:to:cc:subject:message-id;
  bh=2lZiCeCc8SPkeJnBsKKB6eCHQ9MFJaxsrHM5lKPuCSY=;
  b=HNIzZSbFeOjiAoDIU5NsY6hNcNfOFGFrqM2dcnjvZyWW2J7ZDb0ltjlc
   53KdRSzB3z+2sHeYUD0+6b3gi9fuBWEEBBDaJgYKCxYzB7tVQ4Gh0nrzu
   ec2i0jltGA621hVVBgHciYTqNAmNrucE8mM/5Z77NG5J02TSMztwZDQUo
   +oCFBnqP59hIj4YErmavjhL7A/N80QoyZzYTAClLwPnWNqt1I1M0NQiV7
   cdkoSvrECQ1Sg3/wmEivhn/1WoRxiUt1+KgltkNcaV/H2tlRW+nX5fKB7
   aVo4zYf9CF1wBR8OazgRtSAcqf+l2WRAJXjuAZEJqbubHxgixXQ9fe9Ed
   w==;
X-CSE-ConnectionGUID: TtH6aMtwTh2MTSnw0XTFtw==
X-CSE-MsgGUID: /Ge+i+WaTDS/hAmroNkQjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79225232"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79225232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 16:19:13 -0700
X-CSE-ConnectionGUID: 6fTx2JidSemOBdakFOsHpQ==
X-CSE-MsgGUID: EQqdEIXwTHuJ/EK/iukEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247860433"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 16:19:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4oYA-000000006kb-03BI;
	Mon, 23 Mar 2026 23:19:10 +0000
Date: Tue, 24 Mar 2026 00:19:02 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 34/42] vmlinux.o: warning: objtool:
 netfs_prepare_write_buffer+0x38e: netfs_wait_for_encryption() missing
 __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202603240027.f0i73Kcq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: d045bc8a941a2f79f07a9d3fc62b3596fa4a4326 [34/42] netfs: Perform content encryption for buffered writeback
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260324/202603240027.f0i73Kcq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240027.f0i73Kcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240027.f0i73Kcq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: netfs_prepare_write_buffer+0x38e: netfs_wait_for_encryption() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
