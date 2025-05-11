Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C43E573;
	Sun, 11 May 2025 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746975653; cv=none; b=Ki8AbLYiR1HxCox0LKwlv2ZBXpLnejQEsWyIOl7dzU2qMSCP72uN08vcq40Ze9liTlRdrG/DwoUHtlQaxD2n9bBLBQFFx1TeyrV/MhvKbeQTH798GRhHA3X9T19MT2NCtpP5GnoEcNtZIh7592zdIzkd8KMc0D25udvc+L7xfkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746975653; c=relaxed/simple;
	bh=gTSsCAo2HJAu/GodNl8N+nrQWmJQ5t2fdSiiCDI+0l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfyWIukoj2IXIeaGEU3JpLUkF9D9LsYkqc2ymXfwvsV5//zZlcjUvUqQyqcoqfYrn1PbqHeF4vQ4eDe2DTgG4E/Qbjct1wGSaoBV7nkT9a8E7JXgNqrr32bBKPfNltLHYleSpdfkzG2yldjHQNWQZ3X5ewU8g4snyCMc5SvMMN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPEkxlPv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPEkxlPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746975651; x=1778511651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gTSsCAo2HJAu/GodNl8N+nrQWmJQ5t2fdSiiCDI+0l0=;
  b=lPEkxlPvrR3qN9Q7wlcWHqXvlG75SPPiXaH9pbBWH7O0DVHGMNVmFUfP
   CLhcpwpHA4tnHAxM/LUk9HiCNI90af3HcboSoEwK8ihwZHg53KkLf23xm
   7W2WXaxqQHNZLFwKe6luAzlvrfge0O1gnQoEQUNJnAlYUlQgr11Xius/B
   2+Mw7EYzy6FZ3Jy3HngmGaDrB/0jRuz+5Yj0ESk1WF0cmh2lWZGpPt2UC
   SuACz3JXBXezSe8E5ukumyBknSmsk89zUXUpBC65p9VLwHrX2ActoTLwK
   XZYX3M+tI91BorXwGEVo4LWEavtdGx9r0Wf7HzcY09ORV95aLFH6v4HzZ
   w==;
X-CSE-ConnectionGUID: KjSw93H8RFeTEcOadApCPw==
X-CSE-MsgGUID: jCZdSrMpTVyWROedWRykPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48636382"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="48636382"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 08:00:50 -0700
X-CSE-ConnectionGUID: 3PQ5wB4DTvSkG9UazSpG8g==
X-CSE-MsgGUID: CtwYNgcpSwOElTqxiFSCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="142343495"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2025 08:00:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE8AZ-000DoH-0w;
	Sun, 11 May 2025 15:00:47 +0000
Date: Sun, 11 May 2025 23:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.coredump.socket 11/17] net/socket.c:3606:14:
 error: use of undeclared identifier 'SOCK_COREDUMP'; did you mean
 'SOCK_STREAM'?
Message-ID: <202505112251.o8vQJy7U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.coredump.socket
head:   a6db84ba07f7137a473dace5a769551ee0ae3415
commit: fae7938dfe0ba5302ee34640a53a85c6305ad99c [11/17] coredump: add coredump socket
config: mips-ci20_defconfig (https://download.01.org/0day-ci/archive/20250511/202505112251.o8vQJy7U-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505112251.o8vQJy7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505112251.o8vQJy7U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/socket.c:3606:14: error: use of undeclared identifier 'SOCK_COREDUMP'; did you mean 'SOCK_STREAM'?
    3606 |         if (flags & SOCK_COREDUMP)
         |                     ^~~~~~~~~~~~~
         |                     SOCK_STREAM
   arch/mips/include/asm/socket.h:31:2: note: 'SOCK_STREAM' declared here
      31 |         SOCK_STREAM     = 2,
         |         ^
   1 error generated.


vim +3606 net/socket.c

  3587	
  3588	/**
  3589	 *	kernel_connect - connect a socket (kernel space)
  3590	 *	@sock: socket
  3591	 *	@addr: address
  3592	 *	@addrlen: address length
  3593	 *	@flags: flags (O_NONBLOCK, ...)
  3594	 *
  3595	 *	For datagram sockets, @addr is the address to which datagrams are sent
  3596	 *	by default, and the only address from which datagrams are received.
  3597	 *	For stream sockets, attempts to connect to @addr.
  3598	 *	Returns 0 or an error code.
  3599	 */
  3600	
  3601	int kernel_connect(struct socket *sock, struct sockaddr *addr, int addrlen,
  3602			   int flags)
  3603	{
  3604		struct sockaddr_storage address;
  3605	
> 3606		if (flags & SOCK_COREDUMP)
  3607			memcpy(&address, addr, addrlen + sizeof(sock->sk->sk_cookie));
  3608		else
  3609			memcpy(&address, addr, addrlen);
  3610	
  3611		return READ_ONCE(sock->ops)->connect(sock, (struct sockaddr *)&address,
  3612						     addrlen, flags);
  3613	}
  3614	EXPORT_SYMBOL(kernel_connect);
  3615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
