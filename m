Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908328E3
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 20:52:51 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 130so17787576ybz.9
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 13:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eSmjHP3psGeOMr+WEOk0DOTV5ssd7/gZzN1bjJygBoE=;
        b=W/rcNroN25iYeVvA4FNx54QrYtbADyI5O2H8VEtzNGnvZ9oKm6c48boSOL9AicPayo
         UGAvE69d7IxuzXAA2/xE8dR3nkb39jB1608tET99ZpLMvjZgf9vM1Bu1MrVUGg7jcURa
         kN26DNyIQ5oqvDFkQFEH0V5+sVSSHBYL5cONOS4K9Gc82pdferYtOdBvjOEpty8BSuuc
         gXAtJVbIQ5Zv3wmVklfysoubfyGQBMg16hquIOyw3iqFF8FRjYIyot3QKHBqPLadevHq
         aiTWvTa6/qh35l94HjQnQtgPtOoKlWP3Lspzkh5wG7pxujSow7KZknk2ye4MKUmhu1r/
         tGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eSmjHP3psGeOMr+WEOk0DOTV5ssd7/gZzN1bjJygBoE=;
        b=Yx0bb7pg04irH35JcLNIRzV2XDDwpAX/FwxsjNfldb7eW6Wu8tVPxYBN3vnvp+i4PI
         TLAUHx8Bq0ZEWRo3YVBj8XfTYuRsrvt9UrIGGYMFlzqoi2K4DtuusrSE5KfgVxXoeOGD
         sSVyLvmKmD6+a6L0pasamggIC5Xb47eixcqtveRrvYX0COhWjQ7Or2aUDcqihL2n9Ut/
         X0MRhmfu8a9sP0u4+g7194Gw7L6aAtMxCvrpecyd2RyaoQgoP+iTIRKBgJ/3mE3HRMfT
         sRgbXnFiDze9i1lzzz0v5Si2KCWPA6YSqjIdgFUBu/IfnZhubbX+LLhk8GVgOcRpIXov
         VG8w==
X-Gm-Message-State: ACgBeo2I+/bLeRK+v5HfBZOzlAE9RrCry+aYNvovaJpFTDHOKnhYg2vU
	+yvhVlJpyM8BVid9dn9r/rUu4TFxEs+E9oz8bmv3rA==
X-Google-Smtp-Source: AA6agR5SyII+g6dM3/0IIZUA8tRak0g0gdQnoJxzvJTclg/zaQA2sNycYdnFGvhHcXHM1N7GKELHo2uAWHtVy0ENKKY=
X-Received: by 2002:a25:1e86:0:b0:68d:549a:e4c2 with SMTP id
 e128-20020a251e86000000b0068d549ae4c2mr4320074ybe.93.1662583970644; Wed, 07
 Sep 2022 13:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907173903.2268161-1-elver@google.com> <Yxjf2GtNbr8Ra5VL@boqun-archlinux>
In-Reply-To: <Yxjf2GtNbr8Ra5VL@boqun-archlinux>
From: Marco Elver <elver@google.com>
Date: Wed, 7 Sep 2022 22:52:13 +0200
Message-ID: <CANpmjNMNpFUN3mvpAfdgf2NRcrOjMKdnF09UcbPSvAi8+==Byw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kcsan: Instrument memcpy/memset/memmove with newer Clang
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Sept 2022 at 20:17, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> On Wed, Sep 07, 2022 at 07:39:02PM +0200, Marco Elver wrote:
> > With Clang version 16+, -fsanitize=thread will turn
> > memcpy/memset/memmove calls in instrumented functions into
> > __tsan_memcpy/__tsan_memset/__tsan_memmove calls respectively.
> >
> > Add these functions to the core KCSAN runtime, so that we (a) catch data
> > races with mem* functions, and (b) won't run into linker errors with
> > such newer compilers.
> >
> > Cc: stable@vger.kernel.org # v5.10+
>
> For (b) I think this is Ok, but for (a), what the atomic guarantee of
> our mem* functions? Per-byte atomic or something more complicated (for
> example, providing best effort atomic if a memory location in the range
> is naturally-aligned to a machine word)?

There should be no atomicity guarantee of mem*() functions, anything
else would never be safe, given compilers love to optimize all of them
(replacing the calls with inline versions etc.).

> If it's a per-byte atomicity, then maybe another KCSAN_ACCESS_* flags is
> needed, otherwise memset(0x8, 0, 0x2) is considered as atomic if
> ASSUME_PLAIN_WRITES_ATOMIC=y. Unless I'm missing something.
>
> Anyway, this may be worth another patch and some discussion/doc, because
> it just improve the accuracy of the tool. In other words, this patch and
> the "stable" tag look good to me.

Right, this will treat write accesses done by mem*() functions with a
size less than or equal to word size as atomic if that option is on.
However, I feel the more interesting cases will be
memcpy/memset/memmove with much larger sizes. That being said, note
that even though we pretend smaller than word size writes might be
atomic, for no data race to be detected, both accesses need to be
atomic.

If that behaviour should be changed for mem*() functions in the
default non-strict config is, like you say, something to ponder. In
general, I find the ASSUME_PLAIN_WRITES_ATOMIC=y a pretty bad default,
and I'd rather just change that default. But unfortunately, I think
the kernel isn't ready for that, given opinions on this still diverge.

Thanks,
-- Marco
