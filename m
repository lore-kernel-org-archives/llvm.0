Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3EF3E499;
	Thu, 30 Jan 2025 07:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738220810; cv=none; b=X4zGBTZAKvRprCP/dx0qMU+mCl9sJKdUQL3an+z7DfAUIyVN8RMCoFkUH5pEqC9mU2kcVznCsRYnPVftWfYtb6taZLkyOQ+jR6YT41r/L3kNscekRpVnB3C7G8OatmbjRiC6hGb9sJYEYu3bv75Yb5uIAGHmo2YUNg9Ln/EmdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738220810; c=relaxed/simple;
	bh=65jUJG9caq9cyJDHIoGlVpeLv7gZ/BdZBMxmRdScOUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZAAW2FeopG8QJnAhkBwIoax4IIc0pJfk9fgwYn1+QbQ2GAoUnWBepjhmp5OY5ZlBuoyA2t/dyFdknHKlyKDFfR5zNyoa0cQvpQBolFr/ykVlBGUoquVHtvt/OB3YqyY4a/bqdzw/Chg8G2dslC/an6XM2/armXKYk8uwN76a80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cY0ejh1f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cY0ejh1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738220809; x=1769756809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65jUJG9caq9cyJDHIoGlVpeLv7gZ/BdZBMxmRdScOUU=;
  b=cY0ejh1f15p3ZqYZQ5eNCL9H0ArMXyoCAJNlnve9xQPjEcAqnO8YQuNx
   lDntX0blJcnTMde6VrxHT1tfgCaAjvU4Xy005hiAmFwb+DF82zxfleJQ7
   Y8O0IXs3pLAkQf5MFC1ZhGyoInXDJ4SMxCLIDK61GF93YVB+3IuNHOp0I
   yBuVU7YZezi6wQcBzdWwVqjFVHls4fUba3O2lI1BlflyBQLx6xVklmM0n
   jDBL6glaiviI9U6tEMvLZl6DEMipHqeAf4dfIt9L5XBQmJN2pmB/ZzdMT
   6Vvj+cXnaER3jo96ja3gh5+nFTA28VTeznSdi/Qmyo4bk93X3Kvx1YBs4
   g==;
X-CSE-ConnectionGUID: YxJBMCJGSBCpNfDb2WXSbA==
X-CSE-MsgGUID: inJjNioJQ1WTni05cMOHkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38644958"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38644958"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 23:06:48 -0800
X-CSE-ConnectionGUID: 4R2em9WISe6rmx+fcBbQPg==
X-CSE-MsgGUID: Ol3WKRjvQqu/rasfbGtq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109157064"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2025 23:06:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdOdQ-000jnT-0f;
	Thu, 30 Jan 2025 07:06:44 +0000
Date: Thu, 30 Jan 2025 15:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pages 12/20] drivers/iommu/iommu-pages.c:75:6:
 error: conflicting types for 'iommu_put_pages_list'
Message-ID: <202501301544.LclxCLKY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pages
head:   b21a333dd68ad1bca44a6a4ff61c91a9d43fba3a
commit: 828ed1aedcab6ea687a2a6c81e5fb2b6f01328da [12/20] iommu/pages: Remove iommu_put_pages_list_old and the _Generic
config: um-defconfig (https://download.01.org/0day-ci/archive/20250130/202501301544.LclxCLKY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301544.LclxCLKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301544.LclxCLKY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-pages.c:6:
   drivers/iommu/iommu-pages.h:14:34: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      14 | void iommu_put_pages_list(struct iommu_pages_list *list);
         |                                  ^
   drivers/iommu/iommu-pages.h:21:48: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      21 | static inline void iommu_pages_list_add(struct iommu_pages_list *list,
         |                                                ^
   drivers/iommu/iommu-pages.h:24:47: error: incomplete definition of type 'struct iommu_pages_list'
      24 |         list_add_tail(&virt_to_page(virt)->lru, &list->pages);
         |                                                  ~~~~^
   drivers/iommu/iommu-pages.h:21:48: note: forward declaration of 'struct iommu_pages_list'
      21 | static inline void iommu_pages_list_add(struct iommu_pages_list *list,
         |                                                ^
   drivers/iommu/iommu-pages.h:35:51: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      35 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^
   drivers/iommu/iommu-pages.h:38:19: error: incomplete definition of type 'struct iommu_pages_list'
      38 |         list_splice(&from->pages, &to->pages);
         |                      ~~~~^
   drivers/iommu/iommu-pages.h:35:51: note: forward declaration of 'struct iommu_pages_list'
      35 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^
   drivers/iommu/iommu-pages.h:38:31: error: incomplete definition of type 'struct iommu_pages_list'
      38 |         list_splice(&from->pages, &to->pages);
         |                                    ~~^
   drivers/iommu/iommu-pages.h:35:51: note: forward declaration of 'struct iommu_pages_list'
      35 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^
   drivers/iommu/iommu-pages.h:45:50: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      45 | static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
         |                                                  ^
   drivers/iommu/iommu-pages.h:47:25: error: incomplete definition of type 'struct iommu_pages_list'
      47 |         return list_empty(&list->pages);
         |                            ~~~~^
   drivers/iommu/iommu-pages.h:45:50: note: forward declaration of 'struct iommu_pages_list'
      45 | static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
         |                                                  ^
   drivers/iommu/iommu-pages.c:75:34: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |                                  ^
>> drivers/iommu/iommu-pages.c:75:6: error: conflicting types for 'iommu_put_pages_list'
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |      ^
   drivers/iommu/iommu-pages.h:14:6: note: previous declaration is here
      14 | void iommu_put_pages_list(struct iommu_pages_list *list);
         |      ^
   drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:857:30: note: expanded from macro 'list_for_each_entry_safe'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/iommu/iommu-pages.c:75:34: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |                                  ^
   drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:857:30: note: expanded from macro 'list_for_each_entry_safe'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:483:63: note: expanded from macro '__same_type'
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/iommu/iommu-pages.c:75:34: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |                                  ^
   drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:857:30: note: expanded from macro 'list_for_each_entry_safe'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:483:63: note: expanded from macro '__same_type'
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/iommu/iommu-pages.c:75:34: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |                                  ^
   drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:859:32: note: expanded from macro 'list_for_each_entry_safe'
     859 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:761:30: note: expanded from macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/iommu/iommu-pages.c:75:34: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |                                  ^
   5 warnings and 9 errors generated.


vim +/iommu_put_pages_list +75 drivers/iommu/iommu-pages.c

    68	
    69	/**
    70	 * iommu_put_pages_list - free a list of pages.
    71	 * @list: The list of pages to be freed
    72	 *
    73	 * Frees a list of pages allocated by iommu_alloc_pages_node().
    74	 */
  > 75	void iommu_put_pages_list(struct iommu_pages_list *list)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
