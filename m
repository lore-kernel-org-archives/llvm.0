Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F353B1AE845
	for <llvm@lists.linux.dev>; Wed, 11 Sep 2024 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070186; cv=none; b=uusU77y4ROaZp2SZ/2Amy3KBazsQ+2SGv3EsdqreExgsP+lG1byilAGNC7WzpTtu0u6qPJv+E7kTZA7n+Frjut8chRVjCzAZuHGLfWmq+KyM9/Fn2QbmaAbEEDFhwVHPPSGnd6m0v11i7kS5a/rxdpJgctOS2NkWj+7aO8fCJJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070186; c=relaxed/simple;
	bh=Dxod+zYmhRxDadQPuCZp+2EDvtcNQw3ZAxVfQZkt2TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/MN0jQa+u4M0WYRILAkLKa0eis8WFL6L97bdDtD2PR/mTvMQ5K8nWNP+G52RcrHUF1avcmLRKZ0wAiCFqs/58RdZgBrRhEBFbihGEOZPuWw4ts4QfUVUwfwTxKv8m6lOcopKZhsYPpMI4qV1iflpor0YhToTG8ZxZtwJkkMJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6KeoFPG; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6KeoFPG"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-717911ef035so5361036b3a.3
        for <llvm@lists.linux.dev>; Wed, 11 Sep 2024 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726070184; x=1726674984; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jljrGYOdYNtWhSCPWEj0dAzhk8I277dPvpWRqGcz7w4=;
        b=e6KeoFPGqczCI4u0v3cLinBRhQVT2dyfnU2I8SYElBOPGPkDsVKECTnUZ/d9UuWBgZ
         arhwSNEAQ7acA2yt0fNGWacr21lC2+8e9+Q9qfHgXjvl5L+DRAIiCUaRQZaZ+VzJPwpQ
         uanzbfwSCwOgfVYRWw3vBQkofEqFiCuzh0J/pxnBacwcgKcSSL9IchS71a9k3zUwNp3v
         9eZ7V1yrPaUFitWGUhPTxHiveiCQkerf7rbtrSRSlPp3JGhAgbJsAJUyewxjLxUBwvUa
         TTYj2HF9vT7Q9QX6hX2yHgUe4/n2TwpbJOcbzKMPL+suJXp5lepxvE4t2ZhKVKGI3ogm
         TIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726070184; x=1726674984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jljrGYOdYNtWhSCPWEj0dAzhk8I277dPvpWRqGcz7w4=;
        b=mIwGbHKKVxyY/xCo13WSMcpltJwKimvZ1bWnDpUs1YkWfnxccnMJRzfUyWlD1SOgwr
         XXaDZPsgOcyD+ssHfsjk7J7XmoU5o2bXrKgjyEpCcav19lECp3Npr2VLUQ3WItCs2N0B
         jXaf9r2mEQAJo4ZnEj+RzXXM/7p6TO5gyMOcaP8D1Ju0ismUZ2zdYL26EPS/FkzSCmFo
         jUkmDHk1x0eLjsx6J3QJEZUpUs9xSxR4AfOHkqizrU2Yo+xspRrseOdGSSpir58/XUO9
         L7TkGuvl2NVg9T863cw225/wiXLnSfFq8Q3RredVVODcJK3vvxZNTJe3S0RXLHj//orN
         0ZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuID+Qypsi7mHs0xwv/Dyvb3uEZQWX0g8vBaCkfqbmwQNooXX9BktbECNLax/nWHaAxZuY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/IVaHINNL/bkZUJunUQGsfKfO/zN2MTvILM6ALCSJSc0kgB1q
	Nqku2EgB7k40sHXam+OIaVPmK4tBnWZBxXJS+RPvb1zKDZX6Kg3lSHXC8HwrpStRWRRULURyRO3
	LWnT+4/XWxpKPky8YVaFWbuRm1TA=
X-Google-Smtp-Source: AGHT+IGC7L1OFokQK9VoCCn4nPJx/6KFr122GwJ9dQE8hx9Mhb36sXjrE5JVsdVSMMQE0+6RpFj6xHYNV6lbGIOcOlo=
X-Received: by 2002:a05:6a21:1796:b0:1cf:3177:54 with SMTP id
 adf61e73a8af0-1cf5e176fbcmr6792708637.42.1726070184198; Wed, 11 Sep 2024
 08:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4f01524fa4ea91c7146a41e26ceaf9dae4c127e4.1725821201.git.sam@gentoo.org>
