Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC0F33CEB2
	for <llvm@lists.linux.dev>; Thu,  8 Jan 2026 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907981; cv=pass; b=SdtvYfGP79/uKiJZRwXqpmYa5gumHU6cQdtv+ETAr2aURyy9ep+R1z0yunV0qaOT6DBoRR8BaTYaClyolmMCu1E4872B2sl/R1ESkZJXItzrvDVDKVQl/EVO5j9qWZN9SbFMIQQHASc8K4ITt70I1huqIgtzJpQlhQbJrW7TdNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907981; c=relaxed/simple;
	bh=h7T9WIGW4cP4dhj2JwRYmxkFXPoI0ySk4+E7EPCzcII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=iP+Y2SRhmJJ3UtPFHj62jFKmR/p+b7cP2sOM1I+ttOFkoa1ddS4GqfKvFzfrxjkM1lYxQiakNYgeqJcPHr39KB2hXBVOwR+S8ZjZxedHuE9+Yz8/YqeAp6v9wlrCwCRUusBHfk1l0nJ/N50cUBwH0VKKiD0iMbhguonWs1kuPwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a9CSpGzy; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a9CSpGzy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a1462573caso21455ad.0
        for <llvm@lists.linux.dev>; Thu, 08 Jan 2026 13:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767907979; cv=none;
        d=google.com; s=arc-20240605;
        b=dUtkFXRaJEPZ96hnrM88RZNuMAyp0AgYWKNw/HKX2nZH9QegllvGU00/lzvq1mx+Kq
         IgwikwgZL/VeAJ4sSASvtua9PJFqkvkzskKAllK2cVa3yzyaCjIeUCM8ihxrD/A8Y3K8
         EDtQlTn52J7lJxllgDeOc+d4yCQbDm5dMmzhPZHCJ5ZjIGmxlJJ6sRAB/GDAKXvQuy/5
         CxduKm93TtQiaHBtgUzdIKKnwsVnJ4W5umCkZdV/v02P/bRp+Z5ngvm+/tu5u5jxc6Lf
         2dnEQoo0Hjkh/8E2wg7v3KqxYyJBG1XWz7Ww2j/tTVJltgxlGeB3cTbeAlXgBmaLZTV7
         NcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9jii3QhKwF6ZszXh6UcF2y7D5ibtMfEq4bxBfO5NQDc=;
        fh=j5oYNqepfeC25nI94k/NCYu6TlPRU4E0/OqIr8fYHX0=;
        b=Hlbn271YuurgXJxbNPao6r1e7Uczi0OgRtii5ohWvSClQWSAnZPHrhKwW/b3YqUcgb
         YVeIwbGUFxcCa5iexACHwV2ALbZwUa95gTH1kxImk1meRvJwhVIrJgmCX8KSP6h0QK1q
         7uXV6ofEym3re076QtySh5/92sI5oi1mvJOT+AYJKhn7n2ejfyu/T4pqRTS4GoHse8UW
         tO9nxlf6aJQeSf6lqAr5G3D5YCwG3Jk2bgVGEgP//A7g55plotYcIfYnL+b4dkjdwEPQ
         fOUTFraFb2AqytCo4jyCcaZuCCtEkmbRJYIxVFTsqNcUxefkDloj/zLgtAVy/L6Qyasp
         mpbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767907979; x=1768512779; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jii3QhKwF6ZszXh6UcF2y7D5ibtMfEq4bxBfO5NQDc=;
        b=a9CSpGzy59nwHJeSvhFaw54z4IictKjvLHAe6QaJmbYavE4uC9HW53rCap/hTkIoDI
         rwjlNj244ZMOW54a4XzWHJbwdMpDjDtVbrIi3OTPFeJoL9XH1CTSv5/QeDjqg3wPZwXS
         hI1Ia5B3edJUz9Gx+CSYkgDK6KFF2AbyR+kXNQ+iF+VMCCv/5PRyxN5mR5ymUU7X5t5f
         ZRY+cCDX+0+NdwVUS+E1qmOgI91yO9cxLY4Fp33g5QE+y1Nxb4FUVF37ulJbdErM9mCb
         zjmUH/4ulORSoaZRX1e3qgRtv19Rs4pomGbArp3Yrg2Cqo5eW28aKQFugwgpA4qA/ZKs
         Clrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907979; x=1768512779;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jii3QhKwF6ZszXh6UcF2y7D5ibtMfEq4bxBfO5NQDc=;
        b=b0OLD1TtqDoNTW/QUubqaKpG4kRAL/s0qiCSCc3dfIuXSp05R59kPeHmedyegdB9Yk
         QCb2DQ7iMSRHyK4L0SqBKDCdedRW/EQ5LNIU7rmjtjy2NR8J+h4+68yiOJez9Yvq5BFo
         TWbyeku+gYLlPSHDnvEaDnOM1FsBLsFSxv2/m1dKvuT4N+LcedHjae1oNSSBpsedEKEz
         o7Lqn6wmFwEpars9v+yG2rySTSuqMckims+BrOvTqCJXm/0FjrpWOYFUIdrHqEGco2oF
         0EybKsZXadJGMKIHKxQdr3v59/4n+FbTnvYS46pW6PQ+f6vPi0tMzWxUa++veJK78JRW
         K26w==
