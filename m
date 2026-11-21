Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219776;
	b=uqnMkuGnInTniLO1T0UVeUMp8Xl4v3LOyNwlGzyyYhAIfRifg5yx9FLu+oA2h1iFyavN
	 +dGyLE6UJ+p3v3KMK7c5UF1dJvvIuMDIOFD1lUcSSnH+yYlnqeUk+dm5y1139GvSML9aa
	 G8EA/B1QuKzpWuphRiJtDANWSfugO5wBhKhZ0pp8EWxclArU88c4OWxbdbPEuLo2d5tK5
	 oAm/1AENCL5m2oIUZ7gdaK0l0QtamnQrtIc4q/PgXfM+RGalgVjF9f0abIQYGX2EL2BE8
	 xzCYTPBTorqhSCUmjhYtYM20zn4Kls5T28P3wqDJXoB+WUOLgJsCF1dNDN8nwAifgrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
	b=5CWLsYuScHNX7Cvm3KCWTYrQMae0l6ceaV8NtroM2PSui6blqXs9fp9hySyAvuorUq6F
	 N03UJXoT3zxKAFWPuWLO0xxskUpZQpx9+vxO/cmn9wboeJ8pmhFgz47NdM2w4bEvpuV8P
	 7E8DGOMj/wIlOGEtMI6Brzp4YZhKlpeuLLzWdjK+kPUmZJA4elue8QLAe9CAhRN7950qq
	 YxLEAnQKynnMxg7r1Cepe00W//bgQ1Sn7ubFgXnnPK8y5JL8iL+m3QTQ7pAIDKdAy/wU6
	 XRO9QADn5Af4Kov981UO3HMuYKp9hQoOkZ3SlhLsBKQ9pTZ8ZSfPFUB1i4RjN+DAhrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NEpcWN6Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944D60A2600
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 00:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C944D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NEpcWN6Q
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-54492d8a988so110251cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 16:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795219770; cv=none;
        d=google.com; s=arc-20260327;
        b=bqLS01hTqLggayxOIzifhBBD45P7Tqf4aAkF4w/g6iYIOhBpND/lxDqBgYMfNZf+Pj
         v97mu+XcBLu5At1UaCYDOOWMR3RvVSzCZBqFoE4T1neY+yGuLzAh7m8nINDJIMh+oHro
         ESvJNO1icswNaIAKfyevTENAXVaZvSHKM5AOf7Q/xwcN2AM8cgeuVBKbNirT8pj5rCqr
         OsRdYE9yvzHJlAbV2j0g0END4gD2hYT0WOHqksED6Ih5yzXOx9HPx2hYe55zJN2ossDN
         u1Jio0iBosLPjbuGVQGHpVXb8zGFU9Bc0sAUm7vX9rC/++gdwxtHVGqf/iJYkgfYz/UU
         RriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
        fh=wZTeoU+UcQekgyD7kPKciu1Zke7bhnxzky/hiEi0e5Y=;
        b=kzycTQYbKC+WWMOVImutxIoaYOvMbCO+CpG6Ew/LcKsj0LJTWTMOkp4FpyuF+/nnu9
         rf+ycYRguw5NbvTTK6IhGy2JOD70zAcZFdMDPYLbVvfmB74FIvOo1uj/YeWnpnCNRfGz
         ZK+5/yyX/hanM+cXE0a3LlRPYrQ3rG1kiRED8TtiILJcrgnkhcsr63KvlaEXKeytsvKP
         rgASHWffdUlN2PHsFgN2pzemxz14rB+P1aykGClrf2A3ynovqGTNLrJW9JK1axO8M0IF
         EGnvyl6sHUl1qMi0KFI3CvNbiz4MOJwiJJScq9Pa3xgLTHx8EPToh/I/Pi7pIsnYpoPr
         sRmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795219770; x=1795824570; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
        b=NEpcWN6QX0/EgR1L3zEYOLlal93d7ozwaclooMSinl8+xl9pe4spDswJyUeVfhbUud
         aQX7dG6VnwE5YH3oNKLSNEEY3i3M77+zwgrKArxBUOzpyFSX2K3lHgwUzMQYv8c1MV9F
         ey0zxZJAjPCZikHmm7SHyuV1gCH5PAHLfk60MK8S26Vi8T+myvON47s/gNdO8p1zKQAX
         UYJKiH+oen/KdA/UN3MOIGF5YjAWi6unVYPydbuhhmsKcEmDBs873ppwrpGWQsaAqrog
         xNeoGyw0BrPxRUedBw72OrZZcp2LizzTB/0aolnwROXxmWBgpvYjoXPu9GkESidAdnd1
         g6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219770; x=1795824570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
        b=lN8m791i40t1REWloinRSQY6KoT1xAsdXKz424KB4UoN1fWsThEzpmk+uLsoj4pwIc
         EwwZDyIbtXxIh7T9zhfsCU3DaK5itmRvB/BpaaIS4KhgiMaVVzTp25tPkJPTj1DEtEPY
         kVpXPmFXGY/7jmGpJRR+Jq2YoEwinkhyxOE8aTaoeL9SovTc/1ZbmAo+3TAtlsw4jB3y
         vSL1+DBo2J2IlMt+9AGwjTvbjKw2ZcJqMWFlrNF7ffGPVWewpV6zN1A/SynxZHvfSayP
         yMwD1TTBvME04F1Vx972L1i2MkxFVr4lmiJVS4f5DO1sAEw4g/ODvNxFp2EozLBH3tzf
         y4aQ==