In-Reply-To: <4f01524fa4ea91c7146a41e26ceaf9dae4c127e4.1725821201.git.sam@gentoo.org>
From: Jesper Juhl <jesperjuhl76@gmail.com>
Date: Wed, 11 Sep 2024 17:55:46 +0200
Message-ID: <CAHaCkmejAaxvx_N9L1_uS5JpToLfBXPzGqs3C=8-Diy__=1sJA@mail.gmail.com>
Subject: Re: [PATCH] tools: drop nonsensical -O6
To: Sam James <sam@gentoo.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Looks good to me.
Reviewed-by: Jesper Juhl <jesperjuhl76@gmail.com>

On Sun, 8 Sept 2024 at 20:47, Sam James <sam@gentoo.org> wrote:
>
> -O6 is very much not-a-thing. Really, this should've been dropped
> entirely in 49b3cd306e60b9d889c775cb2ebb709f80dd8ae9 instead of just
> passing it for not-Clang.
>
> Just collapse it down to -O3, instead of "-O6 unless Clang, in which case
> -O3".
>
> GCC interprets > -O3 as -O3. It doesn't even interpret > -O3 as -Ofast,
> which is a good thing, given -Ofast has specific (non-)requirements for
> code built using it. So, this does nothing except look a bit daft.
>
> Remove the silliness and also save a few lines in the Makefiles accordingly.
>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
> I promise I'm not completely humourless, but given it's caused
> actual workarounds to be added for Clang, I don't think this is worth keeping.
>
> Plus it sort of propagates a silly myth that -O6 does anything.
>
>  tools/lib/api/Makefile     | 4 ----
>  tools/lib/subcmd/Makefile  | 4 +---
>  tools/lib/symbol/Makefile  | 4 ----
>  tools/perf/Makefile.config | 6 +-----
>  4 files changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
> index 044860ac1ed1c..7f6396087b467 100644
> --- a/tools/lib/api/Makefile
> +++ b/tools/lib/api/Makefile
> @@ -31,11 +31,7 @@ CFLAGS := $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
>  CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -U_FORTIFY_SOURCE -fPIC
>
>  ifeq ($(DEBUG),0)
> -ifeq ($(CC_NO_CLANG), 0)
>    CFLAGS += -O3
> -else
> -  CFLAGS += -O6
> -endif
>  endif
>
>  ifeq ($(DEBUG),0)
> diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
> index b87213263a5e0..6717b82fc5876 100644
> --- a/tools/lib/subcmd/Makefile
> +++ b/tools/lib/subcmd/Makefile
> @@ -38,10 +38,8 @@ endif
>
>  ifeq ($(DEBUG),1)
>    CFLAGS += -O0
> -else ifeq ($(CC_NO_CLANG), 0)
> -  CFLAGS += -O3
>  else
> -  CFLAGS += -O6
> +  CFLAGS += -O3
>  endif
>
>  # Treat warnings as errors unless directed not to
> diff --git a/tools/lib/symbol/Makefile b/tools/lib/symbol/Makefile
> index 13d43c6f92b4a..426b845edfacc 100644
> --- a/tools/lib/symbol/Makefile
> +++ b/tools/lib/symbol/Makefile
> @@ -31,11 +31,7 @@ CFLAGS := $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
>  CFLAGS += -ggdb3 -Wall -Wextra -std=gnu11 -U_FORTIFY_SOURCE -fPIC
>
>  ifeq ($(DEBUG),0)
> -ifeq ($(CC_NO_CLANG), 0)
>    CFLAGS += -O3
> -else
> -  CFLAGS += -O6
> -endif
>  endif
>
>  ifeq ($(DEBUG),0)
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index fa679db61f622..5d6b08a896150 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -238,11 +238,7 @@ endif
>
>  ifeq ($(DEBUG),0)
>  CORE_CFLAGS += -DNDEBUG=1
> -ifeq ($(CC_NO_CLANG), 0)
> -  CORE_CFLAGS += -O3
> -else
> -  CORE_CFLAGS += -O6
> -endif
> +CORE_CFLAGS += -O3
>  else
>    CORE_CFLAGS += -g
>    CXXFLAGS += -g
> --
> 2.46.0
>
>
