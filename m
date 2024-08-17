Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5568F40;
	Sat, 17 Aug 2024 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723909427; cv=none; b=EHeRKUELh2oH1TvrCnVpPxKsS5YDpmCIXs624eHWgHe0CEpEKjrN4XR/HrVa0hsIUGwaYNJKhJoIJP7gfLSLnvlnEBATbgbYlDXoJ+bGn/f6Ibez3L1d3iMya/TZTQZr5KIIMuNaOqDNQm3lt5x10cNaA0n3GRMiSvJJ95SdAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723909427; c=relaxed/simple;
	bh=WkfSqgIGfHofCvLTS8B+PiV5vIEBJJiNNLH18/6XX1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxAC0BGCNGYg9XSc98nCSlGDh7k0G+WaYAIJ7gUBXhODxjmLOM9gZfygpdzZGHuYmoERPjwdwbh+FE3AowtJjeMY8PktGtcbXu4wCA1PNaNh1OXTPdNuG+5pRi1XToHaFxFdB2gL+D3EsshSoRKmgz99FTNc2s+gIqIXSVoOXe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUP194TD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUP194TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723909426; x=1755445426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WkfSqgIGfHofCvLTS8B+PiV5vIEBJJiNNLH18/6XX1I=;
  b=HUP194TDg9NnPfNRYVqHqFS7kgWS5n0AlL8loPZ7g/SKbo08wtzbHANq
   Xztbc6Xhsx1J0tQf0Dr2SbsX9ZIQsyNx39P6lObWv7tisNDbvvf7audzH
   IFUQXzvFZ1cyMGcyzAe/S1kI3bAx1Fpgt5RfDl7GWWIBwJIFklH021onW
   8xMCETlx8e1HWLG9jyUQ5uNuoYW0ta0QJOyXs3er/s7Q/OQvrPSJuDG9U
   cNs81DCSbSh6GiNYJYZxo2EZKbPpRgqaq3adh3XricEg5KJIX9J6qM3oy
   E3QITA9DO+Q+5tZGElaRQi/4fUyZ6rHUGx7n2hTJqyacFxveUihTYtoS7
   Q==;
X-CSE-ConnectionGUID: ceu5c/CgRlqBlYqbHjh+mQ==
X-CSE-MsgGUID: gbBwmaHSRwOlccFjpzoj/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="47591018"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="47591018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 08:43:45 -0700
X-CSE-ConnectionGUID: iLEplIe8RRuHLvtUuZIt+w==
X-CSE-MsgGUID: cuQMsHXTQpKQj4gX3ywy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="60121174"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2024 08:43:43 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfLaf-0007ba-0J;
	Sat, 17 Aug 2024 15:43:41 +0000
Date: Sat, 17 Aug 2024 23:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: [dhowells-fs:pgplib 6/14]
 crypto/asymmetric_keys/pgp_public_key.c:179:31: warning: format specifies
 type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202408172349.ppLqGxkN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pgplib
head:   f5bc37208146cc7ce38c4ad5a403e00904c0b6d2
commit: c1830c5e36f2b94bba3653adf9771c9dcab75dd3 [6/14] KEYS: PGP data parser
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240817/202408172349.ppLqGxkN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408172349.ppLqGxkN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408172349.ppLqGxkN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/pgp_public_key.c:12:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/asymmetric_keys/pgp_public_key.c:12:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from crypto/asymmetric_keys/pgp_public_key.c:12:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/pgp_public_key.c:12:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:9:
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
>> crypto/asymmetric_keys/pgp_public_key.c:179:31: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     179 |         pr_debug("offset %lu/%lu\n", offset, ctx->raw_fingerprint_len);
         |                          ~~~         ^~~~~~
         |                          %zu
   include/linux/printk.h:589:26: note: expanded from macro 'pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:179:39: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     179 |         pr_debug("offset %lu/%lu\n", offset, ctx->raw_fingerprint_len);
         |                              ~~~             ^~~~~~~~~~~~~~~~~~~~~~~~
         |                              %zu
   include/linux/printk.h:589:26: note: expanded from macro 'pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   9 warnings generated.


vim +179 crypto/asymmetric_keys/pgp_public_key.c

   137	
   138	/*
   139	 * Calculate the public key ID fingerprint
   140	 */
   141	static int pgp_generate_fingerprint(struct pgp_key_data_parse_context *ctx,
   142					    struct pgp_parse_pubkey *pgp,
   143					    struct public_key *pub)
   144	{
   145		struct crypto_shash *tfm;
   146		struct shash_desc *digest;
   147		char fingerprint[HASH_MAX_DIGESTSIZE * 2 + 1] = { 0 };
   148		size_t offset;
   149		int ret;
   150	
   151		ret = -ENOMEM;
   152		tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
   153					 "md5" : "sha1", 0, 0);
   154		if (!tfm)
   155			goto cleanup;
   156	
   157		digest = kmalloc(sizeof(*digest) + crypto_shash_descsize(tfm),
   158				 GFP_KERNEL);
   159		if (!digest)
   160			goto cleanup_tfm;
   161	
   162		digest->tfm = tfm;
   163		crypto_shash_set_flags(digest->tfm, CRYPTO_TFM_REQ_MAY_SLEEP);
   164		ret = crypto_shash_init(digest);
   165		if (ret < 0)
   166			goto cleanup_hash;
   167	
   168		ret = pgp_calc_pkey_keyid(digest, pgp, pub);
   169		if (ret < 0)
   170			goto cleanup_hash;
   171	
   172		ctx->raw_fingerprint_len = crypto_shash_digestsize(tfm);
   173	
   174		ret = crypto_shash_final(digest, ctx->raw_fingerprint);
   175		if (ret < 0)
   176			goto cleanup_hash;
   177	
   178		offset = ctx->raw_fingerprint_len - 8;
 > 179		pr_debug("offset %lu/%lu\n", offset, ctx->raw_fingerprint_len);
   180	
   181		bin2hex(fingerprint, ctx->raw_fingerprint, ctx->raw_fingerprint_len);
   182		pr_debug("fingerprint %s\n", fingerprint);
   183	
   184		ret = 0;
   185	cleanup_hash:
   186		kfree(digest);
   187	cleanup_tfm:
   188		crypto_free_shash(tfm);
   189	cleanup:
   190		kleave(" = %d", ret);
   191		return ret;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
