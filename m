Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1B20FE
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 16:19:32 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-63cfd68086dso26328406d6.1
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 09:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691425171; x=1692029971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPJnGrRfrqTcFmM1+fKcLOPow/cxlZkJNS27itglHYY=;
        b=p9f8T/0c2mLFtWQTlr7f8LDvoDunJVOgB6fGL1rGBgdw1Pfh0bq1W2adT1arcPAPss
         GxDg9zHzK6ZsiKW6CV8daCmVtwVMVoJtxylgiMAg2V/QvuHKdR3V8J78dU2GuqzImcz+
         BrPvvXG33syUZEhv1Bkc8AUNC2Oj5B3aZIIAwBsaKBsw1igREq1Of5NtiW3HMAfmByO4
         azORNELxRrYfxDRHi8p7C+P8GzFLPVh/aSdkvI3thYbbap/oPFKf7vADq3UkA+o7eJnx
         y42w9ElPwpDuqDF8gAqTqCSGgOcJ9pcymUu4GvhVZNpy4V2RCXM2ymmx8JFkGXTvE8QX
         +UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691425171; x=1692029971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPJnGrRfrqTcFmM1+fKcLOPow/cxlZkJNS27itglHYY=;
        b=J8PUUt4q58hqUOQF8iTihGFbZkECM+3ydD4fmDLdSncpGCPhA9kEH8Cxf6VwuAGNsd
         XEPTGCKxA4zY+JDlWYUG6CeVDk9UCcmc736RSlOTQR7r5aoufsdJFnAcTRJbScAMz0Nk
         Pk1ka2R7LenX/VWqtPo7Jl7l3/RFOmTPpjafecVtCoU17OHWnVcL+rHFneOnFziarbFY
         jrlMOBmOgQyTk/onWRa7uu2o68ig25RLWUXDDYGqwsdAyhIAECLQN33fE6v7V4H/37aq
         YKLN/5Fd820sQ5JNZ+Fw/dBYlTuOLt4Vehs637TGIs5OeyJ5nZS5sUQOxDMwdsm2amug
         WY6w==
X-Gm-Message-State: AOJu0Yw41eZ1YhRBNpKCboGH/livDwwI1VBrGnbN+GC/hv6N2RWKTiLj
	IV9wnDgD8ViTYcG/4tszIx1Rl5ZuP2CHRypejkpYBCXJzsjgqzoZx3s=
X-Google-Smtp-Source: AGHT+IEoEDNA6GxnW+ViDsmeCqIO9Q5P6sp4c349+g/L2BJWZ2fenuHgxtv40V7icYfhg/FegnnWJ0s5h88o+1Fs71k=
X-Received: by 2002:a0c:9ccc:0:b0:630:7a8:f602 with SMTP id
 j12-20020a0c9ccc000000b0063007a8f602mr7673549qvf.7.1691425170989; Mon, 07 Aug
 2023 09:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308040553.nMR9oB8v-lkp@intel.com> <20230804153749.GA2148888@dev-arch.thelio-3990X>
 <CAKwvOdk7VrGMy95heyyLhdhgNWb1LyV48WmzvhpNUrqaYBin_A@mail.gmail.com> <2a1061fb250905545c4a514b5328e3d36ab6f8f7.camel@intel.com>
