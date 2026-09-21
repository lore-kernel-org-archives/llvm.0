Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB64FC339
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015784; cv=pass; b=LqdgGpcC4Y5VzOEelrncaB857OcpIA7Ky86m9iogBF500SjHYxrDZssXmc2pXObXN/UJfiUaKyQD7wQ0o5B6XWnHowCg3FKAe8iA9BT4tYlP8pgBb+qSvwS38TkNUkIjZ7uuT4x0Go/GhlBwCEWn7nMcQOG/u11u5fRNWO6I48I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015784; c=relaxed/simple;
	bh=5IMj8x9eRgcjqpyKwZG/YkXc/KumJsdOZYNSTZMIJ0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQiuAVb/0cCoE4puQCPa81koYesTDpk2UuE2d2S6xoKDKjrIlqKmtVENuAftqOktZKilz2kzaBZeUCvAH/xjXxgvcMIvApxVpD36RULwd6muOhNYsBuvjEnfIJ5ehaWsbydJFNgGxEF5n/Be1RTC1iNhR/LqP/KACyt1SRTrc3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wT7LXbC2; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wT7LXbC2"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-530e8c6fb80so31171cf.1
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015782; cv=none;
        d=google.com; s=arc-20260327;
        b=dBsbP2QGi1IfTaNO4usCqrridSRnyJjJefg6qOJti/56T5zZPsVJvOQgdH9uu/4IJ8
         3cY/Js2nr33N+8NHr1VwsyksaXP0ZDtKcOMMf66HHZWtfrsLuGji4kIfyNGKW4x64SyO
         fLJc7+ArPc87LdqC3oAIiTZTtOW/TOfaXhiqTBDsEiei3zMSuUXjGqd4Pu0flDAYabOk
         0BJuTpWkuEdHN36tgvOuy3g1rozBW34vNvPVLQWdo4znDfsE57SohhCivyN8sOKqN+kf
         GjrnZOxurkRRUk+8ZL3pa3YEbWV8pFOGzmpRaGeGws1nntct+RTQjTQIPt73j1vQMWka
         wHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hkzGojJ4vehMF4KKmjoVCNEOrAfdvYhqr8q/GMHHrXo=;
        fh=5RGfHFt7VmmxXgiozClz7RIvbK6cZW523t9uNqwh2NY=;
        b=jWyemQIPA8FRDraWt97kxMyBOgqTGF5JEKXTv5WV0USVJssmncRJSaD5/XdjDinNVO
         nFQ+baKTBxCc0s4K3clyBWYWfXAl+2QcFUmHChw6KHXcOg6PzvFomf1t8AMPLRAQrmzG
         2KCSgx5Qge7kRQDCaWcdk3e8sB10P6B4GzUbzEdsoi7jDAEf55YLC/22M42L+hzIr22I
         ZbWXg585emGfpw7NeknHD3Ml0JSp8q1qqnUX2GIHFnlBLumt9PVP7kXUgm4nNW3GbRyv
         g6uHDBw5LYV8XuCHOygSPEcMYS0wS7mCb8+skDw+m2OjnRJ/18kVC2xPo1i2Xf3498Pm
         9gJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790015782; x=1790620582; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hkzGojJ4vehMF4KKmjoVCNEOrAfdvYhqr8q/GMHHrXo=;
        b=wT7LXbC25P5qbFMc/DLDwA6t4H9y/+GCBOYEKITw8xQ+L3IndzPpZLvVaD0oMmjvsS
         HdGczkPbYB7IEu0YNrQqMgiPpGiwKVjTyZyLIfr7+w7eIGff/j4Hyh0pNKj8MfeQLk43
         OeOAug9D2yq8Be1Ij0I9NXr22yj3E1VFzUN2UyR9KZl70TyhoavPU7E5MQt1FCYQR2O8
         kZJt0QXEiFzAcaqmGB0GRlY/zWRLYXMzJi2vux/xcL17EwIkJl7Wwb1CeBtKJMzm6uhU
         DACG+7UvJMwVAYIjwmy1DFhyWET3hPmuCfYrXdIH5kqdh4gj8JJ0vLGiF6oXlnILCSSf
         c2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015782; x=1790620582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkzGojJ4vehMF4KKmjoVCNEOrAfdvYhqr8q/GMHHrXo=;
        b=XWkeLJW/fS+27iTs8vMB0CtnQeGT254Yb4mV3hIxirSHupf4pkdq+TYe3h0N/rgH+W
         S29gzhvns0P8QTbI4Bin0o1Zin/tjGQhD1d67aN0cz5l19qHx5Q42k4N4jRGXuHZdi/R
         hn8NISV+oxHwmQ4vQbTR4so7yiV5+/rAiF5XsP9ezGWLPoFxvuzAncIXib1pm54ZY5Lu
         xLSq2ItdLWArZknDVql/SCVCklOy46uVQ2XI9GasCqOP+OyUmssZ5GR6ZfC9YrSTDp1e
         c/TXmLl0F5/B1EDHvJwgw/3wjczulrus8jySVYhOkXc3LKqyXTafx/q91OOzRfS8xDbc
         cEWw==
