Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7404A11
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 17:09:33 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id h21so8346267qta.3
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7vQ2L03NmZjTjKW7aYlNCJZqth3/yEDQLyW9BQRTAy8=;
        b=A+bgUQTLuISMRGKf3gH1kVvGmP3b/AaIOap7gHgA/PD0nbgpIKholTwlPXLri1af0K
         cnXmQYCXr6Teuy/PYE/inGfAxECxd/mCvZF/wqKa528cfQv970CHoLHSzLvnxIGoeg2I
         Wt438dq+Wr6ck6v+tRyZuqUTQ439HqIxvfrIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7vQ2L03NmZjTjKW7aYlNCJZqth3/yEDQLyW9BQRTAy8=;
        b=qj0H6LZHbDjpnVNn6T1dIPwHopZm/fJKaWcxlFJETvUvJSiBcPLTRKv5Q3wHhO7Enz
         zLIdXwpUMqu2+0KOygQPDfodNHsDin5+cdMDfxTyuN2cRiVQgLieiR+7jCnduavWUeed
         nSKsLf0OHJxhj+O60AFxFAHNwV59YDhxhyegYlo/vEXt1za2ylyXqlWBnfm/1WrfBBP+
         ync3RrLP7mMfuhiWdOPRcBL8ZLRP4IGVp6XwDFWb5zECeBzRbkErAiVkCi3wB915kb5J
         ufPdO8KkX21wfcV26BxK2SVknakxihh1xSEEWffYgFJcCxN9syPkyTPHcUXvKMkfwd6a
         impQ==
X-Gm-Message-State: ACrzQf3MkvxDLtwOS1CjJ3dJd3pAD0zP+RJsVTebfxB5nzTjkZLYrn0C
	gFd1n6v4AIBSQfuDob//nleaGeYYXNTs6Q==
X-Google-Smtp-Source: AMsMyM68V3ku/nHp4DcB7sB7crgRCxIHD7EmExCud/hpL9lXxYtjsG+C7aQNrTgiBPuljVY93OJxug==
X-Received: by 2002:a05:622a:1492:b0:35c:b7e6:12ef with SMTP id t18-20020a05622a149200b0035cb7e612efmr27973697qtx.94.1664384971390;
        Wed, 28 Sep 2022 10:09:31 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id ck11-20020a05622a230b00b0035cf31005e2sm3285630qtb.73.2022.09.28.10.09.31
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:09:31 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3539c6f39d7so19224647b3.12
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 10:09:31 -0700 (PDT)
X-Received: by 2002:a9d:2de3:0:b0:638:e210:c9da with SMTP id
 g90-20020a9d2de3000000b00638e210c9damr14921820otb.69.1664384960424; Wed, 28
 Sep 2022 10:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220928081300.101516-1-gwan-gyeong.mun@intel.com> <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
In-Reply-To: <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Sep 2022 10:09:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivJwvVbMUKma8600F6qaVLZHT=BY90SEnjiHWw2ZUVEg@mail.gmail.com>
Message-ID: <CAHk-=wivJwvVbMUKma8600F6qaVLZHT=BY90SEnjiHWw2ZUVEg@mail.gmail.com>
Subject: Re: [PATCH v13 5/9] drm/i915: Check for integer truncation on
 scatterlist creation
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mchehab@kernel.org, chris@chris-wilson.co.uk, 
	matthew.auld@intel.com, thomas.hellstrom@linux.intel.com, 
	jani.nikula@intel.com, nirmoy.das@intel.com, airlied@redhat.com, 
	daniel@ffwll.ch, andi.shyti@linux.intel.com, andrzej.hajda@intel.com, 
	keescook@chromium.org, mauro.chehab@linux.intel.com, linux@rasmusvillemoes.dk, 
	vitor@massaru.org, dlatypov@google.com, ndesaulniers@google.com, 
	trix@redhat.com, llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-sparse@vger.kernel.org, nathan@kernel.org, gustavoars@kernel.org, 
	luc.vanoostenryck@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 1:15 AM Gwan-gyeong Mun
<gwan-gyeong.mun@intel.com> wrote:
>
> +       if (check_assign(obj->base.size >> PAGE_SHIFT, &npages))
> +               return -E2BIG;

I have to say, I find that new "check_assign()" macro use to be disgusting.

It's one thing to check for overflows.

It's another thing entirely to just assign something to a local variable.

This disgusting "let's check and assign" needs to die. It makes the
code a completely unreadable mess. The "user" wersion is even worse.

If you worry about overflow, then use a mix of

 (a) use a sufficiently large type to begin with

 (b) check for value range separately

and in this particular case, I also suspect that the whole range check
should have been somewhere else entirely - at the original creation of
that "obj" structure, not at one random end-point where it is used.

In other words, THIS WHOLE PATCH is just end-points checking the size
requirements of that "base.size" thing much too late, when it should
have been checked originally for some "maximum acceptable base size"
instead.

And that "maximum acceptable base size" should *not* be about "this is
the size of the variables we use". It should be a sanity check of
"this value is sane and fits in sane use cases".

Because "let's plug security checks" is most definitely not about
picking random assignments and saying "let's check this one". It's
about trying to catch things earlier than that.

Kees, you need to reign in the craziness in overflow.h.

                 Linus
