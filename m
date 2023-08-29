Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E4156DB
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 13:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FACFC433CB
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693315095;
	bh=jh66Sdt/TwjtCznyiblMwdkrIJLYKmp6mKZvnmhdovY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NribA2HGMkZneLf9U7/uitry3HzkvhacsTq11HT1wum835IAUo2agwyqKNJCBjx6J
	 N37zrBFJZa1Xu3rbLSFAKYXL9zgM7DzzKEv2OWDy6LxB3WbUkhnn6D1VWjipIz2uKH
	 aExGbl9HN+Z69MENEAkCytMBV/3MBL7MvmkVWLuT7kCl/CmIatoOgUYkh5O3mewye+
	 f/KF7JJUE3aYL73P5uTU8X6T4S57a3wRdkrF4Y50Del1jxrK4wRefa6OhAxbREy0gV
	 4Mjf3oxZ+zz7tiR2dhMlH7tVbOa7klbkZqQJUXD0+M3qKAjgO5xmZM2iYRFK9bSCo/
	 SITHHIMgdb3NA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-573429f5874so2388598eaf.0
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 06:18:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YxX8P+CQvenitVJh4H4c2UYtoWPsVNpLIX3VdYnQM8Kj/NVyb1Z
	W9wjyPWQNu5q13gzXEUYIURcpd+z9ygP4v9nZBo=
X-Google-Smtp-Source: AGHT+IGrjdYeWbzwPkSj7uxQXMLlkMd5pKaoLDSbw/kSc27B5Aqi/G2w7zTKdbqYYh9m/slezXtMglvq+C6n0WEcJ2g=
X-Received: by 2002:a4a:6b0a:0:b0:573:7828:ce53 with SMTP id
 g10-20020a4a6b0a000000b005737828ce53mr6105017ooc.4.1693315094817; Tue, 29 Aug
 2023 06:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230825072744.1322656-1-denik@chromium.org>
In-Reply-To: <20230825072744.1322656-1-denik@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Aug 2023 22:17:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQKMC-G4AJbHafPF0ef74_YPtzXipcmnZY=1AWgayVoCA@mail.gmail.com>
Message-ID: <CAK7LNAQKMC-G4AJbHafPF0ef74_YPtzXipcmnZY=1AWgayVoCA@mail.gmail.com>
Subject: Re: [PATCH v3] modpost: Skip .llvm.call-graph-profile section check
To: Denis Nikitin <denik@chromium.org>
Cc: linux-kbuild@vger.kernel.org, Fangrui Song <maskray@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 5:15=E2=80=AFAM Denis Nikitin <denik@chromium.org> =
wrote:
>
> .llvm.call-graph-profile section is added by clang when the kernel is
> built with profiles (e.g. -fprofile-sample-use=3D or -fprofile-use=3D).
> Note that .llvm.call-graph-profile intentionally uses REL relocations
> to decrease the object size, for more details see
> https://reviews.llvm.org/D104080.
>
> The section contains edge information derived from text sections,
> so .llvm.call-graph-profile itself doesn't need more analysis as
> the text sections have been analyzed.
>
> This change fixes the kernel build with clang and a sample profile
> which currently fails with:
>
> "FATAL: modpost: Please add code to calculate addend for this architectur=
e"
>
> Signed-off-by: Denis Nikitin <denik@chromium.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> ---


Applied to linux-kbuild.
Thanks.


>  scripts/mod/modpost.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index b29b29707f10..64bd13f7199c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -761,6 +761,7 @@ static const char *const section_white_list[] =3D
>         ".fmt_slot*",                   /* EZchip */
>         ".gnu.lto*",
>         ".discard.*",
> +       ".llvm.call-graph-profile",     /* call graph */
>         NULL
>  };
>
> --
> 2.42.0.rc1.204.g551eb34607-goog
>


--=20
Best Regards
Masahiro Yamada
