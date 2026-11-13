Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587601;
	b=Qsb6qiZ78oMu25Oyf0jiBoRy9hQlLJP+UpIbIRzKZyixK5IEW/X/YKPP6vmiSWefzMkt
	 QzfANrCxiS80EEwr8/jLHYzt9TE+Isvj777RqeS59j4T79/rIyrX9VP4UBClH8/WVcaNz
	 OgBou5AAlrO6H3e1XsrFfQ0hC+LPtDccLKVKwhvpLRKcbeQnBRW5HYFjDZIEfMa5m5cWy
	 EJM3IL5JhEAt/sEE+9l+3p8OD+8UOMDFUq9h/TsarnUmBfjsgrUU2Ka9WwojNOr048rj/
	 HXUsZTuWMHDVQRKKdPk3yWw1tBPzDZ2uPPna2MxzMr0PLCgbh7CHqERqfZOejeHuMeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
	b=dD8nCwDhp2kKFxKpWBImZ94YWnEwxWDmdNfPy7DF/wG5qKz9DQrJp6wPL/rDA5e/1EhV
	 O0YPVdYgTMPJ6btNbnyCbfiHfkG+9jj6RuVly2izgZY8Hzsbj7azNlQbgjh/QkKZvz2VQ
	 qJxqMUXJ6TrLM3QKtCfs6RgEUZud92k4UIweHtJlURgGM2EvIIiKS3UojG3W2lA2vL9bK
	 AErpVe8K0K5xI2JWt0UXUIQNoFAXD47+M2bC5PnxHnggr7TCXgNUsS0w2j3oTKaMDHh9K
	 LWTN6sz54hMp49fzpJjexWK95qOWQTThf4QWeLyLKhAIQF/XYkDc3qFwEckBr26mcOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS+kzEPA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6F606A32D
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A6F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS+kzEPA
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so424841cf.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587600; cv=none;
        d=google.com; s=arc-20260327;
        b=MwondL5ZHhjFQNLItV2A2Lv7Vep1FOYGzsHjtHVQi3QdWC9SgbzL6tl37AHxxud6ux
         52VhaAVN3RWopN0Dbo6w+BDYcwfd4OvpUMhjX7+4b28tBT6IJPdkaZGfNdZx8nssv65G
         mYn8OQsnd9Q4zi2UVtAjfdo/uBTosdWx11Z7WBWkxYWU/kzwUi0Rg6VbpK0F2pSG0XAS
         XNvGeG7XDNMr4NESrDl3v2muHs+nMGW9YxWoKGD8Dx1HEbRW6U0bL1PRDRYs60AyPGXj
         oInz6QBtj/xEL4cF678ByvrQAdsyiWMwru0RxIxKyIktK05W1jV+DwQ9ZHL/1k0l+vyS
         WSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
        fh=S9/YNqOB5FRpDmgNHDGhA/kd+mytPIB0dHzN7m6Q7Vk=;
        b=LXJ85f4ybadND3F+XJdAxrvXDysbabwiOako52hnupmaSSGjC3bUU+60YwAtEzybUw
         rLKuHBrr47LLzLYwb78Dxw5sQ75j1VIpQHDANITEOdxJ52oe5t861PRA80Zd5cy1g+ZG
         C11YTbUvhtBnmoP5f48+Ads3nMzHk4jR+DodKEE0P3eKAMKupaM57tAmJ5OQu8w0TBqw
         KK6sE05d44RMdRM2KjQl1wPkDOdeCDuK3X+6QoRkwgkWL5IUxZCmxuPXbSWsiAWG49pp
         BGxfaKhe8j7UYTsYMYTZCIaM0/zEbo+WOjEbEtif2QnrX1fih3/O3zMzqLRUsuvaGN/z
         hQrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587600; x=1795192400; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
        b=gS+kzEPAK6cRYsWfYUL5b2hJSyU5fiQOjf1TYslyX2HlOqMQerNeBCkitzSjb2RK3v
         4HMxJqVXpoqJ9mSxg5kK9Tl8ie9rsQT3zGb0wQ0GSYF+anRzHjWfIfBkYljvp0MB8wZR
         dNKXLs2DLD43OjAsdYDx3BL00OgiUsQ/2eKDBfJjWRhFkzPJ81vE6FoOXjkcZXj8fvJg
         lMT8bk5VhCWWoMavcAwJIhhghgHvzZgKm4bUBQWWiTW7rlsARkF9K7WZF2/LG2xVImY6
         7s0ur6NHwFp/p4dM7mW6KpOxDlyZ0wYPeVjEgbVMr1TNqptKayg/gT8xBRq7Kx80Od2g
         PAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587600; x=1795192400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
        b=0h7y1uKy9Zb9a0lCYlQgnKEsOpkBKpbLqVTltsapBoqmE5BMOZDZL84FP8fRQcXGYz
         Z/5ejol3sWnLgHlKK1mn9RWDZ62oN8KBgz+LVVBdFwz3wL0hOlQeOR8x0P0DmcnVdn1a
         b3+F2bpQZQUcjFKr1lkI4+8OuYoXla+fZcBCXpk+u5mQ9/fnXOwEjHilgCSyNd1cDJEM
         yOWfBuKyt55TUoujiXBow49UtcgkTx6wo/iiXYgNG9Rmptq+KfSOYMTcOkTN1GTD9pG9
         KzPI0PLhFEaGIhfZQ/CaCdl8TUIL1uyyTDvACObGZcrMoST13zss2D+xX75rTBgIOYPG
         rMoA==
