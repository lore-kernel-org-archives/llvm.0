Received: from out.smtpout.orange.fr (out-69.smtpout.orange.fr [193.252.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9FB21481B
	for <llvm@lists.linux.dev>; Thu,  9 Jan 2025 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409183; cv=none; b=kHk7lQ/I7Ma7xPY8LB+Y/m8/9QQ+pQ7eYyGqHNzE7sGECFUVt3hdaDFiCn41sEyxug4qCvBecUsT8ufqlBrkc2+FmNne/iC1+AJOlOLPZ+txufMz7+Lx73IC0s1qT4cvqp3Qaynm8CkfsCPBIDswnQhS5lbJkBSsjatNMBLVXJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409183; c=relaxed/simple;
	bh=O5ZNgmW3t3fAPZh1YBRP6KjXZhiqggJR9M35+R5lk6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOwZ2JGTJHx8VI94h0RJRdMnwD+nN8RLg3rXMRtmMsrBtTJ+wtcB9VI1yjUHGPyGjeTpGFUAtzsNRLxhHtzLy0VP2cLK5fRxDdwOmyDkmHBhrJogi4nL/VszE9H2UZu1cxUg0lOA0bYTTj0L1byn4W1KZ7x1cNdOrj37asHLNe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=T/9m6N8+; arc=none smtp.client-ip=193.252.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="T/9m6N8+"
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by smtp.orange.fr with ESMTPSA
	id VnLVtwEl3rXfGVnLYt149Y; Thu, 09 Jan 2025 08:52:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736409172;
	bh=UL4vb0fbvLbR1U8J+05ODzNTSN8C6D9E9x0FSE1uPd8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=T/9m6N8+6X154iRiAt/znJxdyVSZvUrQczfyTi5ExkXRPShTO8qt3WlaYaHWLX9HL
	 5QjmPwnd6C9xQQIFRCuqZDXmB9bJIU5Jagk0a7MhVUd4Lq4wChkmKOhI3xXR7P65NP
	 62i6aqP2vE4h/mg5bRtmjSRCe09hCpSVJRpZXkDCBfcX3RdQdnE70/rA6icfG74CY6
	 BrMaPf3j/WoNT+HGntGMf4ntown5FRQMMmwMWYQ9M5Ts2wtkVBjziwPPmu7x5RUFBm
	 Gv5iI1Nu9zWop0b3N/xAEykdNPW08HJCDUNJKRLVIz/rd1gwEZzmNeIIgoNj1QYjDL
	 l2rG3UiYi0uBw==
X-ME-Helo: mail-ed1-f51.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 09 Jan 2025 08:52:52 +0100
X-ME-IP: 209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so863556a12.1
        for <llvm@lists.linux.dev>; Wed, 08 Jan 2025 23:52:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVigzz0WrlePfYgspSOwH+THT6vLHYAmJ3Z3X/AVAxypUsxrN2IKEEqJ3LMsi1dScftxBeB@lists.linux.dev
X-Gm-Message-State: AOJu0YxHm5FJsRHbxWuYMLU9zaou+Gneg7PGe96eGvVSYPxqLRGqpSM/
	PJam7mLQoqo0NsOLMeZN2ryknK/X1LE0E//Acz0m4PfrZE/bvvJC4pT6j0AF9q5VYog+urVklOs
	KKdgSH2dogXXqRsEt/5FO14v9QQI=
X-Google-Smtp-Source: AGHT+IGrVE57aM35lRnQR/iOi4swLH7E8gsU9cV2VQps8o7HOzflIs1aP9S81XCABdsqlNBrPs3PTe6w4eYJHxXeNXE=
X-Received: by 2002:a17:906:fd87:b0:aab:cce0:f8b4 with SMTP id
 a640c23a62f3a-ab2abc9ed6cmr488956266b.52.1736409169155; Wed, 08 Jan 2025
 23:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250108-strlen_use_builtin_constant_p-v1-1-611b52e80a9f@wanadoo.fr>
 <202501081331.E4B6DF747@keescook>
In-Reply-To: <202501081331.E4B6DF747@keescook>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Thu, 9 Jan 2025 16:52:40 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJS5FwuBUdvVdXoZj6wZOJz8Nao4FzSzCK1VtbNF41sMw@mail.gmail.com>
X-Gm-Features: AbW1kvYoZb-oBlASEyfzMJmtYkCQlSTuCO-o2yO14tE6fQRp0GGVay-N1kPrfGk
Message-ID: <CAMZ6RqJS5FwuBUdvVdXoZj6wZOJz8Nao4FzSzCK1VtbNF41sMw@mail.gmail.com>
Subject: Re: [PATCH] fortify: turn strlen() into an inline function using __builtin_constant_p()
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	David Laight <david.laight@aculab.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu. 9 Jan 2025 at 06:46, Kees Cook <kees@kernel.org> wrote:
> On Wed, Jan 08, 2025 at 11:27:51PM +0900, Vincent Mailhol wrote:
> > The strlen(p) function-like macro uses:
> >
> >   __is_constexpr(__builtin_strlen(p))
> >
> > in which GCC would only yield true if the argument p is a string
> > literal. Otherwise, GCC would return false even if p is a const
> > string.
> >
> > In contrary, by using:
> >
> >   __builtin_constant_p(__builtin_strlen(p))
> >
> > then GCC can also recognizes when p is a compile time constant string.
> >
> > The above is illustrated in [1].
> >
> > N.B.: clang is not impacted by any of this and gives the same results
> > with either __is_constexpr() and __builting_constant_p().
> >
> > Use __builtin_constant_p() instead of __is_constexpr() so that GCC can
> > do the folding on constant strings. This done, strlen() does not
> > require any more to be a function-like macro, so turn it into a static
> > inline function. In the process, __fortify_strlen() had to be moved
> > above strlen() so that it became visible to strlen().
>
> This is what __compiletime_strlen() ended up doing, so this seems
> reasonable to me.
>
> > On a side note, strlen() did a double expansion of its argument p.
>
> It did? Ah, was it due to __is_constexpr() wrapping? The other
> expressions should have been side-effect free:
>
>        __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)), \
>                __builtin_strlen(p), __fortify_strlen(p))

