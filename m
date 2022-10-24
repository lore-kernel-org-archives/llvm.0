Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71466441F
	for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 17:44:26 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id b29so5149851pfp.13
        for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dnac3jXX+DqSJpyd7IS9wnKftHu0DkEkt46zBI0n+Aw=;
        b=bJVaxrjh52Jj/A1DMgeGWw1oKPweEw9UOXvf8EFTwvA8D8ugu6rBHlnGtm1bIlw5PQ
         l5OqDfGhvvEFh9Re8EPN7e71ep9rcuQhp61yWM5VLIpY/WrRP4Ffc7AI3lz72h+brjlK
         sJ5WzwCMqPn9AgRwnQB7v+5zG8eJd8kzuwXkBqJ4WLUKYZ4bEot4vmqMLBysqNVxA8OG
         Xar7QdDpDvl5I9eci8QDGnt1xqpgDZXaZlZt/jFHkTJclTFbwpwSXDQQBlQWZcf1U3Cz
         o52ckA0VQDgR01zMqQo72Me9QmKCfQMHbrcLVRwo6iYzvA9EJ3a5OInY9nHPaP0zolVh
         JnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dnac3jXX+DqSJpyd7IS9wnKftHu0DkEkt46zBI0n+Aw=;
        b=44uN/mUZeQ64W8vZ466mlHplDQnBi0/+7xiD1HNgQRifj/AmAeQswL2NHwe5E8xaqu
         IhqW29ePabKXRRs55xO4uHewnXza9OUe8T9sYEBz0B+KaRoc+Yp+50LXRrk1SJ+FI2EB
         7WIA+K+rioS4kx8kIgXrirKJUVKr1k5TDZLwRh7iRus2hhoh5FR881KVy9V/ozDNjCcm
         4xg7EMhGTf7y0gN5aWZckLmrQSxR4HL0VLv2iqj0bWJPNvykQcnHgC3fhHC6ECv505bP
         y1GU9ifVjKG3rmoyisZiOFRWzwkKMI0Sr3c/2U4cVn+WpEZ2LwOJ2IfpjZT/TQLlCgNQ
         2Gfg==
X-Gm-Message-State: ACrzQf2imFMpYaOBG/ZdtMmQpsE7+YTKaZB+o6iE5I8X+/YuUxTYDSkY
	huNZIoXOR5+8cYWnrNb7aQGEyMxdOoYu2P9w5qlfyw==
X-Google-Smtp-Source: AMsMyM5OmVKaEIX2SFRXTaxdaKI2h3ZroD0njIyHv9e6KBWKaKXFjsqz3VOQNkRnNC6MsqlhX0Ip2prNgANFiIHRh3I=
X-Received: by 2002:a63:689:0:b0:46e:be81:566c with SMTP id
 131-20020a630689000000b0046ebe81566cmr15181143pgg.403.1666633465524; Mon, 24
 Oct 2022 10:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221020175655.1660864-1-ndesaulniers@google.com>
 <Y1GV9sHyODVmBbFW@dev-arch.thelio-3990X> <CA+icZUW2tFR=xjJEXJDNARW1yd_vjOOA1etF6aMN3Cx5ReFgmg@mail.gmail.com>
In-Reply-To: <CA+icZUW2tFR=xjJEXJDNARW1yd_vjOOA1etF6aMN3Cx5ReFgmg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Oct 2022 10:44:13 -0700
Message-ID: <CAKwvOdn_mP8kVn5Bhe7bbC8R+VZxr8h02yWwKhvaTHW40ZJ_Uw@mail.gmail.com>
Subject: Re: [PATCH] Makefile.debug: support for -gz=zstd
To: sedat.dilek@gmail.com, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Fangrui Song <maskray@google.com>, 
	Sedat Dilek <sedat.dilek@dhl.com>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Terrell <terrelln@fb.com>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Isabella Basso <isabbasso@riseup.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 23, 2022 at 8:46 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Oct 20, 2022 at 8:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, Oct 20, 2022 at 10:56:49AM -0700, Nick Desaulniers wrote:
> > > +config DEBUG_INFO_UNCOMPRESSED
> > > +     bool "Don't compress debug information"
> > > +     help
> > > +       Don't compress debug info sections.
> > > +
> > >  config DEBUG_INFO_COMPRESSED
>
> Also, I prefer...
>
> DEBUG_INFO_COMPRESSED_NONE
> DEBUG_INFO_COMPRESSED_ZLIB
> DEBUG_INFO_COMPRESSED_ZSTD
>
> Following...
>
> $ ld.lld-16 -v
> Debian LLD 16.0.0 (compatible with GNU linkers)
>
> $ ld.lld-16 --help | grep compress-debug-sections
>  --compress-debug-sections=[none,zlib,zstd]

It's a good suggestion, though I deliberately did not modify the
identifier used for the existing DEBUG_INFO_COMPRESSED.  No defconfigs
set DEBUG_INFO_COMPRESSED explicitly, but I think one issue with
changing the identifier of existing kconfigs is that upon upgrading to
newer kernel sources, if you run `make oldmodconfig` if you previously
had DEBUG_INFO_COMPRESSED=y, kconfig doesn't know that that option has
been renamed to DEBUG_INFO_COMPRESSED_ZLIB so it would be silently
disabled, and image sizes would increase due to uncompressed debug
info. That seems developer hostile.

Masahiro, what are your thoughts on how to proceed? Should I change
the pre-existing Kconfig identifier, or "let sleeping dogs lie?"
-- 
Thanks,
~Nick Desaulniers
