Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632F22F386
	for <llvm@lists.linux.dev>; Thu, 29 May 2025 19:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748547133; cv=none; b=djfqdxSjWr3z+pStwmykMpWgAQZNHW4dwZ9cfmJFY2jSZOtsCO3PscfS0prGHDtBsNnKqszoNgM5duSwmUrbde4xjH5eQ3XBciJazDzMSYOKogEkXeXNna0zFKYhbRchFNorsqe0zr+8JXF3oP4H3dfSzukkAQ17nRfemSmful8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748547133; c=relaxed/simple;
	bh=suM0mpQZuZDS7U6qEAaXfPk2BgJKHIMN0K7aaC2BNg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXLMVCtFSFP+ejxjy5No//+oNq3A6UMkkz9DAx8WKofx+4VgFSkr/iKVjPuWem49e1zUu5z0VkRGxIc0YTLEVh4RKnX/CMGhtbj7FgIyrVb8Njp4frCiZwv1yVLwvAHQzioiQeYjJF6JasguRraHtpp10+FRpNIp6SOFAh+kvtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QE9iaYn5; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QE9iaYn5"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so1675ab.1
        for <llvm@lists.linux.dev>; Thu, 29 May 2025 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748547131; x=1749151931; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUjgQ4y3US2h0NEsYkvYyqgrSdwAy2IN0hLNscKaed4=;
        b=QE9iaYn5lnkSAacCLBzKCF+iWORzSl72b8JSEll3LuTL/+Rz+R4j06vNCZw+fzfLP1
         EF0DHlCaEX0WSyAe+MA3OgNM/YkAu1L6jfGa/Ss7ErbQTZFOc0Dt5+J+Yr+V0ECt3xr9
         WjI1X9gv90CXkIQ0DwFS8shpqFQ32Ttj3XaUtBmhb5AN+NPnktkvGfhXOkIvne8Fmqzb
         WFTLpEFfnz1eVBwn2NcmpTZzuoqKlp1XCObgXvwcODznqvMubdnt/9yENtmRz965mIgc
         nkABcFiDRxwuFYMGpCwTlDX8kjvhrLlSsMcERrw93bFtF/6Pfx1EC87iakp9ijUHT/bX
         e9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748547131; x=1749151931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUjgQ4y3US2h0NEsYkvYyqgrSdwAy2IN0hLNscKaed4=;
        b=E/wx5V0RUwqwjwP9oGFqWRI0eNYFVkG2qrg5EymwnRdJVWZWg13S0/U5FHxoxbL7Qj
         e6RQ0NYeb0jicKzoS3LgWSh72RPF7hLm8p1GVNxBOHNbuEu6FlVE5FRSgCZYxwAxkSgX
         qyXv0T/NF5RlfbAjgG1LEdbqcmVS1Uuzk4YZTsjdBxWn+HKPZdmdG4wYOwly+OL+Ui5z
         hUMHXvdyPp1SJaT7MgBg23siGevvmlVwam8LhTjq7STOoB5/bPV1mmd8nYjkjjdtdC8J
         085Ny2LlA78b8V0jfMS7dABA96fbUyv3UCKYKacCZVyWd4KZvCmCKppuQefjzMc5nbJt
         tg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp6vF4U3Pi0h3R+XznpmENOvZJ4E1bIadnI1NQ9YKaeNk90HJ9VyK6LadC0dzb9a5RJWp6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhmlbk4wGn22VH1R6bUGZrIaT6UDT4pjvPRqdL74fxxI0KrH/O
	N5qxkY5YgEaXBqGWFUtUMXqLznCyaWQThWKewdSCewk5zC/vJqJPtDwIkSiGMDvpYT6rw+ZQt1z
	Rcb+q+4LXA3JHgiIab+Pmpe+gSLj0jP9zLAIt3XaQ