This does not have a side-effect. The issue is not the side effect but
the double expansion itself (actually here it is a triple expansion)
because it may grow exponentially. Linus explained this in greater
details here:

  https://lore.kernel.org/all/CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com/

Note that I do not believe this to be a big deal here. Unless the
strlen() macro gets called in others macro which themselves do double
parameter expansion, the issue should not surface. And honestly, I do
not see this happening with strings. That's why I put this as a side
note, it's more of a "follow a best practice" than solving an actual
problem.

On double thought, the risk does not seem real here. I will simply
drop this paragraph about double expansion in v2.

> I don't think you build-tested this with Clang, though?

I just did and...

  ./include/linux/fortify-string.h:272:17: error: redeclaration of
'strlen' must not have the 'overloadable' attribute
    272 | __kernel_size_t strlen(const char *p)
        |                 ^
  ./include/linux/string.h:200:24: note: previous unmarked overload of
function is here
    200 | extern __kernel_size_t strlen(const char *);
        |                        ^
  1 error generated.

OK, guilty here! Changing the function prototype to:

  __FORTIFY_INLINE __diagnose_as(__builtin_strlen, 1)
  __kernel_size_t strlen(const char * const POS p)

resolves the issue. I was wondering what this POS was for, guess I
have my answer.

>   CC      scripts/mod/devicetable-offsets.s
> In file included from ../scripts/mod/devicetable-offsets.c:3:
> In file included from ../include/linux/mod_devicetable.h:14:
> In file included from ../include/linux/uuid.h:11:
> In file included from ../include/linux/string.h:389:
> ../include/linux/fortify-string.h:272:17: error: redeclaration of 'strlen' must not have the 'overloadable' attribute
>   272 | __kernel_size_t strlen(const char *p)
>       |                 ^
> ../include/linux/string.h:200:24: note: previous unmarked overload of function is here
>   200 | extern __kernel_size_t strlen(const char *);
>       |                        ^
>
> The externs will need to be reworked if it's no longer depending on asm
> renaming.
>
> > Turning it into an inline function also resolved this side issue.
> >
> > [1] https://godbolt.org/z/rqr3YvoP4
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> > This patch is the successor of patch [1] which was part of a longer
> > series [2]. Meanwhile, I decided to split it, so I am sending this again,
> > but as a stand-alone patch.
> >
> > Changelog since [1]: use __builtin_constant_p() instead and turn
> > strlen() into an inline function
> >
> > [1] https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-6-4e4cbaecc216@wanadoo.fr/
> > [2] https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr/
> > ---
> >  include/linux/fortify-string.h | 34 +++++++++++++++++++---------------
> >  1 file changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> > index e4ce1cae03bf770047ce8a7c032b183683388cd5..bd22dd66e5f5b66ad839df42247e6436e0afd053 100644
> > --- a/include/linux/fortify-string.h
> > +++ b/include/linux/fortify-string.h
> > @@ -4,7 +4,6 @@
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/bug.h>
> > -#include <linux/const.h>
> >  #include <linux/limits.h>
> >
> >  #define __FORTIFY_INLINE extern __always_inline __gnu_inline __overloadable
> > @@ -241,6 +240,21 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char * const POS p, __kernel_size
> >   * possible for strlen() to be used on compile-time strings for use in
> >   * static initializers (i.e. as a constant expression).
>
> ^^ This comment, however, is I think what sinks this patch. Please see
> commit 67ebc3ab4462 ("fortify: Make sure strlen() may still be used as a
> constant expression") which required that strlen() not be an inline. I'm
> pretty sure the build will start failing again (though perhaps only on
> older GCC versions).

Strange. I tested it with GCC 5.1 on godbolt and it worked fine. After
more investigation, I only got complains from GCC up to 4.9.4:

  https://godbolt.org/z/rW8r74vE3

I also just did a successful defconfig build using GCC 5.4 (sorry, I
do not have an environment with GCC 5.1).

So, it looks like an issue of the past to me. But in 67ebc3ab4462, the
minimum compiler version was already 5.1:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/min-tool-version.sh?id=67ebc3ab4462#n20

In the end, I am not sure what was the issue you encountered at that time.

Well, I am not able to reproduce, but if you tell me this is an issue,
then I can just keep the s/__is_constexpr/__builtin_constant_p/g
change in v2 and drop the inline function part (thus keeping the
triple expansion).

Let me know if you still think that having it as a function is a no
go. In the end, the main purpose here is to get rid of the
__is_constexpr. Turning the macro into a function still looks slightly
better to me, but at the end I do not really mind.


Yours sincerely,
Vincent Mailhol
