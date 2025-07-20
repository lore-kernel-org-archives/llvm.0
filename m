Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E360DF71;
	Sun, 20 Jul 2025 00:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752969854; cv=none; b=b2wz0goUjjjo5nF+wzwbLo1XfvVjIj2LuM6akM79J+8to0yQC5cFmCs/ZtjBuzxN6EiICHBvZxJwOIk5jy+kNL4qq/oBLy//ObGTYix9C1OkDqGlUgMOPASP4JOPX33bc5o37v4UKs/olfEqLNN+3TZU40OTfKlA78UvtGGxAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752969854; c=relaxed/simple;
	bh=CMdcwjdM+NEKwgCfs8II+AAktb6VqdiwswETRLmxqx4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KusoxWdwToxmA/UofJa9fb+9fL+Il5CUmctsN5WKv5AJBRF/LZLWwEgyhp42RFXO/rSNoFrdN1JU49zZQd2EDCd4AZLosOiC8jUyE4n87LTmVmUas9PU/hiLzcgIlpTfyzWs0lmgXRAT/2IfBWUu41jULL8DCWY2XDJqNUV9B3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PJSWQe9o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PJSWQe9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EE7C4CEE3;
	Sun, 20 Jul 2025 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752969853;
	bh=CMdcwjdM+NEKwgCfs8II+AAktb6VqdiwswETRLmxqx4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PJSWQe9oQQkTIo4LmKA/patMfkTxheJ1Z3wmno2dxAz6YrBKaQ8BUxi8nOZ6KS3A7
	 VY8NoDCl1wSzC4oRF0vEZouiUvCC08IThmPVkV2gosNkuN1Ys2owbShruDUwenPtls
	 kA/cX2d19uQQsDOu8H2usOKE4nypj+TyzZH3hSEg=
Date: Sat, 19 Jul 2025 17:04:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 160/175] mm/kasan/tags.c:145:6: error:
 redefinition of 'kasan_save_free_info'
Message-Id: <20250719170413.9b64b9321c3ac082712348fe@linux-foundation.org>
In-Reply-To: <202507190528.W6ndwfyg-lkp@intel.com>
References: <202507190528.W6ndwfyg-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Jul 2025 05:28:51 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   b0e07b9befa0558a80b281b7efcdb3717881c969
> commit: 3d3c26eaf9f6e00779d27dd54d763c9bdc5dda3c [160/175] kasan: add shadow checks to wrappers and rename kasan_arch_is_ready
> config: arm64-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190528.W6ndwfyg-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190528.W6ndwfyg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507190528.W6ndwfyg-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/kasan/tags.c:145:6: error: redefinition of 'kasan_save_free_info'
>      145 | void kasan_save_free_info(struct kmem_cache *cache, void *object)
>          |      ^
>    mm/kasan/kasan.h:403:20: note: previous definition is here
>      403 | static inline void kasan_save_free_info(struct kmem_cache *cache, void *object)
>          |                    ^
>    1 error generated.

I'll add this.   It should repair the build, at least?

--- a/mm/kasan/tags.c~kasan-add-shadow-checks-to-wrappers-and-rename-kasan_arch_is_ready-fix
+++ a/mm/kasan/tags.c
@@ -142,7 +142,7 @@ void kasan_save_alloc_info(struct kmem_c
 	save_stack_info(cache, object, flags, false);
 }
 
-void kasan_save_free_info(struct kmem_cache *cache, void *object)
+void __kasan_save_free_info(struct kmem_cache *cache, void *object)
 {
 	save_stack_info(cache, object, 0, true);
 }
_