X-Gm-Gg: ASbGncv43vLG14igRtmyDejWao937tsD8K4w4KcDETVJ+DR07wMVDWz8T66M7gqz1HF
	HGuLdaoBcEyENGFOgYbxw33umhKejU9my+wjGVRBUL8fQRq0rAv9xUuN3aoqL8qT6aht6glms1X
	pwnekEe1aeyNUnu6cijZmmiZX55DJkJziyIAYo0fRBmCRlERSd8XyvQyOOOSJwV0G7kQWHSTG1O
	9XP0YTBy8A=
X-Google-Smtp-Source: AGHT+IHuIlvzAfaUZ+xk0wfbMoT5HjP4Fti+GvjUYo8urDejem60iRe8E+38zbjvpQcsccg2Q0gW6DcrObbSjSXcSM0=
X-Received: by 2002:a05:6e02:1486:b0:3dc:7bb8:9f08 with SMTP id
 e9e14a558f8ab-3dd9a6bfcf5mr577735ab.14.1748547130836; Thu, 29 May 2025
 12:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521225307.743726-1-yuzhuo@google.com>
In-Reply-To: <20250521225307.743726-1-yuzhuo@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 May 2025 12:31:59 -0700
X-Gm-Features: AX0GCFuGCembv2mpvjm70qwKFTqfL7Uq8kN6sHwd3VIVLcCpIWuoZMUO7YL4Ymc
Message-ID: <CAP-5=fX-Hy-YLD_P_73Z2+7PfPnSU=0e5yaDgoeZ3gw_getaYw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] perf: Remove libcrypto dependency
To: Yuzhuo Jing <yuzhuo@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, James Clark <james.clark@linaro.org>, 
	Tomas Glozar <tglozar@redhat.com>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 3:54=E2=80=AFPM Yuzhuo Jing <yuzhuo@google.com> wro=
te:
>
> Currently, genelf.c is the only file in the perf tool that depends on
> libcrypto (e.g. openssl), which only uses it to calculate a SHA1/MD5
> Build ID.  This patch series pulls in the SHA1 implementation from the
> kernel tree, and removes the libcrypto dependency from perf.  This also
> switches the default Build ID calculation method from MD5 to the more
> commonly used SHA1.
>
> Yuzhuo Jing (4):
>   perf utils: Add support functions for sha1 utils
>   perf tools: Add sha1 utils
>   perf genelf: Remove libcrypto dependency and use sha1 utils
>   tools: Remove libcrypto dependency

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  tools/build/Makefile.feature            |   2 -
>  tools/build/feature/Makefile            |   4 -
>  tools/build/feature/test-all.c          |   5 -
>  tools/build/feature/test-libcrypto.c    |  25 -----
>  tools/include/linux/bitops.h            |  10 ++
>  tools/include/linux/compiler.h          |  17 ++++
>  tools/include/linux/string.h            |  22 +++++
>  tools/perf/Documentation/perf-check.txt |   1 -
>  tools/perf/Makefile.config              |  13 ---
>  tools/perf/Makefile.perf                |   3 -
>  tools/perf/builtin-check.c              |   1 -
>  tools/perf/tests/make                   |   4 +-
>  tools/perf/util/Build                   |   2 +
>  tools/perf/util/genelf.c                |  72 ++------------
>  tools/perf/util/sha1.c                  | 122 ++++++++++++++++++++++++
>  tools/perf/util/sha1.h                  |  41 ++++++++
>  tools/perf/util/sha1_base.h             | 103 ++++++++++++++++++++
>  tools/perf/util/sha1_generic.c          |  49 ++++++++++
>  18 files changed, 373 insertions(+), 123 deletions(-)
>  delete mode 100644 tools/build/feature/test-libcrypto.c
>  create mode 100644 tools/perf/util/sha1.c
>  create mode 100644 tools/perf/util/sha1.h
>  create mode 100644 tools/perf/util/sha1_base.h
>  create mode 100644 tools/perf/util/sha1_generic.c
>
> --
> 2.49.0.1164.gab81da1b16-goog
>
