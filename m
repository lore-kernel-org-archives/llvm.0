Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253555784;
	Thu, 14 Dec 2023 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qom/+6q2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8083CC433C7;
	Thu, 14 Dec 2023 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702568154;
	bh=Uss3iA6rh8Xl83mjYM5f90LewxWWg+VNtfHzFUroLoA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qom/+6q2qCoT5x8HsvGHAnjmexupHf68r23kF/FFl/jmlgoSmDWCPLwS2e+LGUGPn
	 3+Z8yQl2Fmx2Ra3Mek2vodKNOFHTwUj0C1cL6Wf4JWJWz0Ed0v5DE7rqjW+Ebnm50w
	 lUh1dOJA+OusNm4jMnVwqL2LI3e7RyR9jIXjayJ4=
Date: Thu, 14 Dec 2023 07:35:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 153/301] mm/list_lru.c:110:1: error:
 unused function 'list_lru_from_kmem'
Message-Id: <20231214073553.0c2ce9ad2ed0a56d66021c7b@linux-foundation.org>
In-Reply-To: <202312141318.q8b5yrAq-lkp@intel.com>
References: <202312141318.q8b5yrAq-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Dec 2023 13:09:31 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   3ecae30dda241440417499d69ae90dfad517a932
> commit: 0a97c01cd20bb96359d8c9dedad92a061ed34e0b [153/301] list_lru: allow explicit memcg and NUMA node selection
> config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20231214/202312141318.q8b5yrAq-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141318.q8b5yrAq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312141318.q8b5yrAq-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/list_lru.c:110:1: error: unused function 'list_lru_from_kmem' [-Werror,-Wunused-function]
>    list_lru_from_kmem(struct list_lru *lru, int nid, void *ptr,
>    ^
>    1 error generated.

Thanks, I queued a fix to remove that function.
