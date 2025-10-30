Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53894351FC6;
	Thu, 30 Oct 2025 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761820562; cv=none; b=JTng+msvThu1u8AgU+r018ePGblcV/a9Od6rpZ8rkXrgoAAzORaC8fWk9W2Ptny2wcolH9bAQZ+7Myz/zm+gh8L63433H/HmIqUIY22OQjUKEuUQB5WLZ0SvDrlDoeWEolFB1NtjnRYHD8cquKw8lUCNj+w91svCUlEVIx6BK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761820562; c=relaxed/simple;
	bh=GeSjeHVt+iOUemws8DOgc/QwtZ0/A55hWiasDKdHOcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5W+8FNJc0SP+oRYMj8J+d3mfA62YaV9bEGN8/yuFST8ORTKK1znEHlJRHg/DZ5uDKt+mtjo+nzXcHfJv/Gpju7xxu3GkRFB8rIe/+1kraL1I1b9SS06wWainEVPOTVXSshnQGvof/H4H5IXtGLxrllTq1BGYbFWSoiCNQvmXOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSZE//XQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSZE//XQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761820560; x=1793356560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GeSjeHVt+iOUemws8DOgc/QwtZ0/A55hWiasDKdHOcw=;
  b=LSZE//XQtXwp+uMDBxNTWtV63MEr0DGEx1F8qa9EPaSeRDWDdlUglBGW
   AbAjysv22s2Vij1AHvacisiWRMSkYonGP3OVCNIxsEwm6TvBsfi6YSBq1
   HrM4902OaH+yGButz3H7AetyuH4b1QUcdpbfV5tt8a3XwoNHyU/KfHN1z
   AghisoM1FautS0L6jIU2PSgcmXLaadYWs5GqPqf/6w076v9/wqnyHjFQx
   DA8xDg182cjMPHDGwYzVrFLiZLE1sdKtmaGfbNMoTrToqElXsyT3fiApC
   Nd/aDuk/exgJOTzMwlbnnHiEZhnkQvKKQvR1VdN6MMD/Y8xPmD4Pzd3eT
   Q==;
X-CSE-ConnectionGUID: 0DZcj4WiSvGEs7u7NakQTA==
X-CSE-MsgGUID: s8mhMc5UQvqky6Thslvutg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75305528"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="75305528"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 03:35:57 -0700
X-CSE-ConnectionGUID: oySYT/ffQcq4+otnHdbanA==
X-CSE-MsgGUID: ID6r2m2PQqC49mwXE6T42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="186007839"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2025 03:35:54 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEQ0W-000Lpy-1b;
	Thu, 30 Oct 2025 10:35:52 +0000
Date: Thu, 30 Oct 2025 18:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>, brauner@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	viro@zeniv.linux.org.uk, jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	pfalcato@suse.de, Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH v2] fs: hide names_cachep behind runtime access machinery
Message-ID: <202510301845.m38jBkbI-lkp@intel.com>
References: <20251030085949.787504-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030085949.787504-1-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on linus/master brauner-vfs/vfs.all linux/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/fs-hide-names_cachep-behind-runtime-access-machinery/20251030-170230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20251030085949.787504-1-mjguzik%40gmail.com
patch subject: [PATCH v2] fs: hide names_cachep behind runtime access machinery
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510301845.m38jBkbI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301845.m38jBkbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301845.m38jBkbI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:146:11: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |         result = __getname();
         |                  ^
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
>> fs/namei.c:146:11: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     146 |         result = __getname();
         |                  ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:239:9: note: expanded from macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
>> fs/namei.c:146:11: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     146 |         result = __getname();
         |                  ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:243:10: note: expanded from macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
