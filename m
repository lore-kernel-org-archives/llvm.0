Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819262C83
	for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 03:09:13 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id z5so43493730ybj.2
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FTVshl9Jefo2BzQxtGM9kFLryo0edF9MOJ5E+vVxA44=;
        b=efFH465LIdLBSe6pxeyXd6rpuBwhMRC7O641rjKon+zYzEi5zbCl6aXlyPw/kzRD2e
         hxvl04IAP8Lu0xmEIuQ1Y28asASEfpDySl+jvc7b+sXSYgSIxyN3/50TvP50fjOYDyby
         VQpu6oRd5fS7xFjzsN9pB0qHjFoZixL6UN3Dro8F0prUKfJUku4cuuPpEMV4Y5tsvhTJ
         Yb0Uw6u4NXyR9qD8lSLLvqFk5Dz4TqSZQPR//vgcu3rf69JusHZmsVHWLln1Cj7+r9x0
         wHDrZfrg5nQWhQ6Q6OTKuA66jB8rYEhjj7KXv0FW+8d3CyhCxSTmxFV5VWpUlYcTABEc
         sBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FTVshl9Jefo2BzQxtGM9kFLryo0edF9MOJ5E+vVxA44=;
        b=LMQK4PswVizsOpcfsT4KQ1RjJO+myJMOMcIM1oLwhYezH00rqu7V3ZKwVFlaghFm7N
         uuSWmEZ7QahB02wYTTuKxfW4lGnlPOQcVOvec5hukGE8bLXIftgX0kX8rz5By/eDRm/O
         lpQeH+yQJhEOkLQTAodl4K21IcfojzPOqyIJwzWlVL3G66CKzovsW63skD4fIDfaI16z
         wdQqxh2GfYP6B6hi3qd11kTV2qvMaHzevlnjE4NEa/EfLquWERGLxNb0OM07CBB1zDYT
         zRrFl90u0ERySPucqSovrpwYwfnW5IZctzvmRnEOG+adcL/uJK7yrikAZqDInHqWZprI
         16Mw==
X-Gm-Message-State: AOAM531ApFLNmWLHC6j1EWsmI33BmEA8gCisSHTFoH55yeKr+OpTXExa
	th0DhtuXWxqJtDDNKXXdRQ8IlJxDagJXcWqn4KlqYQ==
X-Google-Smtp-Source: ABdhPJzJS9y19I8QsN2CIc+h2Q+qEVwU2WZQBTowP4Q1pR7aazPCRPw2H9xNl2hUVLv6e/ATtWp904GkhyIGzEVaBg4=
X-Received: by 2002:a25:ba08:: with SMTP id t8mr27043351ybg.111.1634008152410;
 Mon, 11 Oct 2021 20:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211012021321.291635-1-irogers@google.com>
In-Reply-To: <20211012021321.291635-1-irogers@google.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Mon, 11 Oct 2021 20:09:01 -0700
Message-ID: <CAFP8O3L_Oi916yOAuPB7MFpa3QoDQtreRbV7oNt2Yh6h1Coq9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tools: Bump minimum LLVM C++ std to GNU++14
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Leo Yan <leo.yan@linaro.org>, Michael Petlan <mpetlan@redhat.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 11, 2021 at 7:13 PM Ian Rogers <irogers@google.com> wrote:
>
> LLVM 9 (current release is LLVM 13) moved the minimum C++ version to
> GNU++14. Bump the version numbers in the feature test and perf build.
>
> Signed-off-by: Ian Rogers <irogers@google.com>


Reviewed-by: Fangrui Song <maskray@google.com>
