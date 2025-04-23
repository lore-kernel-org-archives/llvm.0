Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F5255247;
	Wed, 23 Apr 2025 00:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745369710; cv=none; b=CFx5jAioBdLrYmpKKve8ehmGNuDpiBEd45IUd1PXAsjQSA/Ghx2yDce8XL1tPtNShJ9+FSTlmxF3Win/MOGJTE7r6g1pAV9sbs2JSKb62rcv62OZYsxeNKGGb6D1KNVVmH8dE/b+dhaYnWiSomWvZEXDTvOzz1c7fotpStHjxgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745369710; c=relaxed/simple;
	bh=MDaHnRYeCbJwJPSfb0vfXGA3faoHVZJItz7UU20SqWY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Y+0Vm/8gNc+OKULU8UL8hHYgQG7FOAh5+I0mPW/WtkykV3/g4y6Dp2GRUeRc/RZ8/69aDlo5msD4vuG0/BCHWrvSpqHmRgYzJTAi9cdHcgwKExFErULkDFhnCbmWrrdIRDPTa2HpyqG521KPILv7q0YVJDRNJIGyEQEtGjoxWio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BKATEM2i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BKATEM2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C93C4CEE9;
	Wed, 23 Apr 2025 00:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745369709;
	bh=MDaHnRYeCbJwJPSfb0vfXGA3faoHVZJItz7UU20SqWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BKATEM2iMldGUcvNDVS705355X2CnmCiHqjM7RX9s4OCamtymU5GXvT91NbVPo0I9
	 hl0LYGWA9qzds1bvDvQdspb0dPtkZ4ze5jMEAkOwIbeWDPIzhS8tGxixx/5AH0neBF
	 plIHSLCvFwuEqBj+OJgqmKLIx1gfVlBv+bWR4V9M=
Date: Tue, 22 Apr 2025 17:55:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Tinguely <mark.tinguely@oracle.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>, Linux
 Memory Management List <linux-mm@kvack.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 66/67] fs/ocfs2/aops.c:1133:17:
 warning: variable 'i' is uninitialized when used here
Message-Id: <20250422175508.cbb4875faacbda05e6c68cfd@linux-foundation.org>
In-Reply-To: <20250422201241.GA3761951@ax162>
References: <202504190950.rq1NDlDz-lkp@intel.com>
	<20250422201241.GA3761951@ax162>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 13:12:41 -0700 Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Andrew,
> 
> On Sat, Apr 19, 2025 at 09:21:13AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> > head:   d1a9b961293d30be9a865d8685590635db282957
> > commit: 89e3e963129e945e0333e474709bde627b6a9cee [66/67] ocfs2: fix panic in failed foilio allocation
> > config: s390-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504190950.rq1NDlDz-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> fs/ocfs2/aops.c:1133:17: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
> >     1133 |                         wc->w_folios[i] = NULL;
> >          |                                      ^
> >    fs/ocfs2/aops.c:1101:12: note: initialize the variable 'i' to silence this warning
> >     1101 |         int ret, i;
> >          |                   ^
> >          |                    = 0
> 
> There appears to be something funky going on with "ocfs2: fix panic in
> failed foilio allocation" in your tree, perhaps as a result of applying
> v2 to mm-nonmm-unstable and v1 to mm-hotfixes-unstable? If you compare
> https://git.kernel.org/akpm/mm/c/392a664f6d2740eeae23df0d29b56f444f558a7c
> to https://lore.kernel.org/c879a52b-835c-4fa0-902b-8b2e9196dcbd@oracle.com/,
> the second hunks do not match, which is what this is warning about. I
> see this same warning in next-20250422.

Thanks.  Confirms that the universe is a plot to confuse akpm.

I dropped everything and remerged the v2 patch.

