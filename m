Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484981;
	b=UoajJ8eZmkcO4v2e/C+V1k1jUyd9iiVdW1syGCDyTWS8I/71Tvqj1ZJq2FNCVdqke2eP
	 WR/HXU/JUHbXkh1/FZ2ryB/bBjn0M/WDWeWEP3AKPMZfoskqo/3GJG20gm+3ODOHDZFE/
	 b72CQ4qzrRs7ErOXX1p+C/pnvnEO/Hu3fs52nh0KLoeb/CFwoM8zUE9vB5WUQl4NqDQra
	 f2f8CuPEVrpveVIsGYbsskf1JCPoD9/aNXegoL1bkOGvxWVhCyU/8OqqPEdgv4bMUCRRB
	 sPM3v+9CI7ZnYcc5pbfE57frjKc8+ERXXiTnSVhrCH2HzrRvk+IbrDqHOI2AqsHPPog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484981;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=Xw7r6iF+zO8fXkdzLRufgVhinglmDPnuGGdycV+HHa4=;
	b=q2n++2XZgjcrsKkWD/ITiTJRvYBTNNMPv57zd3mbaylp9hWgyJIuyMFTlh+3lIEpjONl
	 lOkkP/o8Gw2MH8nrEpcC8G8rC/02miH3pxYY6heE5WjvF7GMpmUVFw902mSDrbUdyu0l/
	 ia+W73rrgoSWQ3YhjpWoG00X1LjWlO7FMeMBxGMG8hFSJWK4+EKYbK6TsWDzbyIfSkFVg
	 dV6pQL9rmWZcftbljiLG5OAkEPqXI4kOLChjc2cV79R2M0rA3AS5s+rqQsi4+Lan76Cdu
	 23pX1mc+Vl7ET+XjBq9CmrxXpBB42DbE4sD5bW8lL/gBQblLG6jMx2p5c+ueIO/BT4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bCSMFy5h;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A4F606A32E
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 12:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58A4F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bCSMFy5h
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261112120258euoutp01964489faf544bdddd3f3211e2255de7c~nSpSE0Td51139111391euoutp01a;
	Thu, 12 Nov 2026 12:02:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261112120258euoutp01964489faf544bdddd3f3211e2255de7c~nSpSE0Td51139111391euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794484978;
	bh=Xw7r6iF+zO8fXkdzLRufgVhinglmDPnuGGdycV+HHa4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bCSMFy5h9WR5MXhQfr/yYMe50oNl4ZJ3B9PhLvn3AfoVJ3Uyo+MSQBjlm9BDOqF/s
	 YI8qgTWpK/VpOR25WqLm1BIOQY430YCMn2hX6owWJ0ZuGG39vX4A1Pt/J8PKIj6edQ
	 41nNcZwJxZucP719/0INyVtl5uX7gSp1npjbR8yk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261112120258eucas1p1c5cb56175a355c1eae521563b7e5958f~nSpR05hFs2595725957eucas1p1w;
	Thu, 12 Nov 2026 12:02:58 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261112120256eusmtip247d84ecda0f477bf594f640a7999ebf7~nSpQMIK460511505115eusmtip2L;
	Thu, 12 Nov 2026 12:02:56 +0000 (GMT)
Message-ID: <46236db8-c386-4db6-a8cd-e08073a5db0a@samsung.com>
Date: Thu, 12 Nov 2026 13:02:55 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored
 sources
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
	<justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Heiko
	Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
	Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Jens
	Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers
	<ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, David
	Laight <david.laight.linux@gmail.com>, Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <avKs4_S7r6EiUVgC@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261112120258eucas1p1c5cb56175a355c1eae521563b7e5958f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9
X-EPHeader: CA
X-CMS-RootMailID: 20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9@eucas1p1.samsung.com>
	<20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
	<avKs4_S7r6EiUVgC@google.com>



On 11/10/26 06:36, Sergey Senozhatsky wrote:
> On (26/11/06 15:42), Michal Wilczynski wrote:
> [..]
>> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
>> index 1e4ad31d39a63f45b3bddd3d8a467d8d7d095beb..50265e3ce256490994cb6dae32a45da376e408e0 100644
>> --- a/drivers/block/zram/backend_lz4.c
>> +++ b/drivers/block/zram/backend_lz4.c
>> @@ -42,7 +42,7 @@ static int lz4_setup_params(struct zcomp_params *params)
>>  	if (!params->dict || !params->dict_sz)
>>  		return 0;
>>  
>> -	dict_stream = kzalloc_obj(*dict_stream);
>> +	dict_stream = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>>  	if (!dict_stream)
>>  		return -ENOMEM;
>>  
>> @@ -88,7 +88,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>>  		if (!zctx->dstrm)
>>  			goto error;
>>  
>> -		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
>> +		zctx->cstrm = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>>  		if (!zctx->cstrm)
>>  			goto error;
>>  	}
>> @@ -112,7 +112,7 @@ static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
>>  					zctx->mem);
>>  	} else {
>>  		/* Cstrm needs to be reset */
>> -		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
>> +		memcpy(zctx->cstrm, params->drv_data, LZ4_MEM_COMPRESS);
>>  		ret = LZ4_compress_fast_continue(zctx->cstrm, req->src,
>>  						 req->dst, req->src_len,
>>  						 req->dst_len, params->level);
> 
> The zram code here is outdated, it has been reworked quite a bit
> (patches are in linux-next and Andrew's trees).
> 

Right, I'll rebase on linux-next.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
