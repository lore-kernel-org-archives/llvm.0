Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66DA15A3
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 14:43:00 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id s23so9086876iog.13
        for <llvm@lists.linux.dev>; Sun, 29 May 2022 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ivB3xZNPk/HRQcIpAvzMtgHzUzcDOyxmfIr4lBMkOpQ=;
        b=Q9i4IqNrDLgnXT5ndv85GwM4ORcOaOyz1LX95hEfYldmLNCvDd14GYQPh4dF7BWY55
         YQiNls5o7NmCUqVCeLTqkMeW1h0bsJJqV/Z44cD7mwuY0pntb84OIjmPaOdVyY0/PSnA
         e3cnmqHf+DQ8zOt2nox0GRq0gK3RjIKaQ4jKee2mB+phOsArSwzZG0N/CL43H1Ae37wG
         tyzB+JxRfrAaPgdaFUJddlz3FNyu0ICNVDdGiSrGMegxblozPD5zNlM5NILKOlR6ZDw4
         R7UqlS64Mmv1g16tbG0VXLq2gK8puU/CT2TFk6va8OUjrYnm5gDtO2LobkDj+vQhjUOR
         6Uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ivB3xZNPk/HRQcIpAvzMtgHzUzcDOyxmfIr4lBMkOpQ=;
        b=dtjwbOzoTEoBWJzjfLlhRplzj9W0+hE4HZErlX2voOiQ6K1m/YCjbGJtdoAvAuCape
         GvnL6Cjh13AFI1W+2avV2gSkxGibI2dH7uu6I52UAaYlqpsaBe1LFS/NGdL7RinaKLxi
         AgLVj0mrNeEEUh2Thy5bawNhJSsrhekeTup4W069yI9zm+GTKdR5xZCheMIAL4lOpvnT
         3mVvSwlipANzfE8aF1T7ThotBrw0jDEuL5/I4mJht3RJCdQu+DCQlvMi1Km+A+gWxDzp
         C0vsaiW4yDJ4moMhernVJAHwjyRob5Fz7AC8+90wf5tH9NkBnDvhncDGx4elX4/pRbRM
         d5TA==
X-Gm-Message-State: AOAM532wyPGRmZEgSzIuyvyHJ42l7EWvFKHUoYWAJBuYXxpY/FdoPwX0
	iWQkifpaRbSG3sjujJVD28aRrw3cJR9NdBme+Fc=
X-Google-Smtp-Source: ABdhPJz2GVGOebiROdNoFngR7SNu6Ex/e9wsBn0eouXGks4uJH2PI/3CJHWNZcWW8hDm2lD2oU+0NuyXHiFoa0y3D30=
X-Received: by 2002:a05:6602:25d3:b0:65b:1d8a:a8ae with SMTP id
 d19-20020a05660225d300b0065b1d8aa8aemr22938278iop.131.1653835379597; Sun, 29
 May 2022 07:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220528154704.2576290-1-masahiroy@kernel.org> <20220528154704.2576290-3-masahiroy@kernel.org>
In-Reply-To: <20220528154704.2576290-3-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 29 May 2022 16:42:23 +0200
Message-ID: <CA+icZUV1eoXkVXGEVD-8rMeh+6y7bwXC91R3EqaT5CKf_=D5fw@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: move vmlinux.o link to scripts/Makefile.vmlinux_o
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, May 28, 2022 at 8:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is a preparation for the objtool move in the next commit.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)

-Sedat-

