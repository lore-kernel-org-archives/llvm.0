Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9C1C9B62
	for <llvm@lists.linux.dev>; Thu, 12 Dec 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734041015; cv=none; b=hWyvmzJFifPF48eoIe/Mrt8YGTp1k8U6VZLTRkEjh4F4hDQpupqLVgQXo0N5p4HSI+P5H9iMtO1qNtxp3ZOlzzcgEM3264eH09nSq62oaCPNHTzvJsIY2L7SFXJt/MSVJFBaThibz2UwQQJ0tcpaXgZ9WnYGUQzKZw9LcEfKZk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734041015; c=relaxed/simple;
	bh=CRwmUv4IRr1Zsl2l5O8iNo6qgyCr1gO6u+tuGewt/rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+h0aedBVB8g+UILOEaSkXT3mcYWeziDuAPg/tGMtxR8jlSGtYjM8YnZL9Si/VJtYZP2R40gn+Nb8J+XX2ktNbtkxsxLuEgmqKOsTboprmYCky+H06EqRHlTk28QpUmM2XEQK9qjjRnAtZ05mUmdgkoLRP13Uq68U5H9sJWjJ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bUjffI3m; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bUjffI3m"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4675936f333so16861cf.0
        for <llvm@lists.linux.dev>; Thu, 12 Dec 2024 14:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734041011; x=1734645811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UolAYRSfthqXCSLPGGN4mTa1qltoMW6sppP83v6THCY=;
        b=bUjffI3mIuO2/tPUtO7jH2eAtt+gLRPALrPvuXFu2QsyVX2cpLm7EkLbypYSGUfk1v
         rEPhLFMv1RuheGibhTzKyWie+5psfKI1e2Wyi3Oh5siLHVPjwxFBLwZ6rQt9FnLZsysC
         ve6i4F70qGUDWz7IbwLX9UHoByVh51C+4PY43d9hOqs9HT0Qdxh3K9JFII7XiGEf+VrT
         3AAe+ZCLxnoeWrZXanJNN8ndKfHfLrCMvIrvapTDSARvTnGfbIuKb9o2Y5p9aHMYRPAS
         GJO7GsUaQQBulzSPZc+HPfgu4fSwJeC/Oo5m/g22aHY50hKxZ9HM0UlSe14XTaWyOCnM
         jzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734041011; x=1734645811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UolAYRSfthqXCSLPGGN4mTa1qltoMW6sppP83v6THCY=;
        b=TiLZtxNubTQ0Ny/cfDt6DaWX0FzmReibz/DS7/T66eh/B45fYeBrayThwsohpPk/9b
         kMziqggS6VxHN0/6/KVBZS0sAXVtuDFW+uDz+QIsiD0PXYtvEH4C8ddYtyFr2R8mDO6B
         RZHi86K0E4RagXaYyWFw+Uz/5btvvHLxjPOumgBty7fS9w6bBGfngiwaRQiogPFNBHaj
         Qqp2QNy2hVXcN5ZfR8VyRM8/Jg+H2xgj1JUoZefw7eUT9KXYQrbCgw3oZy3WufMbXWU8
         OiCq8GfrgjoxRoU6r/tFMASDwap4Runccpekq10I7xsSOPIiBQlePZGmI5et4tAsDNIK
         V/pA==
X-Forwarded-Encrypted: i=1; AJvYcCVWi+KCPbCwJ15CPklUgVA7NenYlau/Ztba54ygJ3C8uFAb1uSbO5t3sw93o4k92uVhuQoI@lists.linux.dev
X-Gm-Message-State: AOJu0YwouzliVLb3oo9yovHmRUZeMcRHKYrE+XZ1S7cMsrm4ihOX7o7T
	EhDFbmj6pdhyO6mNioNxsEmNfFrZCwETfEwk2954BA9khXwZzSwd+5pO7ET4g3nrcD5+tFRVQO+
	lvmTfn4rOfMJa7JFunQaNWW2e66IE+0cQqBOo
X-Gm-Gg: ASbGncsRBmIVTGAy/RkTjKG/nTCCnwzYMzh0mMdqoDk91SRJP9DZtXFZf9lGIRNqR68
	AxLCqwF/My3E4C7KfdJgJSzBBrseH1FrgU3bGXf29COZZ39QblvFB9h6OfBO/jI4h9zXYzwg=
X-Google-Smtp-Source: AGHT+IEtTXrfsemev1bQXjp2ru2C3SgTe0WM6v4TuwBypYZLXlJpqMqyNYgXDGfoZdfwkwvY0DZhia4IV4zRNCi3yYE=
X-Received: by 2002:a05:622a:5a86:b0:466:861a:f633 with SMTP id
 d75a77b69052e-467a588583cmr208881cf.5.1734041011301; Thu, 12 Dec 2024
 14:03:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com> <20241102175115.1769468-8-xur@google.com>
 <c0a6ae91-c925-40d6-8f95-59a9144d203b@linux.dev> <20241212213448.GA865755@thelio-3990X>