>> fs/namei.c:146:11: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     146 |         result = __getname();
         |                  ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:246:10: note: expanded from macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
   fs/namei.c:163:4: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     163 |                         __putname(result);
         |                         ^
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
   fs/namei.c:163:4: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     163 |                         __putname(result);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:774:41: note: passing argument to parameter 's' here
     774 | void kmem_cache_free(struct kmem_cache *s, void *objp);
         |                                         ^
   fs/namei.c:169:4: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     169 |                         __putname(result);
         |                         ^
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
   fs/namei.c:169:4: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     169 |                         __putname(result);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:774:41: note: passing argument to parameter 's' here
     774 | void kmem_cache_free(struct kmem_cache *s, void *objp);
         |                                         ^
   fs/namei.c:191:4: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |                         __putname(kname);
         |                         ^
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
   fs/namei.c:191:4: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     191 |                         __putname(kname);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:774:41: note: passing argument to parameter 's' here
     774 | void kmem_cache_free(struct kmem_cache *s, void *objp);
         |                                         ^
   fs/namei.c:197:4: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |                         __putname(kname);
         |                         ^
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
   fs/namei.c:197:4: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     197 |                         __putname(kname);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
--
>> fs/d_path.c:416:15: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     416 |         char *page = __getname();
         |                      ^
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
>> fs/d_path.c:416:15: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     416 |         char *page = __getname();
         |                      ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:239:9: note: expanded from macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
>> fs/d_path.c:416:15: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     416 |         char *page = __getname();
         |                      ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:243:10: note: expanded from macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
>> fs/d_path.c:416:15: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     416 |         char *page = __getname();
         |                      ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:246:10: note: expanded from macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
   fs/d_path.c:446:2: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     446 |         __putname(page);
         |         ^
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
   fs/d_path.c:446:2: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     446 |         __putname(page);
         |         ^~~~~~~~~~~~~~~
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:774:41: note: passing argument to parameter 's' here
     774 | void kmem_cache_free(struct kmem_cache *s, void *objp);
         |                                         ^
   6 errors generated.
--
>> drivers/base/firmware_loader/main.c:509:9: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     509 |         path = __getname();
         |                ^
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
>> drivers/base/firmware_loader/main.c:509:9: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     509 |         path = __getname();
         |                ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:239:9: note: expanded from macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
>> drivers/base/firmware_loader/main.c:509:9: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     509 |         path = __getname();
         |                ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:243:10: note: expanded from macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
