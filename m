Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105119E7D8
	for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721142330; cv=none; b=jvBCzA8MwOwjcxRYl5/uUX8771InlMCz+QATewW3OHV/mvNHIoc0sMAH5B6IinE2wKbWhZjphWpGZnr5SPM8xL80+ttF+WprEL5oDE0fkPY5GxZ79MqhAFbJUUmjGT2FZr8R0WCtyClCdeWAonYhtgM0wSmnXJPGRYZb9qahKD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721142330; c=relaxed/simple;
	bh=xefOgnZeuLhtvi65uS18ux4ujjqzyflaGqyvkSgWkHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJwGKVKwT5K0SCnkXGy9bfV3lxpFJ6qxpOBtAHP0Hugb9IzgtrTefFlver0Uo+jGzzeip5KotnGFSn1UKnuT/qGS2rJiag2q1E0oKH1FhK+SES/+lSn7skGkng3OZbQGZEO4w2Ls1JhOAJmA5bq7fF4ARfjFs4fwNx7/XbT0GvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gqFlhlwx; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gqFlhlwx"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-375fc24a746so128795ab.1
        for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721142328; x=1721747128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xefOgnZeuLhtvi65uS18ux4ujjqzyflaGqyvkSgWkHM=;
        b=gqFlhlwxSUx9VTFZyGpyJTGZXTvClnQJmz4z9w+uWKz+tQEhGUxdhjiqJDMX3DBNCT
         jjH5av4F4z8A7GpaUs+wTIp5ehI512jGAsa5N6LPkfhm88oP5XPJmrFxWScUsNiAET79
         pw9TEH2ff1UnR6qmiSzbHgwGkGaGoH24wQ2HBvZCL8P96YZlAjGtM2qULAcU1C9BgWAW
         7ovIwMAs8i1AB/keQXZk2Or2HpYPcEMcc/3OlqV7m2uwN3/KxiS3DA09vEMT6WCFqfmx
         qzgpkZZcsTS1OA0PES0GRxAMk0lIKrISzImAS0fWdCjeunda2RZFzvizDvag27m5xIOw
         SmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721142328; x=1721747128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xefOgnZeuLhtvi65uS18ux4ujjqzyflaGqyvkSgWkHM=;
        b=Vn+7sjesnxaaJxRCGhkACDVM/dLrau4AfSiHi0UlZDPHWyKagquoiRpWQvgSuSHWWc
         bCt3/RFnvI6JBB3g7XClewBRGVzqC/4wp5AY25zHHRqt1l2bwkveAOT+vaIuHSZ/avxa
         ciSIF7WCCrYl76YN1vcGUXkzh5jxRrsssiMRXzqxIQqchspuPgFlYERG4OGSUS8Yg+iE
         rIgJp0/mXGNv/sJUH58DoF42pUI5W6n1GgeiZ64xJjXmHEsuf/ZTHPcPg0cAf0uIzaKg
         J2nnTOz0PG/Qy0PhCEPKiHoQo276Jdq4TP9UmxVLnxOnkIFZAtVGaJtJmXQeyosmZdLo
         KvLA==
X-Forwarded-Encrypted: i=1; AJvYcCULDRoWn0hyradd0JAQOEQRu+7B0RUjodbyGeWEL+O3BfNfa8j/P8g9QNVAfyMusJegjeaEh5MVUIycm2UsTW9IBZVwsQ==
X-Gm-Message-State: AOJu0YyTOnxHxOWtVhlCidk+Bjq2Ee1GJm25R2u2ezyzqezO9MhmTHNq
	YxMIxzZB3FJeqCwNIyj96i8LMw85E2ERqrUTYM31/gGuWRyhUbmSWR5O/nIHxhTxYhpnHGqrDqK
	CKUgkShphfYZLOye3+U+Wl7pth/PzdUbgLCwIawhcQLYFEQOPWI1ODDw=
X-Google-Smtp-Source: AGHT+IEIPantRUK2oSHuRgiQ05thlnoYDlj/klIq6vsDAHLGGqEsy9dglfj/Nwvip17tk3QxhSF3RAgc09241BCGrbc=
X-Received: by 2002:a05:6e02:1cae:b0:37a:9156:400 with SMTP id
 e9e14a558f8ab-393c25f44e6mr3042645ab.28.1721142327777; Tue, 16 Jul 2024
 08:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240715143342.52236-1-leo.yan@arm.com> <CAP-5=fVd9pO7kKvZX7PZ6sJ+GHOV7aF=Ry98a=vknimuSTp9Lg@mail.gmail.com>
 <1487da55-24dc-40ef-a6e8-4bf4b153fdc3@arm.com> <CAP-5=fUGJmOr9XcsVWWCREjr1A7rUFaMk0VPkQAKDAEjTLKJVQ@mail.gmail.com>
 <CAP-5=fWY4AeMxfNGh_jB4gss_qtGSgfX4pvv-D-fpCWuqamVfA@mail.gmail.com>
 <f316e3ce-e1e3-45f0-ac78-9af590b58706@arm.com> <CAP-5=fU=LguHNi861L4gmgZWXrrgZtG1w5cdw7hXDxnfWyJyMQ@mail.gmail.com>
 <a17e6701-4195-4132-8518-fe4b10403f7e@arm.com> <CAP-5=fVi8RJVokVBQtin8xSAq7uxN=GB7zcC4OiT=SzqWB+V0w@mail.gmail.com>
 <0c20b4b7-c1f6-4c0e-9f89-a99c25555640@arm.com>
In-Reply-To: <0c20b4b7-c1f6-4c0e-9f89-a99c25555640@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Jul 2024 08:05:15 -0700
Message-ID: <CAP-5=fVvg=5SE29_SUW0MWmLADL477vpP2DBid2kKZ8kNqxXiA@mail.gmail.com>
Subject: Re: [PATCH v2] perf docs: Mark the Android document as obsolete
To: Leo Yan <leo.yan@arm.com>, llvm@lists.linux.dev
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 6:49=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
>
> On 7/16/24 14:30, Ian Rogers wrote:
> > On Tue, Jul 16, 2024 at 3:06=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote=
:
>
> [...]
>
> >> Thanks for correcting. Now I even can build successfully with the Clan=
g
> >> from Android NDK with an additional flag 'NO_DEMANGLE=3D1'. Though we =
still
> >> need to disable several modules for passing the building, but we are o=
n the
> >> right way.
> >>
> >> Would you like to continue a formal fixing or you want me to follow up=
?
> >
> > +clang-built-linux
> >
> > If you could follow up it would be great!
>
> Okay, I will look into it.
>
> > I'm not sure how we detect
> > in the build that we're using clang, I suspect there is an approach in
> > a different kernel Makefile/Build that already tackles this but my
> > quick searching didn't yield anything - perhaps the change would be
> > better suited to the location the CROSS_COMPILE prefix is added to
> > gcc.
>
> Should we follow up the steps in the Documentation/kbuild/llvm.rst?
> The document uses the flag 'LLVM=3D1' for selecting LLVM/Clang.

Fix clang-built-linux email to llvm@lists.linux.dev

I'm not sure as the kernel build and the tools build differ in certain
ways. Perhaps look at the selftests build to see what they do, as they
are under tools and share the build files.

Thanks,
Ian


> Thanks,
> Leo
>
> > The only thing the change to Makefile.config is doing is
> > injecting the --target option. I'm not sure anything more is not
> > working for me on my laptop with this approach compared to cross
> > compiling with gcc, but as you say going in the right direction is
> > worth it anyway.
> >
> > Thanks,
> > Ian
