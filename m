Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67922C83
	for <llvm@lists.linux.dev>; Fri,  8 Oct 2021 18:24:45 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id j21so24901460lfe.0
        for <llvm@lists.linux.dev>; Fri, 08 Oct 2021 11:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JNduv5Koxor1VjtWV3gPPOOJKXOF6CAin4YTjS45gQQ=;
        b=K0UmiBJZRcXruD+pelEeWj2IMAVhEJbeKnJmHjlctL2o1/r4vqCKE3zLxgO3kQIMAW
         CVCXidDzu9ksSYGqCwN7MZDcvz7i98TVr2T4YL8TNQD0Y1WFtu3yqWjHzho0xrb4xaJU
         /+HNJQoT0zzMrOAcSqkZ9GiFTfM34E/De/4rDoLEtIqFnHUPWoc6pP9DmyIPer9oUGUw
         jGm/M4zniLpZbXr6jtKgfDJkIZt8/MbvqWHern9LEX3uxSGSl8kpjOKO/H0D/nE6fWcD
         3Y96cmByQvUZf756wA7VkQKBSsdkUng6KuW4yduc678pJL8/1rCi3L6tMBqdNAc5U+v6
         6dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JNduv5Koxor1VjtWV3gPPOOJKXOF6CAin4YTjS45gQQ=;
        b=eKhTnXwg1+JQD3Nuq3qJ+BUzQQOd5vhfpjJLnyq9xRfrpWtIKnUk5qksfclPEKglAe
         Z7Pdz/uk/+Qw1LVm0Hx3MtGtHCWxg6g3LRRFO0EyaKOZQVu8LSmQmTOntJkB/fOjiotZ
         izMp1pCGt3svP9N0yLd1HyLhqnKuvr6RszzrQ/tQa9YCWYxZrUznKkR4e2Hd/riM5Kco
         uzJ/tLWsNA/xjpzzo3g6BzyPsBmXe7ImLsmntqTpUJ8On3uKehlU48JN+9wEr2pxFIMf
         lzfo/DgunPumHKhheEz/G4RqUoAq9XyuJ2WojXa0qWBbL56VMhmKhS4lDgR0+IJuZ+mD
         B+Xw==
X-Gm-Message-State: AOAM531/yGkGXJXXyOFIkABk70GITr61rxjk2MTNyPzzvjt468vxuU1m
	Q1nZMaRFjFTVcTapi+qI1i7oo88NTDzClK1fTkJcDw==
X-Google-Smtp-Source: ABdhPJz1IaecQmfiooQg7FPl2s4b1/ixcBpHnUQgo1PAozaYO7fpNBQhDYlVgdREYftlPSmgirLh5lSwFXNe1JdgyrI=
X-Received: by 2002:a05:6512:3ba3:: with SMTP id g35mr9081132lfv.651.1633717483442;
 Fri, 08 Oct 2021 11:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Oct 2021 11:24:31 -0700
Message-ID: <CAKwvOdmRZg-8Gkn814NPNPmPg3G7v51AcwcKsLfCPZiqsmm01g@mail.gmail.com>
Subject: Building ARCH=arc linux kernel with Clang
To: marksl@synopsys.com, thomasj@synopsys.com, jeroen.dobbelaere@synopsys.com, 
	grahamy@synopsys.com, brunodf@synopsys.com, tatyana@synopsys.com
Cc: llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello @synopsys.com 2021 LLVM contributors,
I'm Nick, I work on compiling the Linux kernel with clang (and linking
with LLD, and associated llvm-binutils, etc). Jeroen and I know each
other from FOSDEM
(https://archive.fosdem.org/2020/schedule/event/llvm_alda_panel/).

ARC is an ISA that both the Linux kernel has a port for, and LLVM has
a backend for.  Any interest in pursuing being able to build that
(IMO, high value) target?

We have a fair amount of CI in place; once we get a port up and
running we can help report back regressions on the kernel and llvm
sides, but there will probably be a few bug reports before we get
anything building, let alone booting.  Though, does a QEMU port exist
for ARC? Our CI relies on QEMU for boot tests.
-- 
Thanks,
~Nick Desaulniers
