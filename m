Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD6D53B;
	Fri, 16 Feb 2024 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708048490; cv=none; b=p4VtW6SpDMjB+/QqlA6GSTHVqcQ0REowfl8M9FA2eRiLfCSZu9nm8GhvGm8Y0aH77LRLPWN+SGC7Qo0xqFR6DUONLMzCzH6/OEmFvPu8W9KJ53LDkfsxGPLG0rALaNTKeH2Odxl3G/noBkQWO76GNiIOw9B/gvdMfkxcn6w7J+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708048490; c=relaxed/simple;
	bh=ELe4LEal0dJOP+F2HGkC1aCnEIJ8KzGDyQcgMtnRmzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmoXZiS0uyiYQmk9s0c91uTcsTzn+qp51KJTHlrrhDVWbfU6crChJGjTpjB3kJ49GuNG/ld5pgWXQyFY8xjwMtWBhWHim3r+BmnFP+h5E/82wUZM93L0OzShnLr90K6CvMdlmy5AdAXVAmnVTIVNOCZSvTzKPGNVxA3G+ZJIBsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARpnzarS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARpnzarS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708048488; x=1739584488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ELe4LEal0dJOP+F2HGkC1aCnEIJ8KzGDyQcgMtnRmzo=;
  b=ARpnzarS0tDPKEngruzmYpF/Lu6AoOjY/3/daoS+fGtLaAhkc28MmG0f
   +5RpFD0JZFQ58/mLzP8hMn9DYr/o0U2KqB+UYR1gr26zuRawsOIsc86t1
   Ldod9UtbFVicdg4cfiyBLrdDzwC/u+g7NJVZEhYzFpqBfloFDGyytWAcu
   co82yd+GEaByn800lsbm/kWCcqcT4YKIaoZNH8DFtj1iAzkxIo6DEqPPC
   Ka7/togHWagEvqhmxpdXszw/Mlfb0Ci/pNrkvPWI5R58Hl6k+WwsM+ed2
   9cinSiXvur8kpy8yYVbSmocHVjpbyrhj9PE5U/BBabNKnsMemMR9u1c9X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2026568"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2026568"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 17:54:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="3793970"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Feb 2024 17:54:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ranQo-0000vw-1g;
	Fri, 16 Feb 2024 01:54:34 +0000
Date: Fri, 16 Feb 2024 09:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ross Philipson <ross.philipson@oracle.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, kexec@lists.infradead.org,
	linux-efi@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ross.philipson@oracle.com, dpsmith@apertussolutions.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
	dave.hansen@linux.intel.com, ardb@kernel.org, mjg59@srcf.ucam.org,
	James.Bottomley@hansenpartnership.com, peterhuewe@gmx.de,
	jarkko@kernel.org, jgg@ziepe.ca, luto@amacapital.net,
	nivedita@alum.mit.edu, herbert@gondor.apana.org.au,
	davem@davemloft.net, kanth.ghatraju@oracle.com,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v8 14/15] x86: Secure Launch late initcall platform module
Message-ID: <202402160909.BRTtBK7T-lkp@intel.com>
References: <20240214221847.2066632-15-ross.philipson@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214221847.2066632-15-ross.philipson@oracle.com>

Hi Ross,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.8-rc4 next-20240215]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ross-Philipson/x86-boot-Place-kernel_info-at-a-fixed-offset/20240215-064712
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20240214221847.2066632-15-ross.philipson%40oracle.com
patch subject: [PATCH v8 14/15] x86: Secure Launch late initcall platform module
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240216/202402160909.BRTtBK7T-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160909.BRTtBK7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160909.BRTtBK7T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/slmodule.c:28:
   In file included from include/linux/slaunch.h:185:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> arch/x86/kernel/slmodule.c:352:4: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     352 |                         default:
         |                         ^
   arch/x86/kernel/slmodule.c:352:4: note: insert 'break;' to avoid fall-through
     352 |                         default:
         |                         ^
         |                         break; 
   2 warnings generated.


vim +352 arch/x86/kernel/slmodule.c

   313	
   314	static void slaunch_tpm20_extend_event(struct tpm_chip *tpm, void __iomem *txt,
   315					       struct tcg_pcr_event2_head *event)
   316	{
   317		u16 *alg_id_field = (u16 *)((u8 *)event + sizeof(struct tcg_pcr_event2_head));
   318		struct tpm_digest *digests;
   319		u8 *dptr;
   320		u32 i, j;
   321		int ret;
   322	
   323		digests = kcalloc(tpm->nr_allocated_banks, sizeof(*digests),
   324				  GFP_KERNEL);
   325		if (!digests)
   326			slaunch_txt_reset(txt, "Failed to allocate array of digests\n",
   327					  SL_ERROR_GENERIC);
   328	
   329		for (i = 0; i < tpm->nr_allocated_banks; i++)
   330			digests[i].alg_id = tpm->allocated_banks[i].alg_id;
   331	
   332		/* Early SL code ensured there was a max count of 2 digests */
   333		for (i = 0; i < event->count; i++) {
   334			dptr = (u8 *)alg_id_field + sizeof(u16);
   335	
   336			for (j = 0; j < tpm->nr_allocated_banks; j++) {
   337				if (digests[j].alg_id != *alg_id_field)
   338					continue;
   339	
   340				switch (digests[j].alg_id) {
   341				case TPM_ALG_SHA256:
   342					memcpy(&digests[j].digest[0], dptr,
   343					       SHA256_DIGEST_SIZE);
   344					alg_id_field = (u16 *)((u8 *)alg_id_field +
   345						SHA256_DIGEST_SIZE + sizeof(u16));
   346					break;
   347				case TPM_ALG_SHA1:
   348					memcpy(&digests[j].digest[0], dptr,
   349					       SHA1_DIGEST_SIZE);
   350					alg_id_field = (u16 *)((u8 *)alg_id_field +
   351						SHA1_DIGEST_SIZE + sizeof(u16));
 > 352				default:
   353					break;
   354				}
   355			}
   356		}
   357	
   358		ret = tpm_pcr_extend(tpm, event->pcr_idx, digests);
   359		if (ret) {
   360			pr_err("Error extending TPM20 PCR, result: %d\n", ret);
   361			slaunch_txt_reset(txt, "Failed to extend TPM20 PCR\n",
   362					  SL_ERROR_TPM_EXTEND);
   363		}
   364	
   365		kfree(digests);
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
