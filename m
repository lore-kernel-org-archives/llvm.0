Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196987B
	for <llvm@lists.linux.dev>; Fri,  6 Jan 2023 09:24:54 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so3108559wmk.4
        for <llvm@lists.linux.dev>; Fri, 06 Jan 2023 01:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN3wmdzmTLqWXye5oDHMBQuxAiTpRZvNJRGwc3NjW2I=;
        b=DI79P0ulD48ko0W0kQzqD4bbbO/LESjHlP3K+3Gjqd5aq5qCjTjycUCVvjmwWb1a0g
         gHFLluMta509rrl+pNWWb+aSLbQ2Vx9q/WquEQA/P026QlYlFA5sh6byWNePTaqTqCKk
         OKJ0cEKn6QAh1GnPDQ33PZi3/5cA+5Q8Dfp7ZCJpvohQq5u0cSXIjXTzufhoATgbe4nk
         jk45rcLYOwhdbft2IvOijmRmNGSa4i+ZPZpmx0YCXJ48bbuVUbiWZ4o6gPHC35JWiGwL
         GOuMQJ8sAoO5MbwVTgtX6YH36bKJAtOZqNBL/p6+6GU5QRoy/FOBPGgwm8raKpStN+Fp
         GIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eN3wmdzmTLqWXye5oDHMBQuxAiTpRZvNJRGwc3NjW2I=;
        b=ZaYHvEyunb3WfPxKM/CZdIv9wxNEWVTcxD03vItjbZrXLAjeVxoqHZZNE2XFTv0PbY
         jCRrAVlHroQ62koMihJ8uIB1IIILXVclnt0ot2DEYq/K552TF4BXxmDPMJiao7e+3sqa
         E/EfF7Br3134sTIqb8qCHF9+AWyW0PVmXdYFdaEJV3+1HzMQKw9mKSX9oqgnA0QGhc5I
         /aawKTxxnBkDzpkt05QgErOiDjHSViwL/U/1fQ7+zsE7wUnd2zmBkzfOc7XnpUS/kiTG
         3TrKNJh08ikW4QA5EXVMWKg0mnxEMX1HudMapjII4fQaMZlsnneeNofFD3k1f27cLkT8
         +BJw==
X-Gm-Message-State: AFqh2kpdzlxJoPk22szUDAUZMrXMOXAsZnVbG+/pTtA+F9X3Fd4pj+xR
	cDm3V450UvJFtI08BJ/MZwg=
X-Google-Smtp-Source: AMrXdXvPuwuFCHi0wBSNMRA1fAyU8V/40zD5/QIHvmHwD+xoLKDHLsKubomynygyF8bJ9A2VooS6lQ==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id l32-20020a05600c1d2000b003d22aaf0316mr39335797wms.36.1672997093023;
        Fri, 06 Jan 2023 01:24:53 -0800 (PST)
Received: from localhost ([217.138.219.182])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm5909704wmo.39.2023.01.06.01.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:24:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jan 2023 10:24:49 +0100
Message-Id: <CPKZZ0T9YZQI.3REWBZJ04YQZR@vincent>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, "Nicolas Schier"
 <nicolas@fjasle.eu>, "Tom Rix" <trix@redhat.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, <llvm@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/6] kbuild: specify output names separately for each
 emission type from rustc
From: "Vincenzo" <vincenzopalazzodev@gmail.com>
To: "Masahiro Yamada" <masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
X-Mailer: aerc 0.8.2
References: <20221231064203.1623793-1-masahiroy@kernel.org>
 <20221231064203.1623793-2-masahiroy@kernel.org>
In-Reply-To: <20221231064203.1623793-2-masahiroy@kernel.org>

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>


On Sat Dec 31, 2022 at 7:41 AM CET, Masahiro Yamada wrote:
> In Kbuild, two different rules must not write to the same file, but
> it happens when compiling rust source files.
>
> For example, set CONFIG_SAMPLE_RUST_MINIMAL=3Dm and run the following:
>
>   $ make -j$(nproc) samples/rust/rust_minimal.o samples/rust/rust_minimal=
.rsi \
>                     samples/rust/rust_minimal.s samples/rust/rust_minimal=
.ll
>     [snip]
>     RUSTC [M] samples/rust/rust_minimal.o
>     RUSTC [M] samples/rust/rust_minimal.rsi
>     RUSTC [M] samples/rust/rust_minimal.s
>     RUSTC [M] samples/rust/rust_minimal.ll
>   mv: cannot stat 'samples/rust/rust_minimal.d': No such file or director=
y
>   make[3]: *** [scripts/Makefile.build:334: samples/rust/rust_minimal.ll]=
 Error 1
