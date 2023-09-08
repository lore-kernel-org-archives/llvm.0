Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A2111B
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 23:02:34 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68becf931d0so2254700b3a.3
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694214154; x=1694818954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3gm03RUg+/EX5Gaa+EMR3lyCYLZB5fnaib13/h9Wog=;
        b=E5Vgx4VtYDabJIcGxobTm7YFAllAsloR8ZDUZIADJ840Jbc168I84+ltAReWP1sfzV
         E+JTusZzLJI+EYO22M8RRjT+/+kN3Q4UCZmu2AVNXf/WpGq+1dOGbqBmgfobvqSB5dsf
         rDMmWAkhilrAOJFsVMnf3V9NRIE102GWyBL/fm97GzRh9Or2ILACH/x/P9Sw97nyDQcN
         2pDudDHCj4uXzi4kn/C+qCjEW0benSU05qzTgt7ZWDLR/7mu9yPyyizpRsB2WpRVJlcc
         O0c9umAZo/SjqG/fHeBQ8MV51bHZDRCvUWrGm6XeC9u1ipLyA+OPtByM4lovgExTuMeL
         wDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694214154; x=1694818954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3gm03RUg+/EX5Gaa+EMR3lyCYLZB5fnaib13/h9Wog=;
        b=iK82yPYRTNBERKdrKVZGulfx9IminuLl1WyXzACbWS1bTDvYQLCFgfJZ+gZm41dc+x
         fZC8VqHNDV15xJwfeZDeePEimVw3kn4HrnlrdvsQazL8ceA81JI2n94XmtWKmRuAZHjH
         2hMOpLbpeh3sdiKQRGe0v8lp2LmYhMa5fv34vCY2y1O7ciXe1HmrRWzfCDnOT5FGYUiX
         pAVwIXBve7rQUbkFC+9hSg9klS6Q6XVbGOJtZ6+SR9oiaLdtlXfbhTpwE15ut20cE392
         +QRtC6ZU6qNoch22SFi5DN56eCivUe4dzfQDKDq7GeNjAakgtRQeV6TgsLoKoUbs7WSq
         O5PQ==
X-Gm-Message-State: AOJu0YwSudeBYxRJqZJ44egeJyfbm6CyV97ebVnk9xVx+BSVesE9uZQ5
	4iYD4Nr+Clgk9kWdzz+qLq19TKhpQq9h3ANddFIi8g==
X-Google-Smtp-Source: AGHT+IFS+Nskv6R1HWPO1fnwAzKoZR+l2MTbKrrsdbgDWCjS9RGNTlB1Vy9DYoCX21GSL+ppgh7S+Q==
X-Received: by 2002:a05:6a00:2494:b0:68a:4bef:5f9a with SMTP id c20-20020a056a00249400b0068a4bef5f9amr3856161pfv.0.1694214153767;
        Fri, 08 Sep 2023 16:02:33 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:d39f:a985:2060:eedd])
        by smtp.gmail.com with ESMTPSA id j20-20020a62e914000000b0068b1149ea4dsm1753544pfh.69.2023.09.08.16.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 16:02:33 -0700 (PDT)
Date: Fri, 8 Sep 2023 16:02:28 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
	linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	Benjamin Tissoires <bentiss@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/3] selftests/hid: fix building for older kernels
Message-ID: <ZPuoBBGossSy0EiO@google.com>
References: <20230908-kselftest-09-08-v2-0-0def978a4c1b@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908-kselftest-09-08-v2-0-0def978a4c1b@google.com>

On Fri, Sep 08, 2023 at 10:22:37PM +0000, Justin Stitt wrote:
> Hi, I am sending this series on behalf of myself and Benjamin Tissoires. There
> existed an initial n=3 patch series which was later expanded to n=4 and
> is now back to n=3 with some fixes added in and rebased against
> mainline.
> 
> This patch series aims to ensure that the hid/bpf selftests can be built
> without errors.
> 
> Here's Benjamin's initial cover letter for context:
> |  These fixes have been triggered by [0]:
> |  basically, if you do not recompile the kernel first, and are
> |  running on an old kernel, vmlinux.h doesn't have the required
> |  symbols and the compilation fails.
> |
> |  The tests will fail if you run them on that very same machine,
> |  of course, but the binary should compile.
> |
> |  And while I was sorting out why it was failing, I realized I
> |  could do a couple of improvements on the Makefile.
> |
> |  [0] https://lore.kernel.org/linux-input/56ba8125-2c6f-a9c9-d498-0ca1c153dcb2@redhat.com/T/#t
> 
> Changes from v1 -> v2:
> - roll Justin's fix into patch 1/3
> - add __attribute__((preserve_access_index)) (thanks Eduard)
> - rebased onto mainline (2dde18cd1d8fac735875f2e4987f11817cc0bc2c)
> - Link to v1: https://lore.kernel.org/all/20230825-wip-selftests-v1-0-c862769020a8@kernel.org/
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1698
> Link: https://github.com/ClangBuiltLinux/continuous-integration2/issues/61

Thanks to you and Benjamin for sorting all of this out! With this series
applied, I was able to build the hid selftests now without the previous
-Wvisibility diagnostics failing the build.

Tested-by: Nick Desaulniers <ndesaulniers@google.com> # Build

> ---
> Benjamin Tissoires (3):
>       selftests/hid: ensure we can compile the tests on kernels pre-6.3
>       selftests/hid: do not manually call headers_install
>       selftests/hid: force using our compiled libbpf headers
> 
>  tools/testing/selftests/hid/Makefile               | 10 ++---
>  tools/testing/selftests/hid/progs/hid.c            |  3 --
>  .../testing/selftests/hid/progs/hid_bpf_helpers.h  | 49 ++++++++++++++++++++++
>  3 files changed, 53 insertions(+), 9 deletions(-)
> ---
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> change-id: 20230908-kselftest-09-08-56d7f4a8d5c4
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
