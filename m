Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA707F
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 00:24:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id z19so19481088lfq.13
        for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 16:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YAbGJf0nD3tv0C4+x4biz03025yR9r7nSe3Iqf91zgg=;
        b=NUDW/UNCFyXf4XFnOfAXDiJ0WTqWv4778H9sujmy90gvJyk4NNwFzad/b67l7mehR+
         6BuoqihBq3RXmDpM4Sp/LBqGcD4gkrR6prZrvrf9VmV5p7ohYI2j/MDJWp6EPCQ+c89x
         CNehIc2Ho+rJSWTrVBt/yochOwkDc0hx5h+y6sxDgBcmx7QmZQR9cb17i4UBS5I3RJ4B
         Bm7WClqNtkl7j/G9eBmPYf/16RmV6K2USKPMFolT64n6hXZQjzoVvUfsYH/vlecGBVlU
         St6bvBB2O6O6Ektmzn8dY+PySeYrt5HDRIDZ9UeSEZbsVmc9i4Zo5X9PCelMI477MLvJ
         1YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YAbGJf0nD3tv0C4+x4biz03025yR9r7nSe3Iqf91zgg=;
        b=VSC2ZTnfK++ayj8IPIOUIC3mkzhm6grvWzLnrB4GxmuQT6XEUVLL/BXpw4jf8wZYnm
         LA37lGWT2PY/QCmW1ATx1Ga7BrNVRm5b6x6zirXw9KsR8pQ8VSRo+QSLrCKvpnnKL9cU
         5d3iwxW1bwsuzgIDdkyJk3y95lkkOfssZ5BeoHwDnir/AIV6l5KF1qE2tXD7HAXMkNF9
         R+H7Tu901T/k5wrrugf2mls5zcO7fPyclv4un07kJGc81HpB0XMtAIp6/wWwfkBR4Mh/
         fIQiZEjLq9ru+j8Yh0SP7rUb8TUfEkgoZy/WhItMvl1FI1bFUag97t1m+EG/OBPs3nis
         J4pw==
X-Gm-Message-State: AOAM5311UQGaezlm9zPixqJpYtBR2WBfa6oXoHgI9oyijakzTZrevCuM
	gpReUPL+vJtW4jj8QbDh+atwEJVHCXzdsmrHGwLDpRsljF/XJw==
X-Google-Smtp-Source: ABdhPJyVpMwka2BHTC6WOnJhHIhvUXIvzP3KrapzLDJ1aMR0QDplBlPBmpOjgK9mmQSY4XO3synZ60gF04cEls1BPYA=
X-Received: by 2002:ac2:5627:: with SMTP id b7mr2881588lff.489.1644625456780;
 Fri, 11 Feb 2022 16:24:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220204005742.1222997-1-morbo@google.com> <20220210223134.233757-1-morbo@google.com>
 <cb2ff5da9b704a9792549a9433dc0ac8@AcuMS.aculab.com> <CAGG=3QXvSt=d94iqSV-Y9JVNc+pt-WOZGpSeW--fp=w2ttMvUA@mail.gmail.com>
In-Reply-To: <CAGG=3QXvSt=d94iqSV-Y9JVNc+pt-WOZGpSeW--fp=w2ttMvUA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 11 Feb 2022 16:24:05 -0800
Message-ID: <CAKwvOdmqQ4M1pcz1BW+MTtRdwP3itOLcV83X+1nJQkf9BNJ7Fw@mail.gmail.com>
Subject: Re: [PATCH v4] x86: use builtins to read eflags
To: Bill Wendling <morbo@google.com>
Cc: David Laight <David.Laight@aculab.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 11:25 AM Bill Wendling <morbo@google.com> wrote:
>
> On Fri, Feb 11, 2022 at 8:40 AM David Laight <David.Laight@aculab.com> wrote:
> > From: Bill Wendling
> > > Sent: 10 February 2022 22:32
> > >
> > > v4: - Clang now no longer generates stack frames when using these builtins.
> > >     - Corrected misspellings.
> >
> > While clang 'head' has been fixed, it seems a bit premature to say
> > it is 'fixed' enough for all clang builds to use the builtin.
> >
> True, but it's been cherry-picked into the clang 14.0.0 branch, which
> is scheduled for release in March.

While I've requested a cherry pick, the auto PR has not yet been
merged into the release/14.x branch.
https://github.com/llvm/llvm-project/issues/46875#issuecomment-1035262333
https://github.com/llvmbot/llvm-project/pull/42

I share David's concern.  We currently support clang-11+, see
Documentation/process/changes.rst

Users external to Google do not necessarily live at ToT LLVM; we MUST
support them.  There are also multiple unwinders for x86 selectable at
kconfig time; this patch has implications for those different choices.

I would like to discuss this further off list with you Bill before you
resend this patch again.  Please do not resend this patch again until
we've had the chance to speak more about it.  I'm generally in favor
of the intent of this patch, but let's make sure this patch is the
best it can be for everyone, regardless of their compiler, compiler
version, or unwinder.
-- 
Thanks,
~Nick Desaulniers
