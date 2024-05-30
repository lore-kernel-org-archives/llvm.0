Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27035143757;
	Thu, 30 May 2024 04:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717043303; cv=none; b=oAtVZLgB9Wyji2+5eTjpSwual9brBNMmcHW1Uujo8rkBj2tbtfQ/KPOuYF8HOancFavAuSkT9SotTHT4s1pjbpNMOhae65vh5kW9OpnUYxfDNF5Tc9SZPmCPZJjueA17Sn+747/lDgoBj/Tw32A7vgof0GuZ+HrzevB1TTeJGc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717043303; c=relaxed/simple;
	bh=/M2qA7j6SCFOrZEZ+3sKKQIVRmOH0j17eJVjTdWipqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dsECT5xdvCJytU1yG0noFEZNJ5s46O2wV0AeFXZdaDRHPt2RjgRUJEUMb0fuLtgL+NPMSH/d+Vr+oiMyqjFjgpBlrDn2Ox+ZVlxrJetqevcy3OlI0xaxDOWY4A7tSTjaFGfyJExQvbWCkWn2wbTAOPzk9OU8FdNQtsyT1pWS+Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3eyE7Po; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3eyE7Po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717043301; x=1748579301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/M2qA7j6SCFOrZEZ+3sKKQIVRmOH0j17eJVjTdWipqI=;
  b=S3eyE7PolAE+BHUY4q2N+NOiDfQdsg8M7iI6h/LB+Vs0ork5sAzv7Ld+
   YGTewY5TYcwuw0rJH3wrRYQKPAwpWSX9cOvJW0jcGFuYGen6KkSOAzpGq
   gQ1sjaU9D0qorilcCFiQcLhfcwCNRyhgfH9RwcsJ4sFcWcFMiOatwFLno
   Moy+s7IPsliGkiFX+nxyvByHmfqeHIDTzPslEtfWn+LUwVg3RNjezYW4b
   avnVHZRNa/JXcVscUPH+8GKSjhv9dRVNDc7DBqvweX7/NjY98UIf3FTS4
   7cBU0RTAIG+Zg51u/DSEq3+Knubh8356vkmtT8lPMnMslKTvzvHwcMenL
   A==;
X-CSE-ConnectionGUID: uo2LjuMNT9Sc5zI6X2axdw==
X-CSE-MsgGUID: fcUkN076SmWY19S88utRHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13442411"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13442411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 21:28:21 -0700
X-CSE-ConnectionGUID: EE8OwqsZQY6xoNyHnGIVcw==
X-CSE-MsgGUID: erm4vHkiSq+4+iWmuWRsPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36314789"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 May 2024 21:28:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCXOi-000Ent-2y;
	Thu, 30 May 2024 04:28:16 +0000
Date: Thu, 30 May 2024 12:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 3/3] drivers/char/tpm/tpm2-sessions.c:712:3:
 warning: non-void function 'tpm_buf_check_hmac_response' should return a
 value
Message-ID: <202405301232.vCQ86oWH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   fb0eb9008ed78e1f18f6d32d87bc9813b9b74d63
commit: fb0eb9008ed78e1f18f6d32d87bc9813b9b74d63 [3/3] tpm: Remove illict WARN's from tpm2-sessions.c
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240530/202405301232.vCQ86oWH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301232.vCQ86oWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301232.vCQ86oWH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-sessions.c:71:
   In file included from drivers/char/tpm/tpm.h:26:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/char/tpm/tpm2-sessions.c:71:
   In file included from drivers/char/tpm/tpm.h:26:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/char/tpm/tpm2-sessions.c:71:
   In file included from drivers/char/tpm/tpm.h:26:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/char/tpm/tpm2-sessions.c:71:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/char/tpm/tpm2-sessions.c:71:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-sessions.c:712:3: warning: non-void function 'tpm_buf_check_hmac_response' should return a value [-Wreturn-mismatch]
     712 |                 return;
         |                 ^
   9 warnings generated.