X-Forwarded-Encrypted: i=1; AJvYcCWz3QnZ5Tk+LRY87h4BzYLjweNfqmUMF/suj9W0xGH1ifTLc2yWh1E05eH8P7jPgDwvieno@lists.linux.dev
X-Gm-Message-State: AOJu0YwEId3/MxxJ90Y/cYbp2At4s71F2of+ZpnC1QuavrE/oRI52j30
	it9QM+3foNKE20NBfyc8h/HvZRcAOggKzEJekwC5ZxWBGXMJkmLxzdcqS5V77lq5tMU94JldNoU
	6xGF+z2kVXkFTHAIGH/4FZouChNOQe0s3lTF/uP3o
X-Gm-Gg: AY/fxX7fJzhYl4mKS25RnOhCJ34ijtrDUVvUNrix9Buy5L02VY4VHlLn02O8ZLfogCC
	pWT0r58lxQzncDJa5ywHotdDOUcJpSboFFoj/J0IvvlKaqgyiMeTu3bjAjmczj06eYPaMd9bUvG
	6f/MDY6ri8BTK6lYGViPqOmCIwbcYOOJIq+gKMVIuGa1ezGf2uUADVbD/a4FCPPM9+ZtoG/m9RG
	Czf4L9bfEFt3k4peYFdNZATqRnK3ymOMz8Bk4b9lJ6+G91PlrVy+ImXRoE9s08ErEkeBJQcsqHb
	FxpXe0Aoa2iTlkUeeY7izFx7uhCssRmwHMoj
X-Received: by 2002:a17:903:2ac3:b0:299:c368:6b1f with SMTP id
 d9443c01a7336-2a409ac2549mr882185ad.18.1767907979220; Thu, 08 Jan 2026
 13:32:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251007163835.3152881-1-irogers@google.com>