X-Forwarded-Encrypted: i=1; AL+hErEbHX2rsLEjzk5DQvznDJ5F0neys6PGPO6G/6De7m9pveF00OG8xl13lkxms4Tga4QlMCEz@lists.linux.dev
X-Gm-Message-State: APuU4Z8yO9SNvK6tDiTgHq2NXap2GUtBxr/5OAFxZ4oHWjcdka0Pk6hJ
	0bW2733kTHP/nskBmdM7hxn+rAkrCSVg1SwAErG3paSOiAqFkiGtHkW4DappduPKJp9MLOde0OY
	pY9VadHqyDG9Kzfyh/xPDT+DYk+uEkT2FEbqtOw8D
X-Gm-Gg: AYBFou1j1/TB3HGJvmScjIPj0gqpUVBrQIv8cyBYzVfyMnQqQqQyU77fcYjxIB9t9UE
	IqK2XIEahrnNt5jRwBxVB2ghJfJuL86j0woNLYjg9Z8eyEHGa6IsgyHZ8dHcWur5SWDDrMCWMS2
	kT4H+j6WAGhXQlRZEzmuPAGLkjJLsL0EBfSIIkU4rGwmZ7A7fakJQ0lgDzzHpqX0g60g38nE4Ra
	e5VH9q4p4tXB1IJ3dEkZc/1zN8PI/ngHNo8onohafWZokjx60oUjujxNz3RbY87NUvAS/zQV1Wv
	z7oGZfTN0yn/nXrJQO6Zago4FOXtRvUOlCrcwCipn9tQgEXzgGSC/0Q8lOKFOSBPGAiRxwgElEN
	HlFn97NSGT/+Ew8WmKvMyQa7uvmnDMs3ky6J3eOzXOAJUDYj+YbwO9ksD3y7cpHpL0Rc=
X-Received: by 2002:a05:622a:124a:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-55adbb72c40mr15083541cf.4.1794587599092; Fri, 13 Nov 2026
 08:33:19 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-9-irogers@google.com>
 <avVgPUFGCPycCWSI@google.com>