vim +/tpm_buf_check_hmac_response +712 drivers/char/tpm/tpm2-sessions.c

   669	
   670	/**
   671	 * tpm_buf_check_hmac_response() - check the TPM return HMAC for correctness
   672	 * @chip: the TPM chip structure
   673	 * @buf: the original command buffer (which now contains the response)
   674	 * @rc: the return code from tpm_transmit_cmd
   675	 *
   676	 * If @rc is non zero, @buf may not contain an actual return, so @rc
   677	 * is passed through as the return and the session cleaned up and
   678	 * de-allocated if required (this is required if
   679	 * TPM2_SA_CONTINUE_SESSION was not specified as a session flag).
   680	 *
   681	 * If @rc is zero, the response HMAC is computed against the returned
   682	 * @buf and matched to the TPM one in the session area.  If there is a
   683	 * mismatch, an error is logged and -EINVAL returned.
   684	 *
   685	 * The reason for this is that the command issue and HMAC check
   686	 * sequence should look like:
   687	 *
   688	 *	rc = tpm_transmit_cmd(...);
   689	 *	rc = tpm_buf_check_hmac_response(&buf, auth, rc);
   690	 *	if (rc)
   691	 *		...
   692	 *
   693	 * Which is easily layered into the current contrl flow.
   694	 *
   695	 * Returns: 0 on success or an error.
   696	 */
   697	int tpm_buf_check_hmac_response(struct tpm_chip *chip, struct tpm_buf *buf,
   698					int rc)
   699	{
   700		struct tpm_header *head = (struct tpm_header *)buf->data;
   701		struct tpm2_auth *auth = chip->auth;
   702		off_t offset_s, offset_p;
   703		u8 rphash[SHA256_DIGEST_SIZE];
   704		u32 attrs;
   705		struct sha256_state sctx;
   706		u16 tag = be16_to_cpu(head->tag);
   707		u32 cc = be32_to_cpu(auth->ordinal);
   708		int parm_len, len, i, handles;
   709	
   710		if (auth->session >= TPM_HEADER_SIZE) {
   711			pr_warn("tpm session not filled correctly\n");
 > 712			return;
   713		}
   714	
   715		if (rc != 0)
   716			/* pass non success rc through and close the session */
   717			goto out;
   718	
   719		rc = -EINVAL;
   720		if (tag != TPM2_ST_SESSIONS) {
   721			dev_err(&chip->dev, "TPM: HMAC response check has no sessions tag\n");
   722			goto out;
   723		}
   724	
   725		i = tpm2_find_cc(chip, cc);
   726		if (i < 0)
   727			goto out;
   728		attrs = chip->cc_attrs_tbl[i];
   729		handles = (attrs >> TPM2_CC_ATTR_RHANDLE) & 1;
   730	
   731		/* point to area beyond handles */
   732		offset_s = TPM_HEADER_SIZE + handles * 4;
   733		parm_len = tpm_buf_read_u32(buf, &offset_s);
   734		offset_p = offset_s;
   735		offset_s += parm_len;
   736		/* skip over any sessions before ours */
   737		for (i = 0; i < auth->session - 1; i++) {
   738			len = tpm_buf_read_u16(buf, &offset_s);
   739			offset_s += len + 1;
   740			len = tpm_buf_read_u16(buf, &offset_s);
   741			offset_s += len;
   742		}
   743		/* TPM nonce */
   744		len = tpm_buf_read_u16(buf, &offset_s);
   745		if (offset_s + len > tpm_buf_length(buf))
   746			goto out;
   747		if (len != SHA256_DIGEST_SIZE)
   748			goto out;
   749		memcpy(auth->tpm_nonce, &buf->data[offset_s], len);
   750		offset_s += len;
   751		attrs = tpm_buf_read_u8(buf, &offset_s);
   752		len = tpm_buf_read_u16(buf, &offset_s);
   753		if (offset_s + len != tpm_buf_length(buf))
   754			goto out;
   755		if (len != SHA256_DIGEST_SIZE)
   756			goto out;
   757		/*
   758		 * offset_s points to the HMAC. now calculate comparison, beginning
   759		 * with rphash
   760		 */
   761		sha256_init(&sctx);
   762		/* yes, I know this is now zero, but it's what the standard says */
   763		sha256_update(&sctx, (u8 *)&head->return_code,
   764			      sizeof(head->return_code));
   765		/* ordinal is already BE */
   766		sha256_update(&sctx, (u8 *)&auth->ordinal, sizeof(auth->ordinal));
   767		sha256_update(&sctx, &buf->data[offset_p], parm_len);
   768		sha256_final(&sctx, rphash);
   769	
   770		/* now calculate the hmac */
   771		tpm2_hmac_init(&sctx, auth->session_key, sizeof(auth->session_key)
   772			       + auth->passphrase_len);
   773		sha256_update(&sctx, rphash, sizeof(rphash));
   774		sha256_update(&sctx, auth->tpm_nonce, sizeof(auth->tpm_nonce));
   775		sha256_update(&sctx, auth->our_nonce, sizeof(auth->our_nonce));
   776		sha256_update(&sctx, &auth->attrs, 1);
   777		/* we're done with the rphash, so put our idea of the hmac there */
   778		tpm2_hmac_final(&sctx, auth->session_key, sizeof(auth->session_key)
   779				+ auth->passphrase_len, rphash);
   780		if (memcmp(rphash, &buf->data[offset_s], SHA256_DIGEST_SIZE) == 0) {
   781			rc = 0;
   782		} else {
   783			dev_err(&chip->dev, "TPM: HMAC check failed\n");
   784			goto out;
   785		}
   786	
   787		/* now do response decryption */
   788		if (auth->attrs & TPM2_SA_ENCRYPT) {
   789			/* need key and IV */
   790			tpm2_KDFa(auth->session_key, SHA256_DIGEST_SIZE
   791				  + auth->passphrase_len, "CFB", auth->tpm_nonce,
   792				  auth->our_nonce, AES_KEY_BYTES + AES_BLOCK_SIZE,
   793				  auth->scratch);
   794	
   795			len = tpm_buf_read_u16(buf, &offset_p);
   796			aes_expandkey(&auth->aes_ctx, auth->scratch, AES_KEY_BYTES);
   797			aescfb_decrypt(&auth->aes_ctx, &buf->data[offset_p],
   798				       &buf->data[offset_p], len,
   799				       auth->scratch + AES_KEY_BYTES);
   800		}
   801	
   802	 out:
   803		if ((auth->attrs & TPM2_SA_CONTINUE_SESSION) == 0) {
   804			if (rc)
   805				/* manually close the session if it wasn't consumed */
   806				tpm2_flush_context(chip, auth->handle);
   807			memzero_explicit(auth, sizeof(*auth));
   808		} else {
   809			/* reset for next use  */
   810			auth->session = TPM_HEADER_SIZE;
   811		}
   812	
   813		return rc;
   814	}
   815	EXPORT_SYMBOL(tpm_buf_check_hmac_response);
   816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
