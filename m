Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BFF193091
	for <llvm@lists.linux.dev>; Wed,  4 Dec 2024 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733356577; cv=none; b=tvgUP/5k0Pokujigq7z35YLH0UTlBS2loM1muZwYzdO47OH4jZjR8w5/LcEZPDp8LQ5Z3zWgqTS7VhDSfH1fqokOnH3l5niCkVh/Jd2EO6PEA2PZKHooHrxDHy/jD3m46WZib10MBmm+xSxw3fzbXs4zXtJmi4fivAmtoAHWD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733356577; c=relaxed/simple;
	bh=l3U0yJJE36QRWVI/0Ef+4QhRMoufGHj2/nrmEhWmea0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KA/NgHimHF9U66zsGIp/s3PxjHOh0Dk+mNkb5nKKF9iV1czuj+LBkBzwQeAE9Bb6bn3O024pIAwxBwee4fSpjal/d1dV9gIbSuw/1mYX3r17VTHCc8Rn5wyJDfMqNrNCt08jwIc3qPRlzXVEbmijByxr+GZr8QLO6z+2JUGiMY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wiKa4HcP; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wiKa4HcP"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a7bc2d7608so22335ab.0
        for <llvm@lists.linux.dev>; Wed, 04 Dec 2024 15:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733356575; x=1733961375; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8Q+F6en17eJQgfw76pO4T5MKRbHqUZjXgG7qVMS2IU=;
        b=wiKa4HcP79sZ8cCmsSwo1y5wDwI8FfG/6J52Pcma88MuoHw/YH0BENe/T1izgkGEpg
         yCIzVokGvqeXOxA6ba6r9dbmgVUcLoyr13VDBxlERc3Sg5TG2R0dYi2RN4I1vAb4xZHN
         1VKIh0G03rVn68a8mIcu6vUwBAdILUK1+tGqTDSJFE1SYWa6urDr6i3eTyE+t+uY+i1x
         ynG6IH4m2HEsOKramHbY5jy5UCd7ASU6xpdxtMSEBxF3m7IEWt9Do8Qwb9I8ObEY2U/Z
         G75cLUEB04brNVvYbdW1R3FAfdGleHpTdp0dUrb530i98DYiqso6pgj3qk8d8CRJ9qIh
         Yfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733356575; x=1733961375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8Q+F6en17eJQgfw76pO4T5MKRbHqUZjXgG7qVMS2IU=;
        b=nSCHCuyaQg1BPWHafIC/JiDz6ovpPDDsgbebu0f//AdJayqGDzsya+l5fZEshH40a9
         GB8zBBDKuxjJUI1iE2aNXetwLW6gLTTrzZr3F/iRAUMlgfZpzq11OtKDC2JFT3Irlal4
         9thoBGwexmoUmGftiJYqSHOYA0bxFRx2uJIc2IxyXKBd/ZtPbOUjXETOhb9d/qcHRv72
         1vnMoEEURpIE+uFaoYD4wWZ9mPR2gCB2hiQ1vUwBPk/+Kn4hzDxMQHopohmgkK5YcZZf
         K2oC2Mmczs9AeI75yT6kyhcUw4XdWZLjqSHyL+C5W1CDjZEGReJfOkz3bC4hxZl0rRyH
         fWJg==
X-Forwarded-Encrypted: i=1; AJvYcCU5G/5KkIkA/nSB7LcQYKJqBuxOVltRrzoxYaic7IlZO8T5wOnVN6augFDRr61dpMJXWPsi@lists.linux.dev
X-Gm-Message-State: AOJu0YzrMzB1shbJCuHGw/1VnZcrQ5l0LgUTAiUHz724gDSCkAcPk7ZY
	QNNYOlO1cz/P3B55RqVD5K8/8fxsq5LjiRDrgck6S6E76ve6Hsz0ERAoBi+qWV8oR2Zti3fTMAF
	Ye8b2Bri6BrJYStC22p7d4gQHt2dBe7JR9f/7
X-Gm-Gg: ASbGnctXt6egk0LGfZzCMUp2AtTodSE2KJ1emmWmEcZvLnFt6/O5Nbgh4rNl5Rrqzye
	KJEaiNG5DrZF/DFNdvnN+W3hLG09Dy34V
X-Google-Smtp-Source: AGHT+IHRiOICm/Y/IPwvPUgx3E/i5KvQt+b8VmnQpipO1sGUnM5NcQm+mIVfODWSKuu/gQnH8obw8GpXOkA4UKKZxJQ=
X-Received: by 2002:a05:6e02:3693:b0:3a7:5cf1:8a5f with SMTP id
 e9e14a558f8ab-3a80933c362mr625605ab.13.1733356574602; Wed, 04 Dec 2024
 15:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241202182815.639124-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241202182815.639124-1-andriy.shevchenko@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Dec 2024 15:56:03 -0800
Message-ID: <CAP-5=fXbjvsmuKrNe1uAOYLV0k5U9OBuHV+drSs_5JyUuXQ9SQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pref/x86/rapl: Remove unused function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 10:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> get_rapl_pmu_cpumask() is unused, it prevents kernel builds
> with clang, `make W=3D1` and CONFIG_WERROR=3Dy:
>
>   arch/x86/events/rapl.c:165:37: error: unused function 'get_rapl_pmu_cpu=
mask' [-Werror,-Wunused-function]
>
> Fix this by removing unused function.
>
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>
> Fixes: 9e9af8bbb5f9 ("perf/x86/rapl: Clean up cpumask and hotplug")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

nit: s/pref/perf/ in the commit message title

Thanks,
Ian

> ---
>  arch/x86/events/rapl.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/x86/events/rapl.c b/arch/x86/events/rapl.c
> index a8defc813c36..3ed5ea2aa867 100644
> --- a/arch/x86/events/rapl.c
> +++ b/arch/x86/events/rapl.c
> @@ -162,12 +162,6 @@ static inline unsigned int get_rapl_pmu_idx(int cpu)
>                                          topology_logical_die_id(cpu);
>  }
>
> -static inline const struct cpumask *get_rapl_pmu_cpumask(int cpu)
> -{
> -       return rapl_pmu_is_pkg_scope() ? topology_core_cpumask(cpu) :
> -                                        topology_die_cpumask(cpu);
> -}
> -
>  static inline struct rapl_pmu *cpu_to_rapl_pmu(unsigned int cpu)
>  {
>         unsigned int rapl_pmu_idx =3D get_rapl_pmu_idx(cpu);
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>
