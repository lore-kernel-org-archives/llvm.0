Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66D626A092;
	Tue, 22 Apr 2025 20:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745352767; cv=none; b=U7bazOuIwaihnglDx0SfWWI4brrInLBwQ8ZQ2i7YG2g4vbreFhiRvC3mbfXgmArMs1IxH+2J1R9pTuweK4LviUZ5ZqQHVfqVN0/Kpbf5xTNSXp91Y5/So1qPPCC1Yw0zxnh/0JPfak2oOloW3ehHmwsC6ppVRGMet3tKbAYdqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745352767; c=relaxed/simple;
	bh=7k8XxwrGOAJgEq952KWo4KYigCszYv7eUvZUK+4PgjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDwwVGaiZFf6cQjJ5qWKhbAXhPQFzcCj0kAMlJBIqH/KSazYOeHB5C940Ftky5LEBXGPcUQSmSRrC0K198c7i12Rbr2YS+vvDAyUfY4uFQaNr43EYW4kxIAMpZ9FIEEePeKitp3xZ0dbIfoioUlUQ8VIyEYubp9DnmlELohSj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aetyBQo+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aetyBQo+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7ECC4CEEB;
	Tue, 22 Apr 2025 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745352765;
	bh=7k8XxwrGOAJgEq952KWo4KYigCszYv7eUvZUK+4PgjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aetyBQo+RRTNxCYB64yKCsrhSJhZFYtKIroTxKspqjNgtXAXEMXR1W/kkFGf03hKI
	 e0IecnRX0qivMAcujpG4HWRPjcHSfIQvyW4Lc/NvQ5Y5h18MyYuyk84bOhuOfPFMC7
	 3uBxim7hHZyRkULOlKSXENSjEUsQ7IgUmv1ahtgLvTF2I3Dw+1zxQ/PFzgbLXbD9dO
	 Z84kLfBPC9YF9CAXjJ6i0TLg3zjnPO/nnDVNt4BRhCamYIsxJHzu2wiQLWSofaR/dI
	 gypHFMxbVu0aI6BpNMdCU/b4aklRHq2iT+iZUsoMmJXpPkIn8siZWEZoOuMOtAq+gn
	 Du4DqV5NhLByQ==
Date: Tue, 22 Apr 2025 13:12:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Tinguely <mark.tinguely@oracle.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 66/67] fs/ocfs2/aops.c:1133:17:
 warning: variable 'i' is uninitialized when used here
Message-ID: <20250422201241.GA3761951@ax162>
References: <202504190950.rq1NDlDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504190950.rq1NDlDz-lkp@intel.com>

Hi Andrew,

On Sat, Apr 19, 2025 at 09:21:13AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   d1a9b961293d30be9a865d8685590635db282957
> commit: 89e3e963129e945e0333e474709bde627b6a9cee [66/67] ocfs2: fix panic in failed foilio allocation
> config: s390-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504190950.rq1NDlDz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/ocfs2/aops.c:1133:17: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
>     1133 |                         wc->w_folios[i] = NULL;
>          |                                      ^
>    fs/ocfs2/aops.c:1101:12: note: initialize the variable 'i' to silence this warning
>     1101 |         int ret, i;
>          |                   ^
>          |                    = 0

There appears to be something funky going on with "ocfs2: fix panic in
failed foilio allocation" in your tree, perhaps as a result of applying
v2 to mm-nonmm-unstable and v1 to mm-hotfixes-unstable? If you compare
https://git.kernel.org/akpm/mm/c/392a664f6d2740eeae23df0d29b56f444f558a7c
to https://lore.kernel.org/c879a52b-835c-4fa0-902b-8b2e9196dcbd@oracle.com/,
the second hunks do not match, which is what this is warning about. I
see this same warning in next-20250422.

Cheers,
Nathan
