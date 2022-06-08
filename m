Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F6C33D2
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 19:30:21 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id f12so17329542ilj.1
        for <llvm@lists.linux.dev>; Wed, 08 Jun 2022 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=AOjdpRzw4kjXPBWg+IgjE0lEriWtzNXqibpX4C2uBGc=;
        b=jAHJfid2MSi3OT1OIrtN7Gv3Z7jqBsRN41Sb5eYx0Qjy5mikfQtYnmbGDS4uiVXgW7
         zHNMxIlB11TP9sMUU5jW7e5OuPn1/lBV0Tm2C+amVjedIj1dvPGXRLHZ61sGNkqTiEVN
         TiiQOwyIc8G0sRKr/Fik/5BCd0m/7McOMzOV7vilEJr85Dc2R4KJfQ00f+YN85b0flW7
         MtX3WMntOfil+plLEXbCxOZnvKfrdAmnLZY250xVt971dFPC+GtCLuVg9TfjZGbJxnnz
         aPjCRVpFAOpYWXuUQNXOknXyi+1/YPh4qnS/Lpwsv42WL7UrBNUL3L6UhzFmk+qPpmux
         j5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=AOjdpRzw4kjXPBWg+IgjE0lEriWtzNXqibpX4C2uBGc=;
        b=f4HssWP9g+SNzjmrlLx21ukJRsqzumu8Q42OS3BGS/4KFClwOAqJFhPQ/+VPI5NkcI
         90w3U26xKscbPE88lhggaP6+YqbzIV3PuJCnTzYWT9I1oALQpSrVohYvtkuaYd+PnoYo
         qfys+YKRXSq1V4d2tTvKR8LujKWZS3lMwVpy4zvDdSvt0QQ7zzFsDxTnAFZOl9J1Jbsf
         U5yqDlptdEn1UFCfg4FpQ3QTCSiW9zC0G3aOxsfSjUMK2a6rjSIY5vHbcUKjJSU3VIhk
         IW/UOHWB75QoMcDwPlQMyrYBjDGKK5czEuv0eeuZwfbsC2ex6ZzW2dhz/2hM9nlWRr4G
         fvFA==
X-Gm-Message-State: AOAM531wTrnMwe/8sAuQbVkslJWwIkxOQjyO2vHgd9PzONSAh827gRbl
	zYTySIxF/o3PCRjkRn+/VEFdMXWzY9B6/36ixdc=
X-Google-Smtp-Source: ABdhPJzZNF45qIna6xgVavAW/mvucDEcDYNma7Scvm6od77BMHrymlGXZcfcVbmbJ3P8L2ngZSRCY9O8y2BRxRRcNTk=
X-Received: by 2002:a05:6e02:16ce:b0:2d3:edec:17a5 with SMTP id
 14-20020a056e0216ce00b002d3edec17a5mr18678433ilx.4.1654716620920; Wed, 08 Jun
 2022 12:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607000851.39798-1-irogers@google.com> <CA+icZUW-Zrri=ofkdVtNNYcBCQ-cNvLt7GHfcJw54bxzf_zjZA@mail.gmail.com>
In-Reply-To: <CA+icZUW-Zrri=ofkdVtNNYcBCQ-cNvLt7GHfcJw54bxzf_zjZA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 8 Jun 2022 21:29:44 +0200
Message-ID: <CA+icZUUMY1pxzXm-Me92w18ochhAjJvrsFxbC=6dZZg7HZJsiw@mail.gmail.com>
Subject: Re: [PATCH] perf unwind: Fix uninitialized variable
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>, Sebastian Ullrich <sebasti@nullri.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 8:12 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Tue, Jun 7, 2022 at 2:09 AM Ian Rogers <irogers@google.com> wrote:
> >
> > ret may be uninitialized on error goto paths.
> >
> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Fixes: dc2cf4ca866f ("perf unwind: Fix segbase for ld.lld linked objects")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Thanks for the patch.
>
> Feel free to add my:
>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>

If it is not too late, more exactly:

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)

-Sedat-

> $ LC_ALL=C ll ~/bin/perf
> -rwxr-xr-x 2 dileks dileks 16M Jun  7 20:10 /home/dileks/bin/perf
>
> $ ~/bin/perf -vv
> perf version 5.19.0-rc1
>                 dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
>    dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
>                 glibc: [ on  ]  # HAVE_GLIBC_SUPPORT
>         syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
>                libbfd: [ on  ]  # HAVE_LIBBFD_SUPPORT
>            debuginfod: [ OFF ]  # HAVE_DEBUGINFOD_SUPPORT
>                libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
>               libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
> numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
>               libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
>             libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
>              libslang: [ on  ]  # HAVE_SLANG_SUPPORT
>             libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
>             libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
>    libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
>                  zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
>                  lzma: [ on  ]  # HAVE_LZMA_SUPPORT
>             get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
>                   bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
>                   aio: [ on  ]  # HAVE_AIO_SUPPORT
>                  zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
>               libpfm4: [ OFF ]  # HAVE_LIBPFM
>
> -Sedat-
>
> > ---
> >  tools/perf/util/unwind-libunwind-local.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
> > index 37622699c91a..6e5b8cce47bf 100644
> > --- a/tools/perf/util/unwind-libunwind-local.c
> > +++ b/tools/perf/util/unwind-libunwind-local.c
> > @@ -174,7 +174,7 @@ static int elf_section_address_and_offset(int fd, const char *name, u64 *address
> >         Elf *elf;
> >         GElf_Ehdr ehdr;
> >         GElf_Shdr shdr;
> > -       int ret;
> > +       int ret = -1;
> >
> >         elf = elf_begin(fd, PERF_ELF_C_READ_MMAP, NULL);
> >         if (elf == NULL)
> > --
> > 2.36.1.255.ge46751e96f-goog
> >