In-Reply-To: <20251007163835.3152881-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 8 Jan 2026 13:32:47 -0800
X-Gm-Features: AQt7F2p4jlLBo8WB0IBnDmjDWl4i1PUdEKalJuFo7-mqHyIq6-NhlJpnSTbe7tQ
Message-ID: <CAP-5=fW7YViusbdr9uZ_wSg5cwAPcdnysGbfuytKyYw6cbQa4g@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Capstone/llvm dlopen support
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Collin Funk <collin.funk1@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 9:38=E2=80=AFAM Ian Rogers <irogers@google.com> wrot=
e:
>
> Linking against libcapstone and libLLVM can be a significant increase
> in dependencies and file size if building statically. The dependencies
> are also quite cumbersome if bringing perf into a distribution. For
> something like `perf record` the disassembler and addr2line
> functionality of libcapstone and libLLVM won't be used. These patches
> support dynamically loading these libraries using dlopen and then
> calling the appropriate functions found using dlsym. Using dlopen
> allows libcapstone and libLLVM to be installed separately to perf and
> when that's done the performance will improve as separate commands for
> objdump and addr2line won't be invoked.
>
> The patch series adds perf_ variants of the capstone/llvm functions
> that will either directly call the function or (NO_CAPSTONE=3D1 and
> NO_LIBLLVM=3D1 cases) use dlopen/dlsym to discover and then call the
> function. To support the function signatures when
> HAVE_LIBCAPSTONE_SUPPORT and HAVE_LIBLLVM_SUPPORT aren't defined
> prototypes generated using pahole are given. This avoids requiring
> libcapstone or libLLVM for the sake of the header files. It also
> avoids having a build where neither dlopen or dynamic linking against
> libcapstone or libLLVM is supported. There are other possibilities in
> how to organize this, but the chosen approach was done so for the
> simplicity and cleanliness of the code.
>
> The addr2line LLVM functionality is written in C++. To avoid linking
> against libLLVM for this, a new LIBLLVM_DYNAMIC option is added where
> the C++ code with the libLLVM dependency will be built into a
> libperf-llvm.so and that dlsym-ed and called against. Ideally LLVM
> would extend their C API to avoid this.
>
> v8: Rebase down to 3 patches. Update commit and cover messages.
> v7: Refactor now the first 5 patches, that largely moved code around,
>     have landed. Move the dlopen code to the end of the series so that
>     the first 8 patches can be picked improving capstone/LLVM support
>     without adding the dlopen code. Rename the cover letter and
>     disassembler cleanup patches.
> v6: Refactor the libbfd along with capstone and LLVM, previous patch
>     series had tried to avoid this by just removing the deprecated
>     BUILD_NONDISTRO code. Remove the libtracefs removal into its own
>     patch.
> v5: Rebase and comment typo fix.
> v4: Rebase and addition of a patch removing an unused struct variable.
> v3: Add srcline addr2line fallback trying LLVM first then forking a
>     process. This came up in conversation with Steinar Gunderson
>     <sesse@google.com>.
>     Tweak the cover letter message to try to address Andi Kleen's
>     <ak@linux.intel.com> feedback that the series doesn't really
>     achieve anything.
> v2: Add mangling of the function names in libperf-llvm.so to avoid
>     potential infinite recursion. Add BPF JIT disassembly support to
>     LLVM and capstone. Add/rebase the BUILD_NONDISTRO cleanup onto the
>     series from:
>     https://lore.kernel.org/lkml/20250111202851.1075338-1-irogers@google.=
com/
>     Some other minor additional clean up.
>
> Ian Rogers (3):
>   perf capstone: Support for dlopen-ing libcapstone.so
>   perf llvm: Support for dlopen-ing libLLVM.so
>   perf llvm: Mangle libperf-llvm.so function names

Ping.

Thanks,
Ian

>  tools/perf/Makefile.config         |  13 ++
>  tools/perf/Makefile.perf           |  24 ++-
>  tools/perf/tests/make              |   2 +
>  tools/perf/util/Build              |   2 +-
>  tools/perf/util/capstone.c         | 285 +++++++++++++++++++++++++----
>  tools/perf/util/llvm-c-helpers.cpp | 120 +++++++++++-
>  tools/perf/util/llvm-c-helpers.h   |  24 ++-
>  tools/perf/util/llvm.c             | 273 ++++++++++++++++++++++++---
>  8 files changed, 660 insertions(+), 83 deletions(-)
>
> --
> 2.51.0.618.g983fd99d29-goog
>
