Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B83D4718E1
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 23:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934032; cv=pass; b=eElPwWBKpYAcUZRLCOCk3YzWa8YP2t3R2HN1h8cXVu47e+kmGcrGatopf7wTklkDZpk3ivHkjE0PpIY4vkFHEqlnOpPQbmIM9SZfLUwx+JSZKfiWDgCFpOxSRQ8/ZcDI48Anrjjr4DmBt2TyLQfwEfKrOYX9dtB+QE5f7GFaIFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934032; c=relaxed/simple;
	bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfW5SG8SoGDIZLYF4RuRk2FergNs5k3w5tGLeiaYPU4VTRY72BuUFNcefyPhSsX05JWK2M0aQpegJDPALe2xP8qYnQiFLUyBqJA4DHLOwi9+WWQYl2tcqBNjVXnUJvBxNiLOl+UbRImg12nTJ0jMfScw9aY9WqPFJI3TDllqPVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CaDn6RuN; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CaDn6RuN"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535f598d126so344201cf.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 16:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791934030; cv=none;
        d=google.com; s=arc-20260327;
        b=btS8c9uOlgmOkdF7tw6vR0pvG+YfDhhl/Y7kGwzlgqzd9HmeGYulxMkwWR4F7Fv/eW
         m3bqbgQBDrxRCfA9yW/iRzGf0UrhzHREY2u7yL4CdEr4BL/wSMWK+tRS85H/oqpZQQ5q
         pbazR6d3o58ysdZNqY4zq7jQ3xx3PdbkeJXpN3JnIH5K+NcgprUzPYCVoAAYKJgL7aRs
         y1fTqIBpsncwhcIoaMHRWQ4fdfc0D0Vz9+J1XkyJYPyo7KzoabgQCx7eTvoBuvimxnDw
         h93pg7B24Bj7TbO8ywhnSP0yagcEuiuuByBDv8BVktZk9m2uXijerLemERTgrLPVYXyz
         ilpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
        fh=rkPjPGTemq0UKPm80VrHMvb4ocVSNEayUUWXEeLeECU=;
        b=jndC0MxdQvZAGZzEVIhq6D3zhppYgYrK9/NgRZNG8Eghs486tjtZ05lY5fyg6jdCXN
         QZu2my7GKFKzXJD1DqLjgiLGkP2aPP2D74l/GY9UJFqfg8nVatFGyYrjfsPyt/RobSux
         1CatluPLjJKXfSVabr5Wx4O4B3Rp8jgjTytHEXEK3a5krxaPAH4HpYYFlj2NGq2Nzba/
         iyvRaP1yKJ4erWcaWZTNcGJ/7ipySmiwnqT6JAqcunFuGzPXpXpa2PwKiEBiSTZjS857
         YY3SAjDBSxSWcJ+iAIq0XkkARC3roRoQZcJ310tKMMYFEyDTy4c/13zByNfeOnUfPY/X
         zrhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791934030; x=1792538830; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
        b=CaDn6RuNoE1w/3zm9ZZ8dHidWo+fDixHMXlS+2YKZsS4NfzIxVoMWSFKs4bI4bPvGz
         Ye16ECCdgIXOXe4xHSNTnS/4TAZoBTXl1KR3ZGaPA8jtE5GXcPzRWW8ImgR4pPAjpf3A
         0JP0DpRYtOrnh8w4z2FKPkuvSclFT5ZtuqGhhbshoUf5yPT/FuJo3cnkgbwXMskcJjcX
         jc4yOmhM3cD6h/52Baa0a0I9d5hUxKucUuxiOt5JuiRxNGP4eM5KpIJ2j2WL/Vu+4MNs
         VjXjkGJp81pjwsbCS6Nfl5tXt+novfcf1O75agJ1LDPRUkeWtELVnqoy23tyaw+sMQAO
         Kkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791934030; x=1792538830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
        b=OezSLk3baq6lJvZi/xH1ir97nKYaUdKJEm3968OD2M/LEkRUIrm+UrpCrXYILM7n2b
         /pzQMUCWQ9jmA0yudKDbtqbsS5KllQXZZa8rSgMsF838rbXmR78hBBU4oPLm2u70xDZP
         llOzVZyUwC/nWdRZ+vn4S3lWEDnSOsN3cwXbTrFoAbfk+XRLcz4BVeXmFnbM7OZS8CuF
         CEu1oIM+q8KBQWuOEoim9gnzq/Ja0oXRuXc9fgNCxyvuP6mopUjcdaNRDM5Oj+k5jnXj
         m7Q7WEjbuOG9gqranfa7Wms887ZayTva5qWghHh8DuoKhT2cg3rTiUw6tFs4asUG29aD
         OwMw==
