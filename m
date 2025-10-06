Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012211CAA85
	for <llvm@lists.linux.dev>; Mon,  6 Oct 2025 22:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789482; cv=none; b=FWYZPmchYYckckwIPbkg1ElGB5hEILHeVhMoTOK2u1SKqCs7dISAdB71BcGrPGPn89JzOZWnghU7v2lUtuQHhXXPgqj3PXDRcil1JK/oOPuCB5TJ1TTzxGFuB2bBRljCjIjVRd6VZ9c+A9PSt9rX3Mt8eRpdr1fnzM5BPcOQj8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789482; c=relaxed/simple;
	bh=ZzEjdQ3Ctlt2q9UjuwjY8sL9bTZfjoRUrpSLbw/FI2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=k5agJM6NmlHMN+ZuOQZUKKJTGpqNuyIgcWyS7AyDG94X2JHBTL27JYDuvgwBU/bi0ruaGUu8IZQx6iyQVGgspqtBkxrs4mn9qjg4/Wlvm2AXUTXZfQdfb7FBpurPlBiMF3PLMbYO+cVKK8GMjTcXjKAwAmCVUlmf5pwQgcXbbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hwALZspu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hwALZspu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2681645b7b6so29565ad.1
        for <llvm@lists.linux.dev>; Mon, 06 Oct 2025 15:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759789480; x=1760394280; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csUKuBy/cfwB0rrhjYySeSh9a7d+66DcWdMpSkcGTEM=;
        b=hwALZspua62gYyQkhndvNbPeALdqBDimSwgi3QEh06KWbCP1UiqCp/vgK+aiEssax5
         g+G/9M6Dy7DhpnRdYdq3CZIPe535mqIP67e/rsdxkQCIQXGmZkWL3lug5Xk58mLxpEh3
         AgP2X9i9pv2yG7Ysnv9FlQ0oOvOa1XGJBrEWuSNEVRSS/Bd9khoaPO5hEEKzbsSh4hLv
         ZVp7IQY2+WywwYimFs9bhRsard48t/H36z4C0jQyQjkiHDsTDTzZt6sw3WC6lGmJyCJA
         7APRdyeH2vhq/58DJTwIat4YtMtdC7JdCD9LVFUytuA40fhQiOTM+izDBuYNcldCHYds
         Pa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789480; x=1760394280;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csUKuBy/cfwB0rrhjYySeSh9a7d+66DcWdMpSkcGTEM=;
        b=kwKIPtmjU41dmykHYEZrjb714mmitUG1NBL8CsX/8afdnLTP/jIBhk7c5Zao1zS4ai
         RGHl7naZg906rkQ138vGlcFeM6NW5JkRJIVLdgcSlJ/3oH25p0xhfjiXQqruF0msWBzA
         YFqe5V6dZOoUSHdNxC27J5fl9sua6gdQK3vkjFFf5eVcHePUZuSGSLMOpVk8pvVlEtNQ
         DDQREtoF46Kiu5+pbItzN3bXiuEiIcFtScKV53fwtkIQbHSK6NYabQCDWRRQV/6m+wtp
         0GSBkWESaCkBBAo5xP91ypKhAdPjiDJwgyoRrlbAipEmWosP6g25Jh1HcShm+QDmjMHw
         EWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpUiVFmp5iLid9ggSdfOJtSqCuRH+0a31rAiCKn/M/irKjsF38+5zJ+RNJ5KM6TetG5gDM@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1swXF/qvGp4E/vz+Y/V/Rv8Y3EwV2EptM7Qhzj36x1lMFDP3u
	pgMAml4MO4AFtEpCOYh/ZdcfTLdJkKKMzQnAwm7mWF8dsNqyl4pChrX4xucydKz7DHkThjV04DY
	Il46Kzf38RkoTJu0nF+NYlZ1SiYDgoDzs4TEANJ1U
X-Gm-Gg: ASbGncsU1IN1W3qpb6NtEM4z8K17bxKvhzsa6ih3Saa3kZDVlLV1vz6ybyutXUCOb88
	gG9byvRH6CDSmHU3APJoq1QixZNKHnKuaxwt2rDygRyybKZ7215wFihT6owQAKjBa1jylD7z9z7
	6FfMZVnhqo9rzufEK7UAye5Qm3Mv43tji5m4hw1JH76P0p6XSSF5pkkVTzVQwy+MT04b9plXYnr
	jUMOEGg77Lel8/UXvq4cnSEZYfTwA8tHOZdXht+4THVVCk+3rm+lsefdKlVYPrfNHFR
X-Google-Smtp-Source: AGHT+IG8G66y1nO9UVw8rOFx+n/thLkwl0ArE55uKz7jbSHnJDPIVWJsU206eEQU7TiWRH9QC9ziDBifo6OAAslWGrs=
X-Received: by 2002:a17:903:24d:b0:240:6076:20cd with SMTP id
 d9443c01a7336-28ecb769fd3mr795835ad.15.1759789479891; Mon, 06 Oct 2025
 15:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251006222116.3335193-1-irogers@google.com>
In-Reply-To: <20251006222116.3335193-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Oct 2025 15:24:28 -0700
X-Gm-Features: AS18NWB_2GJZPs9mIpmzgg8B7DFq11s7c_bmSvm4OYKklR3eKQo9HSIAnjYj1E4
Message-ID: <CAP-5=fWo66PRxCBQSmwy4C0X75k9fagy8OrphUyh72ciwc1Ggg@mail.gmail.com>
Subject: Re: [PATCH v1] perf build: Don't leave a.out file when building with clang
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 3:21=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> Testing clang features doesn't specify a "-o" option so an a.out file
> is created and left in the make directory (not the output). Fix this
> by specifying a "-o" of "/dev/null". Reorganize the code a little to
> help with readability.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Maybe a fixes tag of:
Fixes: 5508672d7f49 perf python: Remove -mcet and -fcf-protection when
building with clang

Thanks,
Ian

> ---
>  tools/perf/util/setup.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
> index dd289d15acfd..6caf2126b1cd 100644
> --- a/tools/perf/util/setup.py
> +++ b/tools/perf/util/setup.py
> @@ -22,8 +22,16 @@ assert srctree, "Environment variable srctree, for the=
 Linux sources, not set"
>  src_feature_tests  =3D f'{srctree}/tools/build/feature'
>
>  def clang_has_option(option):
> -    cc_output =3D Popen([cc, cc_options + option, path.join(src_feature_=
tests, "test-hello.c") ], stderr=3DPIPE).stderr.readlines()
> -    return [o for o in cc_output if ((b"unknown argument" in o) or (b"is=
 not supported" in o) or (b"unknown warning option" in o))] =3D=3D [ ]
> +    error_substrings =3D (
> +        b"unknown argument",
> +        b"is not supported",
> +        b"unknown warning option"
> +    )
> +    clang_command =3D [cc, cc_options + option,
> +                     "-o", "/dev/null",
> +                     path.join(src_feature_tests, "test-hello.c") ]
> +    cc_output =3D Popen(clang_command, stderr=3DPIPE).stderr.readlines()
> +    return not any(any(error in line for error in error_substrings) for =
line in cc_output)
>
>  if cc_is_clang:
>      from sysconfig import get_config_vars
> --
> 2.51.0.618.g983fd99d29-goog
>
