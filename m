Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADD2CA0
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 23:54:03 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id d10so14239315ybn.0
        for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 15:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihgaAo5WogGBIFfA3JZxyc+oZmIt9Qx839HnIX4rjoI=;
        b=guDk9nJM7g1OQB8G516LjubGKYIcju2I7Qlm5/Xi1wuO3ehF4L3sdWHF0u7kqb1Ho3
         O3A+9zNvaYMoEM+ZTmQkBWV2Iaf2C9hvieQ0UKDOK7Fd5QslztB/YHwnKvPMwSf2aQLM
         okz/tT8jGYS7+r/Dvl96bZs2FaJez8bS/UaZOriw9BstCfOLCCWh6zqjoJmsbSTOcGt4
         yb+QkoTPp42OjVW9VyBMOCKu4k8GQWQvjRq231IMc8pfjXePBVx4OoWoQ/XTSxN2o3Hw
         8FJlrULUPl7vSnRXnnXLfQqz/R6dv9dZzvVFD0cLv2aHc4OC3N4RxYIOfdoyWpWZxswX
         75hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihgaAo5WogGBIFfA3JZxyc+oZmIt9Qx839HnIX4rjoI=;
        b=3kj5OqrTVtkYfKrv4vP7XnQNwpPpIfZO/QAOUuusFjAjMmJZdbbjXs7JssT4LR0A25
         h9IyOPkgSDdvRAyy0ZRoCJRJ83Peg5PNdni3ihyJ6gKnA4l4q8KOVgDF82i5qTMykO+n
         drmOQKgiTOI20FDG2d9BdTsHQYEkFOKvPui52KWDQPV+x6EZUOyNIxVHUJibh/I7Hwif
         qbGO/OdPVz0oFMWIoUE6oCfFkooi/gcDXns1udMbDA/m3rTR9D45Q0oLQC2pLCLvLB6g
         CpSJXlh1lb0KW7KV5WsasUYSlT9b46z89QYU8W5D10SbVXAI3nSojpgySQVugYCHPXfP
         lhbw==
X-Gm-Message-State: AOAM5301aTsb1o3I4AoEPFZ4IUnwezp3ZF6UEh+Q2T604Z5rbMU6qAjx
	gr8xVkBiKUGzKFgnILWRpwKN0ycOc1juwYoKl0A=
X-Google-Smtp-Source: ABdhPJwdcmgKmBpWz4w+ApPLRcuF96Te+4ObOthk2sNbDOGKdiu3XWwv4T4b9DIlUez7Ic7VMbhmtS0RjoLNAJi4BVg=
X-Received: by 2002:a25:abaa:: with SMTP id v39mr37900854ybi.367.1638230042280;
 Mon, 29 Nov 2021 15:54:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122192019.1277299-1-jean-philippe@linaro.org> <20211122192019.1277299-5-jean-philippe@linaro.org>
In-Reply-To: <20211122192019.1277299-5-jean-philippe@linaro.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 29 Nov 2021 15:53:51 -0800
Message-ID: <CAEf4BzbwYoaN8aBF+w=VK7MAv=-WNzffyA-puwAm8633Not-6g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/6] bpftool: Enable cross-building with clang
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Martin Lau <kafai@fb.com>, 
	Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
	john fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 22, 2021 at 11:23 AM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Cross-building using clang requires passing the "-target" flag rather
> than using the CROSS_COMPILE prefix. Makefile.include transforms
> CROSS_COMPILE into CLANG_CROSS_FLAGS, and adds that to CFLAGS. Filter
> out the cross flags for the bootstrap bpftool, and erase the
> CROSS_COMPILE flag for the bootstrap libbpf.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tools/bpf/bpftool/Makefile | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> index 42eb8eee3d89..b0f3e17d981a 100644
> --- a/tools/bpf/bpftool/Makefile
> +++ b/tools/bpf/bpftool/Makefile
> @@ -57,7 +57,7 @@ $(LIBBPF_INTERNAL_HDRS): $(LIBBPF_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_HDRS_
>  $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT)
>         $(Q)$(MAKE) -C $(BPF_DIR) OUTPUT=$(LIBBPF_BOOTSTRAP_OUTPUT) \
>                 DESTDIR=$(LIBBPF_BOOTSTRAP_DESTDIR) prefix= \
> -               ARCH= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
> +               ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
>
>  $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS): $(LIBBPF_BOOTSTRAP_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_BOOTSTRAP_HDRS_DIR)
>         $(call QUIET_INSTALL, $@)
> @@ -152,6 +152,9 @@ CFLAGS += -DHAVE_LIBBFD_SUPPORT
>  SRCS += $(BFD_SRCS)
>  endif
>
> +HOST_CFLAGS = $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUDE),\
> +               $(filter-out $(CLANG_CROSS_FLAGS),$(CFLAGS)))

Isn't this dangerous? CLANG_CROSS_FLAGS are treated as space-separated
array of values, so if you have something like '-I whatever' it will
actually filter out unrelated -Is from CFLAGS, no? I'd rather subst
into empty string instead, just like we do for LIBBPF_INCLUDE.

> +
>  BPFTOOL_BOOTSTRAP := $(BOOTSTRAP_OUTPUT)bpftool
>
>  BOOTSTRAP_OBJS = $(addprefix $(BOOTSTRAP_OUTPUT),main.o common.o json_writer.o gen.o btf.o xlated_dumper.o btf_dumper.o disasm.o)
> @@ -202,7 +205,7 @@ endif
>  CFLAGS += $(if $(BUILD_BPF_SKELS),,-DBPFTOOL_WITHOUT_SKELETONS)
>
>  $(BOOTSTRAP_OUTPUT)disasm.o: $(srctree)/kernel/bpf/disasm.c
> -       $(QUIET_CC)$(HOSTCC) $(CFLAGS) -c -MMD $< -o $@
> +       $(QUIET_CC)$(HOSTCC) $(HOST_CFLAGS) -c -MMD $< -o $@
>
>  $(OUTPUT)disasm.o: $(srctree)/kernel/bpf/disasm.c
>         $(QUIET_CC)$(CC) $(CFLAGS) -c -MMD $< -o $@
> @@ -213,15 +216,13 @@ ifneq ($(feature-zlib), 1)
>  endif
>
>  $(BPFTOOL_BOOTSTRAP): $(BOOTSTRAP_OBJS) $(LIBBPF_BOOTSTRAP)
> -       $(QUIET_LINK)$(HOSTCC) $(CFLAGS) $(LDFLAGS) $(BOOTSTRAP_OBJS) $(LIBS_BOOTSTRAP) -o $@
> +       $(QUIET_LINK)$(HOSTCC) $(HOST_CFLAGS) $(LDFLAGS) $(BOOTSTRAP_OBJS) $(LIBS_BOOTSTRAP) -o $@
>
>  $(OUTPUT)bpftool: $(OBJS) $(LIBBPF)
>         $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $@
>
>  $(BOOTSTRAP_OUTPUT)%.o: %.c $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS) | $(BOOTSTRAP_OUTPUT)
> -       $(QUIET_CC)$(HOSTCC) \
> -               $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUDE),$(CFLAGS)) \
> -               -c -MMD $< -o $@
> +       $(QUIET_CC)$(HOSTCC) $(HOST_CFLAGS) -c -MMD $< -o $@
>
>  $(OUTPUT)%.o: %.c
>         $(QUIET_CC)$(CC) $(CFLAGS) -c -MMD $< -o $@
> --
> 2.33.1
>