In-Reply-To: <20241212213448.GA865755@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Thu, 12 Dec 2024 14:03:19 -0800
Message-ID: <CAF1bQ=R9MTbCeRJi4eNMSW4s5OFVPXUhM3RPyUKr4xMn+Y1YwQ@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] Add Propeller configuration for kernel build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Li <davidxl@google.com>, Han Shen <shenhan@google.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Peter Jung <ptr1337@cachyos.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We will take a look at this issue and get back to you. Thanks for
reporting this.

Best Regards,

-Rong

On Thu, Dec 12, 2024 at 1:34=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, Dec 12, 2024 at 01:20:46PM -0800, Yonghong Song wrote:
> ...
> > > +5) Use the create_llvm_prof tool (https://github.com/google/autofdo)=
 to
> > > +   generate Propeller profile. ::
> > > +
> > > +      $ create_llvm_prof --binary=3D<vmlinux> --profile=3D<perf_file=
>
> > > +                         --format=3Dpropeller --propeller_output_mod=
ule_name
> > > +                         --out=3D<propeller_profile_prefix>_cc_profi=
le.txt
> > > +                         --propeller_symorder=3D<propeller_profile_p=
refix>_ld_profile.txt
> >
> > Prevously I am using perf-6.8.5-0.hs1.hsx.el9.x86_64 and it works fine.
> > Now in my system, the perf is upgraded to 6.12.gadc218676eef
> >
> > [root@twshared7248.15.atn5 ~]# perf --version
> > perf version 6.12.gadc218676eef
> >
> > and create_llvm_prof does not work any more.
> >
> > The command to collect sampling data:
> >
> > # perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c 500009 -- str=
ess --cpu 36 --io 36 --vm 36 --vm-bytes 128M --timeout 300s
> > stress: info: [536354] dispatching hogs: 36 cpu, 36 io, 36 vm, 0 hdd
> > stress: info: [536354] successful run completed in 300s
> > [ perf record: Woken up 2210 times to write data ]
> > [ perf record: Captured and wrote 562.529 MB perf.data (701971 samples)=
 ]
> > # uname -r
> > 6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39
> >
> > The kernel is a 6.11 lto kernel.
> >
> > I then run the following command:
> > $ cat ../run.sh
> > # perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c 500009 \
> > #       -- stress --cpu 36 --io 36 --vm 36 --vm-bytes 128M --timeout 30=
0s
> > # good: perf-6.8.5-0.hs1.hsx.el9.x86_64
> >
> > # <propeller_profile_prefix>: /tmp/propeller
> > ./create_llvm_prof --binary=3Dvmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572d=
fac1b39 \
> >          --profile=3Dperf.data \
> >          --format=3Dpropeller --propeller_output_module_name \
> >          --out=3D/tmp/propeller_cc_profile.txt \
> >          --propeller_symorder=3D/tmp/propeller_ld_profile.txt
> >
> > $ ./run.sh
> > WARNING: Logging before InitGoogleLogging() is written to STDERR
> > I20241212 13:12:18.401772 463318 llvm_propeller_binary_content.cc:376] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is PIE: 0
> > I20241212 13:12:18.403692 463318 llvm_propeller_binary_content.cc:380] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is relocatable: 0
> > I20241212 13:12:18.404873 463318 llvm_propeller_binary_content.cc:388] =
Build Id found in 'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39': eaacd=
5a14abc48cf832b3ad0fa6c64635ab569a8
> > I20241212 13:12:18.521499 463318 llvm_propeller_binary_content.cc:376] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is PIE: 0
> > I20241212 13:12:18.521530 463318 llvm_propeller_binary_content.cc:380] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is relocatable: 0
> > I20241212 13:12:18.521553 463318 llvm_propeller_binary_content.cc:388] =
Build Id found in 'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39': eaacd=
5a14abc48cf832b3ad0fa6c64635ab569a8
> > I20241212 13:12:18.521611 463318 llvm_propeller_perf_lbr_aggregator.cc:=
51] Parsing [1/1] perf.data ...
> > [ERROR:/home/runner/work/autofdo/autofdo/third_party/perf_data_converte=
r/src/quipper/perf_reader.cc:1386] Event size 132 after uint64_t alignment =
of the filename length is greater than event size 128 reported by perf for =
the buildid event of type 0
> > W20241212 13:12:18.521708 463318 llvm_propeller_perf_lbr_aggregator.cc:=
55] Skipped profile [1/1] perf.data: FAILED_PRECONDITION: Failed to read pe=
rf data file: [1/1] perf.data
> > W20241212 13:12:18.521718 463318 llvm_propeller_perf_lbr_aggregator.cc:=
67] Too few branch records in perf data.
> > E20241212 13:12:18.554437 463318 create_llvm_prof.cc:238] FAILED_PRECON=
DITION: No perf file is parsed, cannot proceed.
> >
> >
> > Could you help take a look why perf 12 does not work with create_llvm_p=
rof?
> > The create_llvm_prof is downloaded from https://github.com/google/autof=
do/releases/tag/v0.30.1.
>
> I think Peter may have reported the same issue on GitHub?
>
> https://github.com/google/autofdo/issues/233
>
> I wonder if this is a kernel side or perf tool regression?
>
> Cheers,
> Nathan
