Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D412F594
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707946082; cv=none; b=gqAqn1zSMIfxtyh+6u8npFnOoViEbf+JBdR5CS0eNfjxgKeUd5eH3bvLAyLdwa4RJapno+2jVQZB2ixtm5V9a4U6rsHIsWJBVjyXYnU/v8q5dYNkyUw8klo3ZJ1Ah12sAmXXjEj++EpQqgW2qywNdpKWvjalmtAWDxRNZAGOWDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707946082; c=relaxed/simple;
	bh=sMR/EU43ymYV3sXSFsO3a+GSbk9xup663bB8N2u3J6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOwqWgNCxtfzs7FE4dcsE8q5bfywNfi/ju744TqSzKLer42T/URL/RX52YEelZX0zzk8whLlZhLz/YPTo1zF/J3cry4l094ULjVkpluCkVJrM2p+lTeIuXvATKJtbOih/JdpNwvRWA8tvfyhU6IAAph1sg2Ij5t3R4wz5IcHeMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkNE3/Ha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkNE3/Ha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C81C433B1
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707946082;
	bh=sMR/EU43ymYV3sXSFsO3a+GSbk9xup663bB8N2u3J6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nkNE3/HaVyI7fvPMPdsAn7MA1j+tRn8JsplaOB4Il+ryCZ5ZooXAsGkHAFtiAZx/B
	 7Pb15ykYHeOtP9CwwV9B7m6KJu69QTYuDfYrQkafXG/EVaCXE1kKGpT5U2f59NxSXE
	 u9GrvVBbt3eNiZCh/vVctoT7OT6NPAKrHZW6cvSM3Xp31yLTETZwW2wli0PxmDjsbZ
	 hdh9ND/DJwai0vvjT6breNH4BZuB640Ct+N3sJWhUxNTUXk525Swcjf7w+i2bnsMKW
	 jYdNcrXF3SJWAGbbiDX6oeDXXfN3Wg/Jj/cy8FmiXFVM82XIBYwYLaiGgaOL/cRyHI
	 JB1NTwv2/muBQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d0c9967fdcso14293831fa.0
        for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 13:28:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUPTQzTRgzkBQMwzlhLDd3w0oxObzU+yhZs74uvlvL8NUALyXQZ9I71SLqxkn7XKyG6+iLtHKBor5W0JylnwYltZmZ2w==
X-Gm-Message-State: AOJu0YxtXhMxLFH5QbYUI0jsYjqcx4EwYvrj81gHNziTYEjj8ACouEJN
	Xu0FoJ8HCZsSrqU/9BQlIaUPcw75b5PN1z6jixyaGzdpFFdbtUiskp7/vJpszj7WY5EUmi8T5c/
	pbkkVQJGwIujiMDwQa9xk9deHfTo=
X-Google-Smtp-Source: AGHT+IG/W9lqyeivaxRbePZdzCB0jHVgx1oFHIkcNxKQfTN250PE70uEZ83QpRnCOgahYuK3HBhlFT9SwgKvB2qiUXM=
X-Received: by 2002:ac2:5635:0:b0:511:550f:5300 with SMTP id
 b21-20020ac25635000000b00511550f5300mr1041746lff.14.1707946080774; Wed, 14
 Feb 2024 13:28:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
 <20240214012439.879134-1-andrewjballance@gmail.com> <20240214012439.879134-2-andrewjballance@gmail.com>
In-Reply-To: <20240214012439.879134-2-andrewjballance@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 15 Feb 2024 06:27:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASspq7uYYPx6QLOad_WUeXsyRmtbq9qibXJP_Fbo3Fs0g@mail.gmail.com>
Message-ID: <CAK7LNASspq7uYYPx6QLOad_WUeXsyRmtbq9qibXJP_Fbo3Fs0g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gen_compile_commands: fix invalid escape sequence warning
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: justinstitt@google.com, linux-kbuild@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 10:25=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> with python 3.12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'


I changed "3.12.1" to "3.12" when I applied it
because this occurs for Python 3.12.0


Thanks.



>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 5dea4479240b..e4fb686dfaa9 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file=
_path):
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending=
 on the
>      # kernel version). The compile_commands.json file is not intereprete=
d
>      # by Make, so this code replaces the escaped version with '#'.
> -    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '#'=
)
> +    prefix =3D command_prefix.replace(r'\#', '#').replace('$(pound)', '#=
')
>
>      # Return the canonical path, eliminating any symbolic links encounte=
red in the path.
>      abs_path =3D os.path.realpath(os.path.join(root_directory, file_path=
))
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada
