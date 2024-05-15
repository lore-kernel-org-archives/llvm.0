Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC31A2C25
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715797991; cv=none; b=ejvtWMjKLUIliHUJb8RkPhniJ2PGq+CG8JVqQsMXJDxfFQU9RH8F9cdlpDgWZGGdIwRiDUnCXD+BpFRrenj9nrC3lSkpc2ZJSf1COUX1X4GkYnrSHcUQX1ORXe5JbmxaJJw3xiQ0QsSy+AzFiAjcoDgkEm7VRY9mMXS5o3Vuuso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715797991; c=relaxed/simple;
	bh=yw+ipdvPqTKvzHRePFMCEGB32d2gTHY4yIizWZv9K1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFP377RMy8OR9XQkAFiMI/JLMZKtE8Z/3QY0KlSOCVBveHiidJdyBZgXKt2t+Wms19/EbySHrEvZoSeDT9meHLYYo6/7VPhwydlVkVKb+O2L2o3DSnZs8K5goRBTjKsxA//ZxYDigVZIRUmSjMbvFMjEdtKoQ8sZsGcU9WVuMik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xc92i8I7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xc92i8I7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso36273a12.1
        for <llvm@lists.linux.dev>; Wed, 15 May 2024 11:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715797988; x=1716402788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKkDnLN7qusp5ZEvAbHRefNjI/EUrE6vZKOBSo4hBmc=;
        b=xc92i8I7ORdPe7uIedYiiThxFUj7oDghA1/P2KGJWAL/VgGEbU8tcimUgbtl00maBG
         rty/pbohYzU4LrzgZHP7wwebxWZv46LN8ms49IizrOR3rfOx7hydHN8yv4mO2k1lKhUk
         wrH/xpjliAakDaVYybpjMrQquUT1mqTh2a0BTtHl+vue2KscCmwEQV04Tq3KyN6BJZxH
         LIOrpPdVNN/9QTZd3EjkGMF4+xR+gIrH2wut4r78zc4ZmFzfgaUKzMsKsXOYt4n3OS4R
         xYPAkoqCtypQFo0OQA/pRl4bAHy4BUO53d9rd9EpqYxiLRTmExE9ugwO9qIeYheGwmLi
         hjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715797988; x=1716402788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKkDnLN7qusp5ZEvAbHRefNjI/EUrE6vZKOBSo4hBmc=;
        b=wN0E7OTSem4isyiXGxuUeU4JM36dlV6ZZmSRv3R0N+DZGUVqhwc53mw3oFRMNFDmBs
         iLmJ2mW79SzjQ0ysmEKE9LwMJYmcm/BZIApy0TENmjt41J3pWqxRguNnOoyszMkH7fuz
         pN6CHmqHfwx0yfmklNR+G9egTEHTcw7bZLxrvsSkiKUY0Nhlx953VV6alG12bPDVeVLz
         jq9eRTQBXQZjDkhLB8QE+aCDf/zBq9YruyVI3Od4F+0RGEj35k5M5RNHmu2ePsnBwvWw
         LrlmEMnqh+PR7uKN+kBCSdzwUaKUA0QSnzItfQyCoDQHuUGWHPS/YsxejhWBthuzAvdE
         Vieg==
X-Forwarded-Encrypted: i=1; AJvYcCXt/8JxerGUgDSq3T1rvuwOTT1NTlg75b98RzprEiAKrFzKjJ8M/lx5w53YD2Cs9/7o3S6a4BGolNIV9aMZojqJAwQiJQ==
X-Gm-Message-State: AOJu0Yx33kmPPSvtQBKotTAtEZShuTSkrDDGnyrrqX9ZG61OeKik3uvj
	cVo9pBt9kn7s3vnX0ZXIG4BQ2bcfSPrhM09vsO4cU9diGZG7pY1DgHdJSTqRyCx7dNpl0NCFGKI
	aB7GIbSgXtsVMg0Pakufb2VkHRzhJ3lXYtlA=
X-Google-Smtp-Source: AGHT+IF6MleNTArg5bIvPJ3/eiTCxrRw7G9TB8KN62fOFsAAIP5+dlj2ACr18vI1mrmdbbKTxO7t/JgL68s+ize3a8I=
X-Received: by 2002:a50:85c6:0:b0:573:438c:7789 with SMTP id
 4fb4d7f45d1cf-574ae418342mr914673a12.1.1715797987465; Wed, 15 May 2024
 11:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515010805.605511-1-xandfury@gmail.com> <20240515010805.605511-4-xandfury@gmail.com>
In-Reply-To: <20240515010805.605511-4-xandfury@gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Wed, 15 May 2024 11:32:48 -0700
Message-ID: <CAGG=3QWyeWuLmJg1R7X8T4CsSgM+EiDToxjd_-8MD94D=DCLtw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] selftests/binderfs: Macro argument 'fd' may be
 better as '(fd)' to avoid precedence issues
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 6:08=E2=80=AFPM Abhinav Saxena <xandfury@gmail.com>=
 wrote:
>
> Change the macro argument 'fd' to '(fd)' to avoid potential precedence
> issues. Without parentheses, the macro expansion could lead to
> unexpected behavior when used with an expression having different
> precedence levels.
>
> Example Code:
>
>     #define CALC_SQR_BAD(x) (x*x)
>     #define CALC_SQR_GOOD(x) ((x)*(x))
>
> CALC_SQR_BAD(2+3) expands to 2+(3*3)+2, giving 11 as the incorrect
> answer. Enclosing with parathesis CALC_SQR_GOOD(2+3) sets the correct

s/parathesis/parentheses/

> order of precedence and expands to (2+3)*(2+3), giving 25 as the
> correct answer.
>
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
>  .../testing/selftests/filesystems/binderfs/binderfs_test.c  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c=
 b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> index 4a149e3d4ba4..d5dba6c1e07f 100644
> --- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> +++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> @@ -30,11 +30,11 @@
>
>  #define close_prot_errno_disarm(fd)      \
>         do {                             \
> -               if (fd >=3D 0) {           \
> +               if ((fd) >=3D 0) {         \
>                         int _e_ =3D errno; \
> -                       close(fd);       \
> +                       close((fd));     \
>                         errno =3D _e_;     \
> -                       fd =3D -EBADF;     \
> +                       (fd) =3D -EBADF;   \

While I agree that it's generally good to add parentheses in macros,
this line ensures that 'fd' must be an lvalue and not an arithmetic
expression.

-bw

>                 }                        \
>         } while (false)
>
> --
> 2.34.1
>
