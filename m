Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C9F1E0DE9
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 22:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729550617; cv=none; b=O0NXokLrvbRKGqoq2XquGi0PYxJyIqbAZvT33MTtawtou7biAOuoceyY5E5W77wJXIdZCx8hsBTSc3A2TaXhTB6MJQaTmh2JQu+onp5rVT22fPO2mEBRmQuTIJEV8nKf/rN+Ldb8U36ngJDvnHOkXiGAqn4w20RKIH9Q3thJElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729550617; c=relaxed/simple;
	bh=18SuxrItI+6f+tfrvR4g2u78bJrgXnBh0EqpwvVjrEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwrgvVSI7ovvyju8CfZdxPwyDTKprxQEh6QXIprlCzWkPLCE7vuAOSj7118qqLD5VXtqrXNls2zTdgf5lTJYbwujhfayktEa+5Em9R98b2//NE5ZWxOGYKNIAn3WFOo3ILS3USJA8JXF9AqmWo2ewHPV404DaV+FZZI/kKohUqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SHFTW1v8; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SHFTW1v8"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a3b3f4b599so93125ab.0
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729550615; x=1730155415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yovHp8/4KQS/SjRw8rzJ2RWtyZhJZCAGgSQbJZaDAus=;
        b=SHFTW1v8f9Yzgi5rfwIetfo/IVwGv7DubYwwrBgGZ01XKu7PE2rwtu+5l1YfQCjS4Z
         TJwStZoPFJu8dhE2k9AJ9ycfdsxWK82JRCbzXWDCYTPUDyXXHtOtY7AveUNcFzq75yib
         1FuHsomdDaoIY5sJ2aYUv+pdnvFSXYfygZ92KF9JrjDK0c1P/OBiimhyZDKfSSiLVq4z
         0mTIf0CQjxabxQgIs0oLwid00Q5jkZ/6EtsyiqWi1xbpiSSSbdecFvezby2EIJshDFFG
         L2F3gG9A7+GekZ05EamQ8W647KSQZIyVxDQiqGHjQFis4N6Bmixu1GJfBEhuORcj5yFZ
         LB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729550615; x=1730155415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yovHp8/4KQS/SjRw8rzJ2RWtyZhJZCAGgSQbJZaDAus=;
        b=hrDF4EQqU1p65l7bGoO25QjT/gnrbkXsi0mLTbmSH4tWE+SMVxwhbfTOIq8dAEN7Lm
         H2iEPrMMQjpTgvmBKpLPdSWZ6cET6FHRrgmcwHz2rk8vZeBeEVLEHWvzBlIpt3Qcbv+W
         9a3F4S6wCuYSWgTPqMFD5OHezOu6vNa1csNyDW1vk809arOlcuXmKEtZvCRhvmDToVnm
         6Pp2Soi9YaiYYx4thQgN4KzQUtBeXIvw66ozF9AaYIqLt7YkccUFIfl1tLSRDX/jcnTd
         wzAt54EcP6KNO3b8rgr+2lvXMIADB0hXTQKhIKzt8C7BaB2fKAqnmty6aPZOIY99OYeT
         91xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNG32WxAV9fzD2tgi6xDbSRMH9hDI6BzmMPdhjkH8RO85Ap53QJ3d7At4OlGHVM7RFwuRf@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0ODC2LsJ8XUMrU1E8+qsbankhRhmvQVKoDNtwSBq7my10bJPy
	hNhaeK9oHNbJT9GUyw72s86KGbOnrXSCqxoR+S4fNqJO70xhttjH4GzqpmYRDASIJY8yRBv6ego
	d4V0zt8pOeZgt9M9v+Hu1IxFtac5MGt7ip9dr
X-Google-Smtp-Source: AGHT+IH0HVg3fvyt1+QDr1YQLUpP3z4mO+u5A4ersGEMt75VHmDTieIO3qGEubKhoWD+zxsaZ/P7FpluFK6JQL6j+ro=
X-Received: by 2002:a05:6e02:148d:b0:3a2:6d54:33f1 with SMTP id
 e9e14a558f8ab-3a4cc972f72mr1555125ab.16.1729550614610; Mon, 21 Oct 2024
 15:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-2-xur@google.com>
 <CAK7LNAQ5yNKvZDtJuvo9Lt4rZwLSv0UN4=Ff=WcCDy1CCEpQ7Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQ5yNKvZDtJuvo9Lt4rZwLSv0UN4=Ff=WcCDy1CCEpQ7Q@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 21 Oct 2024 15:43:22 -0700
