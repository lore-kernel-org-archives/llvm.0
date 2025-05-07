Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D55288A8;
	Wed,  7 May 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596689; cv=none; b=aGi7QiIDXe7/2UeDdqnOMULeQe03T7VlQ4qHxUuuqXGuzkJkA6cuLE8oHZnpdN98cxM5VWOSfB0lybB51JtZtm8q9NtBSNG1bfaq2uRM8fbT2B0mOvMse1YhM4cML40jOMrWqaBNO1pnxFbZXYbaaBEdnfadbJ1v4T2As2jyEo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596689; c=relaxed/simple;
	bh=OZNU/j56EWcn84BSV4AJXCarG5B43RDTtU2oSyI4gwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQFx0ASwwbCGD802miuxCB8tS+0u+ZTkAJJAi+U5IeN+l7rJNfhlENsMN+iZT/XrgRyhBraP4Lpl5i9rWdODQcdUFgCtauUAvvHYczROLDAsZTWor9McQWz6SxttLAFmwm3MJTEJ5xQk4U7VCqEc6xs5eNJtPvaPEvXCEv8xnrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hquJbG14; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hquJbG14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596688; x=1778132688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZNU/j56EWcn84BSV4AJXCarG5B43RDTtU2oSyI4gwQ=;
  b=hquJbG145boZdJ4xhSOGR6wkSioKB2ChF69yjIN85Ad/rHgx+brbVb+N
   4UV5HL9AbUNfaIfXT4mENFGhPdCnzITCsKbRJcYh0uy4J1zUyDHLmW9Am
   nuWPqupiFApFbSKaASj8TiNxjcbHyFjmzHXYnY0x50nOahrmDTogiyN29
   Rnk8hAaBOISUHQXnT8vnikIfg+nrXGsPaOnnt1XRftmPe2kRs4F0ah6SQ
   mFVtC/beR6pLOfGCWF7Qa6k0RNWkmgVIi6Z1UqdakrOjSM83IjLakJjhc
   at6DDaCEZQsK0+70a+GShE9uprfAOYq4UExlxPWyBi28z7UGqsjmTjLrP
   A==;
X-CSE-ConnectionGUID: gghahLgaRxWduGEwNlRzXg==
X-CSE-MsgGUID: F0Duf0THQpuQ+DvMosjwQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35932863"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35932863"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: sjzH9OWQQaSqaH0l6cnqNg==
X-CSE-MsgGUID: J17fmtUKR/GfaSM4hT3HKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140959191"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2025 22:44:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaF-00076F-1n;
	Wed, 07 May 2025 05:44:43 +0000
Date: Wed, 7 May 2025 13:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:nvme-fpin.v3 1/20] drivers/nvme/common/auth.c:279:4:
 warning: format specifies type 'long' but the argument has type 'size_t'
 (aka 'unsigned int')
Message-ID: <202505071302.RDc3ETBa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git nvme-fpin.v3
head:   931611be0f664cca44e6df3a27f302d0a27a96b9
commit: f49912b5a4435138b8158e9e5e592d83455d7a56 [1/20] nvme-auth: modify nvme_auth_transform_key() to return status
config: arm-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071302.RDc3ETBa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071302.RDc3ETBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071302.RDc3ETBa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/common/auth.c:279:4: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     278 |                 pr_warn("incompatible digest size %ld for key (hash %s, len %ld)\n",
         |                                                   ~~~
         |                                                   %zu
     279 |                         transformed_len, hmac_name, key->len);
         |                         ^~~~~~~~~~~~~~~
   include/linux/printk.h:560:37: note: expanded from macro 'pr_warn'
     560 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/nvme/common/auth.c:279:32: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     278 |                 pr_warn("incompatible digest size %ld for key (hash %s, len %ld)\n",
         |                                                                             ~~~
         |                                                                             %zu
     279 |                         transformed_len, hmac_name, key->len);
         |                                                     ^~~~~~~~
   include/linux/printk.h:560:37: note: expanded from macro 'pr_warn'
     560 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +279 drivers/nvme/common/auth.c

   239	
   240	int nvme_auth_transform_key(struct nvme_dhchap_key *key, char *nqn,
   241				    u8 **transformed_secret)
   242	{
   243		const char *hmac_name;
   244		struct crypto_shash *key_tfm;
   245		struct shash_desc *shash;
   246		u8 *transformed_data;
   247		u8 *key_data;
   248		size_t transformed_len;
   249		int ret;
   250	
   251		if (!key) {
   252			pr_warn("No key specified\n");
   253			return -ENOKEY;
   254		}
   255		key_data = kzalloc(key->len, GFP_KERNEL);
   256		if (!key_data)
   257			return -ENOMEM;
   258		memcpy(key_data, key->key, key->len);
   259		if (key->hash == 0) {
   260			*transformed_secret = key_data;
   261			return key->len;
   262		}
   263		hmac_name = nvme_auth_hmac_name(key->hash);
   264		if (!hmac_name) {
   265			pr_warn("Invalid key hash id %d\n", key->hash);
   266			ret = -EINVAL;
   267			goto out_free_data;
   268		}
   269	
   270		key_tfm = crypto_alloc_shash(hmac_name, 0, 0);
   271		if (IS_ERR(key_tfm)) {
   272			ret = PTR_ERR(key_tfm);
   273			goto out_free_data;
   274		}
   275	
   276		transformed_len = crypto_shash_digestsize(key_tfm);
   277		if (transformed_len != key->len) {
   278			pr_warn("incompatible digest size %ld for key (hash %s, len %ld)\n",
 > 279				transformed_len, hmac_name, key->len);
   280			ret = -EINVAL;
   281			goto out_free_tfm;
   282		}
   283	
   284		transformed_data = kzalloc(transformed_len, GFP_KERNEL);
   285		if (!transformed_data) {
   286			ret = -ENOMEM;
   287			goto out_free_tfm;
   288		}
   289	
   290		shash = kmalloc(sizeof(struct shash_desc) +
   291				crypto_shash_descsize(key_tfm),
   292				GFP_KERNEL);
   293		if (!shash) {
   294			ret = -ENOMEM;
   295			goto out_free_transformed_data;
   296		}
   297	
   298		shash->tfm = key_tfm;
   299		ret = crypto_shash_setkey(key_tfm, key->key, key->len);
   300		if (ret < 0)
   301			goto out_free_shash;
   302		ret = crypto_shash_init(shash);
   303		if (ret < 0)
   304			goto out_free_shash;
   305		ret = crypto_shash_update(shash, nqn, strlen(nqn));
   306		if (ret < 0)
   307			goto out_free_shash;
   308		ret = crypto_shash_update(shash, "NVMe-over-Fabrics", 17);
   309		if (ret < 0)
   310			goto out_free_shash;
   311		ret = crypto_shash_final(shash, transformed_data);
   312		if (ret < 0)
   313			goto out_free_shash;
   314	
   315		kfree(shash);
   316		crypto_free_shash(key_tfm);
   317		*transformed_secret = transformed_data;
   318	
   319		return transformed_len;
   320	
   321	out_free_shash:
   322		kfree(shash);
   323	out_free_transformed_data:
   324		kfree(transformed_data);
   325	out_free_tfm:
   326		crypto_free_shash(key_tfm);
   327	out_free_data:
   328		kfree(key_data);
   329	
   330		return ret;
   331	}
   332	EXPORT_SYMBOL_GPL(nvme_auth_transform_key);
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
