Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F794C85;
	Sat, 24 May 2025 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046052; cv=none; b=qaTC1G3tsqUdhYi9lczFQceiCXjY1i6kuSaHyhcXUFqRdCnFwfeL8LPuXhn8sIsZzDbHTpQnOKw3v4N2G5srXtX2lZNDk9BRfMf5HYY7c0m6Dh3J/k2AA8bfvchDA8kLZX6lXN9E+9nYzwltI0JW/0JOIO4oeZq696y/3yqR/I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046052; c=relaxed/simple;
	bh=a7QftXpCVWKEACwGNEY9MJ91YjZttsl5xuSWhEyZyYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl08UKQo4ISpQ3VTa0FEjngBKZpMeNFxYBTr4qUqY48NE/P4MwyPq5NI4BylWw4DQgLAVOMdDPAsBMISf/1+TvlbN25kWMbJgSsMtJYdwOG28ZvQXgvd+bM7BFeTA+ClweXGg36ixSP4WeQMpfEW5ecYKv6BMznXbd0djvIzoRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCuUfrxI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCuUfrxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748046051; x=1779582051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a7QftXpCVWKEACwGNEY9MJ91YjZttsl5xuSWhEyZyYc=;
  b=jCuUfrxIbqCYuFx0cGneFLtp08/p2+Ka32RU9zh4msKzZyNcUhoN5Von
   mJ/R9ij+gM90Xro7iJAB6puY2o0SeVYhA9KYQefH7qwZkBwj4VKgP9Bpd
   bT0LJdV/mMKvU2A0DExr88JJ18SOel0SqW6sJsFpx1dz4T+thhNSTYGez
   Y6YUAvWznRDBrjEYSCTDpRW7/hUjt9KhLPcxtUq6WEokqmfDWVNdzrU24
   UC3VuB5mCUdR9OnvLJRB78dXzKZp4eOpp/SuCC8nKKuUr/xnL4RzN4yvw
   tXa6PfwHSn7kIzoag74Htf5GG59Lr/qKlBS+xYlVS2Ou9DVc8QNdJUjFS
   A==;
X-CSE-ConnectionGUID: 3486l7ZhTSGeirNdohU1+g==
X-CSE-MsgGUID: hYS+pa3YSLeCqzDg7clmRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52735338"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="52735338"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 17:20:50 -0700
X-CSE-ConnectionGUID: /KX27uBHSgenAqAMKMRsgA==
X-CSE-MsgGUID: u80E+8yMQEqbe/Bpzb+SQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141849464"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2025 17:20:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIcd2-000QpA-2Q;
	Sat, 24 May 2025 00:20:44 +0000
Date: Sat, 24 May 2025 08:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] x86: string_32.h: Provide basic sanity checks for
 fallback memcpy()
Message-ID: <202505240843.PwhJUSZt-lkp@intel.com>
References: <20250523042635.work.579-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523042635.work.579-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/core kees/for-next/pstore kees/for-next/kspp linus/master v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/x86-string_32-h-Provide-basic-sanity-checks-for-fallback-memcpy/20250523-122803
base:   tip/master
patch link:    https://lore.kernel.org/r/20250523042635.work.579-kees%40kernel.org
patch subject: [PATCH] x86: string_32.h: Provide basic sanity checks for fallback memcpy()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250524/202505240843.PwhJUSZt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240843.PwhJUSZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240843.PwhJUSZt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ioctl.c:773:2: warning: result of comparison of constant 4294967295 with expression of type 'typeof (sb->s_uuid_len)' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     773 |         memcpy(&u.uuid[0], &sb->s_uuid, sb->s_uuid_len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:154:24: note: expanded from macro 'memcpy'
     154 |                 if (!(__n < 0 || __n == SIZE_MAX))      \
         |                                  ~~~ ^  ~~~~~~~~
   1 warning generated.
--
   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
>> include/net/neighbour.h:582:3: warning: result of comparison of constant 4294967295 with expression of type 'typeof (dev->addr_len)' (aka 'const unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     582 |                 memcpy(dst, n->ha, dev->addr_len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:154:24: note: expanded from macro 'memcpy'
     154 |                 if (!(__n < 0 || __n == SIZE_MAX))      \
         |                                  ~~~ ^  ~~~~~~~~
   1 warning generated.
--
   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
>> include/net/neighbour.h:582:3: warning: result of comparison of constant 4294967295 with expression of type 'typeof (dev->addr_len)' (aka 'const unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     582 |                 memcpy(dst, n->ha, dev->addr_len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:154:24: note: expanded from macro 'memcpy'
     154 |                 if (!(__n < 0 || __n == SIZE_MAX))      \
         |                                  ~~~ ^  ~~~~~~~~
   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:38:
>> include/linux/nfs.h:46:2: warning: result of comparison of constant 4294967295 with expression of type 'typeof (source->size)' (aka 'const unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
      46 |         memcpy(target->data, source->data, source->size);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:154:24: note: expanded from macro 'memcpy'
     154 |                 if (!(__n < 0 || __n == SIZE_MAX))      \
         |                                  ~~~ ^  ~~~~~~~~
   2 warnings generated.
--
>> kernel/printk/printk.c:1144:2: warning: result of comparison of constant 4294967295 with expression of type 'typeof (r->info->text_len)' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    1144 |         memcpy(&dest_r.text_buf[0], &r->text_buf[0], r->info->text_len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:154:24: note: expanded from macro 'memcpy'
     154 |                 if (!(__n < 0 || __n == SIZE_MAX))      \
         |                                  ~~~ ^  ~~~~~~~~
>> kernel/printk/printk.c:2338:3: warning: result of comparison of constant 4294967295 with expression of type 'typeof (trunc_msg_len)' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    2338 |                 memcpy(&r.text_buf[text_len], trunc_msg, trunc_msg_len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:154:24: note: expanded from macro 'memcpy'
     154 |                 if (!(__n < 0 || __n == SIZE_MAX))      \
         |                                  ~~~ ^  ~~~~~~~~
   2 warnings generated.


vim +773 fs/ioctl.c

4c5b47997521206 Miklos Szeredi  2021-04-07  764  
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  765  static int ioctl_getfsuuid(struct file *file, void __user *argp)
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  766  {
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  767  	struct super_block *sb = file_inode(file)->i_sb;
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  768  	struct fsuuid2 u = { .len = sb->s_uuid_len, };
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  769  
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  770  	if (!sb->s_uuid_len)
abe6acfa7d7b666 Günther Noack   2024-04-05  771  		return -ENOTTY;
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  772  
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06 @773  	memcpy(&u.uuid[0], &sb->s_uuid, sb->s_uuid_len);
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  774  
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  775  	return copy_to_user(argp, &u, sizeof(u)) ? -EFAULT : 0;
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  776  }
41bcbe59c3b3fa7 Kent Overstreet 2024-02-06  777  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