>   make[3]: *** Waiting for unfinished jobs....
>   mv: cannot stat 'samples/rust/rust_minimal.d': No such file or director=
y
>   make[3]: *** [scripts/Makefile.build:309: samples/rust/rust_minimal.o] =
Error 1
>   mv: cannot stat 'samples/rust/rust_minimal.d': No such file or director=
y
>   make[3]: *** [scripts/Makefile.build:326: samples/rust/rust_minimal.s] =
Error 1
>   make[2]: *** [scripts/Makefile.build:504: samples/rust] Error 2
>   make[1]: *** [scripts/Makefile.build:504: samples] Error 2
>   make: *** [Makefile:2008: .] Error 2
>
> The reason for the error is that 4 threads running in parallel creates
> and renames the same file path, samples/rust/rust_minimal.d.
>
> This does not happen when compiling C or assembly files because we
> explicitly specify the dependency filename by using the preprocessor
> option, -Wp,-MMD,$(depfile). $(depfile) is a unique path for each target.
>
> Currently, rustc is only given --out-dir and the list of emitted types.
> So, all the rust build rules output the dep-info into the default
> <CRATE_NAME>.d, causing the conflict.
>
> Fortunately, the --emit option is able to specify the output path
> individually, with the form --emit=3D<type>=3D<path>.
>
> Add --emit=3Ddep-info=3D$(depfile) to the common command part. Also, remo=
ve
> the redundant --out-dir because we specify the output path for each type.
>
> The code gets much cleaner because we do not need to rename *.d files.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  rust/Makefile          | 10 ++++------
>  scripts/Makefile.build | 14 +++++++-------
>  scripts/Makefile.host  |  9 +++------
>  3 files changed, 14 insertions(+), 19 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index ff70c4c916f8..0e2a32f4b3e9 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -331,10 +331,9 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o F=
ORCE
>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro =3D \
>  	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> -		--emit=3Ddep-info,link --extern proc_macro \
> -		--crate-type proc-macro --out-dir $(objtree)/$(obj) \
> +		--emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --extern proc_macro =
\
> +		--crate-type proc-macro \
>  		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<; \
> -	mv $(objtree)/$(obj)/$(patsubst lib%.so,%,$(notdir $@)).d $(depfile); \
>  	sed -i '/^\#/d' $(depfile)
> =20
>  # Procedural macros can only be used with the `rustc` that compiled it.
> @@ -348,10 +347,9 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUST=
C,$(RUSTC_OR_CLIPPY_QUIET)) L
>  	OBJTREE=3D$(abspath $(objtree)) \
>  	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>  		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
> -		--emit=3Ddep-info,obj,metadata --crate-type rlib \
> -		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
> +		--emit=3Ddep-info=3D$(depfile) --emit=3Dobj=3D$@ --emit=3Dmetadata=3D$=
(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
> +		--crate-type rlib -L$(objtree)/$(obj) \
>  		--crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
> -	mv $(objtree)/$(obj)/$(patsubst %.o,%,$(notdir $@)).d $(depfile); \
>  	sed -i '/^\#/d' $(depfile) \
>  	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
> =20
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a0d5c6cca76d..40de20246e50 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -285,11 +285,11 @@ rust_common_cmd =3D \
>  	-Zcrate-attr=3Dno_std \
>  	-Zcrate-attr=3D'feature($(rust_allowed_features))' \
>  	--extern alloc --extern kernel \
> -	--crate-type rlib --out-dir $(obj) -L $(objtree)/rust/ \
> -	--crate-name $(basename $(notdir $@))
> +	--crate-type rlib -L $(objtree)/rust/ \
> +	--crate-name $(basename $(notdir $@)) \
> +	--emit=3Ddep-info=3D$(depfile)
> =20
>  rust_handle_depfile =3D \
> -	mv $(obj)/$(basename $(notdir $@)).d $(depfile); \
>  	sed -i '/^\#/d' $(depfile)
> =20
>  # `--emit=3Dobj`, `--emit=3Dasm` and `--emit=3Dllvm-ir` imply a single c=
odegen unit
> @@ -302,7 +302,7 @@ rust_handle_depfile =3D \
> =20
>  quiet_cmd_rustc_o_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
>        cmd_rustc_o_rs =3D \
> -	$(rust_common_cmd) --emit=3Ddep-info,obj $<; \
> +	$(rust_common_cmd) --emit=3Dobj=3D$@ $<; \
>  	$(rust_handle_depfile)
> =20
>  $(obj)/%.o: $(src)/%.rs FORCE
> @@ -310,7 +310,7 @@ $(obj)/%.o: $(src)/%.rs FORCE
> =20
>  quiet_cmd_rustc_rsi_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
>        cmd_rustc_rsi_rs =3D \
> -	$(rust_common_cmd) --emit=3Ddep-info -Zunpretty=3Dexpanded $< >$@; \
> +	$(rust_common_cmd) -Zunpretty=3Dexpanded $< >$@; \
>  	command -v $(RUSTFMT) >/dev/null && $(RUSTFMT) $@; \
>  	$(rust_handle_depfile)
> =20
> @@ -319,7 +319,7 @@ $(obj)/%.rsi: $(src)/%.rs FORCE
> =20
>  quiet_cmd_rustc_s_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
>        cmd_rustc_s_rs =3D \
> -	$(rust_common_cmd) --emit=3Ddep-info,asm $<; \
> +	$(rust_common_cmd) --emit=3Dasm=3D$@ $<; \
>  	$(rust_handle_depfile)
> =20
>  $(obj)/%.s: $(src)/%.rs FORCE
> @@ -327,7 +327,7 @@ $(obj)/%.s: $(src)/%.rs FORCE
> =20
>  quiet_cmd_rustc_ll_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
>        cmd_rustc_ll_rs =3D \
> -	$(rust_common_cmd) --emit=3Ddep-info,llvm-ir $<; \
> +	$(rust_common_cmd) --emit=3Dllvm-ir=3D$@ $<; \
>  	$(rust_handle_depfile)
> =20
>  $(obj)/%.ll: $(src)/%.rs FORCE
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index da133780b751..4434cdbf7b8e 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -84,8 +84,8 @@ _hostc_flags   =3D $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRAC=
FLAGS)   \
>                   $(HOSTCFLAGS_$(target-stem).o)
>  _hostcxx_flags =3D $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
> -_hostrust_flags =3D $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
> -                  $(HOSTRUSTFLAGS_$(target-stem))
> +hostrust_flags =3D $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
> +                  $(HOSTRUSTFLAGS_$(target-stem)) --emit=3Ddep-info=3D$(=
depfile)
> =20
>  # $(objtree)/$(obj) for including generated headers from checkin source =
files
>  ifeq ($(KBUILD_EXTMOD),)
> @@ -97,7 +97,6 @@ endif
> =20
>  hostc_flags    =3D -Wp,-MMD,$(depfile) $(_hostc_flags)
>  hostcxx_flags  =3D -Wp,-MMD,$(depfile) $(_hostcxx_flags)
> -hostrust_flags =3D $(_hostrust_flags)
> =20
>  #####
>  # Compile programs on the host
> @@ -149,9 +148,7 @@ $(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
>  # host-rust -> Executable
>  quiet_cmd_host-rust	=3D HOSTRUSTC $@
>        cmd_host-rust	=3D \
> -	$(HOSTRUSTC) $(hostrust_flags) --emit=3Ddep-info,link \
> -		--out-dir=3D$(obj)/ $<; \
> -	mv $(obj)/$(target-stem).d $(depfile); \
> +	$(HOSTRUSTC) $(hostrust_flags) --emit=3Dlink=3D$@ $<; \
>  	sed -i '/^\#/d' $(depfile)
>  $(host-rust): $(obj)/%: $(src)/%.rs FORCE
>  	$(call if_changed_dep,host-rust)
> --=20
> 2.34.1

