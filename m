Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587655;
	b=4ybdabmeCIOF5vj/X/HfhhznvpjAB0u0usadFkAcN57JT8uawhDMdIVphRwl79XODwiL
	 gWrowKI6EoeudgwuhrL+Inr741MjsrBzJ9lGL+qM+m6qkI4rKcFnGVu8SEybATWeCj8rj
	 /+slbfjklDE8CLcP9vYnHKwWaHPL9vf7dbq20qUIDCkHkNzarJPn6tIowqlnxLSQqfBmF
	 vk+kdRBCEMk77V6ZN3/Psgse9Xc4xxK0MffLvSsIxzrnvuv/CiE5GygN4vdY4irbkMxnS
	 E1gidz/IRHo0t3NaCop+ZL6KeWGmV3xaZ+sDy+nKHfRR+dxvkWQCfUamEVzol9Si84g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
	b=psWUx2GjOn1AgWBRAbXlSXdAYvK6W84ewG5S+CBc4xju8WLvzmjQGUyvReoXGDipVaoa
	 ZttdubwRANL0bBNamoVrOGhZVua9uElVv+/JF/vMVcJrzYvMvNMkHEDdLu9liHjpw/aeZ
	 P7LHs0rLXmAIZMPzRWKGQd49DcuOMZ4YCHZnMwb2Gd0MmJb8t2lH7IDIcarw3DSJJIKcf
	 Qefm5AgRnOn7dGRtfbB79q4iytbg0zYlN+rjxj1gJEXo/vkg7dDNU28ORYzgHDBRIL0Wm
	 c+ODYgfKWDv3TAGfC+vtOZ1zysi7NSL/b5cbIlfVwUOO2jfRayXd7Aacgo8T8lu00DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HLYYFyIc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8369606A32E
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8369606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HLYYFyIc
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5383c97c8cfso447361cf.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587654; cv=none;
        d=google.com; s=arc-20260327;
        b=UmLtVMrJdGRwIFaRCMIbgRfdT/z6KX7qHihcscWUVZaMv0634ViRLLExo66AaVCu22
         6udEW6V9jBZZifoMJh+gfI0I1xU0bbTziSdfUFMczx9M84WiAvNRmCKcELT/u+aJIalx
         AupsXQLF0hqS+z9KPiAeje1YBe7dM8R/tLGGJ/gtN+AJCcmpE0coGPonnbAuRyfOB4BU
         TP2AP2neT88CeP6ke7yH/ei7uHzMhChJU9/J9qL5Z6ykrU6L4vmH0I4q4hxdIG5C7XAt
         uv/NmHZ+mTCP7j8nlLo8jEWYExYPRjXdbNVm7cVeSyo7mwxSN/ffKgUtBSiKnnTMdMP0
         nA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
        fh=fIm2GBk+iiCMBwQ70gyP7qNgrUwjPvb+gbX3lFy0dGo=;
        b=WnV0UUvNc9B2dIu9eIVy11X9RFBnvPNcqvn/cth5JUtkDNv3DYWjd7cGiBc44r7lcs
         l93Szl+xhL7s1fNbKmmngck6z65ebujqjMpn5lxYHAtBOnkOxcUfYDpkttUNwf5UPs/y
         DZKyUg2MciuoI84n43UgxXQnaXNKExIybV9WWr9UzNalReQcBcZQ6FcMCnLxy8yV6fYT
         zSC74/blRgGZdbS7rD5u/sHmdgJihVnPdEQxnTZsH22N20HYw9ELV4UO/Hc2IwxeJUWO
         QnhnAs3D5EiuE8TKHLpqvDQzAzihzjaaKLDqUf6yq9npMGk3oOSoLEKKjMlVnz8ZWjpV
         xt5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587654; x=1795192454; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
        b=HLYYFyIc3TDaUVJ0KedbsmTtXSc1TE1l+8kTaBhSUK1kPD4glA6NXT58mJtWdyHZn6
         cEbxVtWSVSXXm+eiQsL8TF7unqpoq8wP9QQOehpr7rqPDl7NW/E0jg131aQfWSRJKKzz
         KOFOJFjytJlw3r91i/RgPEUlHuw0YID7l0ukDpkn6Fh1bZhMcGxt2vVMQR8mhWLxxRp3
         Nb+oB20DYajcvCtq3zNmb2YeC4MsJJL/pI2lvtjidRWoVDRxwW81BcFR+AMpJjt3C8LR
         f6k78V1WWN9qioqttGZGav0lPXc2Fa0FfAk4etKSqsUQDszH9+cBrOLbBaK5BYCoAxma
         AG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587654; x=1795192454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
        b=FzetUZzKAxVTmeqbCBrm2cMsYDR7GrhQ4egeaEhWZAJ3nOWaGnz1Z60dL/DxcBe9Dc
         ZEiX01jH8PNlRkwdf2BtxWPC1BA41x0eDOp/lB1bgqpSU2LTDw/QwRcfm4lnzyvFV79K
         LB/jHiXhW1GrdEAhYFcL1mZsrskXItnPLqWclSlzb+HYKmdBc+Wd9zhNBIF7C+IwuvsP
         rs0YmNbVtc+7MbV5ee9dF3/4Z/mYGPp/ydCibm4QpiK374nfSR6zXPIOYvO0QXI5RGK2
         6x++p6+ZA01cBwi+aGHTMHJDMysqhblk7wtvnwFGzPq8IiFIiDinBZrysgbsVBzgERAD
         qhJQ==
