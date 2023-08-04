Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576918044
	for <llvm@lists.linux.dev>; Fri,  4 Aug 2023 15:42:06 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76cdf055c64so173268685a.3
        for <llvm@lists.linux.dev>; Fri, 04 Aug 2023 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691163725; x=1691768525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMB9HKP4nLwJw3q1s/3PxzF/3mcaB2FmzehgLjwrVXQ=;
        b=luBKmkxS4KkoBKCMcnSbLsA2xPo/yzjRAPnE2Iste//wyFoCcQlJGz/22eRjpreXEA
         mXHBlnWEOoOwjGsLTOYAGGE2JEnHi8clhNz+XXqF5sZqS9zngrBydHfzVDzoa4cyUSE7
         Zg9BBa5JSAgFrSM2Lcn+Y7VJ0wlW6a1ib9psgWEv4gnT7cZAEurA8SEx6CMZ4E/gUw6a
         5lSfoM9hDSAmdvrkiRyvZ3L9+nVJFp1Qz/rsyu+3cgf1zL83a8qDh46nW7v1cmlplZ6B
         GtbclzizXIP5nqAYzguk1QcdwMpE9hnJ0hG1O4bfphu3TrtKg9bhZ4fRXtwWBOIF+if0
         hQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163725; x=1691768525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMB9HKP4nLwJw3q1s/3PxzF/3mcaB2FmzehgLjwrVXQ=;
        b=LEebqbB/QrLI2XdyAQENG8gQsMptpcLELTmoT/DhQb2x6K2P8ppV7J2aZ+Wb39cPvq
         FEQQe4lh98/6ZaSdwHV3PLdvAoAAMUExQSqk44pyBOuLEHB8XWbhFAvoQ189j/41wPkY
         DCNxbz0q5FzS9CIqfPV/CODSn5E+bvMa0xsHswhbEZTg0dTv5t2B5Yh/uObNE20e8uLs
         D3dje/C4u6KzuY1dNT2G4/mDYl4tgU8TV2ROMFAkO0Rg3zY9mef44glOUB7QFbhKsua2
         4Rhs0Dr7kGEP724yoPXZuQtNJ4LF5Od3lxH8COR2g3NXvH0UGBE7QtGpN5f5hdLoaj3O
         XqhQ==
X-Gm-Message-State: AOJu0Yw1oEvg4TMNERpYBnXoIWb3hq1Ymndd1PQJH72CADgRnQxtOaNb
	f+s7CO/ttemkDph0qRGQHFXUGGTA7eTW/TmFX9FiMg==
X-Google-Smtp-Source: AGHT+IExVmYTNrYfBnYNOSGaqMCNi67nZElsdl9+XH2gLzLR6yr4pGYdCNAjcxcttnRulmkVHf7kJZQ42nRF7F72f2U=
X-Received: by 2002:a0c:aa42:0:b0:62d:ee5a:514b with SMTP id
 e2-20020a0caa42000000b0062dee5a514bmr1900649qvb.11.1691163725237; Fri, 04 Aug
 2023 08:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308040553.nMR9oB8v-lkp@intel.com> <20230804153749.GA2148888@dev-arch.thelio-3990X>
In-Reply-To: <20230804153749.GA2148888@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 4 Aug 2023 08:41:54 -0700
Message-ID: <CAKwvOdk7VrGMy95heyyLhdhgNWb1LyV48WmzvhpNUrqaYBin_A@mail.gmail.com>
Subject: Re: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20: error:
 invalid use of a cast in a inline asm context requiring an lvalue: remove the
 cast or build with -fheinous-gnu-extensions
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Fangrui Song <maskray@google.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 8:37=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Fri, Aug 04, 2023 at 05:32:55AM +0800, kernel test robot wrote:
> > Hi Fangrui,
> >
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able.git linux-4.14.y
> > head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
> > commit: 71749b1181eca12af96654a781cabcd058c37c8f [4459/9999] Makefile: =
Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
> > config: mips-randconfig-r035-20230731 (https://download.01.org/0day-ci/=
archive/20230804/202308040553.nMR9oB8v-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.gi=
t 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230804/2023080405=
53.nMR9oB8v-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308040553.nMR9oB8v-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> lib/mpi/mpih-div.c:142:20: error: invalid use of a cast in a inline =
asm context requiring an lvalue: remove the cast or build with -fheinous-gn=
u-extensions
> >      142 |                                         umul_ppmm(n1, n0, d0=
, q);
> >          |                                         ~~~~~~~~~~~~~~^~~~~~=
~~~~
> >    lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
> >      652 |         : "=3Dl" ((USItype)(w0)), \
> >          |                 ~~~~~~~~~~^~~
>
> This is the same as [1] but the upstream solution (b0c091ae04f6) could
> cause breakage in 4.14 for compilers older than GCC 4.4; 4.14 claims to
> support GCC 3.2 as a minimum version. An alternative solution if we care
> about fixing this issue in 4.14 without any regression possiblity would
> be something like:

In our own CI, we don't test mips until 5.4.
https://github.com/ClangBuiltLinux/continuous-integration2/blob/main/genera=
tor.yml#L1691-L1698

Another solution is perhaps to ask kindly that the kernel test robot
team not test branches of stable w/ clang for ARCH=3Dmips.


>
> diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
> index 6c5229f98c9e..42076c124e23 100644
> --- a/lib/mpi/longlong.h
> +++ b/lib/mpi/longlong.h
> @@ -639,7 +639,7 @@ do { \
>         **************  MIPS  *****************
>         ***************************************/
>  #if defined(__mips__) && W_TYPE_SIZE =3D=3D 32
> -#if (__GNUC__ >=3D 5) || (__GNUC__ >=3D 4 && __GNUC_MINOR__ >=3D 4)
> +#if (__GNUC__ >=3D 5) || (__GNUC__ >=3D 4 && __GNUC_MINOR__ >=3D 4) || d=
efined(__clang__)
>  #define umul_ppmm(w1, w0, u, v)                        \
>  do {                                           \
>         UDItype __ll =3D (UDItype)(u) * (v);      \
>
> [1]: https://lore.kernel.org/20230801202602.GA2589710@dev-arch.thelio-399=
0X/
>
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