X-Forwarded-Encrypted: i=1; AKwUvBzswgYGfQ5K6KCpIo5a3PfDkHWo8osGdw7uqHkMqUmQh+pkBc2BBIFl5/Yo70OYo3zjYOr4@lists.linux.dev
X-Gm-Message-State: AFq9FYL66Y+6v2DXjUlNpN9J2MlYYqwOvovKyytVrs84bPPLMYO1X6e4
	WHCMkBb61H25mqDeM09ETGTBTDhh3oUKtq4uJqTod6oeP6p0KwI4+cCscTS2c47PVmDZJzIgpq7
	Eiaz061M4JjK5wGpnJiTtpugKHCB8o+DLp5LFbEyG
X-Gm-Gg: AYBFou2qPsOAfs7fxXv302M8UaAFGkn31beUcs0JOL9RKrF+oiAW1uoQhULg4Q6l3O0
	NlhsgOn+oFNmLOm7YFtMZ2BmLRyb36+p5mvkNN7brOnB2iNfw9V//LNsOrevxgO8ZzLkGNN4rOi
	Sj6GqK94p53G7spcQGQYjaYmhraZkOnK5T4w+TftA3MLUnFCWts3XUyoqA2uHMTlYoIA1BNPTFV
	vroRHZvIEYyJ5SDmN4wD7tq81mRd83DFkaS3oulgw/oZWDQGjP3BBzWaHkwvfZbnBcLcqTt0t90
	4Xt1aJUG6t7/q/9HxmTfWTro1BE1Lv/EMK6MVwPP2rak2c2Qgj4dTiTsIXezEk/5BTLHBarzK1h
	lPhQJVfLuHg==
X-Received: by 2002:a05:622a:6f02:20b0:535:cee9:78ee with SMTP id
 d75a77b69052e-535cee97b65mr42500541cf.15.1791934029392; Tue, 13 Oct 2026
 16:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
 <3f57ddf4-b1a7-4c91-8983-c8cd83d0f25c@acm.org> <CAP-5=fX3e4HRaLXxQhCwEHRuXZdpC0zEEh2pozEEegQBxgc5xw@mail.gmail.com>
 <0e572032-5e5a-4a4f-a362-16ad48f2f02b@acm.org>
In-Reply-To: <0e572032-5e5a-4a4f-a362-16ad48f2f02b@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 16:26:56 -0700
X-Gm-Features: AclHuK9h2b1Y8G06GgB2ybKX-XOEXTLg3GZrEG0Jt72282bAd9ESSyQw9mVDFQE
Message-ID: <CAP-5=fUmMQgxUqP3tCb694yG7V8PN-Uf_=subMDk+WuAiPJeeQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
To: Bart Van Assche <bvanassche@acm.org>
Cc: acme@kernel.org, elver@google.com, namhyung@kernel.org, 
	adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:18=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/13/26 4:09 PM, Ian Rogers wrote:
> > Which mailing list is objecting to the frequent emails?
> This is a policy that applies to all Linux kernel related mailing
> lists. From Documentation/process/submitting-patches.rst: "Wait for a
> minimum of one week before resubmitting or pinging reviewers - possibly
> longer during busy times like merge windows."

That's a nice try, but you misquoted the documentation. As the cover
letter explaining the fixes makes clear, these are different versions
of the patch series, not resubmissions of the same one.

Thanks,
Ian

> Bart.
>
