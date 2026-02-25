Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20DA20C012;
	Wed, 25 Feb 2026 01:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984103; cv=none; b=nmHMGth2VmAKWWKzdv0ChQlMKnUSOzdO2PI05B544fQR1SEEJXFIzOwWumb39iksYCJDDNxTfjn5AnwfzIJA7aaeN3+923KIsa6YoFtxtQj3Q66TtlH0CvwlSRZo5bqlbkK2OgtwcRUMjGUVM5fcendKjNBophrW0vT32mm01ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984103; c=relaxed/simple;
	bh=bHmq3EsJrY7HQ7G38E/klgYl27ZXabwl30vS4U3oV3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NSJHbMEHrSxIhBcg+Q5EBwULt60b6p5FU7p/I1rmk04QCu5yS4qv43R5e/AUVtsYvKnIAZu41sQvQ1S32snyEtU6Yyf9GwxtGLRody5RFv1PFAMfVHVTPymCw8cMX802jISNQ+zOde7NE3vpQdMYsN98NA+rudHT2ZDK3vdBmH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFm0t345; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFm0t345"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771984102; x=1803520102;
  h=date:from:to:cc:subject:message-id;
  bh=bHmq3EsJrY7HQ7G38E/klgYl27ZXabwl30vS4U3oV3A=;
  b=JFm0t345W2y4w1f/gPEcHujKWH2DxyoVCMW9ZyVvXyeS6S8xC3OS9s4i
   Wfv02IQ7wjTX6e72t3FwNvrCdCqi8ZlvUFXFN51TxbDceLmvS2YLrxaDo
   oitekcf2QX10eLP7I4AY0FnaOVmNZU4iBC/ANE6scYV4B+no92QwsEhdV
   P7zLd/kR/vxjK1NGAOxRaBhJu7Lhn/NKAJD28LNs4Z+e+JRKovoU6lrED
   OFhkkYwHfpAAgbOGM7YyRZvybSnxSsnWV/riTGN3kvASDQn2Slkmk8ioI
   sOyKIZo2htc9qXBYEs83P78g5X9SBkyZvA5MWegreGED4TZRoMORLrD8p
   w==;
X-CSE-ConnectionGUID: 7H4eyVYQSiSdL4dSR48Cag==
X-CSE-MsgGUID: 49+U7jLEShahyD3zxTm1xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72716406"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72716406"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:48:19 -0800
X-CSE-ConnectionGUID: nQJBQCTkTnGUScXEtXANQQ==
X-CSE-MsgGUID: /9DBzSdsT1OyXuoGfxgbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="220583323"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Feb 2026 17:48:16 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv40c-000000003FU-1BHh;
	Wed, 25 Feb 2026 01:48:14 +0000
Date: Wed, 25 Feb 2026 09:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@hammerspace.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 67/69] fs/nfsd/nfsfh.c:199:13: error:
 redefinition of 'fh_append_mac'
Message-ID: <202602250943.DuOWNz1P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   71197d3ca486848e7eadacb7c45285b7d6b41d2a
commit: d247fc9b77bc575fa9452ef48dd28cf7b3808d58 [67/69] NFSD: Sign filehandles
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260225/202602250943.DuOWNz1P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250943.DuOWNz1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250943.DuOWNz1P-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/nfsd/nfsfh.c:198:9: warning: 'FH_MAC_WORDS' macro redefined [-Wmacro-redefined]
     198 | #define FH_MAC_WORDS sizeof(__le64)/4
         |         ^
   fs/nfsd/nfsfh.c:145:9: note: previous definition is here
     145 | #define FH_MAC_WORDS (sizeof(__le64) / 4)
         |         ^
>> fs/nfsd/nfsfh.c:199:13: error: redefinition of 'fh_append_mac'
     199 | static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
         |             ^
   fs/nfsd/nfsfh.c:147:13: note: previous definition is here
     147 | static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
         |             ^
>> fs/nfsd/nfsfh.c:231:13: error: redefinition of 'fh_verify_mac'
     231 | static bool fh_verify_mac(struct svc_fh *fhp, struct net *net)
         |             ^
   fs/nfsd/nfsfh.c:178:13: note: previous definition is here
     178 | static bool fh_verify_mac(struct svc_fh *fhp, struct net *net)
         |             ^
   1 warning and 2 errors generated.


vim +/fh_append_mac +199 fs/nfsd/nfsfh.c

   194	
   195	/*
   196	 * Append an 8-byte MAC to the filehandle hashed from the server's fh_key:
   197	 */
 > 198	#define FH_MAC_WORDS sizeof(__le64)/4
 > 199	static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
   200	{
   201		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
   202		struct knfsd_fh *fh = &fhp->fh_handle;
   203		siphash_key_t *fh_key = nn->fh_key;
   204		__le64 hash;
   205	
   206		if (!(fhp->fh_export->ex_flags & NFSEXP_SIGN_FH))
   207			return true;
   208	
   209		if (!fh_key) {
   210			pr_warn_ratelimited("NFSD: unable to sign filehandles, fh_key not set.\n");
   211			return false;
   212		}
   213	
   214		if (fh->fh_size + sizeof(hash) > fhp->fh_maxsize) {
   215			pr_warn_ratelimited("NFSD: unable to sign filehandles, fh_size %d would be greater"
   216				" than fh_maxsize %d.\n", (int)(fh->fh_size + sizeof(hash)), fhp->fh_maxsize);
   217			return false;
   218		}
   219	
   220		hash = cpu_to_le64(siphash(&fh->fh_raw, fh->fh_size, fh_key));
   221		memcpy(&fh->fh_raw[fh->fh_size], &hash, sizeof(hash));
   222		fh->fh_size += sizeof(hash);
   223	
   224		return true;
   225	}
   226	
   227	/*
   228	 * Verify that the filehandle's MAC was hashed from this filehandle
   229	 * given the server's fh_key:
   230	 */
 > 231	static bool fh_verify_mac(struct svc_fh *fhp, struct net *net)
   232	{
   233		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
   234		struct knfsd_fh *fh = &fhp->fh_handle;
   235		siphash_key_t *fh_key = nn->fh_key;
   236		__le64 hash;
   237	
   238		if (!fh_key) {
   239			pr_warn_ratelimited("NFSD: unable to verify signed filehandles, fh_key not set.\n");
   240			return false;
   241		}
   242	
   243		hash = cpu_to_le64(siphash(&fh->fh_raw, fh->fh_size - sizeof(hash),  fh_key));
   244		return crypto_memneq(&fh->fh_raw[fh->fh_size - sizeof(hash)],
   245						&hash, sizeof(hash)) == 0;
   246	}
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
