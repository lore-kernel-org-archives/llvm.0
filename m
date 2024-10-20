Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3E1FDA
	for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729442012; cv=none; b=gdtl+RQJnChp9bnt5PexeOeekbp7NZTPMS0MVeQZhlAwofEzyJpBP7YRsf+Otvz8RgndW78bpk/igMeJ/wae0DgTgvmOCJ2WweEcnlnzJcM7a26xc9oqZCsTPWRQkHUTCMUjXtrLFVgsvMRRlsHIs+msLm222ZVd2LmxJ0daKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729442012; c=relaxed/simple;
	bh=uPFnGWDTdB8fCmlssabZmdFxdbw/lBbpoj15YwsGW9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqMfSEZb1sEWnLzk6QXKDR/sTYa3MN6YkvJlXk9Wq08GtTxOus+KVmSk1h4yC5q/fljBdpxy7/GIB1yvQjficHO8zfHmyohDj3X4j910R92f29Aed3CG6sp88wjuEgNcBXs4fEw6m1TX+iXW5RQo9LZ7gYSRWs4MYTUKw79ZEzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRbis/Mk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRbis/Mk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FEBC4CEE7
	for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729442012;
	bh=uPFnGWDTdB8fCmlssabZmdFxdbw/lBbpoj15YwsGW9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vRbis/Mk//J9/SPvA40etThDNfNL8tHSDZKqFMFM2zDDZxBYPnC3YUk2WUCdjsfWG
	 L64cwpZr2d1bWkypTu+Np8o1kpm1lFPYblGBWkBVBS7yUg6KYzOfzPUVxut+5PQmDC
	 kZDsqAJxykFJifng8Ea2od+ZEfHry93ZFKAiVl/Bbp7nvao9oB56FDsoJQQCvl3QAj
	 VI6/1Lp5XFNHVugkOrMpGdYqNTxF2ALHuOelVPrfh8OQ7M5ySz8JQ4atZxOp9d8yuv
	 6I0IGCFpahS58PR9Wufp3Vcx4vofvROubSrTT3XihI+mphJBiln4TWqUMTomnoqryF
	 3DfihlfemQO6A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a097aa3daso3440485e87.1
        for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 09:33:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUanlbSmrEmJSMmR0RderWC6jzmpoWpFg5ITK3x6H4Xtw593zolf+0a8UljO2SoAAp0c/XM@lists.linux.dev
X-Gm-Message-State: AOJu0YxVyANxNtOZ/yW8X2DxCr8AKTzd7wynvSViKNX110RcxV0DX+8l
	OZblfwk9KzTk2XrNzYDVcOp1YOEov8AsKqxq9iMsZABee2lw/OcFyV2IWPCh0hFfMH8F/B2FDsW
	L94HoYkvZetSykoaVnWCXBVImzYA=
X-Google-Smtp-Source: AGHT+IHRsYlqxXcM1oQgzvk1BylM0N3VPuu21Dvx0mE0WPjx0yBxJBLh7hgIROlqIeEZugzFSYbXaalAxT8cwivhBwk=
X-Received: by 2002:a05:6512:3da9:b0:539:8fcd:51f with SMTP id
 2adb3069b0e04-53a1522aa5emr4507693e87.30.1729442010869; Sun, 20 Oct 2024
 09:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-2-xur@google.com>
In-Reply-To: <20241014213342.1480681-2-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 21 Oct 2024 01:32:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5yNKvZDtJuvo9Lt4rZwLSv0UN4=Ff=WcCDy1CCEpQ7Q@mail.gmail.com>
Message-ID: <CAK7LNAQ5yNKvZDtJuvo9Lt4rZwLSv0UN4=Ff=WcCDy1CCEpQ7Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] Add AutoFDO support for Clang build
To: Rong Xu <xur@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrote:


> +Customization
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +You can enable or disable AutoFDO build for individual file and director=
ies by
> +adding a line similar to the following to the respective kernel Makefile=
:


Perhaps, it might be worth mentioning that kernel space objects are
covered by default.

Then, people would understand ':=3D y' will be less common than ':=3D n'.




> +
> +- For enabling a single file (e.g. foo.o) ::
> +
> +   AUTOFDO_PROFILE_foo.o :=3D y
> +
> +- For enabling all files in one directory ::
> +
> +   AUTOFDO_PROFILE :=3D y
> +
> +- For disabling one file ::
> +
> +   AUTOFDO_PROFILE_foo.o :=3D n
> +
> +- For disabling all files in one directory ::
> +
> +   AUTOFDO_PROFILE :=3D n
> +




> +3) Run the load tests. The '-c' option in perf specifies the sample
> +   event period. We suggest using a suitable prime number, like 500009,
> +   for this purpose.
> +
> +   - For Intel platforms::
> +
> +      $ perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c <count> =
-o <perf_file> -- <loadtest>
> +
> +   - For AMD platforms: For Intel platforms:


I guess this is a copy-paste mistake.


For AMD platforms: For Intel platforms:

   ->

For AMD platforms:






> +   (https://github.com/google/autofdo),  version v0.30.1 or later.


Please one space instead of two after the comma.







> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> new file mode 100644
> index 000000000000..1c9f224bc221
> --- /dev/null
> +++ b/scripts/Makefile.autofdo
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Enable available and selected Clang AutoFDO features.
> +
> +CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable-fs-d=
iscriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> +
> +# If CONFIG_DEBUG_INFO is not enabled, set -gmlt option.


Meaningless comment. It explains too obvious code.


> +ifndef CONFIG_DEBUG_INFO
> +  CFLAGS_AUTOFDO_CLANG +=3D -gmlt
> +endif




> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 01a9f567d5af..e85d6ac31bd9 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -191,6 +191,16 @@ _c_flags +=3D $(if $(patsubst n%,, \
>         -D__KCSAN_INSTRUMENT_BARRIERS__)
>  endif
>
> +#
> +# Enable Clang's AutoFDO build flags for a file or directory depending o=
n
> +# variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE.
> +#


This comment would give the wrong understanding that this flag is opt-in.


The comment for KASAN correctly describes that it is enabled by default,
and can be opted out using KASAN_SANITIZE_*.





--
Best Regards


Masahiro Yamada
