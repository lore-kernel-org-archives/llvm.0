Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FF25CA6
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 17:44:09 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id c9so22703035ybf.5
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=N+KH0bFLs52wGl8kzsXXlEDsvOIn0U7dgBgJ6SkG/So=;
        b=Aoe02Mj5izznE3nsHvWbwiuwxP/svNeaiait61fx8gNuWRmRXcKHoL9Adoed44LPmC
         7Px5DVwpwvu1FVTGhpVAqCOmCYjY1c8lttl3+JoBw+FZ6QdfI6mW+Se/C1MVbE9CpovM
         47KweB6a35vnC0ihHF8MH1nX54sLf60teydGpUbqN4V7BLUGwLbH337GsAlCli2d/aOr
         MC8ot8rXUcYNE2ITrwDvFbIYuF2TbPX3UHm2sCeBlMDIcjKyfX6KZRLuUMlNnSlBS1Ux
         r44QOCqjaf4F0OfTvVPpLYj2MtcgajUO4BCVTcdZZNfbca+PHVS/oJTaCcJxqPLUCSNb
         r9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=N+KH0bFLs52wGl8kzsXXlEDsvOIn0U7dgBgJ6SkG/So=;
        b=QuEmqmf/0ykcUMuidHgDR56YGVuMOgsbOl04/nQfqBQ2cGmUEiuG7W/lRI57UC4LIW
         qabmWa5nlg+iliPuLUcF5JylvHWvMVIw4wzffOCyoN8hF1ya9fvwdG3ztQ+PQ+toNCEq
         oFO8tZYd89vj/WyPRYCeW0V0Ffw4yMsDT/L7pU6RtfQS8qzCFTsRJju2e/aJ5Ry0ZR2X
         JXosdGuv+9J8jzOyezAH9C0SWF/CX+IefJJjGwNi00t5RaSL7wQ/kbBdC39stOgLUPws
         ELXOg5BDVJrNWvUdJ+kryvpQ/a49oxKbKP6MN+MtuXM2vI8Kho5lm6UCoTujmy7fIiMa
         O8eQ==
X-Gm-Message-State: ACgBeo3m/+1/YSR1MXa5PQ3cHIAe+7k4qWbBg4XpVoqoIdiFyfV9Ex2h
	vfcF3IRrB0w2aSlPugBgNHLfjcomsws76UL2QW3LRQ==
X-Google-Smtp-Source: AA6agR5JdE5bkesNzzxbwqA+UWtd9va9jrqL6BDhUAQIpLp41G5EDtiAnmNRcVYiAJuIVb7BChOlukChQiI+Dr/naCo=
X-Received: by 2002:a25:602:0:b0:6ac:9a9b:f587 with SMTP id
 2-20020a250602000000b006ac9a9bf587mr3750619ybg.125.1662572648292; Wed, 07 Sep
 2022 10:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907173903.2268161-1-elver@google.com> <20220907173903.2268161-2-elver@google.com>
 <YxjXwBXpejAP6zoy@boqun-archlinux>
In-Reply-To: <YxjXwBXpejAP6zoy@boqun-archlinux>
From: Marco Elver <elver@google.com>
Date: Wed, 7 Sep 2022 19:43:32 +0200
Message-ID: <CANpmjNN2cch+HDVUYLD27sF9E39RaFrCf++KN=ZZ7j0DH8VaDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] objtool, kcsan: Add volatile read/write
 instrumentation to whitelist
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Sept 2022 at 19:42, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> On Wed, Sep 07, 2022 at 07:39:03PM +0200, Marco Elver wrote:
> > Adds KCSAN's volatile barrier instrumentation to objtool's uaccess
>
> Confused. Are things like "__tsan_volatile_read4" considered as
> "barrier" for KCSAN?

No, it's what's emitted for READ_ONCE() and WRITE_ONCE().

Thanks,
-- Marco
