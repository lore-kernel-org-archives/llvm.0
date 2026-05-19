Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CA5376BCD
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216928; cv=pass; b=is5AXkJ3rO91UGTd76rRtkbYnvTjqOpWexf/+aIJDB6lAZUMMHaiDrh2oUUb78O47pgn61qrkBx/pJLid5JWXv+AQIzSRHRUOsfB5TuPH98xb6GAygU1toy+LCL33MJauy8nLDEOGID+gNSSY6IOULH9PvXgYn0NkQcPdMQVEts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216928; c=relaxed/simple;
	bh=7jJuTFyxIQFgGbFSaoiVo+0a3X/OYWa6i6xQj0whl7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvjTm0hQIeWi1+YnCPK/GWFCeRwrzi0w6CXUCppc71GagoMqvguYdF+jXhjeLnSyfrRGICETjo/0DResFfcmGyOKV3wP4u0rpgk8ZTJOzJhL6vLT1SkJDa2MDdW4uCRw4q4jESaKSvKE6jrGtIsMKqEIAy9Q4YI6YaCgx88xZK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCjZx2WK; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCjZx2WK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so315ad.0
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 11:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216924; cv=none;
        d=google.com; s=arc-20240605;
        b=QzfqrXt3G9+A1b0EWKbZ1eGlsjL8yx2gVdo4jAZNFRaWnXHG8e+pezMtSf4OJKqUmU
         phwaoqErojHtzyi0SjqYa3PFEo7gUGqBErnS9X8xqCbWHWBfAbhkKfVdoas92I4Vqv60
         nJwAM/smytt+DNyJVjuCgUAXWM8RCO916IuON0/5kipWeQFU6JqehmOAii9CojX4KCzl
         8VK6G/CISq0DUlxYcKf5VgT1sCn0jvJWWYI4MxL+vVbwxnM7hKezXm6N/nypeY2DX4iO
         s/hhjj0PKccdYnck+9a12PFpxI/QUyEu/miioEWAq1Cpp2EKfi8e4MEuEHLGYy9vrpkH
         vDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQ3Jvwmd3/jYVoY+5T+/jl2kd+9Tp3/RpWPQ69jbyeo=;
        fh=ntqbjPq/ECHBGfcB3GulBeJ/u/Rje5VcrZt1RrpqHlI=;
        b=fLkn49rgiSKtIDQY00di15/0/J/dJZv8SKzXeOAE+Q+ArCYBRukvCbgs7Is9U/91ux
         fbqcWky+rQotF7bz2zh15C3anONapAAOJRbBC0/JDWP4KOBYLBkrXr33EVlHQoht2+MO
         zCEoQ8+SWhSACzOUduoxGAdguNEeUknq6lTlXMdr4INygYsNSj76oLYdA2/bV4uL1E87
         BLUsNXyB57DG1Iqi+12cI1WPQVxTfTm/WP6RrG3XvkGLi91Fl1wdSnZw5JqbUxZBevPI
         XLhAt0DSDdKodsJWKJpE/TsnIsI2UH/Y7dnF8Qzc2K9IkGbTmMITxgTu5eAHw4JTAe3V
         mh2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779216924; x=1779821724; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQ3Jvwmd3/jYVoY+5T+/jl2kd+9Tp3/RpWPQ69jbyeo=;
        b=YCjZx2WKgQKr3VB2NCsFDfzJ2gz3T+BEPzgH0vfthn6snGKH+ef2DzCZ/v4H1gIxlC
         qV4eROPRh5EIvfPhtwGk31co2gdgIakt6JmV21jzMUOhZsZI8XVJpTRyPXCNZeLJcOeF
         OIX4s4co8K7YWdPWdAtlcND4nJaw6ykLMAugRMwmwceuALY35gqXMHtESLFrQZR2J7FG
         CsyFcqq2Gkz1FquhHYk1Yt1m7vAl3B68ypacOQMQJ1ibXDRKADQLi2BzmQdJnCevftd9
         Y8oK4QH46q78NzGGGGZTLOU3R6xaKUgQURvJWbGxu2FmczsvuaYHrrVXalL6bL/ZzKHl
         dJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216924; x=1779821724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQ3Jvwmd3/jYVoY+5T+/jl2kd+9Tp3/RpWPQ69jbyeo=;
        b=nhDYtEXoM1w5SLHQAMTqSMaS4s37YVxXr6tpxcrWdn5FgQ3nCOlcvfmL60WV2yXrVK
         10A5wFeF9r89OqPy/UFlsaLFwGG4jmZBHGJwN8BnsQzdFtYQerYZfyhTE0fukVxH4+4k
         96aZExx9AK9K9y7DT5BB2UCEHE6FKAaqfuFQcT7ISBFwTgpuZ4o5P8xCt9Wjxn7B8xzC
         3PUekRj3dKWI42hp4x1+2WY77dYv9wuuugPR3sQ3LYRKgO90eSrAnMKPCqZ1TZ4t+oHx
         mjXU/XmE4kkbWT0+xkN+/0avIlxWF5VkV32GjzqVPbTMMvFap9MPwvwo4mnQk2w8QOQ8
         A0fA==