In-Reply-To: <2a1061fb250905545c4a514b5328e3d36ab6f8f7.camel@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Aug 2023 09:19:20 -0700
Message-ID: <CAKwvOd=LMeeeA68ydcQtFgzd1vv0F4i=DJYCxEiHahN7+OP5_A@mail.gmail.com>
Subject: Re: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20: error:
 invalid use of a cast in a inline asm context requiring an lvalue: remove the
 cast or build with -fheinous-gnu-extensions
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: "nathan@kernel.org" <nathan@kernel.org>, lkp <lkp@intel.com>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 6, 2023 at 11:52=E2=80=AFPM Liu, Yujie <yujie.liu@intel.com> wr=
ote:
>
> On Fri, 2023-08-04 at 08:41 -0700, Nick Desaulniers wrote:
> > On Fri, Aug 4, 2023 at 8:37=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org>
> > wrote:
> > >
> > > On Fri, Aug 04, 2023 at 05:32:55AM +0800, kernel test robot wrote:
> > > > Hi Fangrui,
> > > >
> > > > First bad commit (maybe !=3D root cause):
> > > >
> > > > tree:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
.git
> > > >  linux-4.14.y
> > > > head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
> > > > commit: 71749b1181eca12af96654a781cabcd058c37c8f [4459/9999]
> > > > Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross
> > > > compilation
> > > > config: mips-randconfig-r035-20230731
> > > > (https://download.01.org/0day-ci/archive/20230804/202308040553.nM
> > > > R9oB8v-lkp@intel.com/config)
> > > > compiler: clang version 17.0.0
> > > > (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1
> > > > ffa0299048db4c88a)
> > > > reproduce:
> > > > (https://download.01.org/0day-ci/archive/20230804/202308040553.nM
> > > > R9oB8v-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a
> > > > new version of
> > > > the same patch/commit), kindly add following tags
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Closes:
> > > > > https://lore.kernel.org/oe-kbuild-all/202308040553.nMR9oB8v-lkp@i=
ntel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > > > > lib/mpi/mpih-div.c:142:20: error: invalid use of a cast in a
> > > > > > inline asm context requiring an lvalue: remove the cast or
> > > > > > build with -fheinous-gnu-extensions
> > > >      142 |                                         umul_ppmm(n1,
> > > > n0, d0, q);
> > > >          |
> > > > ~~~~~~~~~~~~~~^~~~~~~~~~
> > > >    lib/mpi/longlong.h:652:20: note: expanded from macro
> > > > 'umul_ppmm'
> > > >      652 |         : "=3Dl" ((USItype)(w0)), \
> > > >          |                 ~~~~~~~~~~^~~
> > >
> > > This is the same as [1] but the upstream solution (b0c091ae04f6)
> > > could
> > > cause breakage in 4.14 for compilers older than GCC 4.4; 4.14
> > > claims to
> > > support GCC 3.2 as a minimum version. An alternative solution if we
> > > care
> > > about fixing this issue in 4.14 without any regression possiblity
> > > would
> > > be something like:
> >
> > In our own CI, we don't test mips until 5.4.
> > https://github.com/ClangBuiltLinux/continuous-integration2/blob/main/ge=
nerator.yml#L1691-L1698
> >
> > Another solution is perhaps to ask kindly that the kernel test robot
> > team not test branches of stable w/ clang for ARCH=3Dmips.

^ specifically branches linux-4.19.y and linux-4.14.y.  Newer branches
should be tested for ARCH=3Dmips LLVM=3D1.

>
> Thanks for this info. We've configured the kernel test robot to do so.
>
> --
> Best Regards,
> Yujie
>
> >
> > >
> > > diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
> > > index 6c5229f98c9e..42076c124e23 100644
> > > --- a/lib/mpi/longlong.h
> > > +++ b/lib/mpi/longlong.h
> > > @@ -639,7 +639,7 @@ do { \
> > >         **************  MIPS  *****************
> > >         ***************************************/
> > >  #if defined(__mips__) && W_TYPE_SIZE =3D=3D 32
> > > -#if (__GNUC__ >=3D 5) || (__GNUC__ >=3D 4 && __GNUC_MINOR__ >=3D 4)
> > > +#if (__GNUC__ >=3D 5) || (__GNUC__ >=3D 4 && __GNUC_MINOR__ >=3D 4) =
||
> > > defined(__clang__)
> > >  #define umul_ppmm(w1, w0, u, v)                        \
> > >  do {                                           \
> > >         UDItype __ll =3D (UDItype)(u) * (v);      \
> > >
> > > [1]:
> > > https://lore.kernel.org/20230801202602.GA2589710@dev-arch.thelio-3990=
X/
> > >
> > > Cheers,
> > > Nathan
> > >
> >
> >
>


--=20
Thanks,
~Nick Desaulniers
