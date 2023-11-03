Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C701F60A
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 22:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NcY/tuVY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32ddfb38c02so1516136f8f.3
        for <llvm@lists.linux.dev>; Fri, 03 Nov 2023 15:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699050858; x=1699655658; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYVsvvgW5thJ6ZQ5SF5XrsYvCMjIlh4IARL3HZdCcJs=;
        b=NcY/tuVY4m22kVuM+lBjCOP7fn0aCHzXABDyGhvY02HoPyMNFW90/rQuoOD9nCqTPe
         2JQakdClQtrXWixb7vWNCRr7Nd7Wy3VBwd6sQ2j/Rq5RF162gSrakxNJPKZW3WGhJmto
         Zu60ZNO6bbly62DHlRlnuaxu5QsY+36YVnvX53vLDY733psogsXzGZDhTrtox7kjL8yj
         yu4+K89ll1RbI3st7zpESxttdBnzHnzunD8xVKaAt0W/JHBmw33oUj1nugP7Yel6Nm0r
         ina9zmEIfBI459xbmBGVp9YXd8Af1EBtx9jI1l9NREXwwG+y5s4IXV1r2iT763deix4H
         iQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699050858; x=1699655658;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYVsvvgW5thJ6ZQ5SF5XrsYvCMjIlh4IARL3HZdCcJs=;
        b=YSAD/OkgGqGCnEuXo6ucFVazd3ml5g6FgI0Uj942rSJ0THOBPnaPnSH3Gv0Egk9xWb
         8q7zQpi7/0jcLm7Bt8jEq9ezgBLipzT60gRWH/1RtFZyXaTMsmsOAQVrFqQO7zUr5pSZ
         Xo8hOaTm3Fsys7emNmeeL+gfiUwn5VxrGx8di36Dwi/Qt1NSY4Hfwf8reevxjq0nuDBs
         Idny325zMXmkM2kdLh2B6W3ihHty9Th5kKzIgWUpabVW//LGAkxWga1vty9PPFdAIvX8
         gvUIVWMIyZLoaA2GJ9whWL7r4w7KNQuSSoPUkzB3omWgfo5zF6QTl7jY/WXXNU8lABHx
         rUQw==
X-Gm-Message-State: AOJu0Yw2EJi1IHQqHbjD15hOol0YBFWCOWfpM01nm/ZdDe9KAk69ZuGM
	hWjLHYVogzIAoMS2mrMH/RaLNvm67GR8Jdn5zFgssZllQkLb1cQgMCI=
X-Google-Smtp-Source: AGHT+IGvsZkTB0eUSNkkjXUBvaCB8kniPYlTKWNhzuV/Lw1uA+ARdcybrOnE6l14mWCfMQm7B4eqrQW+Pv10nvFGn5I=
X-Received: by 2002:a5d:4147:0:b0:32d:a335:e33d with SMTP id
 c7-20020a5d4147000000b0032da335e33dmr14951163wrq.58.1699050857955; Fri, 03
 Nov 2023 15:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 3 Nov 2023 15:34:03 -0700
Message-ID: <CAKwvOdmOpXr4=Eoeis0ngU2QPTejWTGmm99bLkFEyBPPW7TD6g@mail.gmail.com>
Subject: minimal soak time in -next leads to breakages in mainline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Linus,
Do you have any kind of policy or guidance to developers to avoid
sending PRs to mainline for features that didn't spend a certain
amount of time soaking in -next?

Not having any soak time in -next was an issue for bcachefs, and gave
us time to clean it up before it landed (mostly, I think), which was
appreciated.  So spending 0 days in -next is obviously problematic.

What if a large feature hits -next for 1 day then gets merged into
mainline the next day?  2 days?  3? Where do we draw the line?

Asking because our CI is red at the moment due to this (large patch in
-next for 1 day before PR sent and now mainline is red).  I don't
think the specifics are important, since this will continue to happen
unless there's clearly stated cultural guidance from the top.  Any
chance we can get a quote we can link people to in the future?  Or is
this something for us to expect to keep happening each merge window?
Is there a way to detect or enforce that PRs don't contain literally
days old commits?

The merge window is always an interesting time for us; another issue
this cycle is fixes not getting sent along in the same PR (sometimes
the fix even gets picked up by a different tree; in that case the fix
and the problem then race to you in PRs; eventually things get fixed,
but until then the CI is red).

Another common pain point is even if we spot the issue ASAP and send a
fix, folks go on vacation, and patches don't get picked up with the
urgency we'd like (for obvious things like "the build is broken
because -Werror").

I'd be curious to know your thoughts on the above.  Have a good weekend.
-- 
Thanks,
~Nick Desaulniers
