Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE086ABC
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 02:15:17 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-41761e9181eso131551cf.1
        for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695089716; x=1695694516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quPggTFwi0XTpntnGHPGihRCg7HVdEcvKNxZf56FGgw=;
        b=0BybRvu1RWiAWmcUNzPSjFRMrNgTzmPbFGrwS/sIbpGvQpLYV5LkqBSVoL7TtCfFXY
         WY0SlvPhDyDdZisPPGISsvg5T1Ik1fIUSQ+cwS9/ENZtntH/zzbvWPmC+vXheXRqiRwL
         TYJoa5nixC4dMzgZaO/IFBJ5H2TaZhe5JPwhHlqhTauSEmEvXmkhBZkqiMy8HKIBdrND
         QvGTrmVO8mW4mQvWsrNcJbHb2+n1KnOWUAfW6rLTBwINCK4w2PkvWSXQ04zikPIk7t3Y
         dJzhMZEpd3mLQ9p6SjjscYSXpZjxMlwhXYYodrGWmPZTaoySBZZlnc6R1C/PuZlCnHiq
         qqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695089716; x=1695694516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quPggTFwi0XTpntnGHPGihRCg7HVdEcvKNxZf56FGgw=;
        b=QyDBtyy0o/Btm5ca0XLNNPmSKPjaUHnjWx9azlan6ZjviQteJ/7V7LlrnU7Jtn9XrO
         UM0+Th8msulKcRsTHhowen9vZwZWWD+P7POPagF/swCcEdsxdTl1w3X09xr59kL21afy
         7XkY/rbKk+eqO/2r/Y5yI21FGtV8XLWuX3lqJJshy2pJyL8l0n/1wtf2SE1JkWAPmlmO
         E1LHREqyThcsdxUkPC/HV7HYl6BVPIDyP2KrQsP3N3n2c56+pM3YuXoUaBAQaOyffsjs
         aMbIKOruTq5EpVf3LjKpWxCaV8zWfORQZMq6VqO3FuWPmh9ZwnRzcjbJzaVHnf091YI+
         fAIQ==
X-Gm-Message-State: AOJu0Yw3vcs4Gg7iuAEan064FWaiy30gVfcC6LLgR8C5hh8+U2WM349O
	vs0yuL5/HVAQE2rM/yIqiFUlelxY9oHfDAcWcVhkKA==
X-Google-Smtp-Source: AGHT+IHoBSJFRxW0g2Vvg66ZyOabyfndhAOtH+QMKpyq3zzNhS3e3yt+3MKN21XQ9/koIthaqFEP3eTmXB3B3rh2hQg=
X-Received: by 2002:a05:622a:188d:b0:3f2:1441:3c11 with SMTP id
 v13-20020a05622a188d00b003f214413c11mr145770qtc.2.1695089716163; Mon, 18 Sep
 2023 19:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com> <20230914211948.814999-5-irogers@google.com>
 <CAM9d7ci3JPZ8ABamXUCRrAEV3jE=twPLSByOU_LC8LdzPedP2w@mail.gmail.com>
In-Reply-To: <CAM9d7ci3JPZ8ABamXUCRrAEV3jE=twPLSByOU_LC8LdzPedP2w@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 18 Sep 2023 19:15:04 -0700
Message-ID: <CAP-5=fWTr9f79k=AqGtE0BtwtXBygp6PKtqJGu8dH2W8p0Gs2A@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] perf test: Ensure EXTRA_TESTS is covered in build test
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nick Terrell <terrelln@fb.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Patrice Duroux <patrice.duroux@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 4:34=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hi Ian,
>
> On Thu, Sep 14, 2023 at 2:20=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > Add to run variable.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/tests/make | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/perf/tests/make b/tools/perf/tests/make
> > index a3a0f2a8bba0..d9945ed25bc5 100644
> > --- a/tools/perf/tests/make
> > +++ b/tools/perf/tests/make
> > @@ -138,6 +138,7 @@ endif
> >  run +=3D make_python_perf_so
> >  run +=3D make_debug
> >  run +=3D make_nondistro
> > +run +=3D make_extra_tests
>
> I'm curious why it's missed.. I couldn't find a commit to delete it.
> Maybe due to an incorrect resolution of a merge conflict?

I think it was just a mistake in the original patch:
https://lore.kernel.org/lkml/683fea7c-f5e9-fa20-f96b-f6233ed5d2a7@intel.com=
/

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> >  run +=3D make_no_bpf_skel
> >  run +=3D make_gen_vmlinux_h
> >  run +=3D make_no_libperl
> > --
> > 2.42.0.459.ge4e396fd5e-goog
> >