X-Forwarded-Encrypted: i=1; AFNElJ9K7J2UJxK0DRE8+VWSWt6jWVdy7NUEq51t9Vx98t6L+fSKt28JoOj69fkKVAWCXT8nVror@lists.linux.dev
X-Gm-Message-State: AOJu0YyS21JgAuvV4nk9nL889wyM3Dby6thF32chJVXcu2A+WmI76y5b
	csl448okwJ9AboHcPCwxx2hihz61SBYAVHBMXYxpaWUiECnl6SnWY3kc8wfoh/YAoNTP3VAlR3c
	qV+M8IPDwWaD+bXPeRtFOcWy/FfTHFYoltMzLTpiX
X-Gm-Gg: Acq92OG+YtGXzN/6SVxX0DTZH3avVJLxT52hSWoqSRIaOmIg/BjJxW2jOEgAIliH24B
	Q+7NN2bpEdOUUqkD4+xKlNu77H18HgErCv7Cd4dVWuaM7m+PuHbabTLnBnqEGWYP+ef1xsN5SeX
	OjVkBn+iZjqVUTuNujqtEwdZyjv806rT9/xidsdh8tEybH4dboRecaC29flGgtNBKZ+SDyRvKSQ
	+VKSYqJ01H8fVTDUYc1NwwC5CmAKJtx4/QpTX7xrd4OiQYSldbE05ALiFHimX7oXFl2zl4gg567
	NUGs1byP3JUfbLbSmwaoz0u35AlZG/N4V9JSu6ClzY0VJf//
X-Received: by 2002:a17:903:2f03:b0:2bd:6727:d689 with SMTP id
 d9443c01a7336-2bdb03a2b85mr7785775ad.12.1779216923701; Tue, 19 May 2026
 11:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519185154.2987285-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260519185154.2987285-1-florian.fainelli@broadcom.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 19 May 2026 11:55:12 -0700
X-Gm-Features: AVHnY4JlPZT2y2KVD2Jea3uptVn6tXWN7jpuqmjhnpWHibNi0RSzYBZXKWi7G-M
Message-ID: <CAP-5=fUuhNRj2Dwz9FmMnWKwXjM3RCFV1oQKO4e3X20EOHstEg@mail.gmail.com>
Subject: Re: [PATCH stable 6.1 0/3] perf build fixes
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: stable@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>, 
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-kernel@vger.kernel.org>, "open list:BPF [MISC]" <bpf@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:51=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> This patch series contains "perf" build fixes specific to 6.1. We have
> seen occasional build failures in our CI looking like these:
>
> util/parse-events-bison.c: In function 'yy_symbol_print':
> util/parse-events-bison.c:901: error: unterminated #if
>   901 | #if YYDEBUG
>       |
> util/parse-events-bison.c:1020:62: error: '_p' undeclared (first use in t=
his function)
>  1020 |   yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp, _par=
se_state, scanner);
>       |                                                              ^~
> util/parse-events-bison.c:1020:62: note: each undeclared identifier is re=
ported only once for each function it appears in
> util/parse-events-bison.c:1020:64: error: expected ')' at end of input
>  1020 |   yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp, _par=
se_state, scanner);
>       |                         ~                                      ^
>       |                                                                )
>  1021 |   YYFPRINTF (yyo, ")");
>       |
> util/parse-events-bison.c:1020:3: error: too few arguments to function 'y=
y_symbol_value_print'
>  1020 |   yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp, _par=
se_state, scanner);
>       |   ^~~~~~~~~~~~~~~~~~~~~
> util/parse-events-bison.c:991:1: note: declared here
>   991 | yy_symbol_value_print (FILE *yyo,
>       | ^~~~~~~~~~~~~~~~~~~~~
>
> which are resolved by these patches.

Lgtm, but the changes should be unnecessary as perf from Linux 7.1
should run on Linux 6.1 and with more and better features.

Thanks,
Ian

> Ian Rogers (3):
>   perf build: Conditionally define NDEBUG
>   perf parse-events: Make YYDEBUG dependent on doing a debug build
>   perf build: Disable fewer bison warnings
>
>  tools/perf/Makefile.config     |  1 +
>  tools/perf/util/Build          | 12 ++++++++----
>  tools/perf/util/expr.y         |  4 +++-
>  tools/perf/util/parse-events.y |  3 +++
>  tools/perf/util/pmu.y          |  3 +++
>  5 files changed, 18 insertions(+), 5 deletions(-)
>
> --
> 2.34.1
>
