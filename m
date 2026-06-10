Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305F31F9A4
	for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108369; cv=pass; b=G/S/LyHp65RxeqFP3uT7sX/otPWc4MIJrH7TLJFbdbseIVOpZ+FUEy55rIyYDKblS4SFymo8vMuUijLJzXXXOG4T8obibB0D/nM1+3gt1fErAaH0MM0EpVmOeTxvBfcugA8G7VTdPs+SlP45oR2ZImwTna0vSYF5mOm1Al1s2XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108369; c=relaxed/simple;
	bh=tEcBow2gdBp+/voVp/g9x+g9NV2I+Be2aTB/lbhkaHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlAPxV+bUGCNoQfYj1r5pfJcedAV1Qas5uLUvdKq0Ou9IrWO+7yXBVZsMlF+aK+q2xHGBFeuVIifwafaoLKvlOqVdx5HmMbcJFhTaoayi34vx2sqE1uGJ/VdZhqs2MetfbQrU/QjokWSL+WbRARpEpAcf3mvGQT834wMWWSYp44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WHkwJPEs; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHkwJPEs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2911f93cso80545ad.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 09:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781108366; cv=none;
        d=google.com; s=arc-20240605;
        b=CHdgquIPsjtevG9yLBSEjbomMuBawN+Lls+w16ZosrABe1EEfr0E5PRXO7JWunlAdE
         DeG1HCPUuwmXUhKKaW6SI0Y0inKiBIWFhFP1V2ZJI2/1NQB+ezioNbOWP0mXfupoO+F0
         iOV7PRDpQD+Z9myOtayjzgfVBUEVmVzje9Sqk7P4UQqkgxdz/Zf+4wTiHzpBiiGGCLha
         vqlaLZF6H8NPGjaBqSqSA91QsMWkW1eXUaW6/XEclx2HNAHosSPU8NZgKKhFDPLUPwlY
         y2TXsA7w3pg0Zhua67PFrogNWEvm0f5rBUcM1TjguekumYoiv20qiWZNquaykRJPYy4s
         024Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vi11/rohvLJyMxroWGqfziqvFq44cunGgPMb0wuOPpg=;
        fh=nDmSPuKujzMxGHXs6S4RbnTbl0H0Cq8kztz/yDN4QcM=;
        b=BSNFLxYLItZQ832OQBezApnmmFz0ApWkJ+WqKHDrWzJLeIw8h595I+h+kF/niV3Q8z
         qAjtZS0oLPiHSx8ARqy+cOHHjsw44XxGh/jO5DUbaYiSxJv78a3mZSQnKVYCSzJpk4Mp
         zOkf45F9S1p4hKt7oRYJKVv6vtEGGU7haZKquLRrXcJdRQZ0yEHXm3jf3fMGDhptIlF8
         60MSVHCEBNxuD06o3VkIMCuqT+ah4Ptts9XyVHPlU/p8Ztd8iPZR79345a9HKDUw31xF
         qasTa9cgCQwJswBwUg6zpcLDykIagZWln201KsW62vKX+Z8JhZs4YC9d8ITf4TWDEUDZ
         pyJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781108366; x=1781713166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi11/rohvLJyMxroWGqfziqvFq44cunGgPMb0wuOPpg=;
        b=WHkwJPEsByvQ6CNP4SKfm+iqh204dSpVAykHKz861F9YhUzUTVWNCdVtYzUSl1F0/6
         exSO9mjrsg4JsDSmeO34e3FSgiruD+yQDN0TpOe/ZG3hMgBG5+sF/8SUXUet43409r0/
         VULwxsTXA237dVSogp+k5XPSMZoHi5FD/dJoU0iHz6tDK7yycXpIoF+C+QxJVnzNbHAm
         f0sSZs0FR5seYdispUZhHQTSFF+S1jH0d27cy2TuYyqvkva3evHEXSTaWi325dmQwsJM
         vswX8sAaUvqZDBkDvmS0fmoaBqyQ9knJKXpJeByNM/bI2Ho/ofDiiudcOAMwmkyFmoHg
         BQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108366; x=1781713166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vi11/rohvLJyMxroWGqfziqvFq44cunGgPMb0wuOPpg=;
        b=JtiyubmCOGnTuwKoEB52R64WgcyYhj5OuVighBatjSn972+uEsDPQ0xnZ7jGtfPgS/
         NKuA0B97yRUeDUeTNgmx2kO6S2aJhmrN+IOkdnaNjEAcpLlRGf+dXtfEGGiJz3kVS1bx
         Ssl8LyIsOfaJ9FTTV7I3Qk6JRkbHD/SId9I7hq5QMo+EKk9mkIMJ3e0X0nJOdkRA2h8V
         +z+FpEgbPtSpXHW9Ih1Nr1FzHVNMnxoDtfzZTUmtroND4pRuVtMgD/X3w9352uR30CNE
         e9ZAZ4AXeO380x65zDgoC9MTujot/NVhLzRepS/PfCjnExccPg+co+4VdpNd6k+R3DwZ
         qa6A==
