Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795243547;
	b=1+3zl9tUqd78hR1/M7V4M5Z4MJEmWGkAGRcROgEvYF2+IsUzRDosRSfSOruhvjdHJG1U
	 MdVKMwRwsa9najoXsdCfmMQBsTvaG2koBzDT7NdDENe7csJtvOWtDIwtwju+oB9589sib
	 KOI52sTCA6MRxs6Nh8OiaVjRBUCMuaVc8Ka1D3iupJcyepF32jHGipWVuskysqNW2cne2
	 IHHEANW1oD5OaPDt4sTxW09xEoxD+EjM9VKiL91enjgT5b2ZXKY4NodrRnKyh6oIMBE+s
	 WiBfKm4iUPqcenISqIji6oEUExDq1GErPpJLNwE2qesc0NTVft5KZ1f/1yyslNOkqhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
	b=RSyE4nMUE9XehOCE+EeQVmTkw318c3JaoEMiAlVCcgZ7MA7TOSUrnLKzKc+mwSZoMHol
	 Kwb/c6MRNUcSSZfzLcTDack1Qb6jp6xbs3dIAH42C+oNmMKFAqNNWfWyHqvup2GPb2ZfA
	 IE0I0HLQwzX8ioMdpmUO9e9JnROqmiQ/fiSdqMf5a3qZE7+PuiBPbXPt9vDn0m3JQrDSz
	 uVosJBmRrCFondhPJ3zoEdjurLQI+2fSSMJ8biTwQvZ3C0p/3jZiXc55Djwrd5aSSMMpK
	 NvR6sgdF3tdOPGvBZ46BU/3Vj8AAVbdWwGRaanvvq/glMIzwJm8m82KxOXyHe/8ACAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Gdu5e/eN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A2C606A680
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A2C606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gdu5e/eN
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55be673e029so80351cf.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795243544; cv=none;
        d=google.com; s=arc-20260327;
        b=Mk7v46gxEQRRaH6Q5+cddaH+MjPG9N7PLlP2hGJiXPW7F+cMVlP92VFA81y7k8qrn+
         2D6GfgsWwmIaWBBqVdr9hLyykc0Dt/+O5nHUnOUBeu9/phSQEnu5FABCxHs8f2lisHVZ
         h+GpgnNGvZ+AV9tHeeG4/sn7xcGO7sA+/LY3XpwTUIGwfSAi4gVxduyCfC93cdLxUZ6O
         BhBPxePGYPlHVwaUeWpegutoCol5XdtxYcdHGMaWSuToVcZgs5MxAxlVwcVybknrFKiL
         L7lovyJXaFi9/rDd9YzgFdwcF0ZVJocTPql+nySnrTIzwLzsvvqpbYsvrlvTanAO74f9
         c5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
        fh=G22Y0c0NdgQTwXnCw81T5NsCl9cEUsw6C19hBCWIueg=;
        b=ZHXul6pghXe2pcXrRPtGI8exE80YZW7RgFTGPR/R1/EJk3c1B3bsWU9cNGwV3UnO6g
         OFZaP2F9/tpBgjEa9SUELtLAhiRclaa6BOfhHhgB3B88/q8+cp0beOVCs7rR79hkXI/t
         /x4BqCp6lFLCfFxzqz/3yZAOoT0yUHO7I38qVS5rT8v2SvUO4YvpCSNNOhclCsxi13XE
         ahkffBh2Can1+xvibkhz56M3nqDiYJjBgQmokCcTXeAiMPa96Oc8N/ykBkpmALmHAjRK
         ENn+hIvX20z4bkJWzCmwbzWTw0ZLWVWYe9rth4T13RkHn1vMh/4gYIPmI76q45qwp5aP
         GlxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795243544; x=1795848344; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
        b=Gdu5e/eNvpcqyAH2aRgOIPZtnAksO1uwZI/v1MSQLfDIwqQ8PzXR4rjioRHdPKRsV6
         lBslXpQ0Ta6HhzmxCCC/5pgNqzRmAEguYp/N2oezF0OXz2+sv3vdAbR8HTgxaga6qmPn
         3LWXuDQQrFYr2yAj5eSoiNJ5H7jwzvF32/Vq52Hx+aplCmzhUvHTixFNBVoB2hkykxHU
         sKUVplj6pVhrxea58Nom9eS6Ut1OiT4BCvgrPpj4pX+1MamgOVwS0stC+WsBB13uXojB
         Vwe6NWgSSwZLkXOpfhCcA2n5sUSYQ/yJO4w/xE+6NnVnW1x9aJhrtcXGCsWvJ3RDG38X
         MjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795243544; x=1795848344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
        b=rcx29ephp5i9YBfR7MLu0NUz2mOglAbMuPgHnIa8H+YeXeyNcEa2Fs2liCzqV/Sfti
         m1sUUfZvs61VS7gj/UNET4904rHwhhiJrt2faqUzwki40hvwCVMjMw24jYoBleJKysl7
         b4gLu8k5V9y97g2IOon3rHifnHt2TvVAt2hD5pc1x9QeInOOlGMA+h/j05c3HL6I2M14
         PPuLGwNiQKa0SMGt0ulUP9tmTvHorKhwWhK+xlo3DN8trWiSvirijSna5FuSvCeOZK0t
         gSiZb9bXCyGA0loUxDXIV/wOjGXI7t9/ZlTknh5VjfIu3E/02Bqbc3JBU6KKmsloMo1J
         MJ5w==
