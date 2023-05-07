Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5C1365
	for <llvm@lists.linux.dev>; Sun,  7 May 2023 02:57:10 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ba2362d4ea9so658481276.3
        for <llvm@lists.linux.dev>; Sat, 06 May 2023 19:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683428229; x=1686020229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y27uBZQDxoMMmtt5dKQE+mflLBajPhR2V/YDaYqpNNc=;
        b=asf8yuwLMoYRuSDkl98e4jZU6XQaGVjcL2PIQTWhuRJCleA6VzN3yh+OhCkGY1y7fz
         YJtMEbGpvu2iLcaAdjgkagdg7MMmc751nhF+AiQnFLUZa/oAzKRM9uijfTCaFqrL36SP
         BXHlOz5HYDhMOi15HlL34ObZ5hiWEg+zIsp+jKoH1p3thfS4QJM044e6Do3/FHv+uTM2
         oM4bmCPGFV00e7BUl6s3kvJY/eC/XYyoTqOTuh98xB5TW/odbILtotYOuDUscuV70OlZ
         midw/cjHuQtCClml5TPlpjV6ViNyBcc7t5yL3DOBzRh4EHG5U/sCOr75wKY/4rNsXdBW
         soZg==
X-Gm-Message-State: AC+VfDxZW1Qm4nUgiNro+eg0/xbk0Ss7D0ld2hei72WmtS0+ih8qbrCS
	5VLuuWobkNNtW7iEJ9xKfxGREH2UQft3iR5Fk+Y=
X-Google-Smtp-Source: ACHHUZ5KYd+Vp866GdYz32Yb8G1anYuwcXULbK3NRkDd6T9rO6BPZvKgFiMbj5mIdsFH380Y3SgiWsJzPH/v6x/8GkQ=
X-Received: by 2002:a25:e648:0:b0:b9e:712f:4a17 with SMTP id
 d69-20020a25e648000000b00b9e712f4a17mr6602071ybh.6.1683428229058; Sat, 06 May
 2023 19:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230506021450.3499232-1-irogers@google.com>
In-Reply-To: <20230506021450.3499232-1-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sat, 6 May 2023 19:56:56 -0700
Message-ID: <CAM9d7cieo+cF9uNfgQq=R1BofNN5Ae69sjz80rV8-TxXPZFasg@mail.gmail.com>
Subject: Re: [PATCH v1] perf build: Add system include paths to BPF builds
To: Ian Rogers <irogers@google.com>
Cc: Song Liu <songliubraving@meta.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Andrii Nakryiko <andrii.nakryiko@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Fri, May 5, 2023 at 7:15=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> There are insufficient headers in tools/include to satisfy building
> BPF programs and their header dependencies. Add the system include
> paths from the non-BPF clang compile so that these headers can be
> found.
>
> This code was taken from:
> tools/testing/selftests/bpf/Makefile
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Thanks, this fixes the BPF build failure on my machine.

Tested-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung


> ---
>  tools/perf/Makefile.perf | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 61c33d100b2b..37befdfa8ac8 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -1057,7 +1057,25 @@ $(SKEL_TMP_OUT) $(LIBAPI_OUTPUT) $(LIBBPF_OUTPUT) =
$(LIBPERF_OUTPUT) $(LIBSUBCMD_
>
>  ifndef NO_BPF_SKEL
>  BPFTOOL :=3D $(SKEL_TMP_OUT)/bootstrap/bpftool
> -BPF_INCLUDE :=3D -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE)
> +
> +# Get Clang's default includes on this system, as opposed to those seen =
by
> +# '-target bpf'. This fixes "missing" files on some architectures/distro=
s,
> +# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
> +#
> +# Use '-idirafter': Don't interfere with include mechanics except where =
the
> +# build would have failed anyways.
> +define get_sys_includes
> +$(shell $(1) $(2) -v -E - </dev/null 2>&1 \
> +       | sed -n '/<...> search starts here:/,/End of search list./{ s| \=
(/.*\)|-idirafter \1|p }') \
> +$(shell $(1) $(2) -dM -E - </dev/null | grep '__riscv_xlen ' | awk '{pri=
ntf("-D__riscv_xlen=3D%d -D__BITS_PER_LONG=3D%d", $$3, $$3)}')
> +endef
> +
> +ifneq ($(CROSS_COMPILE),)
> +CLANG_TARGET_ARCH =3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
> +endif
> +
> +CLANG_SYS_INCLUDES =3D $(call get_sys_includes,$(CLANG),$(CLANG_TARGET_A=
RCH))
> +BPF_INCLUDE :=3D -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE) $(CLANG_SYS_IN=
CLUDES)
>
>  $(BPFTOOL): | $(SKEL_TMP_OUT)
>         $(Q)CFLAGS=3D $(MAKE) -C ../bpf/bpftool \
> --
> 2.40.1.521.gf1e218fcd8-goog
>
