Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A11C28D
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 15:47:14 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-79a31d66002so1502571241.3
        for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692719233; x=1693324033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYNvV23/sQh2KUeEtBQywg5ma3vCxQAqr4Fitqyx0c4=;
        b=UN77YUOelf5sJQMuE+614A5Z84E2e6FM84c3z6tTCr6fuXnbnqGlC4ndp0jdFNAtHk
         MqVEHFAGNEBE57eFoVnRrvGC6tw1cyDaceDUw2Q5XzhsWU3I75Nz+p/HgJaJUnDj0oLj
         C0ouC1ra3gvDQ5hhAmIA9MmPYICUNSJgL+Wl2xt7Mt/zFVJ4E5wJnlUnkdVL8lU+RlFM
         MSWyZXsKWxc9ossbSLXVPY/mGxsQEe3/Cq1O02zt/qxIoDoJ5HGP9axj+xvWuJCYdJBi
         PTE3Eq8dg0BPPpZ8BSjUtqxRPTT8iI/ZA9muVe8V3uEVr5t1Bjqo8voB435c6gsuRh7N
         YMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692719233; x=1693324033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYNvV23/sQh2KUeEtBQywg5ma3vCxQAqr4Fitqyx0c4=;
        b=gQrnm0SxWJkf+rSoWGl0JkX6+HDHmi+ZB/y6sgR7hdnOdLnAmCevtOhRpxEPxYqrgV
         7yVV1pPETm8aRt0ab6srKv8kUFIySThX4YJYkpvPXhynnO/zV19pVUvcritDGAR3cgSR
         17QBCQHN3dzmAwTz/3pWXqobqiPTfGgZ4zh4n03oLT98JeEHxy3bVzrWa1KcHT/xUu5v
         tYBBL8WpO4JKhLYEMUkHwG1L/QzMZg0SKtpTP1ABSsihxvvilHLqluMDrePPn6p62ZvF
         Qem8z4RmoZiGuOj/aQhz1Dk/AKjkvTZ+m1lAPWNIAXPcM564+C21a7wXuVKNb7EiWrEZ
         0FZQ==
X-Gm-Message-State: AOJu0YyjJB47G9mJMC85ZY5t1YjP1xqc0wibKUZCtnpJBu31kRZ9ANBU
	ahgHnbmRxK6X+cy+27bufGc5ouCYal3xtkdVRBAjuw==
X-Google-Smtp-Source: AGHT+IGObL+V0/ELRu9qQaqOGv9Tp3eKDjtfRuftO2ZQwK2jpACBoKq2mdTSjTDQSxxhDvDhAGyMDcJJCgF8fGBxxk0=
X-Received: by 2002:a67:b34b:0:b0:440:b7df:767b with SMTP id
 b11-20020a67b34b000000b00440b7df767bmr8953767vsm.11.1692719233347; Tue, 22
 Aug 2023 08:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org>
In-Reply-To: <20230822065256.163660-1-denik@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 22 Aug 2023 08:47:02 -0700
Message-ID: <CAKwvOdmvUCKDk0kU0DVywRRPS9qT09PsQ435GzzuinHkBcRZ0w@mail.gmail.com>
Subject: Re: [PATCH] modpost: Skip .llvm.call-graph-profile section check
To: Denis Nikitin <denik@chromium.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 11:54=E2=80=AFPM Denis Nikitin <denik@chromium.org>=
 wrote:
>
> .llvm.call-graph-profile section is added when the kernel is built with
> profiles (e.g. -fprofile-sample-use=3D<llvm.profile>). The section holds
> metadata for symbols beloning to other sections and hence doesn't need
> modpost checks.
>
> This change fixes the kernel build with sample profiles which fails
> with:
> "FATAL: modpost: Please add code to calculate addend for this architectur=
e"
>
> Signed-off-by: Denis Nikitin <denik@chromium.org>

Thanks for the patch. If you send a v2 with Fangrui's suggested
changes+additions, feel free to carry forward my reviewed by tag.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
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
Thanks,
~Nick Desaulniers
