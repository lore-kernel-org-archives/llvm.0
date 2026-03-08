Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D889288A2;
	Sun,  8 Mar 2026 21:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773004782; cv=none; b=lm0sZNSn9iVla6VI5/Rkl/qCCrn4bFYM9jSdBxk1y+EgFMwLSN7VS9JNFda4eJ2XhPQjoXdFwP+j4c3CerZ+JqSmMKE59lwOw/UlWHKf3UvFL/KBjB+ubGaksEQV0FLMXWtamQSPYtCkisJ/wrx4/eD1CRU+ldNH8EJOMvPaQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773004782; c=relaxed/simple;
	bh=KaIM6uppfpewOmxL9KYkE+WipHc364p2EAFsaV09DXc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YlvFn6pl1vf0i5Gf2CvQezTO6W88sKq176MB/jPyTJWCAVeE/ehlvnNJwIHdxUS/AmBMQlQeQGn6ee7dy/5a4FM23jFk8Py2grbFcN0fAhU+uDxTasU1U+8YdtQMnxH/sCpaolyKzCvJ0wIexp/nRo4GnCxgICkGKYQpCLAVVhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=diu2qG3H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="diu2qG3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EF0C116C6;
	Sun,  8 Mar 2026 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773004781;
	bh=KaIM6uppfpewOmxL9KYkE+WipHc364p2EAFsaV09DXc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=diu2qG3H0beC7fhBLaYTjH7wGD9ALJfbw9xBRm2G8HcuBpZHIivqkJYjptqysymlf
	 Pbh5bRigRx5FnAQHYOBvrc9TaAdmiZ5UvGty67+/iyXE3i6kUgeoAQLxSSWpzJXT6V
	 sgdA/ebUTaW/6zYM4n3ukhizzROyEv8TwzfstAJs=
Date: Sun, 8 Mar 2026 14:19:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Jianhui Zhou <jianhuizzzzz@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 34/207] fs/binfmt_elf.c:1140:17: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 4294967296 to 0
Message-Id: <20260308141940.0cfd8a176e643b3a6ce49f1f@linux-foundation.org>
In-Reply-To: <202603072018.Dl1xONhs-lkp@intel.com>
References: <202603072018.Dl1xONhs-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 07 Mar 2026 20:21:02 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   49cb736d092aaa856283e33b78ec3afb3964d82f
> commit: cd9119a9480d9d93fdf06792f8f9917cc4f9999c [34/207] mm/userfaultfd: fix hugetlb fault mutex hash calculation
> config: powerpc-currituck_defconfig (https://download.01.org/0day-ci/archive/20260307/202603072018.Dl1xONhs-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603072018.Dl1xONhs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603072018.Dl1xONhs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from fs/binfmt_elf.c:31:
>    include/linux/hugetlb.h:1214:9: error: call to undeclared function 'linear_page_index'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1214 |         return linear_page_index(vma, address);
>          |                ^
>    In file included from fs/binfmt_elf.c:32:

Thanks, I expect v2 will fix this.

--- a/include/linux/hugetlb.h~mm-userfaultfd-fix-hugetlb-fault-mutex-hash-calculation-v2
+++ a/include/linux/hugetlb.h
@@ -1208,12 +1208,6 @@ static inline unsigned int huge_page_shi
 	return PAGE_SHIFT;
 }
 
-static inline pgoff_t vma_hugecache_offset(struct hstate *h,
-		struct vm_area_struct *vma, unsigned long address)
-{
-	return linear_page_index(vma, address);
-}
-
 static inline bool hstate_is_gigantic(struct hstate *h)
 {
 	return false;
_

