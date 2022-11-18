Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D68F65
	for <llvm@lists.linux.dev>; Fri, 18 Nov 2022 17:47:09 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id v28so5529447pfi.12
        for <llvm@lists.linux.dev>; Fri, 18 Nov 2022 09:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LYgVHTNdhuKGn3HeoDWlYgXT5XNzGFpkTsd1oGMfmNE=;
        b=iRN9OeMwK3TDCq7O7YVnHMhkzEM0ss9fAbaDSWX0HrSO89FWSOIjB+hwcZf5kpa26K
         3DRVmtHoq70imca9Mb0jA4cNe+HtkzFIB7OeYjldM0oJdK0asuSDHVGvAULOiv4s3jH4
         xe/thrb0x+iPhhJg30xmvLwVzTs0+kN1uzhi7bttsH2yC2XT8E/U/R8ZXIQJnDAgjSXN
         rHWzBOsJ4Rfs0t6RY2PVL14Eg+6e4nZgzNctyw0Co2qRhfUsugKvxesJgszthD7ugsL7
         eQ5r1icpoLwiIC0JW3O9havGk/ESHxxHXGmQEshpHiJS/SaipKKi506o///6/VivBGgl
         5A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYgVHTNdhuKGn3HeoDWlYgXT5XNzGFpkTsd1oGMfmNE=;
        b=Fa6k27lQIlRAOCTTlGT0GiOGy5UGQlTUQQ91NuoIjaRaKHRawtaDErNTXVqDEjU7CL
         DHO4EkogBvxR9NC2yl+oROVhkOVhgjhuXla31U4m/QLA2QD6o1EWlXkmLBgXEIh9BwD2
         FardZDWviK/M8lplJH0CJdCOPvIjgSiHjRu1T7QDS+4zyXawQhCqEgN+lccqQhEOzNKZ
         nZrAmdJiXJKsI8zayYiqYv4NH+vruFgJlvjDH4GHG1DNma2QlYHhZpi6DyG8XfHqY4Ju
         G1Fp/JgjW1PrLejB48s9XdMZ8x+d8ZAVF0OPDPp3jHaemufgndxSjn+aVnfzbXcL1aQV
         m7zA==
X-Gm-Message-State: ANoB5pnjPsfjc0gAaPEY9Sa9p44e+Ag2/32Ol/tGglaXfbUniEvji46q
	RE7RvP8IidVHmxVRwGvhTzQ6k8RER82bguDsD0iBsg==
X-Google-Smtp-Source: AA0mqf6IHtrzcOhp8Q/72YsEOMVAsv9PHtoWXfZX+/1Mu6eYsMTDT7cLSNTqeYZsDPN1995RAIYGx06VPrvwPZS75sA=
X-Received: by 2002:a63:224c:0:b0:46b:8e9:747 with SMTP id t12-20020a63224c000000b0046b08e90747mr7529166pgm.365.1668793628705;
 Fri, 18 Nov 2022 09:47:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117220339.341290-1-irogers@google.com>
In-Reply-To: <20221117220339.341290-1-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Nov 2022 09:46:57 -0800
Message-ID: <CAKwvOdnc28gwv619=efnp2XYBFgv6fkSa8Z4t6M4XygPR+uC8A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] objtool build improvements
To: Ian Rogers <irogers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 17, 2022 at 2:03 PM Ian Rogers <irogers@google.com> wrote:
>
> Install libsubcmd and then get headers from there, this avoids
> inadvertent dependencies on things in tools/lib. Fix V=1
> support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
> being set for say gcc, and then CC being overridden to clang. Support
> HOSTCFLAGS as a make option.

Hi Ian,
Thanks for the patch set! I'm particularly interested in fixing the
plumbing of HOSTCFLAGS into objtool properly.

Does this patch series depend on recent work you were doing to perf
and libsubcmd? When I apply it to mainline (84368d882b96) or
linux-next (20221118), I observe build failures with it.

```
/bin/sh: line 1: cd:
/android0/kernel-all/tools/objtool/libsubcmd/tools/objtool/: No such
file or directory
../../scripts/Makefile.include:17: *** output directory
"/android0/kernel-all/tools/objtool/libsubcmd/tools/objtool/" does not
exist.  Stop.
make[3]: *** [Makefile:82:
/android0/kernel-all/tools/objtool/libsubcmd/libsubcmd.a] Error 2
make[3]: *** Waiting for unfinished jobs....
builtin-check.c:6:10: fatal error: 'subcmd/parse-options.h' file not found
#include <subcmd/parse-options.h>
         ^~~~~~~~~~~~~~~~~~~~~~~~
```
Which I also observe when just doing a regular kernel build and not
just tools/objtool/.

I tried to apply other recent series first, like
https://lore.kernel.org/lkml/20221109184914.1357295-1-irogers@google.com/
https://lore.kernel.org/linux-perf-users/20221116072211.2837834-2-irogers@google.com/
but wasn't quite able to get the result to build.

My plan to validate HOSTCFLAGS is:
$ make LLVM=1 -j128 mrproper defconfig tools/objtool HOSTCFLAGS=-Os
V=1 1> before.txt
$ <apply patch series>
$ make LLVM=1 -j128 mrproper defconfig tools/objtool HOSTCFLAGS=-Os
V=1 1> after.txt
$ meld before.txt after.txt

>
> Ian Rogers (3):
>   objtool: Install libsubcmd in build
>   objtool: Properly support make V=1
>   objtool: Alter how HOSTCC is forced
>
>  tools/objtool/Build    |  2 --
>  tools/objtool/Makefile | 68 +++++++++++++++++++++++++++++-------------
>  2 files changed, 48 insertions(+), 22 deletions(-)
>
> --
> 2.38.1.584.g0f3c55d4c2-goog
>


-- 
Thanks,
~Nick Desaulniers
