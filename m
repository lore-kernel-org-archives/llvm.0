Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A63A1B6
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706185173; cv=none; b=Ahz3uEB3UuAdRfz3DIs560CX7W5flh5ItJyyqwjK5CeK9O4gUha5eJEEgIOaiSMtM+AzdXcEUU+1F206Uzx5PMGaviLkuMYHeFrht0MaRXIQ1xHUOPtdqOChezy+92vfYV+h+DRHm8Luwjgb8iT8Y8QvTHBqyCMH3G/EZ18uHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706185173; c=relaxed/simple;
	bh=zfYp4IY/7X/+LaY5xSNFJhQT56Y8mXFU7V7bnUDoJjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6Azsf3BEZelTUoW7gUD4PnQs55rDnf8a0sDuuvx4riU+Bmfk1r/1peOdRLcKnvn02LxN4IZXJTTtIhZta2E57D1rhBBy3CyVFLhDbK33Tvvqj2rRrSaZ3wzDN2d1DzZIY6EHcLtb036XRorGsvbJyrYU9l7iXBiE0Ov/8pF5vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEcmHnK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEcmHnK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5BDC433B1
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706185172;
	bh=zfYp4IY/7X/+LaY5xSNFJhQT56Y8mXFU7V7bnUDoJjI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oEcmHnK818I/Jm5CIXPiXFRUVUEYppaXM9myPO1toFGfuJwKcHJFeNfruu/o4VNH7
	 mG5lnXC/ogO/j3r8AWdOzk1rEjQ6CpXLoTlLn0g4Ghmlg9LxTy7GN7qpl2Rd65wuID
	 vAIoOp5UL9HsZwrZRVwigOzTPHk5tEv6m0XHjEzTHa+U0oomwBAaS3WwLb1+DyEmI3
	 5HGyspNEW+lOfq4NzmbgDy/FlFw2lCnTEper9YWLPwq1bpkV2SJ60dGJ6TT0MhdXeV
	 LD70rg68/nxLe0fH/QlHKshy3vLyCqqPOUWf1UZyUDO94iMSRorQDmDwxCptZySMg8
	 xFgBo8GhurSjQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5101055a16fso2388483e87.2
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 04:19:32 -0800 (PST)
X-Gm-Message-State: AOJu0Yw6IhH+vxzJHtB4AsJm2FjL84wq263HclOJfL4djqOwY4QD8Z6/
	jpy/JbJfGN2LxviXCISvWcON7Qw8ebI3GqnrhO5zajjHJtmFhpT0AXr3bJYSXtnv2lhqpbGBL5Y
	FycoLMskZdhJ3DMti8YM7on+CKDg=
X-Google-Smtp-Source: AGHT+IE8X5NPhlKrP0UhMcQQq+MZ5eT7JN3M8CYIYwk0DIMhpjZasu6rhPJKWZjXj4l33/9dJOZOjkHZn/BkUxXAkqs=
X-Received: by 2002:ac2:5f77:0:b0:50f:15fe:f91a with SMTP id
 c23-20020ac25f77000000b0050f15fef91amr417674lfc.88.1706185170550; Thu, 25 Jan
 2024 04:19:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240123234731.work.358-kees@kernel.org>
In-Reply-To: <20240123234731.work.358-kees@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 25 Jan 2024 13:19:19 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGcKBPnHOm6PtsrxePdv5a6AokB=qvMrwvGmPh_Uk6vsA@mail.gmail.com>
Message-ID: <CAMj1kXGcKBPnHOm6PtsrxePdv5a6AokB=qvMrwvGmPh_Uk6vsA@mail.gmail.com>
Subject: Re: [PATCH] smb: Work around Clang __bdos() type confusion
To: Kees Cook <keescook@chromium.org>
Cc: Steve French <sfrench@samba.org>, Nathan Chancellor <nathan@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 00:47, Kees Cook <keescook@chromium.org> wrote:
>
> Recent versions of Clang gets confused about the possible size of the
> "user" allocation, and CONFIG_FORTIFY_SOURCE ends up emitting a
> warning[1]:
>
> repro.c:126:4: warning: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
>   126 |                         __write_overflow_field(p_size_field, size);
>       |                         ^
>
> for this memset():
>
>         int len;
>         __le16 *user;
>         ...
>         len = ses->user_name ? strlen(ses->user_name) : 0;
>         user = kmalloc(2 + (len * 2), GFP_KERNEL);
>         ...
>         if (len) {
>                 ...
>         } else {
>                 memset(user, '\0', 2);
>         }
>
> While Clang works on this bug[2], switch to using a direct assignment,
> which avoids memset() entirely which both simplifies the code and silences
> the false positive warning. (Making "len" size_t also silences the
> warning, but the direct assignment seems better.)
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1966 [1]
> Link: https://github.com/llvm/llvm-project/issues/77813 [2]
> Cc: Steve French <sfrench@samba.org>
> Cc: Paulo Alcantara <pc@manguebit.com>
> Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> Cc: Shyam Prasad N <sprasad@microsoft.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  fs/smb/client/cifsencrypt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/cifsencrypt.c b/fs/smb/client/cifsencrypt.c
> index ef4c2e3c9fa6..6322f0f68a17 100644
> --- a/fs/smb/client/cifsencrypt.c
> +++ b/fs/smb/client/cifsencrypt.c
> @@ -572,7 +572,7 @@ static int calc_ntlmv2_hash(struct cifs_ses *ses, char *ntlmv2_hash,
>                 len = cifs_strtoUTF16(user, ses->user_name, len, nls_cp);
>                 UniStrupr(user);
>         } else {
> -               memset(user, '\0', 2);
> +               *(u16 *)user = 0;

Is 'user' guaranteed to be 16-bit aligned?

>         }
>
>         rc = crypto_shash_update(ses->server->secmech.hmacmd5,
> --
> 2.34.1
>
>
