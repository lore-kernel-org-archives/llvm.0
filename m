Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0619523
	for <llvm@lists.linux.dev>; Wed, 24 May 2023 19:10:41 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-625482282e0so828906d6.3
        for <llvm@lists.linux.dev>; Wed, 24 May 2023 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684955440; x=1687547440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h81XEzBPwR4bI9NqqVxiHNHCxTZ8a1gTVYdXg+UM5xQ=;
        b=BCkFJNEfqgC5o4MydkQjO1+VvUNTJJxl/2jIOyYf3Q031h+Jh/cKOcO4HR1pCebfEU
         XqOr+bjRo4im00dAadyUH54RrVp3c76JL2bj2MME1R4FLTIvYT5Bhlp30AWmGVfECOHt
         /9WZbU2YlqPbW9fAq1duV5Ho4uVvRKeGXfKsZ7mpjUJ1e1VAwCCzOBMmNlJevsaxrwVn
         LC5HiTiC/yu/oFTpdddUnMxd1Xahz8yUKj0OYw+ySZkCP5RhMVWYfH0y4Ikrqdj4NYhj
         fnJd7JzdWHY9Uty+/+fFX6Cj7Dj7kez55LA8qXBUeLTeAiWIaW8sGsXI+ADdBBniPjDP
         0sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684955440; x=1687547440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h81XEzBPwR4bI9NqqVxiHNHCxTZ8a1gTVYdXg+UM5xQ=;
        b=FHes2Rulz4IKbwT9+uSM0v21RJ9XQXoF11FA05aZFTdOJo+yRL5LAUdFQrQYyv5ohW
         6L+G0NUBkXKUiGbIJVk9nIumCyKQWgNWuUuv+gU4gMJPHSbnfOvjF6yVreSSYrs5rHZK
         sgV8d732zMHrlJOTlbqEZrKaWZjsLMJyw24e1tAPfE/0UpJLvDb53d1QzqWZAVG61A6C
         q3Md5XOSczS/C6HOH6WEGGmLYhsO0d/MVxfneJPXsHOgWoNgs/PxQxMkPX6TAsyXPzf8
         pBmPKUpK2HQIoyPNxWTo3EXQ23+9Q5bz1pRIDOOn3b6lJsy1CHKE5C4xynJQDi5yHk3x
         r82Q==
X-Gm-Message-State: AC+VfDxjeNqXOPZnJNa5QYEILu8w5X/QMruAGIekkTTPiHHZ/6p/ez6E
	D5a72n6LUDKVpRmcl9L0TS7zIQ9o12dlkJK1CqTm9A==
X-Google-Smtp-Source: ACHHUZ4PZykgO+qAt/GfVYRFXAXR9glmVwU0iD12ZrZiZ030lBrpghOBZTNusAA1GBGj9IHhm9gGjwRb0C2xhmLxQWg=
X-Received: by 2002:ad4:5f0b:0:b0:625:88f5:7c5f with SMTP id
 fo11-20020ad45f0b000000b0062588f57c5fmr14530999qvb.31.1684955440288; Wed, 24
 May 2023 12:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 24 May 2023 12:10:29 -0700
Message-ID: <CAKwvOdm6diEmc+utBNxQ4ftx3Ai2SD8q32TxRgeZ-rpGoL2Bjg@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: include targets not end with .o
To: Hu Weiwen <huww98@outlook.com>
Cc: llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Hu Weiwen <sehuww@mail.scut.edu.cn>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 3:19=E2=80=AFAM Hu Weiwen <huww98@outlook.com> wrot=
e:
>
> From: Hu Weiwen <sehuww@mail.scut.edu.cn>

Hi Hu,
Sorry, for the delay. I'm usually faster to respond to patches. It was
my mistake this fell through the cracks, and thank you for the patch.

I received this email from <huww98@outlook.com>. Do you mind resending
with your signed off by tag set to the email address from which you
are sending patches?  This patch looks benign to me, but it makes me a
little uneasy when author !=3D sender.

Please also cc
- Masahiro Yamada <masahiroy@kernel.org>
- linux-kbuild@vger.kernel.org

As this would go in via the kbuild tree.

>
> Currently, we only extract commands for targets end with '.o'. But we

s/end/ending/


With this patch applies\d, I get the same word count for
compile_commands.json when running:
$ make LLVM=3D1 -j128 defconfig compile_commands.json

on my x86_64 host. Is that expected?  Is there a specific arch or set
of configs for which such .c files produce executables directly?

> also have many standalone executables built in-tree.
>
> Remove this restriction. And to avoid some false matching, exclude
> targets end with '.c' or '.h' when directly walking the directory.
>
> Signed-off-by: Hu Weiwen <sehuww@mail.scut.edu.cn>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 15ba56527acd..6e88c7e166fc 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -18,8 +18,8 @@ import sys
>  _DEFAULT_OUTPUT =3D 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL =3D 'WARNING'
>
> -_FILENAME_PATTERN =3D r'^\..*\.cmd$'
> -_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.c) *(;|$)'
> +_FILENAME_PATTERN =3D r'^\..*(?<!\.(c|h))\.cmd$'
> +_LINE_PATTERN =3D r'^savedcmd_[^ ]* :=3D (.* )([^ ]*\.c) *(;|$)'
>  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces .cm=
d
>  # files in a different format. Do not support it.
> --
> 2.25.1
>
>


--=20
Thanks,
~Nick Desaulniers
