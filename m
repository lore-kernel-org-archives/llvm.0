Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CB28DD1;
	Wed, 17 Jul 2024 19:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721245951; cv=none; b=pxtlomHrhPkZsG7POTr98XYIPRTXtBvuw6pLa66a5xjy5jwblXTsP1TYWHZtMUix5PQC76b+4wioivdWW7Nmlgg2GAYkP3PP6g0auDgsqgnFkGjSndrwNS9/C6+0RffBZcAH7z2fYK1Irl/Xv6PolN4LQurr0tSMQ7gkyilCtVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721245951; c=relaxed/simple;
	bh=hyk8sVuH7ZeqgtZ+L7ySITm30gqEXnPYQp/EiVA+748=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xsb4yQCL3VEddw86n167Ca77W0srGnx5u8oVcFtSjgCRFxaSnRXViDVfeGTpupqOq8mbrdRAPT6yDPFXM/2kF54w3iWlM/upmsczQChVYMm57iro4PTOccnJXV/fa4uRMIc1QrUuUx/IGfiO3olGNv8xe0rDDTQn9DpzHmyFjmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N70zZ7+R; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N70zZ7+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721245949; x=1752781949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hyk8sVuH7ZeqgtZ+L7ySITm30gqEXnPYQp/EiVA+748=;
  b=N70zZ7+RwFk+iksKuEjMj0hlJskFVZuZt0uj3+Ix0YiaKEUY8D/6QnG5
   AIS9xbIaFK3JE/yT8wnawTZ3sWnavexRYnF6oCUE8rsmAhxUss7vUvgHD
   cejzFI0IeLWtGhmEXGVjFyFacjLBjSQYPTXU+H1esMy3xi7juIvTCYDEF
   OgKLuPv2Tq7waigy5sippHGww9IHN13r7kUnqQIffGsYlrWWaRSDSk81f
   kXHBlnbAfEr4xZsjkx066vmHacLCkw5459QeBKqh9QXLQRQ4e2HmO2n6p
   F3q1VwZz0n7bxj4LqLYr2eWtQwtUL+KBIrhNfAYjV2ayMqK3xhE3W27o1
   g==;
X-CSE-ConnectionGUID: mbB9rAiIQO6/mdRtKj9iEw==
X-CSE-MsgGUID: WbIiIlgmThSFicCJBsKpeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18585852"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="18585852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 12:52:29 -0700
X-CSE-ConnectionGUID: MDYC674ZSW+4tDwWM0tRng==
X-CSE-MsgGUID: yU7ofGjyTIiyUVrUV0hCxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="54835351"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2024 12:52:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUAhN-000geM-16;
	Wed, 17 Jul 2024 19:52:25 +0000
Date: Thu, 18 Jul 2024 03:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v5 12/16]
 include/linux/nvme-keyring.h:23:9: error: incompatible integer to pointer
 conversion returning 'int' from a function with result type 'struct key *'
Message-ID: <202407180316.d7PG9Cr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v5
head:   4d58e409712027c1084413a8c31e93af4d148650
commit: 13f334e9641984819a87fa14cfc477a19c372ed4 [12/16] nvme-tcp: request secure channel concatenation
config: i386-buildonly-randconfig-004-20240718 (https://download.01.org/0day-ci/archive/20240718/202407180316.d7PG9Cr1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180316.d7PG9Cr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180316.d7PG9Cr1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/host/auth.c:15:
>> include/linux/nvme-keyring.h:23:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct key *' [-Wint-conversion]
      23 |         return -ENOTSUPP;
         |                ^~~~~~~~~
   1 error generated.


vim +23 include/linux/nvme-keyring.h

9d77eb52778499 Hannes Reinecke 2023-08-24  19  
c85200aaab7f12 Hannes Reinecke 2023-04-19  20  static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
c85200aaab7f12 Hannes Reinecke 2023-04-19  21  		u8 hmac_id, bool generated, u8 *data, size_t data_len, char *digest)
c85200aaab7f12 Hannes Reinecke 2023-04-19  22  {
c85200aaab7f12 Hannes Reinecke 2023-04-19 @23  	return -ENOTSUPP;

:::::: The code at line 23 was first introduced by commit
:::::: c85200aaab7f1248dd0142da172df0047ddbb812 nvme-keyring: add nvme_tls_psk_refresh()

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Hannes Reinecke <hare@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
