Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1FF110B
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u9rYmCeQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5032a508e74so1013e87.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 15:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696545320; x=1697150120; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKaIQ8Zyh16/tVcnFuQ7sDuazPniKY0bHDKBdsLSgQk=;
        b=u9rYmCeQMsTGId9VFf3n4+q1jMbKASOEpIRv86CxGmsRsqlt2ujq5wSD1Kord9gQgn
         k6oTanh32A0wOzFni4RxPqa+dz/1S5iV/AeMGjngxHUaoXfU6lUpi7S3VJg9X0nK4XEx
         NGpNTfICn1gya2SeHPazCscMAPy7fxkKHPPA4MisoVAJO1SONiVenQYp/uKrhbNpxRzQ
         RAP7NxjXo6dL0RwM9ZEmzvXiDFHinZw8qPtV0o2gNUV/krXeEOu4KQ8bYGH1k/8bIygr
         kmSXV+HI7KYnk7KyQVpCfvdDL6khjoVjgLf8ic9M3LPqcT9IsD+Ydy4GRGVCy1BlU3hJ
         nyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696545320; x=1697150120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKaIQ8Zyh16/tVcnFuQ7sDuazPniKY0bHDKBdsLSgQk=;
        b=ATs8tn++knCwa11DSXcruSjHUMZsbSm+Ul/ecCIW4awIXpOQw98D4aUnSTklc12B3P
         S9efXZg4U5/E9rMZHea+9cKUCdDO6OkImlEsaVmw4QDuG99mcTKIN1k3MslAlOf8Nu52
         8G8wPEYskMUv5PScOEK0x66S7AomzD1qBKRBPdw6fGvPgf1okpdWSCE7LYFQJ4tE8jTR
         JSAwcaaDaa4gBijppGtxP2hN05DYuQ7m39CM6ngT2/lA5Ug+UPxFEo5fCaVzYomg3Ect
         47p+uEndzgQsl1C71u0JDqqwTWmh07hvRrgE9K0CIuIafg9hd4EcsGL1BOz8jsz9NFSX
         Hb4Q==
X-Gm-Message-State: AOJu0YxMUkNaGgRUaJoyAOud+qOypvE4oVRpH6Jid9VvVKQdCYZGSqls
	7AysI7/oFiaI8QQmyVjRGQSmOl4Ju8pZXOFFAoXaUw==
X-Google-Smtp-Source: AGHT+IFqiQSTSTwPTJ61CESf8GdTp78bw4W7PrhxaBvAYX3nwWRy9q/Us0yHiv3NoCGSa/fT9UUpSF7pItxtBuBJLKY=
X-Received: by 2002:a19:7006:0:b0:502:dc15:7fb with SMTP id
 h6-20020a197006000000b00502dc1507fbmr90726lfc.5.1696545319446; Thu, 05 Oct
 2023 15:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com> <20230923053515.535607-2-irogers@google.com>
 <CAKwvOdmHg_43z_dTZrOLGubuBBvmHdPxSFjOWa3oWkbOp2qWWg@mail.gmail.com>
 <CAP-5=fV6c1tWAd2GjMwn4PQN=3BXNQGz=vbonHSjRjQ3fbEL+g@mail.gmail.com>
 <ZRWMWcNKvZMgiAMR@bergen.fjasle.eu> <CAK7LNASuOWtd-iv2C3HLWr1oq9gD8BiP4B=8wRUo81CSK=g5Yw@mail.gmail.com>
In-Reply-To: <CAK7LNASuOWtd-iv2C3HLWr1oq9gD8BiP4B=8wRUo81CSK=g5Yw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 5 Oct 2023 15:35:07 -0700
Message-ID: <CAP-5=fVz-Yqb_AnkJkoBAO8id7m2f0qaU_VnFVDoAXagwHfz6A@mail.gmail.com>
Subject: Re: [PATCH v1 01/18] gen_compile_commands: Allow the line prefix to
 still be cmd_
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Yang Jihong <yangjihong1@huawei.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ming Wang <wangming01@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Yanteng Si <siyanteng@loongson.cn>, Yuan Can <yuancan@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 7:31=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Thu, Sep 28, 2023 at 11:26=E2=80=AFPM Nicolas Schier <nicolas@fjasle.e=
u> wrote:
> >
> > On Mon, 25 Sep 2023 09:06:11 -0700, Ian Rogers wrote:
> > > On Mon, Sep 25, 2023 at 8:49=E2=80=AFAM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > On Fri, Sep 22, 2023 at 10:35=E2=80=AFPM Ian Rogers <irogers@google=
.com> wrote:
> > > > >
> > > > > Builds in tools still use the cmd_ prefix in .cmd files, so don't
> > > > > require the saved part. Name the groups in the line pattern match=
 so
> > > >
> > > > Is that something that can be changed in the tools/ Makefiles?
> > > >
> > > > I'm fine with this change, just curious where the difference comes
> > > > from precisely.
> > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > > I agree. The savedcmd_ change came from Masahiro in:
> > > https://lore.kernel.org/lkml/20221229091501.916296-1-masahiroy@kernel=
.org/
> > > I was reluctant to change the build logic in tools/ because of the
> > > potential to break things. Maybe Masahiro/Nicolas know of issues?
> >
> > I haven't seen any issues related to the introduction of savedcmd_; and
> > roughly searching through tools/ I cannot find a rule that matches the
> > pattern Masahiro described in commit 92215e7a801d ("kbuild: rename
> > cmd_$@ to savedcmd_$@ in *.cmd files", 2022-12-29).  For consistency,
> > I'd like to see the build rules in tools/ re-use the ones from scripts/
> > but as of now I don't see any necessity to introduce savedcmd in
> > tools/, yet.
> >
> > Kind regards,
> > Nicolas
>
>
> tools/build/Build.include mimics scripts/Kbuild.include
>
> That should be changed in the same way.

Thanks Masahiro,

I support that as a goal, I'm not sure I want to embrace it here. For
example, in tools/build/Build.include there is:
```
# Echo command
# Short version is used, if $(quiet) equals `quiet_', otherwise full one.
echo-cmd =3D $(if $($(quiet)cmd_$(1)),\
           echo '  $(call escsq,$($(quiet)cmd_$(1)))';)
```

This is relevant given the use of cmd_ and not savedcmd_. In
scripts/Kbuild.include there is no equivalent, nor is there in
scripts. So do I dig into the history of echo-cmd unfork that, and
then go to the next thing? I find a lot of things like
tools/selftests/bpf won't build for me. When I debug a failure is it
because of a change or a pre-existing issue? Given the scope of the
Build.include unification problem, and this 4 line change, I hope we
can move forward with this and keep unification as a separate problem
(I totally support solving that problem).

Thanks,
Ian

> --
> Best Regards
> Masahiro Yamada
