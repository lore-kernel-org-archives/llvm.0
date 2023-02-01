Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA73201
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 23:28:49 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id bf19so176544ljb.6
        for <llvm@lists.linux.dev>; Wed, 01 Feb 2023 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1TJGIvRrjUyr/9IaggmaLPZelXPwdqIaj19FFw1HR84=;
        b=cfmC9qCNz6NafgTKqfctc3/FV1eJol6vi1JPQgIAXKAdYE/TO61FpTE7RaIFztDcBw
         X7dAEh/5GBCZ7Z/CMNG59rPZ1AlwQkQD4v56erQiNDlchRnP5LKmPQkWCp1sXRdb1Gcn
         Zf1tuQHwYsAmruGPXjofX98Cs3szAfaclKirr4GQ+SqA8g3cXK0YWwoXZUbpCQHXbw0B
         RmFCZclxe0RqH8SJnISlXfV7tpv5z3+eMHBBOUKq1dYK+TZAKjHnSpYNHXbMi3UYS1LU
         CWrb3jQnk5bYf/4WMqJ3UPIvY63YOPSG4I/CsbEdfXXeX91rCWE5oNdFxEu/vGUyx14r
         vK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TJGIvRrjUyr/9IaggmaLPZelXPwdqIaj19FFw1HR84=;
        b=riCF4ZB2F/MgshxUGKL4zh7dvff3i6q4Pwuv76pxO6KcS7YKPN+MJvncWU9yuSQDz0
         Ny5os4UOQhcyKGEQG4bMuqg/3mbK1p7p3WBveo6JF3ahC8JVLl82R+fND9iS29hEc/eB
         Knr7CpV14im49s/p9ikLbVVM7q366Pk257miwJC+VNEZbpB6GZGOEOmKS77jBcmcJkF5
         3Uygwh8FPMVsAfejoqQ6PbuwQb6cfpJCzuRHn1KyA9rKyGOo8IwR+bBmlOxXCOYapjeZ
         qe6XPO+snHWpJZxE9ZCzwZz6z4JuMnHG8RDnruAm3fu6x/qivJVN0Ii64BENriu0txoW
         Y98w==
X-Gm-Message-State: AO0yUKVnbsYdrdUkrV+RWih+8yNC+ODFldXRgbsTcapXZTIAV5UBn0wh
	Dh+AY4lHBs6LhPLutAA9B/a6I2BxAcoco9RJLs4=
X-Google-Smtp-Source: AK7set9igR3QIgrtrWCvjA166/G4Bk0ijI+kCf7WjSnT+JQn8Ah14oogcJFxL9Gpoujs/RLjO/RtYvYjgH2FrdE8N+g=
X-Received: by 2002:a2e:5717:0:b0:290:4fce:f881 with SMTP id
 l23-20020a2e5717000000b002904fcef881mr606608ljb.126.1675294127194; Wed, 01
 Feb 2023 15:28:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230201192509.4124319-1-ndesaulniers@google.com>
In-Reply-To: <20230201192509.4124319-1-ndesaulniers@google.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 2 Feb 2023 00:28:10 +0100
Message-ID: <CA+icZUVFjpZBL-kNJFkU+-L_23DuErcFKMhsquNmMSwFS+eEWA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add Chimera Linux, Google and Meta datacenters
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>, Yonghong Song <yhs@fb.com>, 
	Daniel Kolesa <q66@chimera-linux.org>, Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 1, 2023 at 8:47 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Chimera Linux is a Linux distribution from 2021 that builds its kernels
> with Clang.
>
> Google transitioned its data center fleet to run Clang built kernels in
> 2021, and Meta did so as well in 2022.  Meta talked about this at LPC
> 2022 at a talk titled Kernel Live Patching at Scale.
>
> These were important milestones for building the kernel with Clang.
> Making note of them helps improve confidence in the project.
>
> Signed-off-by: Yonghong Song <yhs@fb.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Cc: Daniel Kolesa <q66@chimera-linux.org>
> Cc: Chris Mason <clm@meta.com>
> ---
>  Documentation/kbuild/llvm.rst | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 6b2bac8e9ce0..6a37ab903e45 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -15,12 +15,15 @@ such as GCC and binutils. Ongoing work has allowed for `Clang
>  <https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
>  used as viable substitutes. Distributions such as `Android
>  <https://www.android.com/>`_, `ChromeOS
> -<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
> -<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
> -collection of toolchain components implemented in terms of C++ objects
> -<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
> -supports C and the GNU C extensions required by the kernel, and is pronounced
> -"klang," not "see-lang."
> +https://www.chromium.org/chromium-os>`_, `OpenMandriva
> +<https://www.openmandriva.org/>`_, and `Chimera Linux
> +<https://chimera-linux.org/>`_ use Clang built kernels. Google's and Meta's
> +datacenter fleets also run kernels built with Clang.
> +
> +`LLVM is a collection of toolchain components implemented in terms of C++
> +objects <https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM
> +that supports C and the GNU C extensions required by the kernel, and is
> +pronounced "klang," not "see-lang."
>

Nick thanks for the patch!

My ex-colleague Bernd Helmle corrected me - it's not "See-Lang" it's
"Klang" and encouraged me to work on ClangBuiltLinux.

"Klang" means German tone, sound, etc. like vocal tone.

That "sounds" nice (shrillness):
clangor (AE) / clangour (BE) - schriller Klang (DE)

For Bernd:

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

BR,
-Sedat-

[1] https://dict.leo.org/englisch-deutsch/Klang

>  Clang
>  -----
> --
> 2.39.1.456.gfc5497dd1b-goog
>