X-Forwarded-Encrypted: i=1; AL+hErFAZceOyaE6mbz1bSlvBp9G1v1RMkPaoz4yrlmQN1rG+OEtBJXQhtF+gZxjoLWkcjK9nHV4@lists.linux.dev
X-Gm-Message-State: APuU4Z9O692pHrfZtTo8Tj9VQj4AZynp3Hw9BMuFZp1ai/XQxe1Kxt0f
	n3CEnmIg/0AawFtNoqNGW7iyTWDzbvkvdGAoYPm4pWgX/xRYl5mTbme6sL/nvFcuGmL2na33P0H
	jINoO3Buj4zxNR4XKWdYvHbdA4vzm3S0ovNoMgfmG
X-Gm-Gg: AYBFou1u3ixR7eiymNZ08AhGQQsV9OW0FoGqkzYmCIwjE2p3AKpYIMmF9bkkVbXtCWG
	EfXBY9AWs3JS5bKehBQU+dTGbspvONv0jHlTiaXAu/hMSNNzDFvpGYWirIvnQlW131H5uLDXg1R
	G2vsnC+WK2OanYGZsWE2pV3bGI5cw7SA4KuUrlSFC0iEodIuzHngm7lAHQpRKoZBvQ4/H2xF3/6
	psQTCtz5513GERzokocKAO1ALK3NAFfRL0PuNyksDYc5U9h3j9tSlXv2jO770cxxP4ppdzq/2XQ
	vt5kaxlhGfULBGMj8k4UJZGXfbqZosXqhDlyxEYqCFOrJj5gBXBS8UJly/VCs5VrK8MYw0wC5D5
	6OhezP/y0WARh8n2aOd/HOqTLZOoXwBt6PEaMddDrPSW48MxnGQbQ3ZKtC0dSs3S30Kk=
X-Received: by 2002:a05:622a:408d:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55ad7e74d7dmr15053831cf.2.1794587652968; Fri, 13 Nov 2026
 08:34:12 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-13-irogers@google.com>
 <avVicOfEPnzFYChm@google.com>
