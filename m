Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5706C2868BC;
	Thu,  8 May 2025 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724948; cv=none; b=nDC91ms/lYIBPygf3MiysmHefLkfTdwNaxc2qEhMpAVpGeHySe/Tz1hDHezPyW+dhdH5HaGIyWVHf4qO6RWg644fopbCTPuLhz0Tg/74MfAQ1ZeZk5X9WpL9C6iDLE1uEA1qqTxo17xyZ9hvCrF0tUmPZyw/dlWTa7V75MV51jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724948; c=relaxed/simple;
	bh=d2SeO8esbFjFSvvELtAef4M7xwsas/hbP3IbDyR9G+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqweCsBXcfRoNTXZ425bNiuHaiKwBSaGEO3EPYXjej91BO2bijVIuK5YmuRJSOFUIPLTDFVYpfhATtJMrIKrn2vG2b28Xud6MrsEssQkDqkD6lshWD9kBh9+Iy6zFdbkKeP496h64/FbbxV723NO3ML9snIR238nsuNoqJKmFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8Q1ylsw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8Q1ylsw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E4FC4CEEB;
	Thu,  8 May 2025 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746724947;
	bh=d2SeO8esbFjFSvvELtAef4M7xwsas/hbP3IbDyR9G+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8Q1ylsw98J0nHwZRrjVwfPeX2JhVqTlBl4xRbqqOXuiX69mZYJSW3IJpLCAV8cwt
	 Ut+sK2G2Z5nWq5gc5b6D/nqONsOGEKVg+dNOMzaCOzZSLeKjSW64fNodTV5CJ7ZQtG
	 HfGUzZML2IzzaQmp9t1Enxz8uHpe2/vkK/t4Tn+Wj9Fqlnkk/e+9cBY8W6YjomVxfY
	 p3tZxJWZHk8wkMoxoziWS9YHJuuLK/xfuYCx/A7QwzOOB38kIVn+C6Dr9uaGcSNAoy
	 CBogCgCIKA4M5awm0WelWideVBbHwEfpx9yVeoZemf1x5Zw4WbYpshAFtest4eWH+O
	 h2HHY+4QLwynA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-31062172698so13347151fa.0;
        Thu, 08 May 2025 10:22:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzX+Q45TZ7PtRDyj+pxKMmObo8/n9jsy0YGoBMqCdPiln1yUqQlmlrPlC5hQoLUu8rQ3E1@lists.linux.dev, AJvYcCVtbQNuRee7PK2sl/MnnC4rDxxu0bfxaB6pEUSJM4janv7wdv4F81TPORrwFKdNVtNSgV/ZPt9LnlSnT2oUnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2fr6sp+u9knCutcyxtfCI1hjurWJZPv9G/tOPSIvXQG3fj7zv
	zTowVgHGCrJTj34DvBmK1KL+tY7ceElqMqjqqJXIQtEZG9VoyRMA5VFJTI8MVWQnbRlOAYEgPQm
	6G18Y72DDO4gR9a66JURb8fk4Ue8=
X-Google-Smtp-Source: AGHT+IEjcvQD5ma76ySzkGyVomNQNSAKPuwlUE49UB4uvOIVQNCcjvsVbGENvCXmzPDonnlu4GrGJCqt5WICYRvjjmk=
X-Received: by 2002:a2e:bc07:0:b0:30b:f775:bae0 with SMTP id
 38308e7fff4ca-326c468a5bbmr1456541fa.36.1746724946129; Thu, 08 May 2025
 10:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505090001.FS7smjqJ-lkp@intel.com> <CAMj1kXEnn0T3zCTq=b8OE0aYB6=ZQ+9p8GK_dxUyD+81d8jYHg@mail.gmail.com>
 <20250508165710.GA2787919@ax162>
In-Reply-To: <20250508165710.GA2787919@ax162>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 May 2025 19:22:14 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGQNyHw57bp-iHU0qgYBKwBS1SSJbq5X9BQkCvKLJFyrw@mail.gmail.com>
X-Gm-Features: ATxdqUHVi53sib620QiMUo0ytaE0oD96_xmi04BMnoujKVV39WhyOihmSksyzo4
Message-ID: <CAMj1kXGQNyHw57bp-iHU0qgYBKwBS1SSJbq5X9BQkCvKLJFyrw@mail.gmail.com>
Subject: Re: [ardb:for-kernelci 15/18] arch/x86/boot/startup/sev-startup.c:141:15:
 error: '__section__' attribute only applies to functions, global variables,
 Objective-C methods, and Objective-C properties
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 18:57, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, May 08, 2025 at 06:50:56PM +0200, Ard Biesheuvel wrote:
> > Hey Nathan,
> >
> > The error below looks bizarre to me. Any clue?
> >
> > On Thu, 8 May 2025 at 18:20, kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
> > > head:   f309d115ff0674e0ce4fe010e587d40bfb5b6e4e
> > > commit: 54ae382c92b4521365fde402a792038b968188f8 [15/18] x86/boot: Move startup code out of __head section
> > > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/config)
> > > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202505090001.FS7smjqJ-lkp@intel.com/
> > >
> > > All error/warnings (new ones prefixed by >>):
> > >
> > > >> arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
> > >      141 | static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
> > >          |               ^
>
> I think this should should be
>
>   static __init struct cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
>
> or
>
>   static struct cc_blob_sev_info __init *find_cc_blob(struct boot_params *bp)
>
> The __init is splitting the return type.
>

Ah oops.

Now I'm surprised it even worked at all with GCC.