X-Forwarded-Encrypted: i=1; AFNElJ/2gSSUIkAv9emKEgSmmfB/lIl8U8qDVim/cJXspfW8FBaeLiKtno6TKsEoLk19w6NQKqY1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Zrt4ujO7yQQsJXwp6ZYH7Z3/ie8C8hDidLzKcadeDDSckOM5
	ZBuQrtx27DRqAdqVURDd9DtvIq3yDakrgP8KgkWXOx02KkZCgt/FaZeeGRiLwW425hfRT1+I9TB
	UgIQkVlENub7FsAhOlSkddY+iGcStlfD0UycY/yek
X-Gm-Gg: Acq92OHzfkV1a5d3a/zSfPDqma6MpEzufCX6zGVXqM6Ucn6mNHPFCQf3WhNqxl2zp6d
	3FBzm1vyqZTrJSWKXRtLFEzMY1lHL0gX0AGP+Q6BcBgq9XFOkFcdfACP476ndzZyy+OAY0EF3V6
	r90RBknWAy4Xk3j3Nm0mscG22Guq693t6cl9+bM7baCVI0CsmaRBJYoumokTbMsKUOzJL11GIzW
	IlfeFVkQTMip9Cos2EO3fllKVCnZqWJ22nkYDfjK2wv7I0hPkfwCsj+83nrG9MXNT0zpEp3crGE
	28Cg8rv0ITfEMtBGz5dDzXbbe7nd39tOe7CopO6dwQmTtAwcs4Z8DVuYJWY=
X-Received: by 2002:a17:903:3c25:b0:2c1:ee6e:4e4a with SMTP id
 d9443c01a7336-2c2d942700amr238395ad.27.1781108365793; Wed, 10 Jun 2026
 09:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610112451.1553054-1-jremus@linux.ibm.com> <a76b93d7-89bb-483a-80dd-59e3dbf921a3@linaro.org>
In-Reply-To: <a76b93d7-89bb-483a-80dd-59e3dbf921a3@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 10 Jun 2026 09:19:14 -0700
X-Gm-Features: AVVi8CeML9xOHpqDi-kOipKhEhSw8qM5oNh-G4lar_licy0sI8HoLNL-mbAU5DU
Message-ID: <CAP-5=fUowmCCdfAOoPimduZ53GTfRPp1qPLMUfXU6R80=x88Eg@mail.gmail.com>
Subject: Re: [PATCH] perf s390: Fix TEXTREL in Python extension by compiling
 as PIC
To: James Clark <james.clark@linaro.org>
Cc: Jens Remus <jremus@linux.ibm.com>, Jan Polensky <japo@linux.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 6:39=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 10/06/2026 12:24 pm, Jens Remus wrote:
> > On s390 the Python extension build fails as follows when using a linker
> > that is configured to treat text relocations (TEXTREL) in shared
> > libraries as error by default:
> >
> >    GEN     python/perf.cpython-314-s390x-linux-gnu.so
> > /usr/bin/ld.bfd: error: read-only segment has dynamic relocations
> >
> > This occurrs because util/llvm-c-helpers.o is erroneously built from
> > util/llvm-c-helpers.cpp without compiler option -fPIC but linked into
> > the shared library (via libperf-util.a(perf-util-in.o)).
> >
> > On s390, object files must be compiled as position-indepedent code (PIC=
)
> > in order to be linked into shared libraries.  Commit a9a3f1d18a6c ("per=
f
> > s390: Always build with -fPIC") added compiler option -fPIC to CFLAGS
> > for s390, which is used in C compiles.  Add -fPIC to CXXFLAGS for s390
> > as well, so that it is also used in C++ compiles.
> >
> > Reported-by: Thomas Richter <tmricht@linux.ibm.com>
> > Signed-off-by: Jens Remus <jremus@linux.ibm.com>

Great! Perhaps we should add a fixes tag for backports. Perhaps:

Fixes: a9a3f1d18a6c ("perf s390: Always build with -fPIC")

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > ---
> >
> > Notes (jremus):
> >      This patch applies on top of the perf-tools-next tree:
> >
> >        git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-ne=
xt.git  master
> >
> >      Note that this resolves the issue discussed in thread "[PATCH 1/1]=
 perf
> >      build: Fix Python extension build with GCC 16 hardening":
> >      https://lore.kernel.org/all/ahV2XGx_6h7upuc3@li-276bd24c-2dcc-11b2=
-a85c-945b6f05615c.ibm.com/T/
> >
> >   tools/perf/Makefile.config | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index 333ddd0e4bd8..33f90968c8a9 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -109,6 +109,7 @@ endif
> >
> >   ifeq ($(ARCH),s390)
> >     CFLAGS +=3D -fPIC
> > +  CXXFLAGS +=3D -fPIC
> >   endif
> >
> >   ifeq ($(ARCH),mips)
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>
