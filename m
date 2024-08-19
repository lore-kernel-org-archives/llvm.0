Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50840175D46;
	Mon, 19 Aug 2024 19:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724094902; cv=none; b=SIjx51+JmQBoqKn2Iq1W77BH98xxT/QNvG0EYWurxK0UJxjftKRkDYwnapqPTm4vnYWucKIm+kYd3lkQmI62vmbcHXCV/1vEEHYOCnKqPMgEjDrIxx5yukyw6IZAQ/ZRUrp4HdnjLGpD6Z/tfH4EqGmRr0x94tIQLjue/XMsrII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724094902; c=relaxed/simple;
	bh=lZXYtOdOmZ6ORLbI1KAZypHMsgBhnkWs7livrES3pP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yo8HslcPrK0HYprLNhH8u0K5+3GgWK9W1u1nEYphAgO6jqhFLAKwt3DVChjfJ8YM/OXvfhlJE1BMUmQFwOSS7IPQ1IGEHzTfWdrbB7JCNAG1ziqfIk8BsDbm2hVaSqR2uyc0LyojISeTMX3UNpZXUwZKxI86+6V0PWxGzQYhEFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmHaHzKf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmHaHzKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724094900; x=1755630900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZXYtOdOmZ6ORLbI1KAZypHMsgBhnkWs7livrES3pP4=;
  b=PmHaHzKfXYFLdz/xDj1i1wzKLTLRp33XRNrXZgnTch2SpM3dolJuIXpA
   GnCVLJtuM4JQo8mUwopQr+jZgexjlxwCdcOsy/6YSX0FK6DYIsfAoBmN5
   iXs/cRk4vzdzW33JHyCmGD8P550IUE4gmiLWqo11CpZBK7iRb5HQH3qoh
   kfAU0LQxLDcR7PXEKxdeio1cR7DrR57ugEQgMafpmj+WRxZJZ/4dKrgXB
   KKizNNM7Ldg4P5L8mwO0qxFN9/9b+G9NkLULsWceV0aX6p7DUjX6KcxDq
   pcoFwVpfH72n5LxFeb4/um4LNOlmh7xb7ir0DKtb6VKCZ6pwGB91MeTfk
   w==;
X-CSE-ConnectionGUID: 0P6nEY4WQYuYOQ7716VWAA==
X-CSE-MsgGUID: hMPs/vNdTMKiUFk8fQ1NYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26120618"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="26120618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 12:14:59 -0700
X-CSE-ConnectionGUID: cTZjV0feTze9FJIz5ZjQhw==
X-CSE-MsgGUID: fMGqNo7jRjqhbKNuLAy5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60526817"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Aug 2024 12:14:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg7qC-0009LW-0g;
	Mon, 19 Aug 2024 19:14:56 +0000
Date: Tue, 20 Aug 2024 03:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:secure-concat.v9 3/10] include/crypto/hkdf.h:25:10:
 error: use of undeclared identifier 'ENOTSUP'
Message-ID: <202408200307.yPvUJ1sm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v9
head:   24817e66fba53d9e2722aec6abd8a00b29bf108a
commit: 07a5113f110b146bff44efafd623d3c0e87d9118 [3/10] nvme: add nvme_auth_generate_psk()
config: powerpc64-randconfig-001-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200307.yPvUJ1sm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200307.yPvUJ1sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200307.yPvUJ1sm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/common/auth.c:14:
>> include/crypto/hkdf.h:25:10: error: use of undeclared identifier 'ENOTSUP'
           return -ENOTSUP;
                   ^
   include/crypto/hkdf.h:31:10: error: use of undeclared identifier 'ENOTSUP'
           return -ENOTSUP;
                   ^
   2 errors generated.


vim +/ENOTSUP +25 include/crypto/hkdf.h

7cdb18431a4b69 Hannes Reinecke 2024-07-18  11  
7cdb18431a4b69 Hannes Reinecke 2024-07-18  12  #ifdef CONFIG_CRYPTO_HKDF
7cdb18431a4b69 Hannes Reinecke 2024-07-18  13  int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  14  		 unsigned int ikmlen, const u8 *salt, unsigned int saltlen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  15  		 u8 *prk);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  16  int hkdf_expand(struct crypto_shash *hmac_tfm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  17  		const u8 *info, unsigned int infolen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  18  		u8 *okm, unsigned int okmlen);
7cdb18431a4b69 Hannes Reinecke 2024-07-18  19  #else
7cdb18431a4b69 Hannes Reinecke 2024-07-18  20  static inline int hkdf_extract(struct crypto_shash *hmac_tfm,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  21  			       const u8 *ikm, unsigned int ikmlen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  22  			       const u8 *salt, unsigned int saltlen,
7cdb18431a4b69 Hannes Reinecke 2024-07-18  23  			       u8 *prk)
7cdb18431a4b69 Hannes Reinecke 2024-07-18  24  {
7cdb18431a4b69 Hannes Reinecke 2024-07-18 @25  	return -ENOTSUP;

:::::: The code at line 25 was first introduced by commit
:::::: 7cdb18431a4b69e4912fa880449c256e92f3a30d crypto,fs: Separate out hkdf_extract() and hkdf_expand()

:::::: TO: Hannes Reinecke <hare@kernel.org>
:::::: CC: Hannes Reinecke <hare@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
