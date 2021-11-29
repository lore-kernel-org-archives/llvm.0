Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E07429CA
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 23:51:18 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id f186so47082639ybg.2
        for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 15:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l7Mp/d6Rqmx/LRmJ5y1bc/kVe95zOiVJ5beMB8pxyLE=;
        b=j8OyLd7WUyHnCqZgxAHtSFGz5+Km4xZtxVyoPrepgt7SGdsw4c3GrNLK2KIY3x7lf2
         M1/tyM4i6ihC84jcEsnYoaRTkuL8QEYU2nEoLjF5lrOX6sP+JWNxsOplFuB9Q5a81Tei
         JBZUxJ0QKv4t/hLUbi+1VZJoBFbhZO+iUv5vhb0h9FrNgviSe0CibK4JttaqVGh90N3A
         WVtiZI+9gX7tcLY0enGqsewMTZ+bmfiNXCsMv86ccyYeRQKtAPY7t3KzeQtqDLkjwUK+
         BvaWGuUBm6J1TtP0uk46Z6sSIIOwaODThwwsU6g/53xivsfOsmwS8V3giUyUhsXfQglc
         /vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7Mp/d6Rqmx/LRmJ5y1bc/kVe95zOiVJ5beMB8pxyLE=;
        b=uKsikCPex3BqV+A8iHlPbSdzqyO/Xwh8g112PKv4yIZZsK/nq75pY4Bs7jT+0Xo1Xh
         Fz0l9wDwZF9OUvCX/gqBK+MBzVoZB7w5sjSCy24mDN3v+N4geTggo/ILtHLPJu1UTj+h
         ZF3d/23XXo6v50o9xSdxvpns6BfTxcpOB3iZ1I3lD8Jpq9YxK3IdK3P8d28jX4gd40MK
         h8iWYmRmA3cMP2AyXJJD7N7aH9Bqs5TqO+Wx4acdz+8ztUCDkBmAJV5gRxGvUpOXnE08
         lVJrhCoDTJfm+FHSGoMEjqaSsovB4yXCmrz1ccDqACl70VxehRtytaMkSbDEsmLURQRi
         GmqA==
X-Gm-Message-State: AOAM531ePIhwG7IE4UvdZDcAifShmjG1kMnQrP6eoX7iC7BfVOJjS9us
	g+yQ9ryipWssQaSMsm40DlXFHCTGxYHmoBgUiPk=
X-Google-Smtp-Source: ABdhPJwX81cDy3z4JXfLLsmO+XgVE9RTxTxaZ1TEENhIP4OzNX5qEis71t77WGOnNYYUG6A7Po0ir83tHv32XJB2Afw=
X-Received: by 2002:a05:6902:1006:: with SMTP id w6mr39165243ybt.252.1638229877383;
 Mon, 29 Nov 2021 15:51:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122192019.1277299-1-jean-philippe@linaro.org> <20211122192019.1277299-4-jean-philippe@linaro.org>
In-Reply-To: <20211122192019.1277299-4-jean-philippe@linaro.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 29 Nov 2021 15:51:06 -0800
Message-ID: <CAEf4BzYgeNQXHq2sWR1b2FNs6fC=FOQjxdNdtFVf5+-4Fory+g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/6] tools/libbpf: Enable cross-building with clang
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Martin Lau <kafai@fb.com>, 
	Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
	john fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 22, 2021 at 11:24 AM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Cross-building using clang requires passing the "-target" flag rather
> than using the CROSS_COMPILE prefix. Makefile.include transforms
> CROSS_COMPILE into CLANG_CROSS_FLAGS. Add them to the CFLAGS.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tools/lib/bpf/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index 5f7086fae31c..fe9201862aed 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -90,6 +90,7 @@ override CFLAGS += -Werror -Wall
>  override CFLAGS += $(INCLUDES)
>  override CFLAGS += -fvisibility=hidden
>  override CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> +override CFLAGS += $(CLANG_CROSS_FLAGS)
>
>  # flags specific for shared library
>  SHLIB_FLAGS := -DSHARED -fPIC
> @@ -162,7 +163,7 @@ $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
>  $(OUTPUT)libbpf.so: $(OUTPUT)libbpf.so.$(LIBBPF_VERSION)
>
>  $(OUTPUT)libbpf.so.$(LIBBPF_VERSION): $(BPF_IN_SHARED) $(VERSION_SCRIPT)
> -       $(QUIET_LINK)$(CC) $(LDFLAGS) \
> +       $(QUIET_LINK)$(CC) $(CLANG_CROSS_FLAGS) $(LDFLAGS) \

I haven't checked, but what would happen if we just use $(CFLAGS)
here? Would it still work?

>                 --shared -Wl,-soname,libbpf.so.$(LIBBPF_MAJOR_VERSION) \
>                 -Wl,--version-script=$(VERSION_SCRIPT) $< -lelf -lz -o $@
>         @ln -sf $(@F) $(OUTPUT)libbpf.so
> --
> 2.33.1
>
