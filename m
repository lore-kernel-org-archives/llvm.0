Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E69472796
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136272; cv=pass; b=GLHSSWpg/4AbTVhfkF02KLlDgqlzR5LT89OMdi/nM7vMVwuBO9POXvnXDy1488saU1JkZfZzg+Fl+ei2mn+jdJgaWuiJYt/L/uzs1n8UYvK7xX3xY1pSdlDo9Rrm1rV9Ouc27abVkb3UgKj6Zlf/LPHRdFcByzxlkkURa7g4VBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136272; c=relaxed/simple;
	bh=cNuKMIcek4rkNIhg1DjvTNY6u94NrZCdTQHA/3wIBW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnqLl726Ndw1mh5ObIn5P0kBBCFd4FOX3hBXdzjJmGHVj9QbcsyOpGzHtTt11pJ+JOdXGCaqy9YFLpVXg99I1A3nypXxk3P2kj5+lwAF+yWL2bcm24c5xZv54/PvPKvVBhNrZFBbmaLjmpejiZmLWgoWNwV6eLS4YhrqY/oukwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OXoJZk9R; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OXoJZk9R"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab97c86bdso4725ad.1
        for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 10:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784136263; cv=none;
        d=google.com; s=arc-20260327;
        b=EYQBpqoQlPDZ4EtISbnRc7lSOUgHBz7VTi8YlcRvc+q5sdE6hMOv5JdDvclhebETKY
         Goo2qquAw13MBMCwACsarEVSMVS/yTpacY6OjCc0mIvFEBxPASdcH6vY9nMpABA6OH3l
         NGGjAMMHxTC+nKvv+bpCDIAe4hXd21J79qf+QKRMcIcJ5N9k/D67PjAN7M/Y9zhpp9H1
         F7buN5sn2clzQRNvXVn7p9UmBiQHE7RxA68UfT3FwlkGYrAs9azT/MSkkYNBI0lQoyOR
         qNEzZS9fICc0uqMe2SdPJvI/6tieOLt4V3imHpXcrfNF3yakJSkAeqeav97F45iSzGTv
         EnIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kZWZPrQd54BSDgxOyeSGv4OPeqvj2vn4bH0lrJGj4Ms=;
        fh=gk09tmeT1sM6sBrfyDfhie53woudghWm/OP0ZcMpTg0=;
        b=dRX895epaZkm8WRNOExBwJUEPQKjmDukhRbeCQtVaOo+1NafoHiy87PbcEWVuxLne6
         DY/BYsc5BsfwBVTBBGpOi7aQLmjYjmiJG3Cqc0Eje+8CEBvdRINIV/kZDr34QSAWUOQR
         +aJ01v/GZcQJAD7/+W2mZmoOtep0oBOIrQLnWkySzVOgtnK45JXrHT8jJGbI/MJt9t/7
         Do8S9gXT+uo7nD+Glto/jOblypp06vgbJ+TdPL7HwnTloRQe7ZMobsu6G27aJWZdr7vI
         jdA+uGsZKiOR0TDd8zCQJT943DYmqBITxjKI7h0ulOsyvgQ+4r5V+JQnl084GfBxQ+Jd
         6jMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784136263; x=1784741063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZWZPrQd54BSDgxOyeSGv4OPeqvj2vn4bH0lrJGj4Ms=;
        b=OXoJZk9RH6HpqHBnDace6xkk1iT598hDOAFFfhJuqnk5FoHs1PQdHo/yWQaIcJQPzk
         CBfGv1Tgk/wSE+mDtzxfe1kiDPKc8SL8BLQdNv2RW/6hAhZoZpbQYDArpzZJg6TihofD
         Ipek1lgJZ+Y08LCpNcMd+j6f1uYgI0/YdF45BfGU0l9UQmGReU7PRz4y6aEJuDFQVkVh
         dHgdkB8LmU5TLPy2f4gmSvyWLmNe9HrJenvb7yUHcK5sY3GHsRiNcSb1GpsB+IrD6d8W
         7if43L5w8b9TgI1KfTQK1EQs3f5ZImOIKoMYpCrdRN+zsM0eXfH9QYhDFjrKb8dhuQPr
         tc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784136263; x=1784741063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZWZPrQd54BSDgxOyeSGv4OPeqvj2vn4bH0lrJGj4Ms=;
        b=mW7a8kP1LsUIBxCZnxIRv1xJWOgzo8kPRajnBFSQYG+83Qv3qs41fYOPPXVauPy8iK
         5tDn7VSBrbh2exEXt6Zrwt9bEsuPNHV2mEBcP8fwVQv6lQKxwe7WMPjdTj+p8OXGisnQ
         bAELGtBjWMo5qCpAapEkOVv8F4ELShcTZjfkQYTpC+PPYDiFcNqA5ksd77EyEW55qim0
         gNFLtdmII0/jB6Mohm0GOP9nCQitzb+Df2DJNpVG+xnY4FMnba7hVaROszsjXzG2fvgQ
         d40Rq5JkBZlydBZRHpbBbXV7J6vVwjlXMN1x+3j3lE05s36C1qmzq0QUZYFvBw5Ccb+i
         kfvg==
