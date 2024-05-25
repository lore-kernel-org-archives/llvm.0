Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAB12C69A;
	Sat, 25 May 2024 23:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716678740; cv=none; b=d3isxI7AJVNq24s6to/PXNtcGt6uwL7WBsujgtEz/KVl9IJEyEMBCJvbg9Qi2n9BsMNyHwZwaYae5nY5kwQQ0yrcnsdItwvuq7BXChg28CKvMk1i3Y9jqJKMuNUBUVfuuVtBxvIOlABoOzJK2PqRoMCEZP97ijFBqIBVHXpPa/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716678740; c=relaxed/simple;
	bh=75glpFOhw/7cyRJjauXDPBAYr3QfTCVtXpIkvD69TiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9xYB4holWvjfIujzH4X8tjoAUzzw6xRMiMDYBQIxSdxDSIB1vXNxh/tG+G+Z8IybXyembYoHfmpRXGXQ1lXW39VXg/OaCGDPdPNt8oiXS28t/P9Iq9WMLV4z4RW7TChza49pmL8+A4Eod17tnfN7lfbcAYkBMyL5QaJZyMmxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLQQ6cgK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLQQ6cgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716678739; x=1748214739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=75glpFOhw/7cyRJjauXDPBAYr3QfTCVtXpIkvD69TiY=;
  b=nLQQ6cgKtAR0QZwnC2K2OOhSY8X9XkxwzGWcMuGScABdD5p5dz+MxnKW
   BNEimJKzkYrLXADFKRBZFfMWK3SSZLoCYRnmCz0T/b/qEwVik/XL01xPJ
   R4qtYw0syBGTddKzqd/BION6WFzVGmJRz9DQziQazTalfq1fWQTugqjro
   IIWSYa6SkgWfO6s43YPD1AFf8k2WyPJFKtViWaDTmKrbIs4UvPKLaFYuq
   Oz0Vtp8uIzSKrlj5UF4X89L8iCmO+8B1bee+YuU8FdiJ+2r8coSOGRQ/E
   ezjXsI5v/wWV22IDhFfmIugkoaMPHf/QQxqM1nCLY77BBSoOcLAOT6MUZ
   g==;
X-CSE-ConnectionGUID: LlW2JUtNSJ2R4rYjuve8Kg==
X-CSE-MsgGUID: XlRc9eJXTZGs/razWieiVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="23630221"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="23630221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 16:12:18 -0700
X-CSE-ConnectionGUID: viTfTIV5TMihNZDAakA6Ig==
X-CSE-MsgGUID: jHllbbTNQcagxdtDpkXxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34458533"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 May 2024 16:12:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB0YV-0007Vn-02;
	Sat, 25 May 2024 23:12:12 +0000
Date: Sun, 26 May 2024 07:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2key-v6 7/8]
 crypto/asymmetric_keys/tpm2_key_rsa.c:646:10: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202405260700.cpGs7Far-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   aaca9ec010dd34be09499bbf1bcec969b56c560b
commit: 89db40264dffec84747b770d7ba79f893ef48f4b [7/8] keys: asymmetric: tpm2_key_rsa
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405260700.cpGs7Far-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260700.cpGs7Far-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260700.cpGs7Far-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_rsa.c:589:6: warning: variable 'attr' set but not used [-Wunused-but-set-variable]
     589 |         u32 attr;
         |             ^
   crypto/asymmetric_keys/tpm2_key_rsa.c:591:6: warning: variable 'alg' set but not used [-Wunused-but-set-variable]
     591 |         u16 alg;
         |             ^
>> crypto/asymmetric_keys/tpm2_key_rsa.c:646:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     646 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:642:9: note: initialize the variable 'ret' to silence this warning
     642 |         int ret;
         |                ^
         |                 = 0
   3 warnings generated.


vim +/ret +646 crypto/asymmetric_keys/tpm2_key_rsa.c

   635	
   636	/*
   637	 * Attempt to parse a data blob for a key as a TPM private key blob.
   638	 */
   639	static int tpm2_key_rsa_preparse(struct key_preparsed_payload *prep)
   640	{
   641		struct tpm2_key *key;
   642		int ret;
   643	
   644		key = tpm2_key_decode(prep->data, prep->datalen);
   645		if (IS_ERR(key))
 > 646			return ret;
   647	
   648		if (key->oid != OID_TPMLoadableKey) {
   649			kfree(key);
   650			return -EBADMSG;
   651		}
   652	
   653		ret = __tpm2_key_rsa_preparse(key);
   654		if (ret < 0) {
   655			kfree(key);
   656			return ret;
   657		}
   658	
   659		prep->payload.data[asym_subtype] = &tpm2_key_rsa_subtype;
   660		prep->payload.data[asym_key_ids] = NULL;
   661		prep->payload.data[asym_crypto] = key;
   662		prep->payload.data[asym_auth] = NULL;
   663		prep->quotalen = 100;
   664		return 0;
   665	}
   666	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
