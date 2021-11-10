Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BC872
	for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 20:19:19 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id br15so5040067lfb.9
        for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 12:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sfkLEyAh2f0FnZgoyr5ZOnaxpuprPl9HQyaWcoACmR8=;
        b=sqjWIl2uzMEK2g5GksLYcz/qLHpXgLzH13UQB3j1AUlei4YSIvbgoY5o/k2+vT7Wg+
         VyCIULycAv3lK5CmoVpP+rVNfmeUqzrp7Wb32G8OzooVp1VJQhgghC3VbkRyp+Je7Emh
         fjc8RFf0NZEGOOFa7AGURqpR+wFVOLhPvpVq+i/TQxQhd3MBY4Hasd5OuCVJWfUZEpce
         TYvr/rZz2A347yMu2gkQEcknY6LmUYJTvR78OlfQUS6A1xFzVTV55SC0YkyoSpxPG3Gz
         63RCKroXx6LgLISkyWb2bMemYWJcxVO+nxgTKx2Gov3SlpN+rgtdmkwrBJKg6Y8zrp0m
         G6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sfkLEyAh2f0FnZgoyr5ZOnaxpuprPl9HQyaWcoACmR8=;
        b=bNOEc0+tvRIroDBVyVqfucvzrIS796QB8Y1cHYDBmpHdg1oxVRdytEqgsqY85X5w8F
         Q5fKuC744+UW8pixrUiv7Pxo93ow5Di3njbHq/+vNrrE2a6lRKFlWUS3WzaTETROxTqM
         07C3KUcCGvWJQjhGB7xS0OqToKgLtnAs+1tU4L+6AORL/2wNlVTGrebipVEmBfRRApDa
         hnchgUM17zohlXuO6rSQLOqCzlPQxG7maY7NxICsPQjOmPwExSr4yyW1mB1Cwahzexvj
         x/Ae16YsNl3IxP8FRAEF5/BCNv0n7K96vAedvZZpD1CrpQ06JnGhAXqw66NVjpNH9JkN
         igzw==
X-Gm-Message-State: AOAM530bAgjUzxKsMkX6tl5HSsFUEVyYpMkhEzUczy6J2SHj++4nquUZ
	YcFY8o0430vfz/VaxIcDWDG5vwWpaOqA01Ad6ITs1g==
X-Google-Smtp-Source: ABdhPJxqn/www7tIhoKSEkqyNjE2zOFSoBeoIMJ138IF8vw8u0UOPO9GEH/e0CpTKJg2Xjx8Ov1vhkFgbm43fEr/eoY=
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr1658265lfi.82.1636575557693;
 Wed, 10 Nov 2021 12:19:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YYhY7GqlrcTZlzuA@fedora>
In-Reply-To: <YYhY7GqlrcTZlzuA@fedora>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 10 Nov 2021 12:19:06 -0800
Message-ID: <CAKwvOd=SsrCy=aG_t2=58YFymR-j6Rp-Jxb_RDfFwX3Lfy8E2g@mail.gmail.com>
Subject: Re: [PATCH] iommu/vt-d: Remove unused dma_to_mm_pfn function
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Cc: dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org, 
	will@kernel.org, nathan@kernel.org, iommu@lists.linux-foundation.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 7, 2021 at 2:53 PM Ma=C3=ADra Canal <maira.canal@usp.br> wrote:
>
> Remove dma_to_buf_pfn function, which is not used in the codebase.
>
> This was pointed by clang with the following warning:
>
> drivers/iommu/intel/iommu.c:136:29: warning: unused function
> 'dma_to_mm_pfn' [-Wunused-function]
> static inline unsigned long dma_to_mm_pfn(unsigned long dma_pfn)
>                             ^

Thanks for the patch!
Fixes: dd4e831960e4f ("intel-iommu: Change dma_set_pte_addr() to
dma_set_pte_pfn()")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/iommu/intel/iommu.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 0bde0c8b4126..35300b5b69f7 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -133,11 +133,6 @@ static inline unsigned long lvl_to_nr_pages(unsigned=
 int lvl)
>
>  /* VT-d pages must always be _smaller_ than MM pages. Otherwise things
>     are never going to work. */
> -static inline unsigned long dma_to_mm_pfn(unsigned long dma_pfn)
> -{
> -       return dma_pfn >> (PAGE_SHIFT - VTD_PAGE_SHIFT);
> -}
> -
>  static inline unsigned long mm_to_dma_pfn(unsigned long mm_pfn)
>  {
>         return mm_pfn << (PAGE_SHIFT - VTD_PAGE_SHIFT);
> --
> 2.31.1
>


--=20
Thanks,
~Nick Desaulniers
