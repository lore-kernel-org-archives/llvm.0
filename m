Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA3AFD1
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 20:26:05 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id kq3so40829179plb.13
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680899165; x=1683491165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Qml57ez/12DBtRR0XUBgkJY5NbIgppt8GcAw2X+wm0=;
        b=jlgKUkeNPYv1Sx63l6pSLH05wzmw2SWFRyWDkpSerSMRZzUnhFrk8FOzW6ty1OTs6L
         aXSBgLux/7ZwSrneXsDFZbbiYQiPP7OI6g6m/MGb2unwyuEkTzzkg2QAUr6ogIjeJ7Lp
         Cjl59RvTqPlFUCfxWUu4a2KyiSqwC7yD8tkQlaGOgCeHily1ZCjmq5zx2dFUtkAQkyt2
         ofNSaKqyJH9oQKNCgW2JfziuzJmVEo0BaqKZSLKnhzVMBPgVXX6aNSNhnj+tnBF9Zl4x
         L4vMjrmtrsI5lWBuKo+P48RflUkXdUbdnIEVuPhiUHdfNt4HZo/63R5Kglb1f75B6G8T
         wG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680899165; x=1683491165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Qml57ez/12DBtRR0XUBgkJY5NbIgppt8GcAw2X+wm0=;
        b=z+0W26qQ4zcFotJT4ne9iWnuMQcxQ46268WzX9/eBJ7x8y/22WSPztZqVT650A0J3m
         eP6mfLi2no8qcnzX6cH64GHUe65hxMsR28Ki3DSWpNAx5PZA3AR9ynAbv5FYFMc4W1Dr
         /YmdNzvXX8AhxwRkxSFy310/czgfLiu4QS2LDRhnYEtHXGM9oI+HVjez5mFXpU4UYbGW
         CAiUdlZkrlQgh2YlNRo/Kx7IZVHgs8q3mu2b4DXPS9iWWfC0hvb6sjrW1yd5HA67mjyB
         mAJc9J/TbTeyD0NyCbB0gutdiXnXh1bqa3SzZlh5ADOhNx75FWgW3+SV2Y30bGsi8tMJ
         sakw==
X-Gm-Message-State: AAQBX9eE1k/fCs7rTpRo/N1Vs9elN0S6GOGHtcXOaeSf98jMxXMsMtD7
	RRHY9/4Ngmzriy1Fx1L3DwoeGH148AB6ypxYVVJGgw==
X-Google-Smtp-Source: AKy350aM6xwPlVLA5rPYKoB5RhjF3PEYNPlYrCd4ZkeeIS0YPdjjoUxwDWIT0Z1yKwTOSaz5gJVMKt7qI9B2Hn4F8Ks=
X-Received: by 2002:a17:902:a50b:b0:1a2:6e31:73cb with SMTP id
 s11-20020a170902a50b00b001a26e3173cbmr1247076plq.2.1680899164994; Fri, 07 Apr
 2023 13:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230308115243.82592-1-masahiroy@kernel.org> <20230308115243.82592-8-masahiroy@kernel.org>
In-Reply-To: <20230308115243.82592-8-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 13:25:53 -0700
Message-ID: <CAKwvOdmdKo-ZtUZH=4R1G9DgxoRaWa_peyx_uHHKYqFXbuKeBw@mail.gmail.com>
Subject: Re: [PATCH 8/8] scripts/kallsyms: update the usage in the comment block
To: Masahiro Yamada <masahiroy@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 3:53=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Commit 010a0aad39fc ("kallsyms: Correctly sequence symbols when
> CONFIG_LTO_CLANG=3Dy") added --lto-clang, and updated the usage()
> function, but not the comment. Update it in the same way.

I'm surprised to not recall that commit.  Was our mailing list cc'ed?
Looking at https://lore.kernel.org/lkml/20221102084921.1615-4-thunder.leizh=
en@huawei.com/,
it looks like "no."

Zhen, Luis, please make sure to use scripts/get_maintainer.pl when
sending patches.  You can put Cc: below the fold of the commit message
in the patch file even when sending a series and git send-email will
use those just for that commit.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kallsyms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 937900823fa8..0d2db41177b2 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -6,7 +6,7 @@
>   * of the GNU General Public License, incorporated herein by reference.
>   *
>   * Usage: kallsyms [--all-symbols] [--absolute-percpu]
> - *                         [--base-relative] in.map > out.S
> + *                         [--base-relative] [--lto-clang] in.map > out.=
S
>   *
>   *      Table compression uses all the unused char codes on the symbols =
and
>   *  maps these to the most used substrings (tokens). For instance, it mi=
ght
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
