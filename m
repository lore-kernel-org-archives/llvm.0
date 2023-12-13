Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5D1EB2C
	for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NE4ou/ur"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c4846847eso29302035e9.1
        for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702457342; x=1703062142; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iYD9RnPAzZn/twKQIifseItY/M9p2JS4Pz3uXMUgu8=;
        b=NE4ou/urHX2AjnZq+FX5kbilDGAjvZ5i50sE/kKk6C6ojw60l2pif1O/ueefku+qun
         TO1oK3QV4zPUpu3YVU+eBt5PGGvzVBmRWedYyMrGqo/LJlrbWrdJhz431E4IA9vBFLiS
         4QNcfK2XoHt/7FxMECqO0XGwLGn6g6JIdV3ZOH2PPy2GSifBe7eNMk2LFcuKoifQVIMZ
         nNhEu4WP+7w3lfjXGKzZix4Ecpez4iUsTgyOucZqGbpG2tDUuYdjZtVhglFNHkgni9E9
         5i3BVifOpAdA4wxZ+CzfHcL0QEFGay1olbHGvS5X+RaK93QbcAo9wUUOBNF571IM2/sC
         e5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702457342; x=1703062142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iYD9RnPAzZn/twKQIifseItY/M9p2JS4Pz3uXMUgu8=;
        b=i6tFfBS1tc9vdmthNOgJbsrIdr9UF5tEOXt0GqjeA0oTf//7iRs8WFRXDMOcNg0v9b
         2TKT/bz+tf4qqbBp72VsuAjzTabYFAb2yljKaqAGOlLX0PVe1QCtrSDodYaBC2sHv1Fc
         D4PcDf01afUV8rFtjPQEjWnvSnjFPPJ5sv/FTf4KmjUdiibYUw+FnvJySbSDD0NwGUhd
         xPc8kwaT0LGMPOw7+5av33jdRYhOVplhg4GvCT1OlgZgyMT1B5fTCpt3gWg1uxL+jcCT
         P9oopeBmoipdqmGpAqqd4eW0i6FKS4+72VGIxDRZftS4Gj1Ah5MPVsPW4h9tNATub3b/
         Y7GQ==
X-Gm-Message-State: AOJu0YyvH3X+f5wr7uIjzk1uDSlkgOsfGC29nFGi3R2YWfx/42YOsPNM
	d6sp/bVSU2G+NnXbZkebjCBnfk9F47K4S5Q4Wug=
X-Google-Smtp-Source: AGHT+IFBk1lNKv3BcxKBdjQgOw3kbIIuMtHUxLUHRm6/4kNBX81PypqFHKgMOYx4nqumSh9nXBONTvkOTaO2J8UGnLQ=
X-Received: by 2002:a05:600c:44e:b0:40c:6e8:610a with SMTP id
 s14-20020a05600c044e00b0040c06e8610amr4076458wmb.56.1702457341628; Wed, 13
 Dec 2023 00:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <20230325085416.95191-1-ashimida.1990@gmail.com> <20230327093016.GB4253@hirez.programming.kicks-ass.net>
 <CABCJKueH6ohH27xCPz9a_ndRR26Na_mo=MGF3eqjwV2=gJy+wQ@mail.gmail.com>
In-Reply-To: <CABCJKueH6ohH27xCPz9a_ndRR26Na_mo=MGF3eqjwV2=gJy+wQ@mail.gmail.com>
From: Dan Li <ashimida.1990@gmail.com>
Date: Wed, 13 Dec 2023 16:48:50 +0800
Message-ID: <CAE+Z0PFZaa2bwtfY5P7ZDYH4JjMxKpJgqz0m+KJ_ks4dctzAKA@mail.gmail.com>
Subject: Re: [RFC/RFT,V2] CFI: Add support for gcc CFI in aarch64
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Aaron Tomlin <atomlin@redhat.com>, 
	Alexander Potapenko <glider@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>, Brian Gerst <brgerst@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Changbin Du <changbin.du@intel.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Frederic Weisbecker <frederic@kernel.org>, gcc-patches@gcc.gnu.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Kees Cook <keescook@chromium.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, Marco Elver <elver@google.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Michal Marek <michal.lkml@markovi.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Richard Sandiford <richard.sandiford@arm.com>, Song Liu <song@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, Yuntao Wang <ytcoode@gmail.com>, 
	Yu Zhao <yuzhao@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	wanglikun@lixiang.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Likun

On Tue, 28 Mar 2023 at 06:18, Sami Tolvanen <samitolvanen@google.com> wrote=
:
>
> On Mon, Mar 27, 2023 at 2:30=E2=80=AFAM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Sat, Mar 25, 2023 at 01:54:16AM -0700, Dan Li wrote:
> >
> > > In the compiler part[4], most of the content is the same as Sami's
> > > implementation[3], except for some minor differences, mainly includin=
g:
> > >
> > > 1. The function typeid is calculated differently and it is difficult
> > > to be consistent.
> >
> > This means there is an effective ABI break between the compilers, which
> > is sad :-( Is there really nothing to be done about this?
>
> I agree, this would be unfortunate, and would also be a compatibility
> issue with rustc where there's ongoing work to support
> clang-compatible CFI type hashes:
>
> https://github.com/rust-lang/rust/pull/105452
>
> Sami
