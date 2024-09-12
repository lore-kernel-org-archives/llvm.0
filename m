Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA0119259A
	for <llvm@lists.linux.dev>; Thu, 12 Sep 2024 21:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726177004; cv=none; b=KKwzwJ33psqOqfpdR0zI+8XZDFzaY8XWBg/38ZaDSwcq67+HwGB3seSfvtt2F3xSciCERzLYsD3gAKYLggIj1UoaAOCPOAP6VEpPjR1tqauN4pTPUIDPWhl4YT81h7Q0uKRTbufzM+3zy+AyPGU1Vfdv5NQd84CWXyRg3JFZTmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726177004; c=relaxed/simple;
	bh=pDqhAgtaGUIk/5wz/QDpvGvuqyiDlqtUCUYvT654FxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XB7v+x+qw40/2xSTw+LvtraQkPAMrxAjlTIw0JbuJN/PP/p/PcvXw5MuKesGybJyvumsuM4wrT53DE2cpV/2pCbOKda5zXyJ7rghEQhooQBl/kqHECGE9oGSxodF8nuU2BOlzNk1BTRcWvlvcTZRsWIdWDWAIwYy9BaXdomYP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hnyOKZfX; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hnyOKZfX"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-49becc93d6aso398546137.1
        for <llvm@lists.linux.dev>; Thu, 12 Sep 2024 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726177001; x=1726781801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV/uSQHel3G7NaBIuUYTK9WPHlxT4nG6GtUVNt1aiiw=;
        b=hnyOKZfXhToYhIIiWBOoUi2HUsZX6LOyi7U14nmRA8UCRxr7w3nu4uDatIM6KVii+a
         Sdgea5Hnbznyh1quumpuM5hIAzt8om46cfsQE4sc+PZ6mq8es0DmPuYvli5fg8MVRgmg
         MK3t5gdCffqAv/m/GMwNUrmoDiNqU0n6zSVcdgAcuyF7WSy9dRXVbbJPxcyW8kvUub5H
         g+o6YIQ/zKAmVfhJgeHXhjbO4FaJ7YUf3a+92OLRQEH+uKxo1dD1Y91nvcHDGjmnOs7n
         6nK407aKJxcQlk19csKTJt2etHpSD3N8iY6OO/rhLzYMKu5Dk3EOe7pv+iMDQwnU4oq5
         Fl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726177001; x=1726781801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aV/uSQHel3G7NaBIuUYTK9WPHlxT4nG6GtUVNt1aiiw=;
        b=kD5KxTdupfSxzkLCU80jnKtW9DJVaE+quZuKceAhVUKEteObr1WIAAXcRwJp37fLQe
         zrQrzxDeuhelWWNMYww5fnxoHqllCj56zREmsQJqpbPLOCFvn1s4hDY4xvhsP0aFbAat
         hwzL2F//Mbi2hTMOUqrdi8vCMHTHeHy52j76lokQEujlgi+c0+2ThwGuSxWKBEsnfzKi
         Vb5zQ5Z8V5eQJ2e0Z6ZZoHKcdafXlfUffYJIk+yFy0wqR+fJtutEAyrOuU0e7kYf5eQY
         1m4H3zbGHCySxdedSWPuWgjvo9T2Qhr8CTkfZdpE4dUuKaLcHDtNiZmwv6gXyXMdy3NY
         Um9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH4RxuqA4KCau0eJZWJgC8RtsXbJtwqxQq7p5x4Ucyk2qpF5EC/Ar67daa138c/zC9Hq4/@lists.linux.dev
X-Gm-Message-State: AOJu0YzNZ+hvLYFcpKFwg7b0aVx5+XhQqte0xJREX/x8EM3upMAIidhF
	bBe0f0PZuzPqhQNWxVHbtxZ4s3+RLudho2OcyHDAyQ1633U8qRKqyIXeRuPJlv0tItRHFc3gs7Q
	PhkBT3g8hP7zrD8QAbQk4th+fa4eKbvbaoaa3
X-Google-Smtp-Source: AGHT+IH05pjtSDhnhSat0T4TMcHpVIIy9ELPbIRaoAr2cIE1oDrkYRJOYxE3o0MeBcNuyMPFcCB85eDpRsk4NuzwEyU=
X-Received: by 2002:a05:6102:511e:b0:49b:be3b:8812 with SMTP id
 ada2fe7eead31-49d4157c4eemr4055765137.24.1726177000369; Thu, 12 Sep 2024
 14:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240516-kunit-compile-commands-v1-1-05fc32b79312@google.com>
In-Reply-To: <20240516-kunit-compile-commands-v1-1-05fc32b79312@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 12 Sep 2024 14:36:28 -0700
Message-ID: <CAFhGd8pLAa7vkVUtcdhvdk+oq=dOSGQWCOf0oZK7pszaLdsKNA@mail.gmail.com>
Subject: Re: [PATCH] kunit: tool: Build compile_commands.json
To: Brendan Jackman <jackmanb@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 12:38=E2=80=AFPM Brendan Jackman <jackmanb@google.c=
om> wrote:
>
> compile_commands.json is used by clangd[1] to provide code navigation
> and completion functionality to editors. See [2] for an example
> configuration that includes this functionality for VSCode.
>
> It can currently be built manually when using kunit.py, by running:
>
>   ./scripts/clang-tools/gen_compile_commands.py -d .kunit
>
> With this change however, it's built automatically so you don't need to
> manually keep it up to date.

This is great!

>
> Unlike the manual approach, having make build the compile_commands.json
> means that it appears in the build output tree instead of at the root of
> the source tree, so you'll need to add --compile-commands-dir=3D to your
> clangd args for it to be found.

This is annoying for some. For my setup, the discovery of
compile_commands.json depends on where I open my editor from. So this
isn't really an issue as I can *choose* what compile_commands to use.
I think some folks may wish the compile_commands.json was also dumped
in the top-level directory so clangd can discover it easier.

>
> [1] https://clangd.llvm.org/
> [2] https://github.com/FlorentRevest/linux-kernel-vscode
>
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
>  tools/testing/kunit/kunit_kernel.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/ku=
nit_kernel.py
> index 7254c110ff23..61931c4926fd 100644
> --- a/tools/testing/kunit/kunit_kernel.py
> +++ b/tools/testing/kunit/kunit_kernel.py
> @@ -72,7 +72,8 @@ class LinuxSourceTreeOperations:
>                         raise ConfigError(e.output.decode())
>
>         def make(self, jobs: int, build_dir: str, make_options: Optional[=
List[str]]) -> None:
> -               command =3D ['make', 'ARCH=3D' + self._linux_arch, 'O=3D'=
 + build_dir, '--jobs=3D' + str(jobs)]
> +               command =3D ['make', 'all', 'compile_commands.json', 'ARC=
H=3D' + self._linux_arch,
> +                          'O=3D' + build_dir, '--jobs=3D' + str(jobs)]
>                 if make_options:
>                         command.extend(make_options)
>                 if self._cross_compile:
>
> ---
> base-commit: 3c999d1ae3c75991902a1a7dad0cb62c2a3008b4
> change-id: 20240516-kunit-compile-commands-d994074fc2be
>
> Best regards,
> --
> Brendan Jackman <jackmanb@google.com>
>

Reviewed-by: Justin Stitt <justinstitt@google.com>

Thanks
Justin
