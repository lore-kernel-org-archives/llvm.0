Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217DF7FD;
	Sun, 26 May 2024 02:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716690757; cv=none; b=YUSQAcng5l/WTZpJN5sP0W+pqWzID334EsIDkWk2udOFhZXCyAK9ritJAMXBBPclG+YJac7dGwnGbQ5Oy+CyAj0yoMn/A4ZOPWSSXTgKp05+JOfWIX+at2WVh+op/ChSzQgGuhGvZxwCJu7JahCFnxAiNmoQEwtESWiOwy2Fgcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716690757; c=relaxed/simple;
	bh=leNp0ieOUeYs1Nj8kMePKO1CcdfC2x/m7heg0QTd+cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aypx609rBdCpWyCn410qXfWyVdXWz02ifcuvRMD3onQPA/iVi0QDZmppB/vMmukESijZ/YYwjNHCH5uPGdlK9ZgrdGWVhK8vNUNnl7knnuL4EZjsZ28iYzIO79zDfIH20klBmKD0DhBYAErFdFZGgIgw5thSYPM1ghVxD16bb/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+7J4myo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+7J4myo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716690755; x=1748226755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=leNp0ieOUeYs1Nj8kMePKO1CcdfC2x/m7heg0QTd+cA=;
  b=U+7J4myolUzVC+G1FS2mCHkVzP7gkTD6OtP50JEWLUas6BWjBvqoG4OX
   VwPtvNa/w5f37O4CEetV0dmhjElmw01N7DqaGmSUS9Yc/uCdBAlfCsdyU
   T8IChaGTdZQWdiIqU36jukUP9IMZksbXJLfmyZMHuRXyyrE0jbgMVrt4w
   m3f7txK6eCtIy60xtBcO4N325vDIlekdGaQMdk2zaAZXZb2N8zUxJgkbw
   3a6N5WG7fyUGyb5X/lX2nbWFjIWmyAf2TwwOZoMKsEp2fnFqoSiRBgPEg
   XERKoH+oHT+z0zMz8oSIN60BBu/j7ddekGBuyip6yW1o4Wtz0OxHy06N7
   A==;
X-CSE-ConnectionGUID: wrTUEwqeRvusUBWOp3KAeg==
X-CSE-MsgGUID: 5XqzlLZtQZ+rJvrVI21F1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="24158150"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="24158150"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 19:32:35 -0700
X-CSE-ConnectionGUID: LZ05+oPCT9aEtBQ+83r4vw==
X-CSE-MsgGUID: bsHJsoshTwe+83oQ+BxLHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34893009"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 May 2024 19:32:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB3gU-0007ep-2t;
	Sun, 26 May 2024 02:32:30 +0000
Date: Sun, 26 May 2024 10:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Prestwood <prestwoj@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v6 6/7]
 crypto/asymmetric_keys/tpm2_key_rsa.c:588:6: warning: unused variable
 'policy_len'
Message-ID: <202405261005.7oE8eMUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   b03e8f497b5900039f45ae1c49ee0a90f37eda9f
commit: ebb90aec5c2b11ad23633e0a8fd6b44d780f6470 [6/7] keys: asymmetric: tpm2_key_rsa
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405261005.7oE8eMUz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405261005.7oE8eMUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405261005.7oE8eMUz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/tpm2_key_rsa.c:588:6: warning: unused variable 'policy_len' [-Wunused-variable]
     588 |         u16 policy_len;
         |             ^~~~~~~~~~
>> crypto/asymmetric_keys/tpm2_key_rsa.c:589:6: warning: unused variable 'attr' [-Wunused-variable]
     589 |         u32 attr;
         |             ^~~~
>> crypto/asymmetric_keys/tpm2_key_rsa.c:590:6: warning: unused variable 'alg' [-Wunused-variable]
     590 |         u16 alg;
         |             ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:629:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     629 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:625:9: note: initialize the variable 'ret' to silence this warning
     625 |         int ret;
         |                ^
         |                 = 0
   4 warnings generated.


vim +/policy_len +588 crypto/asymmetric_keys/tpm2_key_rsa.c

   582	
   583	static int __tpm2_key_rsa_preparse(struct tpm2_key *key)
   584	{
   585		struct tpm2_rsa_parms parms;
   586		off_t offset = sizeof(key->desc) + tpm2_key_policy_size(key);
   587		u8 *pub = tpm2_key_pub(key);
 > 588		u16 policy_len;
 > 589		u32 attr;
 > 590		u16 alg;
   591	
   592		if (tpm2_key_type(key) != TPM_ALG_RSA)
   593			return -EBADMSG;
   594	
   595		if (offset + sizeof(parms) > tpm2_key_pub_len(key))
   596			return -EBADMSG;
   597	
   598		parms.symmetric = get_unaligned_be16(&pub[offset + 0]);
   599		if (parms.symmetric != TPM_ALG_NULL)
   600			return -EBADMSG;
   601	
   602		parms.scheme = get_unaligned_be16(&pub[offset + 2]);
   603		if (parms.scheme != TPM_ALG_NULL)
   604			return -EBADMSG;
   605	
   606		parms.key_bits = get_unaligned_be16(&pub[offset + 4]);
   607		if (parms.key_bits != 2048 &&
   608		    parms.key_bits != 3072 &&
   609		    parms.key_bits != 4096)
   610			return -EBADMSG;
   611	
   612		parms.exponent = get_unaligned_be32(&pub[offset + 6]);
   613		if (parms.exponent != 0x00000000 && parms.exponent !=  0x00010001)
   614			return -EBADMSG;
   615	
   616		return 0;
   617	}
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