>> drivers/base/firmware_loader/main.c:509:9: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     509 |         path = __getname();
         |                ^~~~~~~~~~~
   include/linux/fs.h:2968:39: note: expanded from macro '__getname'
    2968 | #define __getname()             kmem_cache_alloc(__names_cachep, GFP_KERNEL)
         |                                                  ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:739:69: note: expanded from macro 'kmem_cache_alloc'
     739 | #define kmem_cache_alloc(...)                   alloc_hooks(kmem_cache_alloc_noprof(__VA_ARGS__))
         |                                                                                     ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:246:10: note: expanded from macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:737:50: note: passing argument to parameter 'cachep' here
     737 | void *kmem_cache_alloc_noprof(struct kmem_cache *cachep,
         |                                                  ^
   drivers/base/firmware_loader/main.c:591:2: error: call to undeclared function 'runtime_const_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     591 |         __putname(path);
         |         ^
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^
   drivers/base/firmware_loader/main.c:591:2: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct kmem_cache *' [-Wint-conversion]
     591 |         __putname(path);
         |         ^~~~~~~~~~~~~~~
   include/linux/fs.h:2969:42: note: expanded from macro '__putname'
    2969 | #define __putname(name)         kmem_cache_free(__names_cachep, (void *)(name))
         |                                                 ^~~~~~~~~~~~~~
   include/linux/fs.h:2965:25: note: expanded from macro '__names_cachep'
    2965 | #define __names_cachep          runtime_const_ptr(names_cachep)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:774:41: note: passing argument to parameter 's' here
     774 | void kmem_cache_free(struct kmem_cache *s, void *objp);
         |                                         ^
   6 errors generated.


vim +/runtime_const_ptr +146 fs/namei.c

611851010c7404 Mateusz Guzik  2025-03-13  134  
51f39a1f0cea1c David Drysdale 2014-12-12  135  struct filename *
dff60734fc7606 Mateusz Guzik  2024-06-04  136  getname_flags(const char __user *filename, int flags)
91a27b2a756784 Jeff Layton    2012-10-10  137  {
94b5d2621aef59 Al Viro        2015-02-22  138  	struct filename *result;
7950e3852ab868 Jeff Layton    2012-10-10  139  	char *kname;
94b5d2621aef59 Al Viro        2015-02-22  140  	int len;
^1da177e4c3f41 Linus Torvalds 2005-04-16  141  
7ac86265dc8f66 Jeff Layton    2012-10-10  142  	result = audit_reusename(filename);
7ac86265dc8f66 Jeff Layton    2012-10-10  143  	if (result)
7ac86265dc8f66 Jeff Layton    2012-10-10  144  		return result;
7ac86265dc8f66 Jeff Layton    2012-10-10  145  
7950e3852ab868 Jeff Layton    2012-10-10 @146  	result = __getname();
3f9f0aa687d45c Linus Torvalds 2012-04-28  147  	if (unlikely(!result))
4043cde8ecf7f7 Eric Paris     2012-01-03  148  		return ERR_PTR(-ENOMEM);
^1da177e4c3f41 Linus Torvalds 2005-04-16  149  
7950e3852ab868 Jeff Layton    2012-10-10  150  	/*
7950e3852ab868 Jeff Layton    2012-10-10  151  	 * First, try to embed the struct filename inside the names_cache
7950e3852ab868 Jeff Layton    2012-10-10  152  	 * allocation
7950e3852ab868 Jeff Layton    2012-10-10  153  	 */
fd2f7cb5bcac58 Al Viro        2015-02-22  154  	kname = (char *)result->iname;
91a27b2a756784 Jeff Layton    2012-10-10  155  	result->name = kname;
7950e3852ab868 Jeff Layton    2012-10-10  156  
94b5d2621aef59 Al Viro        2015-02-22  157  	len = strncpy_from_user(kname, filename, EMBEDDED_NAME_MAX);
d4f50ea957cab6 Mateusz Guzik  2024-06-04  158  	/*
d4f50ea957cab6 Mateusz Guzik  2024-06-04  159  	 * Handle both empty path and copy failure in one go.
d4f50ea957cab6 Mateusz Guzik  2024-06-04  160  	 */
d4f50ea957cab6 Mateusz Guzik  2024-06-04  161  	if (unlikely(len <= 0)) {
91a27b2a756784 Jeff Layton    2012-10-10  162  		if (unlikely(len < 0)) {
94b5d2621aef59 Al Viro        2015-02-22  163  			__putname(result);
94b5d2621aef59 Al Viro        2015-02-22  164  			return ERR_PTR(len);
91a27b2a756784 Jeff Layton    2012-10-10  165  		}
3f9f0aa687d45c Linus Torvalds 2012-04-28  166  
d4f50ea957cab6 Mateusz Guzik  2024-06-04  167  		/* The empty path is special. */
d4f50ea957cab6 Mateusz Guzik  2024-06-04  168  		if (!(flags & LOOKUP_EMPTY)) {
d4f50ea957cab6 Mateusz Guzik  2024-06-04  169  			__putname(result);
d4f50ea957cab6 Mateusz Guzik  2024-06-04  170  			return ERR_PTR(-ENOENT);
d4f50ea957cab6 Mateusz Guzik  2024-06-04  171  		}
d4f50ea957cab6 Mateusz Guzik  2024-06-04  172  	}
d4f50ea957cab6 Mateusz Guzik  2024-06-04  173  
7950e3852ab868 Jeff Layton    2012-10-10  174  	/*
7950e3852ab868 Jeff Layton    2012-10-10  175  	 * Uh-oh. We have a name that's approaching PATH_MAX. Allocate a
7950e3852ab868 Jeff Layton    2012-10-10  176  	 * separate struct filename so we can dedicate the entire
7950e3852ab868 Jeff Layton    2012-10-10  177  	 * names_cache allocation for the pathname, and re-do the copy from
7950e3852ab868 Jeff Layton    2012-10-10  178  	 * userland.
7950e3852ab868 Jeff Layton    2012-10-10  179  	 */
94b5d2621aef59 Al Viro        2015-02-22  180  	if (unlikely(len == EMBEDDED_NAME_MAX)) {
fd2f7cb5bcac58 Al Viro        2015-02-22  181  		const size_t size = offsetof(struct filename, iname[1]);
7950e3852ab868 Jeff Layton    2012-10-10  182  		kname = (char *)result;
7950e3852ab868 Jeff Layton    2012-10-10  183  
fd2f7cb5bcac58 Al Viro        2015-02-22  184  		/*
fd2f7cb5bcac58 Al Viro        2015-02-22  185  		 * size is chosen that way we to guarantee that
fd2f7cb5bcac58 Al Viro        2015-02-22  186  		 * result->iname[0] is within the same object and that
fd2f7cb5bcac58 Al Viro        2015-02-22  187  		 * kname can't be equal to result->iname, no matter what.
fd2f7cb5bcac58 Al Viro        2015-02-22  188  		 */
fd2f7cb5bcac58 Al Viro        2015-02-22  189  		result = kzalloc(size, GFP_KERNEL);
94b5d2621aef59 Al Viro        2015-02-22  190  		if (unlikely(!result)) {
94b5d2621aef59 Al Viro        2015-02-22  191  			__putname(kname);
94b5d2621aef59 Al Viro        2015-02-22  192  			return ERR_PTR(-ENOMEM);
7950e3852ab868 Jeff Layton    2012-10-10  193  		}
7950e3852ab868 Jeff Layton    2012-10-10  194  		result->name = kname;
94b5d2621aef59 Al Viro        2015-02-22  195  		len = strncpy_from_user(kname, filename, PATH_MAX);
94b5d2621aef59 Al Viro        2015-02-22  196  		if (unlikely(len < 0)) {
94b5d2621aef59 Al Viro        2015-02-22  197  			__putname(kname);
94b5d2621aef59 Al Viro        2015-02-22  198  			kfree(result);
94b5d2621aef59 Al Viro        2015-02-22  199  			return ERR_PTR(len);
94b5d2621aef59 Al Viro        2015-02-22  200  		}
d4f50ea957cab6 Mateusz Guzik  2024-06-04  201  		/* The empty path is special. */
d4f50ea957cab6 Mateusz Guzik  2024-06-04  202  		if (unlikely(!len) && !(flags & LOOKUP_EMPTY)) {
d4f50ea957cab6 Mateusz Guzik  2024-06-04  203  			__putname(kname);
d4f50ea957cab6 Mateusz Guzik  2024-06-04  204  			kfree(result);
d4f50ea957cab6 Mateusz Guzik  2024-06-04  205  			return ERR_PTR(-ENOENT);
d4f50ea957cab6 Mateusz Guzik  2024-06-04  206  		}
94b5d2621aef59 Al Viro        2015-02-22  207  		if (unlikely(len == PATH_MAX)) {
94b5d2621aef59 Al Viro        2015-02-22  208  			__putname(kname);
94b5d2621aef59 Al Viro        2015-02-22  209  			kfree(result);
94b5d2621aef59 Al Viro        2015-02-22  210  			return ERR_PTR(-ENAMETOOLONG);
94b5d2621aef59 Al Viro        2015-02-22  211  		}
7950e3852ab868 Jeff Layton    2012-10-10  212  	}
b463d7fd118b98 Song Liu       2025-04-09  213  	initname(result, filename);
^1da177e4c3f41 Linus Torvalds 2005-04-16  214  	audit_getname(result);
^1da177e4c3f41 Linus Torvalds 2005-04-16  215  	return result;
3f9f0aa687d45c Linus Torvalds 2012-04-28  216  }
3f9f0aa687d45c Linus Torvalds 2012-04-28  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