X-Forwarded-Encrypted: i=1; AL+hErHEHOH6oxjRpu48yX7bmebPVMZtG3rEuUMGp82YNTdGdaazaseA7dOm5kw+NEjPU/AFV1Q/@lists.linux.dev
X-Gm-Message-State: APuU4Z8gnOfGlmeN9Px4RFCEsyt7uwVW/65ioupAXrB7gz9dHs+WPzAZ
	S+lzAbU+odQjQtlOKGWLkmmaAsU7D4x3xFZr6uq7p1bVNfB3LDsA2aDvhtAMcP1NoSaJDfQfTSg
	J5GTbBOVbyxeENERccx76wta/S/FvCTHjN2UEwecb
X-Gm-Gg: AZFdTZf1cmTp56LsNOIHgOBZ1uQnWOS4LCHGEzL3km+LYfsLBGlGmxw7Bt0MU563u7o
	yH19eOVR+hTLeBwwjO2x6oKrmfT6nK+d/hDZkHi5ObPqInp/EJ8bA67NxX44mvg8fi8/Z8vcG9U
	/sHq/FVegw+4JnZ9x+lwczSQAuigJxeyw054OuIOjU5obDgxSxlxT1QV2qOPAVkicLJtKn9Q8if
	EcDGDOxRdF/a9iesqiEsP7yPfDFyO9FAEWDd2OGEGEkjESPsgV5Cuux7Owsv8iqR4pkEn65UQSf
	yEVzTy25OC9bUlY0KK7rwxqY1isnOjJ4h2dDWnPS3jXZt6IgiwuJuzUZS6cdV+oFtxUgZFmwTAP
	oFioehXuKtnaDMp2QaqopJuo/7Tmeo6lqkqw/9DF4PP09F8pRdW/rKRtslw==
X-Received: by 2002:a05:622a:260a:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-55d87eb670fmr7626051cf.0.1795219770051; Fri, 20 Nov 2026
 16:09:30 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com> <20261113164152.2095566-5-irogers@google.com>
 <av_bGKcyato9YHD_@google.com>
In-Reply-To: <av_bGKcyato9YHD_@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 16:09:18 -0800
X-Gm-Features: Aa3M54oEg23XwIywUM7xCazlV1aZ6ADuzxfe0YE_c6ZVLGLnwXlwTRPiuHL2zps
Message-ID: <CAP-5=fV+q=vMuo7kf1YroivHgboTNtcYzYuVp6iJ582Jj081Bw@mail.gmail.com>
Subject: Re: [PATCH v13 04/21] perf mutex: Use kernel style
 compiler-context-analysis.h annotations
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:31=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Nov 13, 2026 at 08:41:35AM -0800, Ian Rogers wrote:
> > Enable -DWARN_CONTEXT_ANALYSIS alongside -Wthread-safety for Clang
> > builds in tools/perf/Makefile.config, replace the custom lock safety
> > macros in tools/perf with the kernel's compiler-context-analysis.h
> > annotations (context_lock_struct, __guarded_by, __acquires,
> > __acquires_shared, __releases, __releases_shared, __cond_acquires,
> > __must_hold, __must_hold_shared, __must_not_hold, __returns_ctx_lock,
> > __no_context_analysis, and __context_unsafe), and remove the redundant
> > macro definitions from tools/perf/util/mutex.h.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
[snip]
> >    # Enabled Wthread-safety analysis for clang builds.
> > -  CFLAGS +=3D -Wthread-safety
> > +  CFLAGS +=3D -Wthread-safety -DWARN_CONTEXT_ANALYSIS
>
> Why is this needed?  Also it seem to belong to the next patch.

Thanks for the review! linux/compiler-context-analysis.h gates all of
its Clang thread-safety attributes behind `#if
defined(WARN_CONTEXT_ANALYSIS)` (matching the kernel's
scripts/Makefile.context-analysis); without -DWARN_CONTEXT_ANALYSIS,
the macros expand to no-ops.

It was placed here so -Wthread-safety stayed active across removing
the mutex.h macros, but moving -DWARN_CONTEXT_ANALYSIS to patch 5 so
Makefile.config is only touched in one place is cleaner and still
builds cleanly at every commit. I'll move it to patch 5 with a comment
in v15.

Thanks,
Ian

> Thanks,
> Namhyung
