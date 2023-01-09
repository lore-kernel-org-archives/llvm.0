Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911B5233
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 22:17:35 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so14371789pjj.2
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 14:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xGvurkR1Vr6sjo81OlaobHYxvZ0qlIiCt9EHEneHOsE=;
        b=DDZCTOCMHFE5ZjjCoXo6qIhcEGDmOZ7PVc9Am94F7Yk18Ol7+jsiYYIKULyIJ3QCJp
         iCL2XR16382+0R/lkiR8Ge6jNXB9uIjZWKRCGuq18T+2ZvWyTod6WDdQSBiARkqi8N/F
         7sKjhOkY+KoCSbCxFLS9kp71a2Fbz8MvEepczM/+WVzg7DDSuZT7OwofpTLbpYOX4XDq
         gg4Afss7nfhUt1X59LtfRzIK1b50H8l76BJjOZlJv3QZ8vPKaVaSpvW1lCim3j45N9Ya
         SzbkyYIunNLQKNcJ9NWYw8TCVyLI8R/34wzeeaKr5l1psASdlpWyJgj5moBG0lEOXiL+
         ghrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGvurkR1Vr6sjo81OlaobHYxvZ0qlIiCt9EHEneHOsE=;
        b=AXyTgtg8gPhofhENB2FTl4juhsf69aTcFH7P4Ws+O1GYv7f59JUcW3Jdon2AYuG4Yz
         LSJuTJWQlATQvFH5ph1JdGbrK98kTr1qNcX+ldI1yBydJ1RoQ5+7hxb/WWorNfx3Q/n2
         uNvnGQrMyTK+pS8pQ+b63f1/9UhVUQa0Q0Ci2lVubWstWXRtbeejNaXXHueFPXhEU3SP
         yXLtznVv+VzmPAWyHIBz+Kqj8cpwDTpomhC+hGgrdtyyV5m1n6U46+Zg8KSDj9KJ3X+H
         HqcDqvTaXkq1y8qia+0ok6Vr2SkNWBtKoQ2063xLZBSvcD9Zaso6RHVnvMibtr865/0G
         s5Nw==
X-Gm-Message-State: AFqh2kr7tGT/NiFinZtaKqvUPu2t9yrAwsx6RP9ODgLmVeuWEuedbba0
	yR17JFbc7r1vgQPDKL9dgYAL4PiUdRajsgwCMl+fufvbNQEB2A==
X-Google-Smtp-Source: AMrXdXsbEkI8ioQJlwLD7T5rd6K+n/Z046jK7Ma+7vkOIPXQukf7w9g5uyGrECSfGxO6LFFR0t9JF51Ub2jBHdYPCo8=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr2188673pjh.102.1673302655184; Mon, 09
 Jan 2023 14:17:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-14-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-14-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 14:17:23 -0800
Message-ID: <CAKwvOdkk+U8Nkh9R4FRdfTe4y-SvhUXXiMWA4OS0EkUqwNiEnQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] kbuild: Stop using '-Qunused-arguments' with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This option masks all unused command line argument warnings, which can
> hide potential issues, such as an architecture Makefile adding an
> unsupported flag to KBUILD_AFLAGS or KBUILD_CFLAGS, which will cause all
> as-option and cc-options to silently fail due to -Werror with no
> indication as to why in the main kernel build.
>
> Remove this flag so that warnings of this nature can be caught early and
> obviously in a build.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Nice job on the series!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c05b4fb7121e..4bc79d2a42f2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -878,7 +878,6 @@ KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
>  KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
>
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CPPFLAGS += -Qunused-arguments
>  # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
>  KBUILD_CFLAGS += -Wno-gnu
>  else
>
> --
> 2.39.0
>


-- 
Thanks,
~Nick Desaulniers
