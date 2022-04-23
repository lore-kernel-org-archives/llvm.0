Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C02F2A
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 16:15:00 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id z19so6971660iof.12
        for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IMQZ2RLXAtmsjlcoyG1Ejf9thK9F6e9b1RJe6akdKmw=;
        b=F2azqWjRMT5A5DXNcKJVPvoYcI5e4vIH72e9V0gpj4ILsmdTzCd4+hWO6cJAIshNqg
         M0dLDn9RDNJpvKGd4qZ7ueOIEr4wwpSlAKAXE7rOdUmdTZvx/qVezJCC7W50F9heSVtL
         dnSb1jSNqh6sRcKtjsB2eNbnUlNDzqCoBpEdds/oL1w268tqEbItfNzMHqaqd3HlPQlM
         gDxW5pI/LJlKFxyv42SOU2P04Zo64CgdTVf1otFndIZGvK5GSFzL4jhJBnqWG9G+ZwkA
         Zoi6y0nSq2x/EeA4AEkB6wWnSofvmbvhjG3Xi/KNofvEnW5+Gz6u+kW3rnfp/HaAuCcB
         HfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IMQZ2RLXAtmsjlcoyG1Ejf9thK9F6e9b1RJe6akdKmw=;
        b=gkQRRMmSSrstEM5Bc8L4xcS4ZwiEG/dCocJxy2NKKJ0+QxZJ7puLjJH3vTRMqmRHUN
         MUjoLCH8clpDqMZ8ehResQphMH75IMZi6CJ3R+pCh8DNClMK7CEw8hsZd4aOabYJjxCU
         czjIPLIoqNBlbTkIj2erUTCz51Mqa8dm3szVipU8HnrN+NfRTNobKYEhmSejW6lOewXy
         DCYS0gAiiq9IRPLGRezt56i/vIi+uotnUO4DR4RVHzNHnSmBg9c32Fsq9aIErS5Ndw4K
         R7KcQVQskIZ4twZHWpXv/u7r40hWhkvKwrlR9FtaUaDpD7I7yWLDJcrJ7X1Lw7Md+q92
         FunQ==
X-Gm-Message-State: AOAM532sZMVAe97TztjibpCbQAmZs1VTfxiR7iDZ853xIh+4RucWdX+J
	J2c1UBYsM0L6cbXyHGyMcEPGtch+tk5wTAr3oKtvari4os0=
X-Google-Smtp-Source: ABdhPJxSZpeLH6HLwirF8fz6+F1sM0b9Mk/frQ/bSyt5u1eWasmDJCTDy81yS1/GWLNKUud7CFz3Ispq9cRSoyEWbvU=
X-Received: by 2002:a05:6602:1341:b0:637:d4dc:6f85 with SMTP id
 i1-20020a056602134100b00637d4dc6f85mr3903365iov.155.1650730499411; Sat, 23
 Apr 2022 09:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8b6b252b-47a6-9d52-f0bd-10d3bc4ad244@digikod.net>
In-Reply-To: <8b6b252b-47a6-9d52-f0bd-10d3bc4ad244@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Apr 2022 18:14:48 +0200
Message-ID: <CANiq72nLOfmEt-CZBmm2ouEB_x6Jm9ggDVFCVJxYxKw7O0LTzQ@mail.gmail.com>
Subject: Re: clang-format inconsistencies with checkpatch.pl
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micka=C3=ABl,

On Sat, Apr 23, 2022 at 1:45 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> I also noticed that there is some clang-format configuration lines that
> are commented because of incompatibilities with versions older than 6.
> Shouldn't we require a minimal version, at least the 6th?

I will be increasing this cycle the version to 11, which is the
minimum LLVM supported at the moment, and then keep it sync'd to that
minimum.

> About checkpatch.pl, it incorrectly warns about space between function
> name and open parenthesis for *for_each* functions (specifically
> interpreted as "for" statements in .clang-format, e.g. list_for_each_entr=
y).

Note that the prevailing kernel style is to not have a space. This
should be fixed with the increase to 11.

Cheers,
Miguel
