Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146E2110E;
	Thu, 19 Mar 2026 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962574; cv=none; b=rDtY6ntYRSOnRhWgB964vHgeCdJZKyTSBRhRCEFAD/oEYzli8vAcAw6FBezVRKOraso5yuKTWi70Ts2x/ZFWESwQDnLbeSIh2dYBGHh9ZQE4td6cyZFC08Mgn+csrhkcF8m/cDjeDC/F/M4HIV+egndlxvCAx2HB024GvFYoR9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962574; c=relaxed/simple;
	bh=GjW39Qg1AahnvHV0leJI8X7W/akNQqnDexJE4bn05Bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QlOAbBSFEctazuw8nvwNNPDEVDM6HJFXtdpgtVBFmQiF4ejKkyBDa8QMYxhxRpzowJWHTnf80rAdB74X4ekati5EgFFA2Utq8wzrEdVj22TKX6lJLqPdJM3vzgIf0Dy5M5PamGR7BtkDfXP0Sj9SS7sUFrf/vZpUe5GsntOAkxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cD/lOs7t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cD/lOs7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773962573; x=1805498573;
  h=date:from:to:cc:subject:message-id;
  bh=GjW39Qg1AahnvHV0leJI8X7W/akNQqnDexJE4bn05Bw=;
  b=cD/lOs7t3EtIlXRLUwsQmpN1C2b06ds3kfqrQnKIcbjanDBbCsvMm71W
   vqYQ1Oe6n8GGB716Se3xinn6uE4tfKiWY4VlzbSxW7qYKFYr1KBA+AeX2
   wowKkahs5Ybz0x4dzlQjOUPG9etMfRh0UVDvvjOzGcvXPH7F/RUtWWBp1
   Et7sbsSVycI5gGIGuLxaNJ5X6fiTpQOl1mFJk1hKt2KOEsLfbCp6RLSVD
   fAXbq5CV3N57T/H7mg4O1lkXV5brN5WHFWyxSZYyJ1ORKMfTWwmlqI/TO
   3QOzccakpuISbHFNHxT2IvlW+jpeFEkWB32ec87QDEfixAemf2TXdIRlf
   w==;
X-CSE-ConnectionGUID: QEBN7fqJTa20/aorMjD8/w==
X-CSE-MsgGUID: zVG0WGtzSGmR8xiwIxlDig==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92431906"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92431906"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 16:22:52 -0700
X-CSE-ConnectionGUID: PV3U1lvLQuml+AIAkds07Q==
X-CSE-MsgGUID: Hw3/SWCYQ6ubXnFXvjvv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222336028"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Mar 2026 16:22:50 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3MhT-000000001lJ-2Hzx;
	Thu, 19 Mar 2026 23:22:47 +0000
Date: Fri, 20 Mar 2026 07:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v3 2/8]
 drivers/nvme/common/keyring.c:347:19: warning: variable 'keylen' is
 uninitialized when used here
Message-ID: <202603200745.dOgeJiFP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v3
head:   7ffdb5e32339cf1e1ba50b8caefaca6dbab4d882
commit: 04e4f1368f8ff23feef8b02cba8c03732228faa7 [2/8] nvme-keyring: add 'dhchap' key type
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200745.dOgeJiFP-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200745.dOgeJiFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200745.dOgeJiFP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/common/keyring.c:347:19: warning: variable 'keylen' is uninitialized when used here [-Wuninitialized]
           prep->quotalen = keylen;
                            ^~~~~~
   drivers/nvme/common/keyring.c:309:40: note: initialize the variable 'keylen' to silence this warning
           size_t datalen = prep->datalen, keylen;
                                                 ^
                                                  = 0
   1 warning generated.


vim +/keylen +347 drivers/nvme/common/keyring.c

   292	
   293	/**
   294	 * nvme_dhchap_psk_preparse - prepare DH-HMAC-CHAP key data
   295	 * @prep: preparsed payload of the key data
   296	 *
   297	 * Decode the DH-HMAC-CHAP key data passed in in @prep and
   298	 * store the resulting binary data. The binary data includes
   299	 * space for the CRC, the version, and the hmac identifier,
   300	 * but the data length is just the key data without the CRC.
   301	 * This allows the user to read the key data via the
   302	 * 'user_read()' function. The additional 'version' ahd 'hmac'
   303	 * data is used in the ->read() callback to generate the
   304	 * base64 encoded key.
   305	 */
   306	static int nvme_dhchap_psk_preparse(struct key_preparsed_payload *prep)
   307	{
   308		struct user_key_payload *upayload;
   309		size_t datalen = prep->datalen, keylen;
   310		int ret;
   311		u32 crc;
   312		u8 version, hmac;
   313	
   314		if (!prep->data) {
   315			pr_debug("%s: Empty data", __func__);
   316			prep->payload.data[0] = NULL;
   317			prep->quotalen = 0;
   318			return -EINVAL;
   319		}
   320	
   321		if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%*s",
   322			   &version, &hmac) != 2) {
   323			pr_debug("%s: invalid key data '%s'\n", __func__,
   324				 (char *)prep->data);
   325			prep->payload.data[0] = NULL;
   326			prep->quotalen = 0;
   327			return -EINVAL;
   328		}
   329	
   330		/* skip header and final ':' character */
   331		datalen -= 11;
   332	
   333		/*
   334		 * payload is < key | version | hmac >
   335		 * base64 decode will always return less data
   336		 * than the encoded data, so allocating the size
   337		 * of the encoded data will be large enough.
   338		 */
   339		upayload = kzalloc(sizeof(*upayload) + datalen, GFP_KERNEL);
   340		if (!upayload) {
   341			prep->payload.data[0] = NULL;
   342			prep->quotalen = 0;
   343			return -ENOMEM;
   344		}
   345	
   346		/* decode the data */
 > 347		prep->quotalen = keylen;
   348		prep->payload.data[0] = upayload;
   349		ret = base64_decode(prep->data + 10, datalen, upayload->data,
   350				    true, BASE64_STD);
   351		if (ret < 0) {
   352			pr_debug("%s: Failed to decode key %s\n",
   353				 __func__, (char *)prep->data + 10);
   354			return ret;
   355		}
   356		ret -= 4;
   357		crc = ~crc32(~0, upayload->data, ret);
   358		if (get_unaligned_le32(upayload->data + ret) != crc) {
   359			pr_debug("%s: CRC mismatch for key\n", __func__);
   360			/* CRC mismatch */
   361			return -EKEYREJECTED;
   362		}
   363		/* append version and hmac to the payload */
   364		upayload->data[ret + 4] = version;
   365		upayload->data[ret + 5] = hmac;
   366		upayload->datalen = ret;
   367		return 0;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
