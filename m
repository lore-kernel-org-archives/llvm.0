Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE8710E5
	for <llvm@lists.linux.dev>; Sat,  7 Jan 2023 01:55:28 +0000 (UTC)
Received: from kwepemm600009.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Npjsz4cX9zRqsF;
	Sat,  7 Jan 2023 09:53:43 +0800 (CST)
Received: from [10.67.101.184] (10.67.101.184) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 7 Jan 2023 09:55:18 +0800
Subject: Re: [PATCH] crypto: hisilicon: Wipe entire pool on error
To: Kees Cook <keescook@chromium.org>
References: <20230106041945.never.831-kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>, Zhou Wang
	<wangzhou1@hisilicon.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David
 S. Miller" <davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
	<linux-hardening@vger.kernel.org>
From: Weili Qian <qianweili@huawei.com>
Message-ID: <7c9e9870-2456-01af-177f-1af62a0055e3@huawei.com>
Date: Sat, 7 Jan 2023 09:55:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230106041945.never.831-kees@kernel.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.101.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected


On 2023/1/6 12:19, Kees Cook wrote:
> To work around a Clang __builtin_object_size bug that shows up under
> CONFIG_FORTIFY_SOURCE and UBSAN_BOUNDS, move the per-loop-iteration
> mem_block wipe into a single wipe of the entire pool structure after
> the loop.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1780
> Cc: Weili Qian <qianweili@huawei.com>
> Cc: Zhou Wang <wangzhou1@hisilicon.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-crypto@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/crypto/hisilicon/sgl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/hisilicon/sgl.c b/drivers/crypto/hisilicon/sgl.c
> index 2b6f2281cfd6..0974b0041405 100644
> --- a/drivers/crypto/hisilicon/sgl.c
> +++ b/drivers/crypto/hisilicon/sgl.c
> @@ -124,9 +124,8 @@ struct hisi_acc_sgl_pool *hisi_acc_create_sgl_pool(struct device *dev,
>  	for (j = 0; j < i; j++) {
>  		dma_free_coherent(dev, block_size, block[j].sgl,
>  				  block[j].sgl_dma);
> -		memset(block + j, 0, sizeof(*block));
>  	}
> -	kfree(pool);
> +	kfree_sensitive(pool);
>  	return ERR_PTR(-ENOMEM);
>  }
>  EXPORT_SYMBOL_GPL(hisi_acc_create_sgl_pool);
> 
Thanks for your patch.

There is no sensitive data in the pool, so memset zero can be deleted directly.

Thanks,
Weili
