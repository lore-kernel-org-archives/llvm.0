Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2008F1859
	for <llvm@lists.linux.dev>; Sun,  8 Jan 2023 21:56:41 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 194so4747589ybf.8
        for <llvm@lists.linux.dev>; Sun, 08 Jan 2023 13:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weoSnaHHRzPUIS2PJ2baxYU/e708niinbN3stK9FOPs=;
        b=Kb+3aDB6Z3rzJfQCcq6QIY1F6jECCpWu+KDijxn7jMZbuFvEzy7OOgb8Ai0cQ48mKJ
         CZS0tOJk7ysCn9lj6/EbmfQ2H06bwahvhI36KnKwEI6iUYChksMXGCVNaP4iXJ9rvLE7
         g4bDjlykbdaMhBMI9GR9zuZzixThD62+3W/oREGuqRWuOS0tzvq1y38ySdWX3BbLPMDC
         dl5o5YQC85QyPnmTcFUHlF35tFAyD5F3oZ0rx9xjEJR7Ya49zagNKkybyVDpy3Yq5SB+
         22NKuDaJU9Quza9m3xbyPDR5c5rtQJnFRclK/O9Fd6OrilgAVQhGuv/T06o4oiixNSYT
         aNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weoSnaHHRzPUIS2PJ2baxYU/e708niinbN3stK9FOPs=;
        b=35Qgr3T66sN9e1nGQ8fce4LdsdhdT8g6ixA4tLc9GBo5U+y4X6yk33Vdf81NesLOvN
         pGQsw+ux5BSJ6La1tk1JtItxgflbmrorCcygqK7+KOXq4hwjwF+H8uUfB6w+6l1d8Vie
         FrifM5Z77hXUMlPck3SNyTSBVkr5E2ADn/4kEOxoIO2iF2a+3K2FQqtKg1xlDUnDaONl
         3Bivri96dWQO+iWS8zSnG8PxtdWDVPc9p/H5rydXXcjT9ZlB2RjSb+w36DtQZs/skdAV
         nFslarGghkM1WKk5XWmc8HgygI53ie5KuZhQ5ctdkDCdLp/mTUA9NfwGTQ5sUjUmqeAd
         iyfQ==
X-Gm-Message-State: AFqh2koAaHdUYyewQKAJenyyGAFa3RYTeZfGvr81V3yWO4tUBXw/W9xc
	TDZcYQhLZDzBUz4aRXlzO4peUDz5566qsYnnLT4=
X-Google-Smtp-Source: AMrXdXu3vT5SqiH7IDKisW1KgKS5L0uteSVQ09IqaZl8P7p1dT5WE0lri8gQekPgJPIu9rKWXkBWV+vte/tpx5gAEZ8=
X-Received: by 2002:a25:7653:0:b0:6f9:13cc:de91 with SMTP id
 r80-20020a257653000000b006f913ccde91mr7377146ybc.328.1673215001045; Sun, 08
 Jan 2023 13:56:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231082739.1629735-1-masahiroy@kernel.org>
In-Reply-To: <20221231082739.1629735-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Jan 2023 22:56:30 +0100
Message-ID: <CANiq72nyckkPgbc9y1DS00i1+WvNGcDF7MmWaom89ZCb_ufZxw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: remove -v option of scripts/rust_is_available.sh
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 9:27 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The -v option is passed when this scripts is invoked from Makefile,

scripts -> script

> but not when invoked from Kconfig.
>
> As you can see in scripts/Kconfig.include, the 'success' macro suppresses
> stdout and stderr anyway, so this script does not need to be quiet.

Yeah, let's get rid of the complexity. The script originally was
intended to be usable independently of the `Makefile`, but in the end
we don't really use it like that.

In fact, now we should probably add a warning/error if somebody calls
it directly (and/or set defaults for the variables). I can send a
patch for that on top of this one.

There is a small functional change, in that we will be making an
unneeded call to `cc-version.sh` and another to `$CC` for the Kconfig
case (i.e. the previously non-verbose case), but that seems like a
fine price for the simplicity.

> --- a/scripts/rust_is_available.sh
> +++ b/scripts/rust_is_available.sh

Could you please remove the comment at the top? i.e.:

    #
    # Pass `-v` for human output and more checks (as warnings).

With that:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

If you want me to take it, please let me know.

Cheers,
Miguel
