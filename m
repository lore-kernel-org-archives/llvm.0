Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B07F
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 18:13:29 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id n144so3297453iod.4
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=3wk3vE05GmoK4OKiW6MbO1jzUBwfjbF3RO3sZka4u5w=;
        b=kyv+J9uo8rVfEt79as0se2cJZdaPRsgQkzKFFy+2OAU7l49GtWFdVzmBDhVS1+8R6K
         +tKNGY7Jgevr9Xav/0lxhb8w1Wh8phPkm16vzi71tjXxqwwGp/BEsS4czh6xSHRxRLkZ
         aCp05jbuqMtoF57twN/oYI8hZ8FZZXtZbvi5s8Hq3CZEzvbgd5McD9NgcPbT78yMIirz
         uPa50ZuptW66xplcwJIjeuBnULtYCx4iCY9i4ByE67f1ZOak2uE8UtRKCrCoS52i1ECf
         tZOH47ODKakU3fm/GV7+I0SjD8wfRgRlBYjQXboudvInKQ33xC0u1EL7funnQM8kbInN
         SENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=3wk3vE05GmoK4OKiW6MbO1jzUBwfjbF3RO3sZka4u5w=;
        b=OSgSyfutGfv2SiEoVbcaWUxGtylGaKhI8EqTuLZx/pteAJXx1gponkXnsZYTyx1xC1
         lKOXoVKNqkW5vPggT2CpH+K5UtGvgjRbUYrmT9Iyf9hKFSufyIg0cjIbc3rk6eDC61r8
         uqH1yt0PuHoxvCK4G4prU5I0F9f0cbiiRPcKN4zX6iZXQ+JCTBt4du1yuhpqm6iwPEuY
         D6EBoBtiYnIxUpvxCuvVrqO9gXFjD3Iy3W0huP1+ZT0473qbXxFlrlutsDQd04+CTRhN
         zK/I6A3hU496r7obt2dw2heRKbRxN6ikraYaco4kuYHCsdGrwdEmc1XBmcXvioKYuCSZ
         /LzQ==
X-Gm-Message-State: AOAM531U94AKnM6HDk0MppPgHyfgPgrYwLGYWKwvqa+WEu49S2HKCK7e
	QTTqAQQVAv2x2dL4Sy63Q+0hL8ook/2k++cH2eE=
X-Google-Smtp-Source: ABdhPJywRDF4Gq9orpB0mEQklOMtyOI4f+fzvomrVYwKviGqK1E/7iq8Wc+QSMhTmppm8uuM0WPtj03uU6P9Owq9wCs=
X-Received: by 2002:a6b:440c:0:b0:669:440b:66f3 with SMTP id
 r12-20020a6b440c000000b00669440b66f3mr7647992ioa.128.1654625608321; Tue, 07
 Jun 2022 11:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607000851.39798-1-irogers@google.com>
In-Reply-To: <20220607000851.39798-1-irogers@google.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 7 Jun 2022 20:12:52 +0200
Message-ID: <CA+icZUW-Zrri=ofkdVtNNYcBCQ-cNvLt7GHfcJw54bxzf_zjZA@mail.gmail.com>
Subject: Re: [PATCH] perf unwind: Fix uninitialized variable
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>, Sebastian Ullrich <sebasti@nullri.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 2:09 AM Ian Rogers <irogers@google.com> wrote:
>
> ret may be uninitialized on error goto paths.
>
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Fixes: dc2cf4ca866f ("perf unwind: Fix segbase for ld.lld linked objects")
> Signed-off-by: Ian Rogers <irogers@google.com>

Thanks for the patch.

Feel free to add my:

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

$ LC_ALL=C ll ~/bin/perf
-rwxr-xr-x 2 dileks dileks 16M Jun  7 20:10 /home/dileks/bin/perf

$ ~/bin/perf -vv
perf version 5.19.0-rc1
                dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
   dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
                glibc: [ on  ]  # HAVE_GLIBC_SUPPORT
        syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
               libbfd: [ on  ]  # HAVE_LIBBFD_SUPPORT
           debuginfod: [ OFF ]  # HAVE_DEBUGINFOD_SUPPORT
               libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
              libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
              libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
            libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
             libslang: [ on  ]  # HAVE_SLANG_SUPPORT
            libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
            libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
   libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
                 zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
                 lzma: [ on  ]  # HAVE_LZMA_SUPPORT
            get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
                  bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
                  aio: [ on  ]  # HAVE_AIO_SUPPORT
                 zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
              libpfm4: [ OFF ]  # HAVE_LIBPFM

-Sedat-

> ---
>  tools/perf/util/unwind-libunwind-local.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
> index 37622699c91a..6e5b8cce47bf 100644
> --- a/tools/perf/util/unwind-libunwind-local.c
> +++ b/tools/perf/util/unwind-libunwind-local.c
> @@ -174,7 +174,7 @@ static int elf_section_address_and_offset(int fd, const char *name, u64 *address
>         Elf *elf;
>         GElf_Ehdr ehdr;
>         GElf_Shdr shdr;
> -       int ret;
> +       int ret = -1;
>
>         elf = elf_begin(fd, PERF_ELF_C_READ_MMAP, NULL);
>         if (elf == NULL)
> --
> 2.36.1.255.ge46751e96f-goog
>