In-Reply-To: <avVgPUFGCPycCWSI@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:33:08 -0800
X-Gm-Features: AclHuK9L-E3dF8YJnLshs1tY7VQqvZTZoGdVDHChKgorJQHTyeGB3QWOADeecfk
Message-ID: <CAP-5=fVy8oN3okjJKHYvtqT0ZWWx=8uT24HkPhgvwwcKzvG4Aw@mail.gmail.com>
Subject: Re: [PATCH v12 08/20] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:44=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:00AM -0800, Ian Rogers wrote:
> > In machine__process_ksymbol_register(), set the binary type of non-OOL
> > ksymbol DSOs to DSO_BINARY_TYPE__BPF_IMAGE (which
> > machine__process_bpf_event_load() upgrades to
> > DSO_BINARY_TYPE__BPF_PROG_INFO on PERF_BPF_EVENT_PROG_LOAD), and update
> > dsos__find_kernel_dso_cb() to skip DSO_BINARY_TYPE__BPF_PROG_INFO,
> > DSO_BINARY_TYPE__BPF_IMAGE, and DSO_BINARY_TYPE__OOL so that
> > dsos__find_kernel_dso() does not match ksymbol DSOs in machine->dsos.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/dsos.c    | 3 +++
> >  tools/perf/util/machine.c | 9 ++++-----
> >  2 files changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
> > index 1574c8885d78..fbbf98c4ccae 100644
> > --- a/tools/perf/util/dsos.c
> > +++ b/tools/perf/util/dsos.c
> > @@ -475,6 +475,9 @@ static int dsos__find_kernel_dso_cb(struct dso *dso=
, void *data)
> >        * is_kernel_module() treats it as a kernel cpumode.
> >        */
> >       if (!dso__kernel(dso) ||
> > +         dso__binary_type(dso) =3D=3D DSO_BINARY_TYPE__BPF_PROG_INFO |=
|
> > +         dso__binary_type(dso) =3D=3D DSO_BINARY_TYPE__BPF_IMAGE ||
> > +         dso__binary_type(dso) =3D=3D DSO_BINARY_TYPE__OOL ||
> >           is_kernel_module(dso__long_name(dso), PERF_RECORD_MISC_CPUMOD=
E_UNKNOWN))
> >               return 0;
> >
> > diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> > index 5eb5efa4eb90..0334cb01349a 100644
> > --- a/tools/perf/util/machine.c
> > +++ b/tools/perf/util/machine.c
> > @@ -769,6 +769,10 @@ static int machine__process_ksymbol_register(struc=
t machine *machine,
> >                       dso__set_binary_type(dso, DSO_BINARY_TYPE__OOL);
> >                       dso__data(dso)->file_size =3D event->ksymbol.len;
> >                       dso__set_loaded(dso);
> > +             } else {
> > +                     dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IM=
AGE);
>
> Shouldn't this move into the if statement below?  At least it should
> check if the ksym_type is BPF.

Good catch. Setting DSO_BINARY_TYPE__BPF_IMAGE unconditionally was done
so dsos__find_kernel_dso_cb() would also skip bpf_prog_* ksymbol DSOs
before PERF_RECORD_BPF_EVENT sets DSO_BINARY_TYPE__BPF_PROG_INFO (or
when --no-bpf-event is used), but that mislabels BPF programs as
BPF_IMAGE.

In v13, I've moved dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE)
into an `else if (event->ksymbol.ksym_type =3D=3D PERF_RECORD_KSYMBOL_TYPE_=
BPF &&
is_bpf_image(event->ksymbol.name))` block, and factored out
dso__is_bpf_prog() from __map__is_bpf_prog() (which falls back to
checking the "bpf_prog_" prefix) for dsos__find_kernel_dso_cb() to use.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +                     if (is_bpf_image(event->ksymbol.name))
> > +                             dso__set_long_name(dso, "", false);
> >               }
> >
> >               map__set_start(map, event->ksymbol.addr);
> > @@ -780,11 +784,6 @@ static int machine__process_ksymbol_register(struc=
t machine *machine,
> >               }
> >
> >               dso__set_loaded(dso);
> > -
> > -             if (is_bpf_image(event->ksymbol.name)) {
> > -                     dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IM=
AGE);
> > -                     dso__set_long_name(dso, "", false);
> > -             }
> >       } else {
> >               dso =3D dso__get(map__dso(map));
> >       }
> > --
> > 2.56.0.542.g3ef89b7020-goog
> >
