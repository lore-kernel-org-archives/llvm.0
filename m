Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3F1E47C7;
	Fri,  9 May 2025 20:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824233; cv=none; b=stc9spD05j1GqCVhHhbxXIle+noWUIdkTDcux+JK1p+7AKbwrP3z7Rq05rrZz8x4DgcjoJJMvGvAUTWOZKljJ3KcXNOobFxkEPoQxGh0o6auFzt85kZwlImwyPzKUi7iRwfA4UbGh8MRhhsZHiWVAHgOAi6NeOGsJeWxY3I0u1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824233; c=relaxed/simple;
	bh=38zTe3L3gLwycCxLFZa5toytwMpGo/jEBRWsaWtWm0s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=k37IY0MTe4NDkgapEPOxCAx8SQymozumoTUQpMBcLGQaLzA/X3H+6lTeRFucTQaYbObdeyx6HUWiwC9KMqm+FydAwgdLIt6TGg3PHy48MFZZp8+1OwpKs/z4IXjc907kzOiJg1RYo04Zlvm11eqRtaCD3/L9FFLoSg0mOLZ2xRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nb1SgRnO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nb1SgRnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D95C4CEE4;
	Fri,  9 May 2025 20:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746824232;
	bh=38zTe3L3gLwycCxLFZa5toytwMpGo/jEBRWsaWtWm0s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nb1SgRnOfYJnUZMz4b+U1zxXHweYzsDuvvWiSiin9lLYfGmYmSUFsyY/Ty9hsJSbU
	 ABavJgZg1h62YkIRP3nq18F2wQwOMuC+fuUJMWwn+3iiIjokol2WdLZ650darNjOau
	 pQ4lRi9tqGU2MIER1RPvB+V5sEjcDWnFo6cNf2rQ=
Date: Fri, 9 May 2025 13:57:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Zi Yan <ziy@nvidia.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 337/348] mm/page_isolation.c:18:20: warning:
 function 'get_pageblock_isolate' is not needed and will not be emitted
Message-Id: <20250509135711.28707139f71901046f998243@linux-foundation.org>
In-Reply-To: <202505092126.yRGhLhg1-lkp@intel.com>
References: <202505092126.yRGhLhg1-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 May 2025 21:21:03 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   9fe9c5a30f2f2d799c0e2df192df6622969b23b7
> commit: ca2f45163b701e1632c452022b2aadeb52841ec6 [337/348] mm/page_isolation: remove migratetype parameter from more functions
> config: i386-buildonly-randconfig-004-20250509 (https://download.01.org/0day-ci/archive/20250509/202505092126.yRGhLhg1-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092126.yRGhLhg1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505092126.yRGhLhg1-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/page_isolation.c:18:20: warning: function 'get_pageblock_isolate' is not needed and will not be emitted [-Wunneeded-internal-declaration]
>       18 | static inline bool get_pageblock_isolate(struct page *page)
>          |                    ^~~~~~~~~~~~~~~~~~~~~
>    mm/page_isolation.c:28:20: warning: unused function 'set_pageblock_isolate' [-Wunused-function]
>       28 | static inline void set_pageblock_isolate(struct page *page)
>          |                    ^~~~~~~~~~~~~~~~~~~~~
>    2 warnings generated.

Thanks.  I'll try something like the below fixup, but this is all
looking a bit messy - the benefit of those helpers is questionable!


--- a/mm/page_isolation.c~mm-page_isolation-remove-migratetype-parameter-from-more-functions-fix-2
+++ a/mm/page_isolation.c
@@ -15,22 +15,19 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/page_isolation.h>
 
+#ifdef CONFIG_DEBUG_VM
 static inline bool get_pageblock_isolate(struct page *page)
 {
 	return get_pfnblock_flags_mask(page, page_to_pfn(page),
 			PB_migrate_isolate_bit);
 }
+#endif
+
 static inline void clear_pageblock_isolate(struct page *page)
 {
 	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
 			PB_migrate_isolate_bit);
 }
-static inline void set_pageblock_isolate(struct page *page)
-{
-	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
-			page_to_pfn(page),
-			PB_migrate_isolate_bit);
-}
 
 /*
  * This function checks whether the range [start_pfn, end_pfn) includes
_

