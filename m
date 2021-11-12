Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C873D68;
	Fri, 12 Nov 2021 20:49:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94A626058D;
	Fri, 12 Nov 2021 20:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636750153;
	bh=fkmIU7jlKIAraD5VFeHRavVnMH8h3GOEcryEp4j9SMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNh0UBtJfDpCs1/9RvKusqflaf0e6LZbrhn2TD/6e7aWSC9on0RDjpRii6iki+Em4
	 y8KpLRBCslUIJjK0rRJXzUrFcQFQzGXCzZasgsV0PAZNZyW7pZYrzFiVMYykCvC3AY
	 mEYOfFm60l4eOPApRM/AdlTfyLI2d1PCK789em3px4rwvy0K2R8TJEyEZ/MP3WWAid
	 lRZJ6HbRyZtHdMcOE0Q9v+VYgzGDC8S0u7XMK79rk8EUe+Z6WIC8Nmy19dabh4Oq+s
	 6MS8qGYgXhlz86PkNjqAbmAMIzysiCzU11mDeAktmHnUz+ZJjN9sThLdH8oVbiDh82
	 spv+Y20t9a5BA==
Date: Fri, 12 Nov 2021 13:49:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Deepak R Varma <drv@mailo.com>,
	Ding Xiang <dingxiang@cmss.chinamobile.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Robert Foss <robert.foss@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yang Li <abaci-bugfix@linux.alibaba.com>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] media: atomisp: handle errors at
 sh_css_create_isp_params()
Message-ID: <YY7TQ96ta8ondfqy@archlinux-ax161>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
 <f1157236eacdaab3def9b7d18f1c2e7ef9a3699d.1636672052.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1157236eacdaab3def9b7d18f1c2e7ef9a3699d.1636672052.git.mchehab+huawei@kernel.org>

On Thu, Nov 11, 2021 at 11:08:53PM +0000, Mauro Carvalho Chehab wrote:
> The succ var tracks memory allocation erros on this function.
> 
> Fix it, in order to stop this W=1 Werror in clang:
> 
> drivers/staging/media/atomisp/pci/sh_css_params.c:2430:7: error: variable 'succ' set but not used [-Werror,-Wunused-but-set-variable]
>         bool succ = true;
>              ^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636672052.git.mchehab+huawei@kernel.org/
> 
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index dbd3bfe3d343..3cc5b82a8a31 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -2473,6 +2473,10 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
>  	succ &= (ddr_ptrs->macc_tbl != mmgr_NULL);
>  
>  	*isp_params_out = params;
> +
> +	if (!succ)
> +		return -ENOMEM;
> +
>  	return err;
>  }
>  
> -- 
> 2.33.1
> 
> 