Message-ID: <CAF1bQ=Syxi46xnGbpZWhYfqKhQZqrBPPh5FGaqzmJTg6MMDJSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] Add AutoFDO support for Clang build
To: Masahiro Yamada <masahiroy@kernel.org>
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

Thanks for the detailed suggestions! My comments are inlined below.

Best regards,

-Rong

On Sun, Oct 20, 2024 at 9:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
>
> > +Customization
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +You can enable or disable AutoFDO build for individual file and direct=
ories by
> > +adding a line similar to the following to the respective kernel Makefi=
le:
>
>
> Perhaps, it might be worth mentioning that kernel space objects are
> covered by default.
>
> Then, people would understand ':=3D y' will be less common than ':=3D n'.
>

Good point! How about I change to the following:
"
The default CONFIG_AUTOFDO_CLANG setting covers kernel space objects for
AutoFDO builds. One can, however, enable or disable AutoFDO build for
individual file and directories by adding a line similar to the following
to the respective kernel Makefile ...

>
>
>
> > +
> > +- For enabling a single file (e.g. foo.o) ::
> > +
> > +   AUTOFDO_PROFILE_foo.o :=3D y
> > +
> > +- For enabling all files in one directory ::
> > +
> > +   AUTOFDO_PROFILE :=3D y
> > +
> > +- For disabling one file ::
> > +
> > +   AUTOFDO_PROFILE_foo.o :=3D n
> > +
> > +- For disabling all files in one directory ::
> > +
> > +   AUTOFDO_PROFILE :=3D n
> > +
>
>
>
>
> > +3) Run the load tests. The '-c' option in perf specifies the sample
> > +   event period. We suggest using a suitable prime number, like 500009=
,
> > +   for this purpose.
> > +
> > +   - For Intel platforms::
> > +
> > +      $ perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c <count=
> -o <perf_file> -- <loadtest>
> > +
> > +   - For AMD platforms: For Intel platforms:
>
>
> I guess this is a copy-paste mistake.
>
>
> For AMD platforms: For Intel platforms:
>
>    ->
>
> For AMD platforms:

Thanks for catching this! Will fix this.

>
>
>
>
>
>
> > +   (https://github.com/google/autofdo),  version v0.30.1 or later.
>
>
> Please one space instead of two after the comma.
>

Will fix it.

>
>
>
>
>
>
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > new file mode 100644
> > index 000000000000..1c9f224bc221
> > --- /dev/null
> > +++ b/scripts/Makefile.autofdo
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Enable available and selected Clang AutoFDO features.
> > +
> > +CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable-fs=
-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> > +
> > +# If CONFIG_DEBUG_INFO is not enabled, set -gmlt option.
>
>
> Meaningless comment. It explains too obvious code.

Will remove this line of comment.

>
>
> > +ifndef CONFIG_DEBUG_INFO
> > +  CFLAGS_AUTOFDO_CLANG +=3D -gmlt
> > +endif
>
>
>
>
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 01a9f567d5af..e85d6ac31bd9 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -191,6 +191,16 @@ _c_flags +=3D $(if $(patsubst n%,, \
> >         -D__KCSAN_INSTRUMENT_BARRIERS__)
> >  endif
> >
> > +#
> > +# Enable Clang's AutoFDO build flags for a file or directory depending=
 on
> > +# variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE.
> > +#
>
>
> This comment would give the wrong understanding that this flag is opt-in.
>
>
> The comment for KASAN correctly describes that it is enabled by default,
> and can be opted out using KASAN_SANITIZE_*.
>

I can change to use KASAN's expression:
"
# Enable Clang's AutoFDO build flags for kernel except some files or direct=
ories
# we don't want to enable (depends on variables AUTOFDO_PROFILE_obj.o
and AUTOFDO_PROFILE)
"

>
>
>
>
> --
> Best Regards
>
>
> Masahiro Yamada
