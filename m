Received: from condef-07.nifty.com (condef-07.nifty.com [202.248.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08551851
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 17:08:51 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-07.nifty.com with ESMTP id 23TH3ghV021998
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 02:03:42 +0900
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 23TH3R6m031957
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 02:03:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 23TH3R6m031957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1651251808;
	bh=2vpSHisjjsnf9NfbpwTfPLzqRn0BtksbaOiDQMdZIhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vIZKmixvU3vr2L5AM0NRMs6Js+aaHTAUpjPmRsHYlD5bN0Z5suE+z4fPNRck9lLwY
	 9OhL5IeMww9wXpimeozNQUifnf7B/A48CioSTRkFjOEZx4x+GUggqd/6KHorFx04oO
	 r8J4y+qlitJaoI+gNbzG9DHCAxHri4RjZv8EGE3uywnsygVFleDHHyDUP+qmD8a7bz
	 peFt01GltVqHLatiy9e82YOwbvsL1ooF0mnioAfyxzXQCcI9juATsu0Wl4hfRxLmON
	 52rIlHEKuwQvNHp7HQC1mBOwHKCX1UfUM2iVHTlpL682CKfVJtbUPn92rSq3JehAlD
	 plDZDEbrLlf5g==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id iq2-20020a17090afb4200b001d93cf33ae9so11035539pjb.5
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 10:03:28 -0700 (PDT)
X-Gm-Message-State: AOAM531USm3w1AlYzEnnZmbvYUcylfz+FOHKOaSA3UzUC1Wk+6Q9zYJY
	G2FtqOe0vr7rQYRrDW0DCYD7Dop6zAhY8DhRuBk=
X-Google-Smtp-Source: ABdhPJxTFHxNrrT5TqeOkyMPJTn0AidkGCpkTxYwuoLHQHkodF0cp0Iagk/I7OqOD0n4qehCHvFWugf2l3faxbK2OGU=
X-Received: by 2002:a17:902:f54e:b0:15e:6c3f:5b5 with SMTP id
 h14-20020a170902f54e00b0015e6c3f05b5mr342925plf.99.1651251807401; Fri, 29 Apr
 2022 10:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 30 Apr 2022 02:02:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARL+_amg-6RN9W+P9n8KuWqobpWrvo6gXxRphxj+=OU7Q@mail.gmail.com>
Message-ID: <CAK7LNARL+_amg-6RN9W+P9n8KuWqobpWrvo6gXxRphxj+=OU7Q@mail.gmail.com>
Subject: Re: [PATCH] checksyscalls: ignore -Wunused-macros
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 23, 2022 at 12:18 AM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> The macros defined in this file are for testing only and are purposely
> not used. When compiled with W=2, both gcc and clang yield some
> -Wunused-macros warnings. Ignore them.
>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---

Applied to linux-kbuild (only the second hunk)
Thanks.

The current check is not nice,
but this does not hurt.



>  scripts/checksyscalls.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
> index 9dbab13329fa..cde15f22ec98 100755
> --- a/scripts/checksyscalls.sh
> +++ b/scripts/checksyscalls.sh
> @@ -255,6 +255,7 @@ cat << EOF
>  /* 64-bit ports never needed these, and new 32-bit ports can use statx */
>  #define __IGNORE_fstat64
>  #define __IGNORE_fstatat64
> +
>  EOF
>  }

Noise.
I dropped it.



>
> @@ -268,4 +269,4 @@ syscall_list() {
>  }
>
>  (ignore_list && syscall_list $(dirname $0)/../arch/x86/entry/syscalls/syscall_32.tbl) | \
> -$* -Wno-error -E -x c - > /dev/null
> +$* -Wno-error -Wno-unused-macros -E -x c - > /dev/null
> --
> 2.35.1
>


-- 
Best Regards
Masahiro Yamada