X-Forwarded-Encrypted: i=1; AHgh+RpvXxCQc0ZipQgDmjc8usn5K447u/0/ZmxUKojgYUYLz5NzPMAhsgeSZQwZNk8jclc5dcOF@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+g/5tQm8Rc4CpwvlwbvjSu1+hHriY86pij5azECtgr3TETtmL
	OImNf/zp/Q1aSbk3ta0Q7EhDTZBilA1egj78Mar5c9QMN05g1W1YoKh2DvLnAvIuSOBoRcNV89k
	8wMLsv/76Jut9MtPOSLiRdnve+6h/0i+ucJ6V73UA
X-Gm-Gg: AfdE7cnlTMKvcr4exDfZ8QIHF7N+Bx7a/fc3G3Bmet4prw94swpXaMfL8hzDWuQ1PDs
	TbtPHnRiv6l1pNSejDJ977hYyqweSjkTJCLceu7zwfyF+3NV39CVVqF6OR0CPsNuJ+CtwXLZYQY
	vJcVdCduGLK4IBTDdUmp0qRtiu/L7pgulYKKAAl+SOdq7HIm/hvcERMuKaFyTvrxE1KC7o863PT
	7gpt69jcu/EPox/w51wDSR+P0SBLeJjXnHB0T8kJHTKFjnfkS7e5Eq8v1NCL2fKGOBmEn/5MqyP
	2jOcZ86CUx8Eh1+l1/pVDMCfRmo=
X-Received: by 2002:a17:903:3807:b0:2cb:14c8:1ab9 with SMTP id
 d9443c01a7336-2cf18cd4872mr182285ad.0.1784136262817; Wed, 15 Jul 2026
 10:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
In-Reply-To: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 15 Jul 2026 10:24:11 -0700
X-Gm-Features: AUfX_mybqHGCI446L5L7h2Zp_6_VyrODdqkNsCPAiWVWAbvp3R1ALNx_UrcHOIY
Message-ID: <CAP-5=fV=_CsZFJf9HhNrJ+=jXCTqqDGd=HvwjMWu2WEn9bXqbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] tools/build: Allow versioning of all LLVM tools
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> I ran into the build issue mentioned in the first commit, because using
> an option like LLVM=3D-15 is a documented way to build [1], but only
> some of the LLVM tools defined in tools/ support this.
>
> After fixing that, a lot of other tidyups fell out. I didn't go too far,
> for example some selftests include tools/testing/selftests/lib.mk which
> reimplements some of the LLVM_SUFFIX stuff, but other selftests include
> tools/scripts/Makefile.include and I stopped before touching the former.
> Some other non build scripts hard code toolchains and I didn't touch
> those either, this change is only focused on things that already
> include Makefile.include.
>
> [1]: Documentation/kbuild/llvm.rst
>
> Signed-off-by: James Clark <james.clark@linaro.org>

For the series:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v4:
> - Drop "tools/build: selftests: Allow versioning LLVM lld", clang
>   already picks the correct sibling lld version. (Sashiko)
> - Link to v3: https://lore.kernel.org/r/20260715-james-perf-llvm-version-=
v3-0-8854bfe5af7e@linaro.org
>
> Changes in v3:
> - Add warning for empty $USE_LD
> - Use $HOSTREADELF in bpf Makefile
> - Rebase on v7.2-rc3
> - Link to v2: https://lore.kernel.org/r/20260518-james-perf-llvm-version-=
v2-0-f12cc4f031d8@linaro.org
>
> Changes in v2:
> - Fix selftests/bpf build. LLD needs to take the full path to be used
>   with -fuse-ld=3D
> - Link to v1: https://lore.kernel.org/r/20260514-james-perf-llvm-version-=
v1-0-6cac1a9a4c8d@linaro.org
>
> ---
> James Clark (4):
>       tools/build: Allow versioning of all LLVM tools defined in Makefile=
.include
>       tools/build: Indent if else blocks
>       tools/build: Allow versioning LLVM readelf
>       tools/build: selftests: Remove some duplicate toolchain definitions
>
>  tools/bpf/resolve_btfids/Makefile    |  3 --
>  tools/lib/api/Makefile               |  4 --
>  tools/lib/bpf/Makefile               |  8 ++--
>  tools/lib/subcmd/Makefile            |  4 --
>  tools/lib/symbol/Makefile            |  4 --
>  tools/perf/Makefile.perf             |  7 ----
>  tools/scripts/Makefile.include       | 77 ++++++++++++++++++++----------=
------
>  tools/testing/selftests/bpf/Makefile |  1 -
>  8 files changed, 46 insertions(+), 62 deletions(-)
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>
