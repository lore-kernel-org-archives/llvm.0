Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C71A9FA4;
	Wed, 20 May 2026 06:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259097; cv=none; b=cpRGZKCEZZ4juVw++uVtlbXjTXKXIcoRGFP6YqSg0PdSPtCEBqlF49sTpz+dWezH3/cSwlNWExitD9c/sq/NW/ewE891kR98pHAhF/sPfrqnocVQaOJFT72ut4Ae2fyHop01Lfu2bhN1EMHBHmmuQKC1B9Hjmh/KoWc3HN4A0dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259097; c=relaxed/simple;
	bh=Cbv2tqveTty5U1e9keaMs6yzjXm+KrQnM4603FbQNMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNTijUxGBjByJPzONj0TXOlNRqprOxZ1pPXtDc+kiobpBI3cRm4mMBVAAO/mYzpO/tWHQgabk/wr2ILhZj7jlpJBQGvPo1CXEPhDgmDPCz+Zh25qKUi8o6SlLhROzqeK8peafNT9Hl5rNjKmYOjn1ti0SeGqzdsdDwhlN9HO+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xuz0HBC7; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xuz0HBC7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779259092; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=qmh963UmdnckJF9emk6BMMuwHPG05DoMUMZkYsJ5MFs=;
	b=xuz0HBC7xFKcVnMWGtvzavslTMXhqR5Z+6rQB1jAbZm9aYUOIKKDtJh51x4c1VLOMx/P0VzFsk8dDmbmQQvcBf0AJYOggnwWV4JGY2hC0k92K1RruCUm5pcrsnEzUvvKh1C/itjXVyAoSZxKrTJoa692wdW9arrdxvxtxSNolRo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0X3Hd2l1_1779259091;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X3Hd2l1_1779259091 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 May 2026 14:38:11 +0800
Date: Wed, 20 May 2026 14:38:09 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5548/6445] kernel/dma/contiguous.c:139:13:
 warning: variable 'numa_cma_configured' set but not used
Message-ID: <ag1W0asYZn_CV1mt@U-2FWC9VHC-2323.local>
References: <202605200341.a1HLq7XC-lkp@intel.com>
 <CGME20260520045926eucas1p12f0b92b63a683fcab5878f20a32f4195@eucas1p1.samsung.com>
 <ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local>
 <8e73aae3-8ab4-4670-bce9-9efc3be6b340@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e73aae3-8ab4-4670-bce9-9efc3be6b340@samsung.com>

On Wed, May 20, 2026 at 08:14:58AM +0200, Marek Szyprowski wrote:
> On 20.05.2026 06:59, Feng Tang wrote:
> > On Wed, May 20, 2026 at 03:13:09AM +0800, kernel test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >> head:   6a50ba100ace43f43c87384367eb2d2605fcc16c
> >> commit: 38ce91195a7c6f76fa88ef5c03bad0bbabbf5556 [5548/6445] dma-contiguous: add kconfig option to setup numa cma area if not configured explicitly
> >> config: s390-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/config)
> >> compiler: clang version 23.0.0git (https://protect2.fireeye.com/v1/url?k=32465e8a-53cd4baf-3247d5c5-74fe485cbff6-571f25844ec6a01e&q=1&e=12c943a4-ee86-40a1-97e7-3937ac9b04c7&u=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605200341.a1HLq7XC-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>>> kernel/dma/contiguous.c:139:13: warning: variable 'numa_cma_configured' set but not used [-Wunused-but-set-global]
> >>      139 | static bool numa_cma_configured;
> >>          |             ^
> >>    1 warning generated.
> > Thanks for the catch!
> >
> > In this config, CONFIG_CMA_SIZE_PERNUMA is not set, which triggers the
> > warning.
> >
> > The patch below should fix it.
> >
> > Hi Marek,
> >
> > Could you help to squash this follow-on fix patch, or I can send
> > you a modified new version of the original patch? Thanks!
> 
> Yes, sure. I've updated the patch on my dma-mapping-for-next branch.

Thanks! - Feng
