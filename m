Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C370D51C
	for <llvm@lists.linux.dev>; Tue, 17 Jan 2023 18:17:57 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so11572281pjg.4
        for <llvm@lists.linux.dev>; Tue, 17 Jan 2023 10:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0fpJFz+uumjj7KE/lorb8wR6u11JYG6vZ+zsVfls5E=;
        b=VBrRf9pTr/4IPYNmGourNvutyd/ceeVLNpGDPjYtcjudgwi8bWs3X2fID1pp4T6P9x
         kCxV6g3thz6inwVNXqUomT28JPS2ASsErK+GnX32+XdchqM1ZA9rZp1L54MNryjAKc2D
         3Y8dbKLBCXTr72HwAJPkq9mYKDdLlO9Ww4JA9vgJ+ariun+1gAwsRGjIgOetyIN/lKC8
         pBlvSQCFm1kfkCg1oJ0Gp9WU//JwlAYAoqDqvoUs0678SECg+yGXEuLIzQdsvAU9uMH/
         hlHBXvoF3ljJyon0Q4DggoJ1vVF1vkwaLkoZSDQW6aEmLBQARFMreCm7uLanSV6HKBfZ
         0xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0fpJFz+uumjj7KE/lorb8wR6u11JYG6vZ+zsVfls5E=;
        b=VM6BqOo79q43kSOkGFaxQfPi58JG8GUSPhZtvWs+I4DMDL8HipMi8PXO2qfVAQZYgD
         r58iamY0JF5JBk1aQ+Yedfa21X67GLbanUFuVXI1RbNbzi/3ATpCiegcVmlQdHJTR2f8
         UtOXfKD1E6hlHkE5jEUZif/zAY39eRU736/otAolk54eG4/s5/40gU4UoghfP1WZkAh9
         qf0qWq+4M1bcYhOT+NYNnhZnHP5znEDxez+Ig0xC7WNI4ZFNPAojCEpw6W0cZ6jZi1Mq
         0E8J6OLYOto2L0rAhPOWulvZ7aaXxdGJBv/cqJnpzPc1oF3Bky7hg4S7A/fIUfP/q8+8
         LBrg==
X-Gm-Message-State: AFqh2kqbpXZOSrUkAjciOQZ6WJapZZMKJs1+tgos5vWOtXkFyC8vkL16
	2Nk7+y4LhHa4zWaD0IltqEPvaCKRxThaHhkHKPHc5A==
X-Google-Smtp-Source: AMrXdXsLciTK/2HzPHQv+ZKXUDNClH0QiJEUmRoQczErUi+3abrIY/ID2bNm4k6HDiWy8rkplZ05CxtNFA2LLMBhZzU=
X-Received: by 2002:a17:90a:c784:b0:227:202b:8eaa with SMTP id
 gn4-20020a17090ac78400b00227202b8eaamr359677pjb.147.1673979476682; Tue, 17
 Jan 2023 10:17:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230110170848.3022682-1-trix@redhat.com>
In-Reply-To: <20230110170848.3022682-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Jan 2023 10:17:45 -0800
Message-ID: <CAKwvOdnde5qmYCsU1V4ccRn4tkEmPZLwJ2UFFLQfR-to7wLQTw@mail.gmail.com>
Subject: Re: [PATCH v3] crypto: ccp: initialize 'error' variable to zero
To: Tom Rix <trix@redhat.com>
Cc: brijesh.singh@amd.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, nathan@kernel.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 9:09 AM Tom Rix <trix@redhat.com> wrote:
>
> Clang static analysis reports this problem
> drivers/crypto/ccp/sev-dev.c:1347:3: warning: 3rd function call
>   argument is an uninitialized value [core.CallAndMessage]
>     dev_err(sev->dev, "SEV: failed to INIT error %#x, rc %d\n",
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> __sev_platform_init_locked() can return without setting the
> error parameter, causing the dev_err() to report a garbage
> value.
>
> Fixes: 200664d5237f ("crypto: ccp: Add Secure Encrypted Virtualization (SEV) command support")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> v2 cleanup commit log
> v3 cleanup commit log
> ---
>  drivers/crypto/ccp/sev-dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index 56998bc579d6..643cccc06a0b 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_GPL(sev_issue_cmd_external_user);
>  void sev_pci_init(void)
>  {
>         struct sev_device *sev = psp_master->sev_data;
> -       int error, rc;
> +       int error = 0, rc;
>
>         if (!sev)
>                 return;
> --
> 2.27.0
>
>


-- 
Thanks,
~Nick Desaulniers
