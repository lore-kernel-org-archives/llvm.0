Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926CB23AB
	for <llvm@lists.linux.dev>; Sun,  6 Mar 2022 15:32:01 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id d19so14601489ioc.8
        for <llvm@lists.linux.dev>; Sun, 06 Mar 2022 07:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=lTxXsLQ3/sJFqkOXAUPDqcJOvuhEL+3+rvVpOV3yWgw=;
        b=RnGMWIJ3X7XTQvdkajhB5xVRNavoMahZJLBD9vyo0KNzdbWHGQaNf6knBDBoQ55VKT
         F1YZYuOBsKX7jyVBVwT6yyn6ij94uvyHV75j+fGsXYREYMcGkTcobcAkuRiSpWYhyHbj
         4apRIQoLGDHinLIEd+yHG8G1ErdUdvduAtRLBoAmOf3DsWksKa8xDilKfoZNdqxC0urv
         8sYOAwGPAjSknRcnPCgDWuzHcloa4RF3zBgQPUqtiLbF1xLpauScZEhOgHQJQUCzcu13
         1g46ZyUKbOOCasFMGWhP2+Arb1JT/MrH66sT0nJia2yu+1W1ufX86S1zeHHIF+9e8M+O
         HYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=lTxXsLQ3/sJFqkOXAUPDqcJOvuhEL+3+rvVpOV3yWgw=;
        b=1IlXRK/BFAJY4CiE7kVtIie1ZR2dGc70SCDL5fx14CZsmSf8vePWH8T4JG7YjOwc2E
         0UeP3G4j4OBJcJ1GNAQ4NmT+g/RhJn5O2D1Mcj5DWaUM+DJj+2v5OEV2uzZcIZLqm3gS
         Hx7sFOo4TkyCSkTKk5eLHDaEgMJKvXUQHg2wOA3u0JhrJdErMGtnu8+wNmCj6fkxD8dk
         WjbitWDD6xJu4WIGBHFvIcq57WWY8gWJOn6I5xa/3rN64NbuARzo83IymmpkOBM1JoG+
         2Tq0S23fZq0AYSPQLkDQ4jAdJjxgt1xe2maSTwMBPHCMhM4Z+73oJQw1Od/pdcCZj3Tc
         WQ/A==
X-Gm-Message-State: AOAM533ucpkcUBG7LRlo+/LzSJ8aN8pEgQGZ0BPgiPfe06YHtzIOeYY5
	js9GD+AHhVfPc8Dx6YM4IVI2Sw6SSY8+J4p6Bbk=
X-Google-Smtp-Source: ABdhPJyurIugi2NpH/AHJdPJSjrCSnkjk+CgFnV6VItjl+2OHue5fkK5G7G6tY9vo60gMRNBnEb4/q68ZQ/zEQ56f2o=
X-Received: by 2002:a05:6638:168b:b0:314:7a8d:19d4 with SMTP id
 f11-20020a056638168b00b003147a8d19d4mr7354926jat.199.1646580720634; Sun, 06
 Mar 2022 07:32:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <CA+icZUW8N25F_9_DVhRiQoe6rnvARH2AhKJgjKeYyNmdz5t_Lw@mail.gmail.com>
In-Reply-To: <CA+icZUW8N25F_9_DVhRiQoe6rnvARH2AhKJgjKeYyNmdz5t_Lw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 6 Mar 2022 16:31:24 +0100
Message-ID: <CA+icZUUM1v1FCaJDk1BaRN9+uOQD53r5Rwcv=ESQHhdN9QRedA@mail.gmail.com>
Subject: Re: [PATCH 1/3] [v3] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 5:25 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
[ ... ]
> When I saw the first patches in this area, I was thinking what about
> the tools/ build-system?
> This ECO system has its own rules.
>

My other goal was to build perf with my selfmade or distro LLVM/Clang
and -std=gnu11.

I was able to do so:

$ git log --oneline --no-merges v5.17-rc6..for-5.17/tools-std_gnu11-dileks-v2
2d99b1cfa897 (for-5.17/tools-std_gnu11-dileks-v2) perf: Use -std=gnu11
c345a183c4ef tools: libtraceevent: Use -std=gnu11
26f77082f233 tools: libsubcmd: Use -std=gnu11
aaba58ec81c8 tools: libbpf: Use -std=gnu11
ffc800af3be4 tools: libapi: Use -std=gnu11

For perf/libperl-support I needed an extra patch:

$ git log --oneline --no-merges
v5.17-rc6..for-5.17/perf-libperl_support-clang-dileks
316a1917ec05 (for-5.17/perf-libperl_support-clang-dileks) perf: Fix
libperl support with clang and perl v5.34

For details see [1].

I can send the patches if someone wants them.

[1] https://marc.info/?t=164646683300002&r=1&w=2