In-Reply-To: <avVicOfEPnzFYChm@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:34:01 -0800
X-Gm-Features: AclHuK9OqGSk8ck1I4JLjB0pnpSD93w92b8e_EbtkFL6s6Mk7Zb6EDKfDxyZGp4
Message-ID: <CAP-5=fVq3rovyLZCKBRSec2mOtpoqQizgLmPPg4n=WEtTRTk_Q@mail.gmail.com>
Subject: Re: [PATCH v12 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:53=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:04AM -0800, Ian Rogers wrote:
> > In dsos__findnew_id(), try finding the DSO under the read lock first an=
d
> > only acquire the write lock when a new DSO must be inserted or an
> > existing DSO needs its ID updated (checked via dso__needs_improve_id())=
.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/dso.c  | 16 +++++++++++++++-
> >  tools/perf/util/dso.h  |  1 +
> >  tools/perf/util/dsos.c | 10 ++++++++++
> >  3 files changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> > index f0e02062c09c..4dc518f7cb7d 100644
> > --- a/tools/perf/util/dso.c
> > +++ b/tools/perf/util/dso.c
> > @@ -1685,6 +1685,18 @@ const struct dso_id dso_id_empty =3D {
> >       }
> >  };
> >
> > +bool dso__needs_improve_id(const struct dso *dso, const struct dso_id =
*id)
> > +{
> > +     const struct dso_id *dso_id =3D dso__id_const(dso);
> > +
> > +     if (!id)
> > +             return false;
> > +
> > +     return (id->mmap2_valid && !dso_id->mmap2_valid) ||
> > +            (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_gene=
ration_valid) ||
> > +            (build_id__is_defined(&id->build_id) && !build_id__is_defi=
ned(&dso_id->build_id));
>
> Don't we prefer build-ID over inode?  I'm curious if it needs to check
> existing build-ID is defined first and return true.  Any chance it'd
> overwrite a build-ID with an inode?

struct dso_id keeps the maj/min/ino fields and build_id as separate
members rather than a union (unlike perf_record_mmap2), so build_id
wouldn't be overwritten in memory, though setting mmap2_valid did take
precedence in __dso_id__cmp() and `perf report --mmaps`.

Agreed we should prioritize build-ID over inode. In v13, I've moved the
build-ID checks ahead of the inode checks in __dso_id__cmp(),
dso__needs_improve_id(), and __dso__improve_id(), returning early when
the existing DSO already has a defined build-ID so inode metadata isn't
added on top of it.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +}
> > +
> >  void __dso__improve_id(struct dso *dso, const struct dso_id *id)
> >  {
> >       struct dsos *dsos =3D dso__dsos(dso);
> > @@ -1692,6 +1704,8 @@ void __dso__improve_id(struct dso *dso, const str=
uct dso_id *id)
> >       bool changed =3D false;
> >
> >       /* dsos write lock held by caller. */
> > +     if (!id)
> > +             return;
> >
> >       if (id->mmap2_valid && !dso_id->mmap2_valid) {
> >               dso_id->maj =3D id->maj;
> > @@ -1715,7 +1729,7 @@ void __dso__improve_id(struct dso *dso, const str=
uct dso_id *id)
> >
> >  int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
> >  {
> > -     if (a =3D=3D &dso_id_empty || b =3D=3D &dso_id_empty) {
> > +     if (!a || !b || a =3D=3D &dso_id_empty || b =3D=3D &dso_id_empty)=
 {
> >               /* There is no valid data to compare so the comparison al=
ways returns identical. */
> >               return 0;
> >       }
> > diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> > index 9e38b3b69e9b..df1748763d95 100644
> > --- a/tools/perf/util/dso.h
> > +++ b/tools/perf/util/dso.h
> > @@ -802,6 +802,7 @@ void dso__delete(struct dso *dso);
> >  int dso__cmp_id(struct dso *a, struct dso *b);
> >  void dso__set_short_name(struct dso *dso, const char *name, bool name_=
allocated);
> >  void dso__set_long_name(struct dso *dso, const char *name, bool name_a=
llocated);
> > +bool dso__needs_improve_id(const struct dso *dso, const struct dso_id =
*id);
> >  void __dso__improve_id(struct dso *dso, const struct dso_id *id);
> >
> >  int dso__name_len(const struct dso *dso);
> > diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
> > index fbbf98c4ccae..1b3f8b84ed30 100644
> > --- a/tools/perf/util/dsos.c
> > +++ b/tools/perf/util/dsos.c
> > @@ -349,6 +349,16 @@ static struct dso *__dsos__findnew_id(struct dsos =
*dsos, const char *name, const
> >  struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, cons=
t struct dso_id *id)
> >  {
> >       struct dso *dso;
> > +
> > +     down_read(&dsos->lock);
> > +     dso =3D __dsos__find_id(dsos, name, id, false, /*write_locked=3D*=
/false);
> > +     if (dso && !dso__needs_improve_id(dso, id)) {
> > +             up_read(&dsos->lock);
> > +             return dso;
> > +     }
> > +     up_read(&dsos->lock);
> > +     dso__put(dso);
> > +
> >       down_write(&dsos->lock);
> >       dso =3D __dsos__findnew_id(dsos, name, id);
> >       up_write(&dsos->lock);
> > --
> > 2.56.0.542.g3ef89b7020-goog
> >
