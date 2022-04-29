Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954987B
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:25:35 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y38so7817037pfa.6
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5pPN8mjwx/AbKx3KOw4z6XHphBE7jWSt7OLsq9OVFo8=;
        b=RFv6M1M7x1ZS99n8d92LLnRufVr4PLadgMM5VGutzeL9WiG6XAw+x64RYu1SyYmECi
         Mgqcj7VrYXtSD7tbwFk/1jiljcK0dm5HDDK9lIJ79BFvNUOM1eg9maedbdcAHaxnXCar
         I1z/V/Y5vO70u0X2LKMTscnDn6tOvq0uLlqUNAYD6I4sORc+BpLOoP2zkWc8GROaWs/o
         hXhuYoAS85NaPKJ3cbQZelgaixZXGBCkqgP54uKnK0oUoQ1Uwq4rLK0QVg9euB7lZk5P
         LYab+nm/m4WjwA34d4u95jVabBy5DyD4JL4pn9DuXBlmP6Xx0UxxJlIR94tRwDPA6IiR
         Urew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=5pPN8mjwx/AbKx3KOw4z6XHphBE7jWSt7OLsq9OVFo8=;
        b=UMub1dCNyga86owZ8tipuhCsZgiuIwm7vquctOvG0E4uS67GjT/XUdEFqbb+oqXt6J
         tTgJG7wn33+LEz2yxrYKHopBZSBCt2zM4+Fd4T8EfiNtZbdN8r0hiTn2xOP83GX5bLpy
         o0nOa4WoHZ1h2v9/fRfRT3hLPJUx5/ctQD/ZOVG7TeAIIhk24PUwqwMUpUNi8k5cSTlO
         4FHQftachUfVuI2/D3KrkRwFYd/IrUJ6RlrERkduaz9UHng9em4jlWWvsFFoL1Y5voHC
         MwGAy28TrO14AXc17rPIXkhVTj8YX2UJMfj9AZKkhzGvqeJsll5UPCvVIi15BQYZC4VL
         Yfmw==
X-Gm-Message-State: AOAM532ua/nSCUBxoxEFuEYSUyX20LwMKDGcOK1BWpAt3feslgy1XRJt
	78QXVsVda5rDMEaJeec150sl4ubirekpltxs7TrnHpiSUb0m
X-Google-Smtp-Source: ABdhPJxx2r/bcAs9WTy7Awo124jl+kplEIfMVJpvGa2fwL3kN/hW26+AhysMcaozbOAR8ytmX6BRXa3mpgy8RwBmV3Q=
X-Received: by 2002:a05:6a00:1946:b0:4fe:309f:d612 with SMTP id
 s6-20020a056a00194600b004fe309fd612mr766654pfk.10.1651263934498; Fri, 29 Apr
 2022 13:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bill Wendling <morbo@google.com>
Date: Fri, 29 Apr 2022 13:25:23 -0700
Message-ID: <CAGG=3QX8M0p2JQOs6tq0ZSqHKLhzVh77eCxYkh22SDL6Qaa36g@mail.gmail.com>
Subject: 2022 Clang-Built Linux Meetup: Call For Papers
To: clang-built-linux <llvm@lists.linux.dev>, 
	clang linux fellowship <clang-linux-fellowship@google.com>, 
	android-llvm-dev <android-llvm-dev@google.com>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@google.com>
Content-Type: text/plain; charset="UTF-8"

The 2022 Clang-Built Linux Meetup is planned for 10-11 September, 2022
in Dublin, Ireland.

This is a time for everyone interested in Clang and Linux to get
together to share ideas, present current works, and generally have
fun. Best of all, we're meeting in person this year!

  https://clangbuiltlinux.github.io/cbl-meetup/

Call For Papers

If you have ideas for a presentation, create an "issue" on the GitHub site:

  https://github.com/ClangBuiltLinux/cbl-meetup/issues

More information will be forthcoming as the date approaches and
logistics are solidified.

Share and enjoy!
-bw