X-Forwarded-Encrypted: i=1; AL+hErGiKAS6Hf8a8qe1vFk5hkwsJKv5X0CGcTYwrnUVqffVB/pcOvl6slDUd6YRWIrBaszaJPGq@lists.linux.dev
X-Gm-Message-State: APuU4Z+cHpfYBNew8Un+LOR6MJgRi3JIzsSVOkOx+OAzRB6m3eDaDegW
	kc7Kk6VfZHGW+swshUcbuGWbQdwlbqY6RKPaLCLm81ynHVdTQoydgzmlkScIDPl/1nwWz11jyzV
	w1UtzybZq1B99/lURta59mNKfcDpdhBzReiqA8aq0
X-Gm-Gg: AZFdTZe8aRCMv8hUYjB7AAtY5BWwVYpcMVFHyF88xbIquaIBos93YVynx03cU5+0Or/
	GP5kRkyWXqQwGnT8sSUUijVtG9AgMc9NMjMkAv9zbB/czHkqRcceuIxkdGuJ7aiN1KwONAL6VtC
	J38+u7L25rr0K9eeGdfx9VxpJ1QYGMWoBxZYU/TtLdmRgE8iWqlnXvtmqt9U9Icv3lCQbXL8ipY
	Nu7+SOEGdjuoPCktgwe5yo/DYtmUUu4WXpOvMkv74OKq1YmhAEcKq+290IqXaGs6WvykQilB5/A
	n1gGfKyHj9NvDnrEhzTzIvbN/+gkWCtT5bPcxs0o4MPp1twAu4D+LVxg+nFL/rUY4hk3EomiQL0
	0vZL8e1nOtnTBAVbhfdOQzrHp8QEM2FL1A3GO5PYD0NMtQxFAexdzQQBZUQ==
X-Received: by 2002:a05:622a:2598:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-55d890363c8mr7906391cf.10.1795243543244; Fri, 20 Nov 2026
 22:45:43 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com> <20261113164152.2095566-20-irogers@google.com>
 <av_bvJpYwwMWNfDt@google.com>
In-Reply-To: <av_bvJpYwwMWNfDt@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 22:45:32 -0800
X-Gm-Features: Aa3M54qyHKFYs0sdnXs9w20kZO_6DKZ1sbg-cIz7ng-wQJ7TMSYuLzSPX_ox-F0
Message-ID: <CAP-5=fV=DxVPn_wQGuFD8FEmz0n4kXQLyYV7aTc53-HoUp=NeA@mail.gmail.com>
Subject: Re: [PATCH v13 19/21] perf maps: Fix lock inversion in maps__load_first()
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:33=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Nov 13, 2026 at 08:41:50AM -0800, Ian Rogers wrote:
> > In maps__load_first(), take a reference to the first map and drop
> > maps__lock(maps) before calling map__load() to avoid a read-to-write
> > self-deadlock when loading kernel maps inserts extra trampoline maps.
>
> It seems this function is not used anymore.

Good catch! Commit 553d18c98a89 ("perf lock contention: Load kernel map
before lookup") removed the last caller. I'll replace this patch with
one removing maps__load_first() in v15.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Fixes: e77b0236cd0c ("perf maps: Add maps__load_first()")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/maps.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
> > index f808df2fe77b..7ca33e5218e7 100644
> > --- a/tools/perf/util/maps.c
> > +++ b/tools/perf/util/maps.c
> > @@ -1459,10 +1459,15 @@ int maps__merge_in(struct maps *kmaps, struct m=
ap *new_map)
> >
> >  void maps__load_first(struct maps *maps)
> >  {
> > -     down_read(maps__lock(maps));
> > +     struct map *first =3D NULL;
> >
> > +     down_read(maps__lock(maps));
> >       if (maps__nr_maps(maps) > 0)
> > -             map__load(maps__maps_by_address(maps)[0]);
> > -
> > +             first =3D map__get(maps__maps_by_address(maps)[0]);
> >       up_read(maps__lock(maps));
> > +
> > +     if (first) {
> > +             map__load(first);
> > +             map__put(first);
> > +     }
> >  }
> > --
> > 2.56.1.703.gf848ed807c-goog
> >
>
