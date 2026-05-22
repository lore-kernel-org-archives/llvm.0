Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422217A305
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 06:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429747; cv=none; b=bFbI79XrUVlZZtakQVFG5HbvU9WtG9yFarbZOUQu7icU9BJ/Ld3eOzGkNlFXeArQir0catwMUAgOAZTg8D7kukPmWSvoSb/Qy423AEB5iXoQ/oE6Xi/Xn8xXvKhEW3a5YFWYodzBO3NHGOR4w1s2dzauLlVuv1YsykOZBpv+wjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429747; c=relaxed/simple;
	bh=x2y53w7c1e8+Q48egGy68Np7IsuVA68IgU0qf8wkud4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=OZMPcsvqmi2kXocMmPuM/dUP9Es8X9UIUv1heXSDAGaJMaMtkYOyFqOKl83FfaeRFL48Q1dk/ZtZ26dfIQgkGXgMeNVKnuFlEfuUaCX89gLSkBXMYNk+s6Qvlx7dmmj2FEsLl3wGdb4roonK7ZKEGJ598unGr0m0qQclycX68N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qe+1BIcd; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qe+1BIcd"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260522060222euoutp0247e8b80aff0396af064b841af45ccb6b~xzexWijxy2486124861euoutp02l
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 06:02:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260522060222euoutp0247e8b80aff0396af064b841af45ccb6b~xzexWijxy2486124861euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779429742;
	bh=4J5pzzJH1WRf8mEoRQtTRMNCxIld6gZMOlem1a3l+Nc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qe+1BIcdIVTCseRLsA7U0VTRys9TvvhWVPInQqkxNGpAN8f6IQr/SlyWVIkbwuXs0
	 CYfS+4P50jFa108fGPIYcS/TFATIiO8uKzk5di/7hDI0O4ejMS+gGU5+y983qVyzB3
	 Q2AeNxTVw+1R+Yvhnaq5DWHJlfkyNy3BMSQRnROE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260522060222eucas1p21143fc4c09872a48275e37f34f2a4325~xzexMMGQQ1128511285eucas1p2B;
	Fri, 22 May 2026 06:02:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260522060221eusmtip176ff2017700ba234285cfc6154dc1d6b~xzewnzGS22675326753eusmtip17;
	Fri, 22 May 2026 06:02:21 +0000 (GMT)
Message-ID: <3d7f3f61-f305-4b31-beb9-c21a6d460255@samsung.com>
Date: Fri, 22 May 2026 08:02:21 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [linux-next:master 5548/6445] kernel/dma/contiguous.c:139:13:
 warning: variable 'numa_cma_configured' set but not used
To: Feng Tang <feng.tang@linux.alibaba.com>, Nathan Chancellor
	<nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ag5g30Jm-3gRS9QQ@U-2FWC9VHC-2323.local>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260522060222eucas1p21143fc4c09872a48275e37f34f2a4325
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260521013323eucas1p118cd8406a412e2fadcea2e0276529610
X-EPHeader: CA
X-CMS-RootMailID: 20260521013323eucas1p118cd8406a412e2fadcea2e0276529610
References: <202605200341.a1HLq7XC-lkp@intel.com>
	<ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local> <20260520222742.GA1607511@ax162>
	<CGME20260521013323eucas1p118cd8406a412e2fadcea2e0276529610@eucas1p1.samsung.com>
	<ag5g30Jm-3gRS9QQ@U-2FWC9VHC-2323.local>

On 21.05.2026 03:33, Feng Tang wrote:
> On Wed, May 20, 2026 at 03:27:42PM -0700, Nathan Chancellor wrote:
> [...]
>>> ---
>>> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
>>> index 42227c823893..f286d49bf068 100644
>>> --- a/kernel/dma/contiguous.c
>>> +++ b/kernel/dma/contiguous.c
>>> @@ -136,7 +136,7 @@ static struct cma *dma_contiguous_numa_area[MAX_NUMNODES];
>>>  static phys_addr_t numa_cma_size[MAX_NUMNODES] __initdata;
>>>  static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
>>>  static phys_addr_t pernuma_size_bytes __initdata;
>>> -static bool numa_cma_configured;
>>> +static bool __maybe_unused numa_cma_configured;
>>>  
>>>  static int __init early_numa_cma(char *p)
>>>  {
>>>
>> I know Marek already updated this but I think a better solution would
>> have been turning the '#ifdef' into IS_ENABLED(), as I don't see a
>> reason for this code to be ifdef'd, none of these variables are
>> undeclared or unusable when CONFIG_CMA_SIZE_PERNUMA is unset. This would
>> allow the compiler to always see the variable as used, regardless of the
>> value of CONFIG_CMA_SIZE_PERNUMA.
> Looks good to me, thanks. I'm fine either way.
Okay, I've updated that patch again. While touching it, I've also added 
__initdata attribute to the numa_cma_configured variable.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

