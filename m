Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699070;
	b=2lYK+mHM9hlxtfb0aXaKZqA8hJ1WjYC3kpPbO2hY4crYNazgePH7AnQCZEgEvWZOUE8o
	 eEedkGM8o9n5MLSvTcFedjGLdGUi+QPK1WQhiQlE4IKkkJqOuwlpuErsbFYKfVnX5vPZo
	 uQBCBoRsMmLldHrVjLjF5a1K5TnOu4+iuwRa6YgUFkBYwn3a7+Q86POp/+oKto6WXohgi
	 a6/TilXamFptLRI8Sgw3jhlcHvX+ISdIIdxfveJjFeoPbqZ1zrxKETgg1INYHJeu2JLOm
	 1gU+/iH8CQUuaqorsiEYiXVFWdhdXzjWkHBxxDZkmqWDma+CAQSKdA0m7ITiv+cnhNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699070;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=EqD6XXEFKVf4WUIZtUdGo2rdQDUJQpo7+qGZ1y//k9Y=;
	b=P07xiVKnPetU7E4r0hBB5yU6fSHbt59BaO0ogZECh4l6tNh/Qn9zt/DEOCtjgRw0lr/B
	 WN4vK9oOXIuQ8euF/JpmwAzPu2RrmQmTVwJP+5f+j5iQLg8c8TGJ+RgAJfytsXP21QB+1
	 tLj7FxNYIRWB7vzCzdY8TsWVloAHuLKZNOSKPbz2romFx4iBmzqJokDGKrKW4AquoIdY5
	 x/TKhyzcCj8uT28nSfMbCq7/YvfeVzNTMatuBq8jhZLWBsn1zCU4TKZ8I8sAoxyz/G/zu
	 IxUokBxl5i+0l616+FvHe43MDiXzxsZw6J/cyYxlMMMxiIsmhdJvja/uV7YXdaJCp4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0F606A330
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 09:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA0F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261103094425euoutp01c02a9d27dde9928d4a3f5a5d871a0428~kf8wF2p-U2983929839euoutp01p
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 09:44:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261103094425euoutp01c02a9d27dde9928d4a3f5a5d871a0428~kf8wF2p-U2983929839euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793699065;
	bh=EqD6XXEFKVf4WUIZtUdGo2rdQDUJQpo7+qGZ1y//k9Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NFegZMCmsOz9eMS3itkiBpvSwHFNBoGwf/1MbFWg2hwoq6nDtOviGgPzwKEQMieAq
	 BOAhrAlUiRqpCclrpKU8YGbKCRT9ZGzbeNMHXA3CGtVpCqUnhSE1GnX/aNkjJmUmby
	 4dt4J1ImQVGPlOkD5w0ASZ47AFZhwhHBTo7b8leY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261103094425eucas1p14f8698866db3a44dc2559fef5569686e~kf8vsv8-G1950419504eucas1p1X;
	Tue,  3 Nov 2026 09:44:25 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261103094424eusmtip1a4f4097b78810e28de113df65a194052~kf8ug9zZc1524615246eusmtip1d;
	Tue,  3 Nov 2026 09:44:24 +0000 (GMT)
Message-ID: <8b1e8238-e5ba-4875-869f-478177591738@samsung.com>
Date: Tue, 3 Nov 2026 10:44:23 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] of: reserved_mem: mark the early_memremap() array
 helpers __init
To: Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261102224528.2495168-1-sashal@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261103094425eucas1p14f8698866db3a44dc2559fef5569686e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261102224535eucas1p2a4b762399cd706fadb9dbaeb08188846
X-EPHeader: CA
X-CMS-RootMailID: 20261102224535eucas1p2a4b762399cd706fadb9dbaeb08188846
References: <CGME20261102224535eucas1p2a4b762399cd706fadb9dbaeb08188846@eucas1p2.samsung.com>
	<20261102224528.2495168-1-sashal@kernel.org>

On 02.11.2026 23:45, Sasha Levin wrote:
> early_array_map() and early_array_unmap() wrap early_memremap() and
> early_memunmap(), which are __init, but the helpers themselves are only
> static inline. If the compiler decides not to inline them, the out of
> line copy ends up in .text and modpost complains. clang 21 does this for
> a riscv allnoconfig build:
>
>   WARNING: modpost: vmlinux: section mismatch in reference: early_array_map+0x30 (section: .text) -> early_memremap (section: .init.text)
>   ERROR: modpost: Section mismatches detected.
>
> Both helpers are only called from fdt_scan_reserved_mem(), which is
> __init, so mark them __init too.
>
> Fixes: aa05faf81583 ("of: reserved_mem: allocate and map the reserved_mem array early")
> Signed-off-by: Sasha Levin <sashal@kernel.org>


I wasn't aware that 'static inline' functions might need __init
annotations.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
> KernelCI's clang-21 riscv builds fail on this once dt/for-next is
> merged, so it will probably show up in tomorrow's linux-next as well.
>
> Tested with a riscv LLVM=1 allnoconfig build (fails at modpost before,
> links after), plus W=1 builds of of_reserved_mem.o for riscv and arm64
> defconfig with clang, and arm64 defconfig with gcc.
>
>  drivers/of/of_reserved_mem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 0fd1683cba011..630ad65466385 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -66,11 +66,11 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>   */
>  #if defined(CONFIG_GENERIC_EARLY_IOREMAP) && !defined(CONFIG_PPC64)
>  #include <asm/early_ioremap.h>
> -static inline void *early_array_map(void *array, size_t size)
> +static inline void * __init early_array_map(void *array, size_t size)
>  {
>  	return early_memremap(__pa(array), size);
>  }
> -static inline void early_array_unmap(void *map, size_t size)
> +static inline void __init early_array_unmap(void *map, size_t size)
>  {
>  	early_memunmap(map, size);
>  }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