> ---
>
>  scripts/Makefile.vmlinux_o | 61 ++++++++++++++++++++++++++++++++++++++
>  scripts/link-vmlinux.sh    | 41 +------------------------
>  2 files changed, 62 insertions(+), 40 deletions(-)
>  create mode 100644 scripts/Makefile.vmlinux_o
>
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> new file mode 100644
> index 000000000000..a9b375ca86d5
> --- /dev/null
> +++ b/scripts/Makefile.vmlinux_o
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +PHONY := __default
> +__default: vmlinux.o
> +
> +include include/config/auto.conf
> +include $(srctree)/scripts/Kbuild.include
> +
> +# Generate a linker script to ensure correct ordering of initcalls for Clang LTO
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_gen_initcalls_lds = GEN     $@
> +      cmd_gen_initcalls_lds = \
> +       $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +       $(PERL) $(real-prereqs) > $@
> +
> +.tmp_initcalls.lds: $(srctree)/scripts/generate_initcall_order.pl \
> +               $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS) FORCE
> +       $(call if_changed,gen_initcalls_lds)
> +
> +targets := .tmp_initcalls.lds
> +
> +ifdef CONFIG_LTO_CLANG
> +initcalls-lds := .tmp_initcalls.lds
> +endif
> +
> +# Link of vmlinux.o used for section mismatch analysis
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_ld_vmlinux.o = LD      $@
> +      cmd_ld_vmlinux.o = \
> +       $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> +       $(addprefix -T , $(initcalls-lds)) \
> +       --whole-archive $(KBUILD_VMLINUX_OBJS) --no-whole-archive \
> +       --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> +
> +define rule_ld_vmlinux.o
> +       $(call cmd_and_savecmd,ld_vmlinux.o)
> +endef
> +
> +vmlinux.o: $(initcalls-lds) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS) FORCE
> +       $(call if_changed_rule,ld_vmlinux.o)
> +
> +targets += vmlinux.o
> +
> +# Add FORCE to the prequisites of a target to force it to be always rebuilt.
> +# ---------------------------------------------------------------------------
> +
> +PHONY += FORCE
> +FORCE:
> +
> +# Read all saved command lines and dependencies for the $(targets) we
> +# may be building above, using $(if_changed{,_dep}). As an
> +# optimization, we don't need to read them if the target does not
> +# exist, we will rebuild anyway in that case.
> +
> +existing-targets := $(wildcard $(sort $(targets)))
> +
> +-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
> +
> +.PHONY: $(PHONY)
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index b593cb1a8137..90680b6bd710 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -45,45 +45,6 @@ info()
>         printf "  %-7s %s\n" "${1}" "${2}"
>  }
>
> -# Generate a linker script to ensure correct ordering of initcalls.
> -gen_initcalls()
> -{
> -       info GEN .tmp_initcalls.lds
> -
> -       ${PYTHON3} ${srctree}/scripts/jobserver-exec            \
> -       ${PERL} ${srctree}/scripts/generate_initcall_order.pl   \
> -               ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}   \
> -               > .tmp_initcalls.lds
> -}
> -
> -# Link of vmlinux.o used for section mismatch analysis
> -# ${1} output file
> -modpost_link()
> -{
> -       local objects
> -       local lds=""
> -
> -       objects="--whole-archive                                \
> -               ${KBUILD_VMLINUX_OBJS}                          \
> -               --no-whole-archive                              \
> -               --start-group                                   \
> -               ${KBUILD_VMLINUX_LIBS}                          \
> -               --end-group"
> -
> -       if is_enabled CONFIG_LTO_CLANG; then
> -               gen_initcalls
> -               lds="-T .tmp_initcalls.lds"
> -
> -               # This might take a while, so indicate that we're doing
> -               # an LTO link
> -               info LTO ${1}
> -       else
> -               info LD ${1}
> -       fi
> -
> -       ${LD} ${KBUILD_LDFLAGS} -r -o ${1} ${lds} ${objects}
> -}
> -
>  objtool_link()
>  {
>         local objtoolcmd;
> @@ -336,7 +297,7 @@ fi;
>  ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
>
>  #link vmlinux.o
> -modpost_link vmlinux.o
> +${MAKE} -f "${srctree}/scripts/Makefile.vmlinux_o"
>  objtool_link vmlinux.o
>
>  # Generate the list of objects in vmlinux
> --
> 2.32.0
>
