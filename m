Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238D38DF2;
	Thu, 29 Feb 2024 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709238759; cv=none; b=roqAy4aBzjuish7YiLRLRveahTq6OkTwBynyE4h5JNPF9onK7aOYa6zk27Mygcpr+g2Xi/4uzD+0ApcE0dsgPzs/E0Xe+3JeVgsQzJfb4gSiWN8JmO/0sXATzcnUxXCs82PYTEy9s8BuffomeQCt8NkJMk+3HEhspA2ipvWZ9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709238759; c=relaxed/simple;
	bh=QdHW8YGSexj3zLYWs4Lrol9h7GTVySqXvP2XDMRsq/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0D9Sz/mWVW0l4t1UVIerikcWEN9tWZkuaOfUDn8niYKsy/Fhu3/BxgWbOelGlmgusqJYMuZatiVVxb+WZ38KzjCOODm5oL6HlanHuOmMWSD7bb6NckMfPADaZXdlkOQvvMdFg2Q3aZ9ZY8VBSvrBBXVbWDGMk5Ojl6P8qQFzwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaPRBGwH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaPRBGwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709238758; x=1740774758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdHW8YGSexj3zLYWs4Lrol9h7GTVySqXvP2XDMRsq/Y=;
  b=XaPRBGwHeI2aw2RHsB3SEDYYwtSJygqaPghqZ22UI3wPguZPxCnpHr8+
   kmYNHHRt7UIq6zRvUXd1kHB2Vllp8jtsdXDPBOom6AOeyBeAZnKRip7FM
   0qnPXa26eE7D+Jks32e4427tYkmzMQGfc/hhNgu7p1qAyd274TM06ILcg
   wCrT7NGH0Ewk77Wvk5a1fr8yL5Ofsgi4IZ/YgRv7/eDscrtnMT68DWh1p
   S9dUReTBE3iiptHgRaYTvm4uMbCsf3+J95sBG6Qqj1dvmIj2CRDDHSkKq
   KudXO5SBI93HGDyQwimRmVPBNQamVB4oEJpjgfwqx+prhkqFnBSSNGWRO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="6698051"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6698051"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 12:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12633241"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Feb 2024 12:32:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfn4n-000DH7-2P;
	Thu, 29 Feb 2024 20:32:21 +0000
Date: Fri, 1 Mar 2024 04:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:feature/fs_param 1/1] fs/f2fs/super.c:4519:14: error: no
 member named 's_qf_names' in 'struct f2fs_fs_context'
Message-ID: <202403010459.qXWlWwpd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/fs_param
head:   d4eac172f8f9f4594056366859b67e589e6124c3
commit: d4eac172f8f9f4594056366859b67e589e6124c3 [1/1] [WIP] f2fs: use new fs_context interface
config: arm-randconfig-002-20240301 (https://download.01.org/0day-ci/archive/20240301/202403010459.qXWlWwpd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010459.qXWlWwpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010459.qXWlWwpd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   fs/f2fs/super.c:187:1: warning: 'static' ignored on this declaration [-Wmissing-declarations]
     187 | static const struct mount_opts {
         | ^
   fs/f2fs/super.c:187:8: warning: 'const' ignored on this declaration [-Wmissing-declarations]
     187 | static const struct mount_opts {
         |        ^
   fs/f2fs/super.c:910:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     910 |         case Opt_inlinecrypt:
         |         ^
   fs/f2fs/super.c:910:2: note: insert '__attribute__((fallthrough));' to silence this warning
     910 |         case Opt_inlinecrypt:
         |         ^
         |         __attribute__((fallthrough)); 
   fs/f2fs/super.c:910:2: note: insert 'break;' to avoid fall-through
     910 |         case Opt_inlinecrypt:
         |         ^
         |         break; 
   fs/f2fs/super.c:3973:26: warning: unused variable 'ctx' [-Wunused-variable]
    3973 |         struct f2fs_fs_context *ctx = fc->fs_private;
         |                                 ^~~
>> fs/f2fs/super.c:4519:14: error: no member named 's_qf_names' in 'struct f2fs_fs_context'
    4519 |                 kfree(ctx->s_qf_names[i]);
         |                       ~~~  ^
   5 warnings and 1 error generated.


vim +4519 fs/f2fs/super.c

  4509	
  4510	static void f2fs_fc_free(struct fs_context *fc)
  4511	{
  4512		struct f2fs_fs_context *ctx = fc->fs_private;
  4513		int i;
  4514	
  4515		if (!ctx)
  4516			return;
  4517	
  4518		for (i = 0; i < MAXQUOTAS; i++)
> 4519			kfree(ctx->s_qf_names[i]);
  4520	
  4521		fscrypt_free_dummy_policy(&ctx->dummy_enc_policy);
  4522		kfree(ctx);
  4523	}
  4524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
