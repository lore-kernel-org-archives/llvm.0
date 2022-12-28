Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B8805
	for <llvm@lists.linux.dev>; Wed, 28 Dec 2022 10:49:15 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id z23so3475521uae.7
        for <llvm@lists.linux.dev>; Wed, 28 Dec 2022 02:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qc4GMdi1dtN/U5J4nf2BxViaxJc5bdEY/94/Fx0h1oo=;
        b=GDpb95sQOqwhtno042AWhfoDl0nhCVpuvOZfzg0N9VK7B+ObUvY1HJXg5UDnuFEZyT
         XcvanvurpsD0m/qKhH5+eVkxhOYTAzHgGiu0ERW6rP3mojiBawuT1oESSOXJkT/xnmPS
         yIJJ0QuDcA893uMQBzoI2PhczPk68eeucdyUZJq6yO4usDmoAg094Sd0Sdz+dzY/kZ6d
         BPKRNavyeaP7nqCE4k31L/VZAEwr4EiiXH+LnE7JjBOWGoHMF7SrvSTKljdg8q9uxZCT
         PPFwzSTbq3931s1pRbWicWA7ByGGcMeRDatgcaPq7W2WNTKdCggg/hTxpTNFl+yiNvrL
         0wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qc4GMdi1dtN/U5J4nf2BxViaxJc5bdEY/94/Fx0h1oo=;
        b=qOENYCn/VXo77e7x2EDxpKRRpewZKxNb14jyBWBbQ33sws2K57RuhOkpOJqVlzic4E
         wBFtB7pE1ExdFxo9vJWevNe3/svHCuv0r+MgT/jHlUlDn+OWsfrQUEn8zFnyfHgppIeQ
         qFVQTdjD8Qpcgq0UczB8S938U7OWsGh71dgjgG+mZxE56q4N3QadFGOZrY0cPN3O53rh
         Qo8HYEkn0Zw7t7jZhWtvzSl8gqTHCvY/3MoxIhChQkFnP8l+PX0Phm9V64Z+jPRQdCnd
         GGic2hTQJqRGMVyd0IUhivqiP2UINbGLs4ndhjdNw2SiirrnIsfeO8vEg2ZoJZHiv/Xm
         allA==
X-Gm-Message-State: AFqh2krAT6Yz0cOWagXK+HfeGd3+ErxIFPvny5i441oR5Onyevp6TumP
	7XaYNJJNa2phJdGiSLsG2mgtu3clN2okMSx8MEm3Cg==
X-Google-Smtp-Source: AMrXdXtFsHIeSouKwNPlsTpcJOWSMlR0NPg9XgKy51UaKg6Cvktw0EIVnnGJFn0Fu8vAMp+iebSa/M1UJx/vBFw5lT4=
X-Received: by 2002:ab0:152b:0:b0:418:620e:6794 with SMTP id
 o40-20020ab0152b000000b00418620e6794mr2222573uae.59.1672224554156; Wed, 28
 Dec 2022 02:49:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221213191813.4054267-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20221213191813.4054267-1-giulio.benetti@benettiengineering.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 28 Dec 2022 16:19:02 +0530
Message-ID: <CA+G9fYvHyx+R2Dbw+qijK5aG=k2w+YN_o3-KwWVYK1U-3L-ddg@mail.gmail.com>
Subject: Re: [PATCH] ARM: mm: fix warning on phys_addr_t to void pointer assignment
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Dec 2022 at 00:48, Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> zero_page is a void* pointer but memblock_alloc() returns phys_addr_t type
> so this generates a warning while using clang and with -Wint-error enabled
> that becomes and error. So let's cast the return of memblock_alloc() to
> (void *).
>
> Cc: <stable@vger.kernel.org> # 4.14.x +
> Fixes: 340a982825f7 ("ARM: 9266/1: mm: fix no-MMU ZERO_PAGE() implementation")
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


> ---
>  arch/arm/mm/nommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
> index c1494a4dee25..53f2d8774fdb 100644
> --- a/arch/arm/mm/nommu.c
> +++ b/arch/arm/mm/nommu.c
> @@ -161,7 +161,7 @@ void __init paging_init(const struct machine_desc *mdesc)
>         mpu_setup();
>
>         /* allocate the zero page. */
> -       zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> +       zero_page = (void *)memblock_alloc(PAGE_SIZE, PAGE_SIZE);
>         if (!zero_page)
>                 panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
>                       __func__, PAGE_SIZE, PAGE_SIZE);
> --
> 2.34.1


--
Linaro LKFT
https://lkft.linaro.org
