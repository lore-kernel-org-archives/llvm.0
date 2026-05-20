Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F0313E36
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257705; cv=none; b=h73TXBDO/lAQk60hZWAavurLkMrwSJrfV5R50UwoIO2lJzZTIXg+BEiu/kTpmm/ibzwtYemQqFxq1/4amsCrWoGeJG8hKjC6WuAx8lmdsYiuLmV65y2Fy2GNlyfPXzdSjJFs4OQTzMDCUZSdzdhYQ9NHZBiG4u4jviexyKd/Frg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257705; c=relaxed/simple;
	bh=fgLc90DeVLuyp5RGRCvv+QZXzNGte6HjmG1vfERDY8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=fCsSfQ0y4DggNJpYHuHaatRkBM+Ivvl2uQ+tcyghVSrM14El4q684Qt6lDnUvJiw3YV6AgLt71ZaJCKRQmjGvoxt0hfAiJpwkHGcBY8xNIbyb3tyzLVCIPAiqSEzIxw3yo7rRLQw1tcgS7bUo8ClKIYj6wxlZuQI+RnL/o0hdWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gvK2UPsk; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gvK2UPsk"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260520061459euoutp01bf8fc5b8e00edf61f5a03281e13bf53b~xMXN9Nuji0102101021euoutp01C
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:14:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260520061459euoutp01bf8fc5b8e00edf61f5a03281e13bf53b~xMXN9Nuji0102101021euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779257699;
	bh=d9KBwCT1e+knM7hzQMRaTwLr6h7rD16jBqoIOjcDPj4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gvK2UPsk6l5sOe23BUKJ/7HyFA/OImgprMNFCd3s1UmCEJd47woIFvCn4FtO90MWr
	 4ERmg3w6Y9U/EW/lcYQz1C8MhAOj0Qrl7013MDr0A1gxjtSAAN7pDuJzAEWAhi0DqK
	 bTJoAytZr4gjQ+8Q6LXYOTclf7zIdtEU9lRYJrF8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260520061459eucas1p10ef610267fb33fd1159f0e9a500a0fe3~xMXNv1dSD2079220792eucas1p1B;
	Wed, 20 May 2026 06:14:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260520061459eusmtip16b1b6432df93df00c19d6fce271eb338~xMXNSLsGG1106611066eusmtip1G;
	Wed, 20 May 2026 06:14:59 +0000 (GMT)
Message-ID: <8e73aae3-8ab4-4670-bce9-9efc3be6b340@samsung.com>
Date: Wed, 20 May 2026 08:14:58 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [linux-next:master 5548/6445] kernel/dma/contiguous.c:139:13:
 warning: variable 'numa_cma_configured' set but not used
To: Feng Tang <feng.tang@linux.alibaba.com>, kernel test robot
	<lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260520061459eucas1p10ef610267fb33fd1159f0e9a500a0fe3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260520045926eucas1p12f0b92b63a683fcab5878f20a32f4195
X-EPHeader: CA
X-CMS-RootMailID: 20260520045926eucas1p12f0b92b63a683fcab5878f20a32f4195
References: <202605200341.a1HLq7XC-lkp@intel.com>
	<CGME20260520045926eucas1p12f0b92b63a683fcab5878f20a32f4195@eucas1p1.samsung.com>
	<ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local>

On 20.05.2026 06:59, Feng Tang wrote:
> On Wed, May 20, 2026 at 03:13:09AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   6a50ba100ace43f43c87384367eb2d2605fcc16c
>> commit: 38ce91195a7c6f76fa88ef5c03bad0bbabbf5556 [5548/6445] dma-contiguous: add kconfig option to setup numa cma area if not configured explicitly
>> config: s390-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/config)
>> compiler: clang version 23.0.0git (https://protect2.fireeye.com/v1/url?k=32465e8a-53cd4baf-3247d5c5-74fe485cbff6-571f25844ec6a01e&q=1&e=12c943a4-ee86-40a1-97e7-3937ac9b04c7&u=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project 5bac06718f502014fade905512f1d26d578a18f3)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202605200341.a1HLq7XC-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> kernel/dma/contiguous.c:139:13: warning: variable 'numa_cma_configured' set but not used [-Wunused-but-set-global]
>>      139 | static bool numa_cma_configured;
>>          |             ^
>>    1 warning generated.
> Thanks for the catch!
>
> In this config, CONFIG_CMA_SIZE_PERNUMA is not set, which triggers the
> warning.
>
> The patch below should fix it.
>
> Hi Marek,
>
> Could you help to squash this follow-on fix patch, or I can send
> you a modified new version of the original patch? Thanks!

Yes, sure. I've updated the patch on my dma-mapping-for-next branch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

