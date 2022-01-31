Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966E72C82
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 21:09:42 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id e16so13405229pgn.4
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 13:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QkhfbO5ZuAnM+4vhyHXHVmq11kG0AqyRd/tsjcMAl14=;
        b=F/nlSE/yNJSASXLMWSaLGYR1yLL+hmZl/FP19SuvRwCudcOLOFjyjyVSys+cJHT9bd
         DiZvJM5FOigFZ+06vJkHc2u3C3fnV1/DSbQTDMK18auGH7E+/aYpx456r1n6VPV2cenW
         5C7lLsPmpGYiN/CdnhIbAxw1RAA+Yh655yk9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QkhfbO5ZuAnM+4vhyHXHVmq11kG0AqyRd/tsjcMAl14=;
        b=O8pi1nkHRSawRUgiN1UzRLCY//3StjIUH8hdIGyTVMbpFeh/lVaps6g7C4XFcwsesX
         KjCEv7aFsIJtDZJAR5KwZIyejL7kSZumfh/HIFnTk2g5eF70ugL/qsNbG9549M6JxhTj
         9rwm4h+cSsbOWVcKGrSF2TFJwaMO5IYHy9qUJ+b1nDai6vAuZoS62gxHfFfqoLhCv5Oy
         ess3+WJJ9oqTtvft70V+UeDg9KMhtJ32N/ftPi/3XMxUIU0wvDZrqzL89p+YTc7N0RX1
         3gXYaHuIRjqJbeQktB4ojn7oTnvXozSfsYymM249wmSc0odyqFv75xISwSrx+esYNlFT
         2AlA==
X-Gm-Message-State: AOAM532HkSFthwNEeRFv84sb7l5d2rUJrqeGhWX+1nQLLTKLaprvisw0
	DjTM67241DDukU35UT4pLBF8SQ==
X-Google-Smtp-Source: ABdhPJwLHNNlfqh8k0yscOHN38ElXx7ca741f/SViX5QRk7Zaq7yJAYAxfp6QboGV6M3GgXg8Lw/Tg==
X-Received: by 2002:a62:1dcc:: with SMTP id d195mr22080045pfd.4.1643663382057;
        Mon, 31 Jan 2022 13:09:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id bj7sm228915pjb.9.2022.01.31.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:09:41 -0800 (PST)
Date: Mon, 31 Jan 2022 13:09:41 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fortify: Update compile-time tests for Clang 14
Message-ID: <202201311306.0FC6E303@keescook>
References: <20220130181616.420092-1-keescook@chromium.org>
 <CAKwvOdmETY-j9B9vms4d31kAc0xb1yE902KijiH2baY5-M=fLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmETY-j9B9vms4d31kAc0xb1yE902KijiH2baY5-M=fLQ@mail.gmail.com>

On Mon, Jan 31, 2022 at 11:09:27AM -0800, Nick Desaulniers wrote:
> On Sun, Jan 30, 2022 at 10:16 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Clang 14 introduces support for compiletime_assert(). Update the
> > compile-time warning regex to catch Clang's variant of the warning text
> > in preparation for Clang supporting CONFIG_FORTIFY_SOURCE.
> 
> https://twitter.com/ifosteve/status/1190348262500421634?lang=en
> error messages can change over time. More thoughts below.

Sure, but I don't want the compile-time checks to silently regress,
which requires looking specifically for the error.

> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: linux-hardening@vger.kernel.org
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > I'm splitting this patch out of the main Clang FORTIFY enabling patch.
> > ---
> >  scripts/test_fortify.sh | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/test_fortify.sh b/scripts/test_fortify.sh
> > index a4da365508f0..c2688ab8281d 100644
> > --- a/scripts/test_fortify.sh
> > +++ b/scripts/test_fortify.sh
> > @@ -46,8 +46,12 @@ if "$@" -Werror -c "$IN" -o "$OUT".o 2> "$TMP" ; then
> >                 status="warning: unsafe ${FUNC}() usage lacked '$WANT' symbol in $IN"
> >         fi
> >  else
> > -       # If the build failed, check for the warning in the stderr (gcc).
> > -       if ! grep -q -m1 "error: call to .\b${WANT}\b." "$TMP" ; then
> > +       # If the build failed, check for the warning in the stderr.
> > +       # GCC:
> > +       # ./include/linux/fortify-string.h:316:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> > +       # Clang 14:
> > +       # ./include/linux/fortify-string.h:316:4: error: call to __write_overflow_field declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
> > +       if ! grep -Eq -m1 "error: call to .?\b${WANT}\b.?" "$TMP" ; then
> 
> Doesn't this depend on -Werror being set? I guess it did so before
> hand, too, but couldn't I unset CONFIG_WERROR then this check would
> still fail (since instead of `error:` we'd have `warning:`)? If we
> used __attribute__((error(""))) then this would always be an error.
> Right now, it is only because -Werror is set promoting the warning
> diagnostic to an error.

Right, see earlier up in the script. "-Werror" is explicitly set:

line 40: if "$@" -Werror -c "$IN" -o "$OUT".o 2> "$TMP" ; then

-- 
Kees Cook
