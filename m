Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE57D17D8A5;
	Tue, 25 Jun 2024 21:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719352374; cv=none; b=HsPUBTjS+Te7xjvaGVN3oETjFW4IuuhpLzNc+QizWSEOeZtrI2yGQBKR69LCzu8o/13aj744PaTNf7F973ms2oFgM8mUtplCvxXZdte0+mlI6jm0tscuvwM5NI2SCm2seiLy0KaF3GkAd8qX1wkyx98vONRiBxwzGdlM6Dq+7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719352374; c=relaxed/simple;
	bh=G6GOHUSnoxrYjNbOCPF7hY75PTqZowehFbGl4aaLeSc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=C16B1ycV7EE4HnJANhUUvqElK6dgMmsrnysumVXj58Vn07XwVA071E4FcW6f3aCfG9c2la0SXWQw44XuX9HZeKRej731MLyTD4LB/QRy6iwO719NEquku87KdV8inminL6676ZXtUle548SilP/8YFL+CJKR9qcYiDQeuK7tYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OKHkg445; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OKHkg445"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F90CC32781;
	Tue, 25 Jun 2024 21:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719352373;
	bh=G6GOHUSnoxrYjNbOCPF7hY75PTqZowehFbGl4aaLeSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OKHkg445PwrR26/Gvds2THaNYUdszmNn2mqwHCeJ3tzbW340Cko9xEGPVYuGqQ/Mf
	 TB2iqdnVRgguJLDilrK83MFBxqkYkdILmTTnGoSKTeJwqaSOJKn0yfnS1Uq+CmuAqm
	 JzAgDO8We3BJvnZEIjHGR3KhXMMVqujz5Sm10n0Q=
Date: Tue, 25 Jun 2024 14:52:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Lance Yang <ioworker0@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7701/8232] mm/huge_memory.c:2735:31:
 warning: variable 'page' is uninitialized when used here
Message-Id: <20240625145252.d78d18a109cb6bf84eefb5f7@linux-foundation.org>
In-Reply-To: <202406260514.SLhNM9kQ-lkp@intel.com>
References: <202406260514.SLhNM9kQ-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Jun 2024 05:39:54 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> commit: 4627108658d68fad359600dbe667b88b501cee71 [7701/8232] mm/vmscan: avoid split lazyfree THP during shrink_folio_list()
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240626/202406260514.SLhNM9kQ-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260514.SLhNM9kQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406260514.SLhNM9kQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/huge_memory.c:2735:31: warning: variable 'page' is uninitialized when used here [-Wuninitialized]
>     2735 |         folio_remove_rmap_pmd(folio, page, vma);
>          |                                      ^~~~
>    mm/huge_memory.c:2699:19: note: initialize the variable 'page' to silence this warning
>     2699 |         struct page *page;
>          |                          ^
>          |                           = NULL
>    1 warning generated.
> 
> 

um yes. 
https://lore.kernel.org/all/20240622100057.3352-1-ioworker0@gmail.com/T/#u
removed the initialization.

I'll do this, because I'm about to push a tree out:

--- a/mm/huge_memory.c~hack
+++ a/mm/huge_memory.c
@@ -2697,7 +2697,6 @@ static bool __discard_anon_folio_pmd_loc
 	struct mm_struct *mm = vma->vm_mm;
 	int ref_count, map_count;
 	pmd_t orig_pmd = *pmdp;
-	struct page *page;
 
 	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
 		return false;
@@ -2733,7 +2732,7 @@ static bool __discard_anon_folio_pmd_loc
 		return false;
 	}
 
-	folio_remove_rmap_pmd(folio, page, vma);
+	folio_remove_rmap_pmd(folio, pmd_page(orig_pmd), vma);
 	zap_deposited_table(mm, pmdp);
 	add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
 	if (vma->vm_flags & VM_LOCKED)
_

