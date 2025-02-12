Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83BC1FF7A9;
	Wed, 12 Feb 2025 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390380; cv=none; b=ihOvK832Wkpemd2E+Jdh8+KBPElmb1ceNtNOFhVjlVuuABh3WBNUp1ZteaF8d7XPKFBATKZuPpbYzbud2ZAqvjrPWClj2PNyagiZ4LKHKc5VTExl40TWp1SFFhRL8gyFmLH3cjADRaJC0DGf1bBJ3kqsbdgmPmKAOymDl9AiEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390380; c=relaxed/simple;
	bh=pZa3d3SVnecxnEdCui6amvreTRyfWVXoif+gndf8L3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Er4WeqZlz/WdELw+Uie616WklyR3mv8FyUNK3Wg8jcX3hW2SYEZdUVo9nUropYUY0DXaHvdO6zEcH3O1oPIX10jtV55JirLMes4fscJNI0HwPXu1W2XZrM57vbGckk38e3RjuoZxuTP21acXqZBklYeXTrt4OKyh9YPbDd8KegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQr9bwCv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQr9bwCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739390378; x=1770926378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZa3d3SVnecxnEdCui6amvreTRyfWVXoif+gndf8L3M=;
  b=bQr9bwCvE14er3ZSTDDZyYMzZBQV8qlkWYUUUm5xQ0NRokF/XERpTB2T
   gG6weiKP+XN3kufDxdR3fVjlvhYfaBrOYE/hgQXHcPCscKS3JwSe47aKg
   N8p4ZcSKedWi0PEAR5rN4Kt2o8TzP8rnzDa4C9kVcgB4xoWQGD4h9Jgj/
   yx7xogjrCQLMoisd87oACKvZL+9LXdA/bcBfQuXv7l69N0OsgYKJpwVLN
   ug9l65AyK5iTYiVUQWIW31L5cflrwnHUuzG8pEvbYV+CI/5C0JGE9kxyB
   Pv7bMAt+7+o3Z5hMF/B6dzWalB2m553Vf5mMUyU8zUM7g/iAmFn6grbhi
   g==;
X-CSE-ConnectionGUID: R+YWkQGwRCCzkuBfDHGFaQ==
X-CSE-MsgGUID: DSP5PSjvQe+o+MOVbfxBWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="57599273"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="57599273"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:59:37 -0800
X-CSE-ConnectionGUID: UiJpzqt0TcGIsLbqDrNwBw==
X-CSE-MsgGUID: KE1QHbPiSYSTS2UhfqhIBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="112783325"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Feb 2025 11:59:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiItS-00164d-0n;
	Wed, 12 Feb 2025 19:59:34 +0000
Date: Thu, 13 Feb 2025 03:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 27/35] /usr/bin/ld:
 net/rxrpc/rxgk_common.h:84: undefined reference to `crypto_krb5_decrypt'
Message-ID: <202502130314.0gqxuaPN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   1df5ee14458290f1dc72aeba8770ba56a94e5c15
commit: 850d0b821f2d57cac5f0dc86826eb866936a7aff [27/35] rxrpc: rxgk: Implement connection rekeying
config: um-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250213/202502130314.0gqxuaPN-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130314.0gqxuaPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130314.0gqxuaPN-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_respond_to_challenge':
   net/rxrpc/rxgk.c:921: undefined reference to `crypto_krb5_how_much_buffer'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_encrypt_authenticator':
   net/rxrpc/rxgk.c:892: undefined reference to `crypto_krb5_encrypt'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_preparse_server_key':
   net/rxrpc/rxgk.c:36: undefined reference to `crypto_krb5_find_enctype'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_alloc_txbuf':
   net/rxrpc/rxgk.c:310: undefined reference to `crypto_krb5_how_much_data'
   /usr/bin/ld: net/rxrpc/rxgk.c:314: undefined reference to `crypto_krb5_how_much_buffer'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_secure_packet':
   net/rxrpc/rxgk.c:411: undefined reference to `crypto_krb5_encrypt'
   /usr/bin/ld: net/rxrpc/rxgk.c:370: undefined reference to `crypto_krb5_get_mic'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_verify_packet':
   net/rxrpc/rxgk.c:480: undefined reference to `crypto_krb5_where_is_the_data'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_verify_mic_skb':
   net/rxrpc/rxgk_common.h:123: undefined reference to `crypto_krb5_verify_mic'
   /usr/bin/ld: net/rxrpc/rxgk.o: in function `rxgk_decrypt_skb':
   net/rxrpc/rxgk_common.h:84: undefined reference to `crypto_krb5_decrypt'
>> /usr/bin/ld: net/rxrpc/rxgk_common.h:84: undefined reference to `crypto_krb5_decrypt'
   /usr/bin/ld: net/rxrpc/rxgk_app.o: in function `rxgk_decrypt_skb':
   net/rxrpc/rxgk_common.h:84: undefined reference to `crypto_krb5_decrypt'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.o: in function `rxgk_generate_transport_key':
   net/rxrpc/rxgk_kdf.c:222: undefined reference to `crypto_krb5_find_enctype'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:86: undefined reference to `crypto_krb5_calc_PRFplus'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:119: undefined reference to `crypto_krb5_prepare_encryption'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:162: undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:135: undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:(.text+0x81b): undefined reference to `crypto_krb5_prepare_checksum'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.o: in function `rxgk_set_up_token_cipher':
   net/rxrpc/rxgk_kdf.c:276: undefined reference to `crypto_krb5_find_enctype'
   /usr/bin/ld: net/rxrpc/rxgk_kdf.c:280: undefined reference to `crypto_krb5_prepare_encryption'
   clang-16: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
