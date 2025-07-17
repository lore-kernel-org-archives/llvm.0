Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E82FA63E
	for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770759; cv=none; b=bvhFf1Jd+PxJAnVL8s42NeZwGxuN7dZ/L4I1TDYi53+2c8QB/frhss2JuWR6QgisPdaQZdXYGMWGFaEqCaF8ZL/iMe6/TdJIBJDrLEOEIRu2Z67yhMt919fVPGbN9bg5G29FG+lod5C3zyIOOvv24QkU7z58fJSuYQKLpMH1ptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770759; c=relaxed/simple;
	bh=iRnWqNpzFeM5Zf6BqsRpXhJqEgg8Z8aFyrLB8L1gRTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVfFfLBhtUTRkzBo7wZg9wTnaZblKfNn+hwzll26SYx5oU6qDmfA6EfWvm21M9+Yo/Q8mcKe2r3RKvm2AQ3OX2O4f17na/yzQOJu0sxMJSarmwsuUeMPpBdD7qJ9g9uNWJhHIgfspuGV/qayCFiqHR9L42cVy6xs2eqVeMSUgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZH9hFiwG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZH9hFiwG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dd9ae5aacso1265ad.1
        for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752770758; x=1753375558; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKUJNmP0H+2EOEC7uEp9wCLLSrzA1vzqL1Sr2tNFz6M=;
        b=ZH9hFiwGXO8uRJQGuVSqKVhm/lk5AE3DuG1J+FmfHejrE35Plfwz1cUArHVVjMWgw4
         0quF92r7wN35beszkesqaFxwyUk1TXlzqNZGXB09ioODf+mv7dnH4Mc1mXjvYtZMsA23
         Mfn9Hc8ZC41Njtng/0pMICIc1O/Qv0UuNtXN2If0pivSVHfx6cB8kvwV8xUQYQHd1JGd
         QGva8Zc7MmAayLt772qYYEe/SQukzNSXpg5IKWDXk4FeFgagOY5LxMiEvlic/Fusnqpy
         hMRiekv9WvuF+JN4eASmtE7EfnX61odFDySK450ZjdcpdeToSxZnIygV7zqIxnphK20F
         UuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770758; x=1753375558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKUJNmP0H+2EOEC7uEp9wCLLSrzA1vzqL1Sr2tNFz6M=;
        b=Rm/Vkp+DaVXUvqGs4fFxATztc6S/2dWX9QxJu7oD3vQlqQRNpZDHXQzRJv2A8KMQYD
         DItymb/uETBjv9LLYfI8i2MU6/zHdJNxTbIm7tEj7AE9L4eZ1UWqoDIBvi+x2f590ihy
         PdanUvG/qyMGjJwUcCRd3RiAWefGIpDTE2NINLR4UquHazsnS37ttV1Jm/cq7OU7s04e
         GiblrvtSqYekjUpEBKCE2SqVgssxBvu+7W7uh/GG0DqAzp7jy5BLZ4M4TtYLujkz9ZTg
         XwFjeW9JcDTv56vE4NOScY6x9cJExcYH4AWVRlanye1NlFMBH+a+fC7CBTz1e+WsIj+G
         CR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcdvsscIYeXs741Ij3z5DoPdS1DW8VrBr2lkEQ0FOdBnpaB4qTyMZG15zj6Ls+YfXR54G/@lists.linux.dev
X-Gm-Message-State: AOJu0Yw57Jt5RSZGlQ+hr+T871MUMk7yMEAbO+OdqhXyOf6TMAnlOTdM
	qbybwvKM9ADEKCcMgWTz+pJW5H9PWkbUjNStflMlhUKvdbB+XGCFfmQ8+5jXzdfDioBr2Jhne8Z
	S5vHm/cwFAvn5zdFPwu/r2v0YVG4Biv1h9wxOl1a5
X-Gm-Gg: ASbGncufcWZJxm/z4fxFdLJzvDKet3v6FJJxDyKORahqkz2evL96gjSpKDTCBLUkHwd
	ETB7s/ghnDhZOtTPKuMVnxW1+J7YhIUf7qFIcz7hvFmYvjhA/GrGv254nwA1xFpUAaS22GOFo68
	2XbV5hCwx+lOtJmmpE4ENep7ppQx2RSqwBwNcSxZ8wNPFTT/XDiDYFi8vF8n9cF+2NhTFJNWyWV
	XE4JOOMy+5F/Cg=
X-Google-Smtp-Source: AGHT+IF/jbc5KsIrIk4t259Eq/zkKG3YR3wGUxeaP9wSJo62CP4cjrCT1LbXx3KWXrxV/ZX4TXAsZ+zA+Z6VyzKLOXc=
X-Received: by 2002:a17:902:d486:b0:23d:eb0f:f49 with SMTP id
 d9443c01a7336-23e392b9d79mr277515ad.14.1752770757077; Thu, 17 Jul 2025
 09:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717085300.work.146-kees@kernel.org>
In-Reply-To: <20250717085300.work.146-kees@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 17 Jul 2025 09:45:19 -0700
X-Gm-Features: Ac12FXxFBLO3F6u3hRZZBsSiDUycM_ZS3G7VWFf1ItHH-mMCSDv03W4t2NQH_00
Message-ID: <CABCJKucfFyVqarstWRCRMf1DbvM7-SajkxAphsH-X8MgSPPN8A@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: Add __kcfi_salt
To: Kees Cook <kees@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Thu, Jul 17, 2025 at 1:54=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> +/*
> + * This tries to call an indirect function with a mismatched hash salt.
> + */
> +static void lkdtm_CFI_FORWARD_SALT(void)
> +{
> +       /*
> +        * Matches lkdtm_increment_void()'s and lkdtm_increment_void_agai=
n()'s
> +        * prototypes, but they have different hash salts.
> +        */
> +       pr_info("Calling matched prototype ...\n");
> +       lkdtm_indirect_call(lkdtm_increment_void);
> +
> +       pr_info("Calling mismatched hash salt ...\n");
> +       lkdtm_indirect_call(lkdtm_increment_void_again);
> +
> +       pr_err("FAIL: survived mismatched salt function call!\n");
> +       pr_expected_config(CONFIG_CFI_CLANG);

Should this test also have a "This is probably expected" message if
the compiler doesn't support the __kcfi_salt__ attribute?

Sami