X-Forwarded-Encrypted: i=1; AKwUvBxtuPS3Be4xvtglqNlMrZEH4iNY2A452N4JtWh0kXr5ppi4n+fwhEU4fwIVYfps8vR6jfM0@lists.linux.dev
X-Gm-Message-State: AFuF++lIhAyQ3apZdwZylqtGOXVromsZRSTaLnDuItfSXyL8hGK/a5sk
	cnwVmverTgblRkXWfZG3c2x7Bv15Sibc6AbSlEzzqrV+4FXuKYLH1ah27BkcT74hhc62qALQuSJ
	TuwSjdcDLwhjxYMrBohdzMFamNs3Q3WF30LaY4SW/
X-Gm-Gg: AYBFou2WqFF2fvdgA31WnDvxnUF1Wx9Hk/YKsTE+03BocO8JXctPRjX1KXMuDWCNOVz
	Nb6Kr7XHB2MfMkdodcdiKpVRCtgBNB1pKE8SUa/1c7VE+h58Z399oV3ZP1va1WXNEZMvjaB9RC9
	RYv8APTZ3Tf+LdfjUYvZvKPaayNIgcBbBuKhZko9wMmRyHe6E3GdcXsWmMOH+rypvn97ObrEtbS
	G9rr/RIC1asw45B6lS39/QzlB5ZZ/cDQztS+3O2HtYXYTykcJbiTVt8eGSjyQh0mwdPzPf/Q7Jo
	NLSD861HCWNA6fw4/LZzC/mbT6GEBESn4t+voQCqhyjCt9pbz3HucmING79O00dA1QM4k1T5Mxz
	DH3dyjHVR
X-Received: by 2002:a05:622a:2290:b0:531:a85:69c1 with SMTP id
 d75a77b69052e-532dc3bde3bmr1415511cf.5.1790015780611; Mon, 21 Sep 2026
 11:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917125802.1198419-1-wutengda@huaweicloud.com>
In-Reply-To: <20260917125802.1198419-1-wutengda@huaweicloud.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 11:36:08 -0700
X-Gm-Features: AcwNN1XL2P6NwaYXUdhKIHqVAwXxCkVy_W7OkIGEoUZLnBkLv48KQjUcMsGXLjE
Message-ID: <CAP-5=fVOdeA-cf1NRJxQ_YFeYKu3F1PJ3ykXR5Gtx7r0MtsUtA@mail.gmail.com>
Subject: Re: [PATCH] perf llvm: Fix memory leak of args->fileloc in symbol__disassemble_llvm()
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org, xueshuai@linux.alibaba.com, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, leo.yan@linux.dev, 
	Li Huafei <lihuafei1@huawei.com>, Kim Phillips <kim.phillips@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Bill Wendling <morbo@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Zecheng Li <zli94@ncsu.edu>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 5:58=E2=80=AFAM Tengda Wu <wutengda@huaweicloud.com=
> wrote:
>
> In symbol__disassemble_llvm(), after calling llvm_addr2line(), if the
> subsequent disasm_line__new() fails, the code directly jumps to 'err'
> without freeing args->fileloc, leading to a memory leak.
>
> Fix this by explicitly calling free(args->fileloc) before jumping to
> the error handling path when disasm_line__new() fails.
>
> Fixes: 048856817888 ("perf annotate: LLVM-based disassembler")
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/llvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
> index a0deb742a733..dc66f6cc1db6 100644
> --- a/tools/perf/util/llvm.c
> +++ b/tools/perf/util/llvm.c
> @@ -254,8 +254,10 @@ int symbol__disassemble_llvm(const char *filename, s=
truct symbol *sym,
>                                (unsigned int *)&args->line_nr, false, NUL=
L);
>
>                 dl =3D disasm_line__new(args);
> -               if (dl =3D=3D NULL)
> +               if (dl =3D=3D NULL) {
> +                       free(args->fileloc);
>                         goto err;
> +               }
>
>                 annotation_line__add(&dl->al, &notes->src->source);
>
> --
> 2.34.1
>
