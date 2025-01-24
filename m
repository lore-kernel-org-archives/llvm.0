Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4D016DECB;
	Fri, 24 Jan 2025 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737683159; cv=none; b=WqwqMvgEOwEezCDtemFndu0eLhbr4HPp/iqq3ySYTS0ynbXQBd8rIup4yW+MVooMd8tWbTkwdza5N71OW64v1v3fr+0D8Apxou+uixVNqWZycBDb40fR39uFjj9FYLL8OM8yhs4W5Q4ZhSe0a9oOPBQRglzm4ArMs4Oq/soj7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737683159; c=relaxed/simple;
	bh=FORbqKOfpELyW3FvXxXbu9qqAYbNpl+wErLO4xZdnYA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p4iSyGV5izzVXu1CLB8is+PrlZBiMjBXa4CTy8fed8JYvipRvyxp1bS7gmg/d4vzAI0B67gY4Y7Pt2zdh5D9Vq2GkgbiAn1nifEXuPtl0r2xJPxWO50fMgqVENAzxqb/S0GnG6xGzo1rDUbewjUweR2rF4Odw8QYTB56KjJ0I5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-791ff700000194b3-09-6792f0c9547c
Message-ID: <96ec41ca-16d8-4960-8d4f-cedf5aca386c@sk.com>
Date: Fri, 24 Jan 2025 10:45:45 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: kernel_team@skhynix.com, 42.hyeyoo@gmail.com,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8826/10150] mm/zsmalloc.c:431:20: warning:
 function 'is_first_zpdesc' is not needed and will not be emitted
To: kernel test robot <lkp@intel.com>, Alex Shi <alexs@kernel.org>
References: <202501240958.4ILzuBrH-lkp@intel.com>
Content-Language: en-US
From: Hyeonggon Yoo <hyeonggon.yoo@sk.com>
In-Reply-To: <202501240958.4ILzuBrH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsXC9ZZnoe7JD5PSDc680rSY2GNgMWf9GjaL
	5Xcfs1vcW/Of1eJV8yM2iydT9rNZHFp5hcmB3WPnrLvsHov3vGTy2LSqk81j06dJ7B4nZvxm
	8XixeSZjAFsUl01Kak5mWWqRvl0CV8b7zwvZC57xVVzua2JrYJzN08XIwSEhYCIxcZFbFyMn
	mNnx4xEzSJhXwFLi8B0ekDCLgKrE7eN9LCA2r4CgxMmZT8BsUQF5ifu3ZrB3MXJxMAu0MUms
	n3qbCcQRFuhllNh0/DcTSJWIgJPEw23zwTqEBAwlbt5fCWYzC4hL3HoynwlkGZuAlsSOzlSQ
	MKeAkcSe961MECVmEl1buxghbHmJ7W/nMIPMlxA4wSbx5/FjVoijJSUOrrjBMoFRcBaSA2ch
	WTELyaxZSGYtYGRZxSiSmVeWm5iZY6xXnJ1RmZdZoZecn7uJERgby2r/RO5g/HYh+BCjAAej
	Eg+vh9mkdCHWxLLiytxDjBIczEoivP+fTEgX4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmv0rTxF
	SCA9sSQ1OzW1ILUIJsvEwSnVwKj95YpohpNqwpd/njPZe+MNT7BlFtwQ+Ki4kNlk9+bdE3nc
	p31/cLjlkIxsq8ZNiSNv2Mue/VhyS/tu5L8Hrle5fZ+vPNMY+XvWS+FL8z33bylnfllnt9Hj
	Zl+ms5qs59O9zK7q/P9d7L3Y2YynpPr+4Dy6ZPa63q9yJx80Lbt1qKxomVXUDjklluKMREMt
	5qLiRACdhMxuiQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsXCNUOnRPfkh0npBn8blSwm9hhYzFm/hs1i
	+d3H7BaH555ktbi35j+rxavmR2wWT6bsZ7M4tPIKkwOHx85Zd9k9Fu95yeSxaVUnm8emT5PY
	PU7M+M3i8WLzTEaPxS8+MAWwR3HZpKTmZJalFunbJXBlvP+8kL3gGV/F5b4mtgbG2TxdjJwc
	EgImEh0/HjF3MXJw8ApYShy+AxZmEVCVuH28jwXE5hUQlDg58wmYLSogL3H/1gz2LkYuDmaB
	NiaJ9VNvM4E4wgK9jBKbjv9mAqkSEXCSeLhtPliHkIChxM37K8FsZgFxiVtP5jOBLGMT0JLY
	0ZkKEuYUMJLY876VCaLETKJraxcjhC0vsf3tHOYJjHyzkNwxC8mkWUhaZiFpWcDIsopRJDOv
	LDcxM8dMrzg7ozIvs0IvOT93EyMwzJfV/pm0g/HbZfdDjAIcjEo8vA76k9KFWBPLiitzDzFK
	cDArifD+fzIhXYg3JbGyKrUoP76oNCe1+BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNT
	qoExpuT57m1n4lbfDBb6L3jn/6u/cU4m9za/qQ+eFfzT2f3Bi81T8yp4ipziTafLcm1JOxlU
	sV5MKzKn5N1Hl9QNT95LFtVlt3tsLK7pzHA9vvvQjg/XVQSenf9/OexttM/LgzI63L/t5W5O
	yPk5aR3X6uf6nGvDfvHXPflw/Fcqh/s3/VMTbk6KV2Ipzkg01GIuKk4EAFvHGmhvAgAA
X-CFilter-Loop: Reflected



On 1/24/2025 10:30 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   853d1f41ba73e78d22e7075d9a95670aab187eba
> commit: 1c6c153b503f90d1099ae606198e080a452687f6 [8826/10150] mm/zsmalloc: use zpdesc in trylock_zspage()/lock_zspage()
> config: i386-randconfig-005-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240958.4ILzuBrH-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240958.4ILzuBrH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501240958.4ILzuBrH-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> mm/zsmalloc.c:431:20: warning: function 'is_first_zpdesc' is not needed and will not be emitted [-Wunneeded-internal-declaration]
>       431 | static inline bool is_first_zpdesc(struct zpdesc *zpdesc)

Ok. for now is_first_zpdesc() is only used to check erroneous conditions
on CONFIG_DEBUG_VM=y. Simply adding __maybe_unused will be enough to
suppress this warning.

However I'm afraid that it's too late to update the patch now.

Andrew, if you're ok I'll send a patch after the merge window's closed.
How does that sound?

--
Hyeonggon

>           |                    ^~~~~~~~~~~~~~~
>     1 warning generated.
> 
> 
> vim +/is_first_zpdesc +431 mm/zsmalloc.c
> 
>     430	
>   > 431	static inline bool is_first_zpdesc(struct zpdesc *zpdesc)
>     432	{
>     433		return PagePrivate(zpdesc_page(zpdesc));
>     434	}
>     435	
> 

