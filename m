Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AAD4C6D
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 23:18:45 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id e4so11867152ljl.1
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 16:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=af6354Q+PYtjAeTE1fHxbOWk4spb0xe2rddSt4jQNw0=;
        b=qsw/gp8RDQr7TxcFAw67QADvplw4M8CuLpbXwYePEvTc9gyloRoNkLA0/65LPS2PHG
         lwvUx0Vk5tnQau+/eN+yj4vNNvEwrbFYrLKwsm69bjXQ0R4nOllOmIVjbhrvEDyLI/wP
         oUAGxwYePVYRcuzvMPpwS/H20SN6RBqtDq3M/sIFmsPVSQfFBqjqsQ4YrUJFt60H+vrG
         /vbIkayBKj2NafmzkfPK5WFIV3Pwo6mzHcJ+8+5Fy+N2x3QXFf68sSVrj/uvcZRdIojW
         qhr4netPBQEp3dEnvthXme6ipHwfVm1f0OwUWXWzeGYvw+rVPOiGjeTn1JUKCz0o06hy
         xlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=af6354Q+PYtjAeTE1fHxbOWk4spb0xe2rddSt4jQNw0=;
        b=hPXYKbsNu2hJL1U19FzHTqv2gTwi7lB8xHyJKJKw7K1VibUs2hJhWjOXWFYc2pwB5I
         5hyc6sKQTukjGsjMqxki8Waf4YIgZkRALuhK8CWLlm7L6evQsFvTNMVvu4A2luA3Or1+
         ZGn7Hn/2sleiDabO7CKhEvZORt9PIQLWdbhKjGW6K7O8isTjhqhTusOqFL/Z8E5KG0Hs
         yDuMT3S8dN0VqCWS/SudObE4n7i1Y1eGjYd10vRL+TmwdSMZrlPd9xT5z1lyWeQle1+b
         rG+H1hViW6USq72v+IulkdKMON3zH3ceQ7VZA3GK61m4qNcdhX75joahiYUsBHHsIc8H
         tFXw==
X-Gm-Message-State: AOAM533/+UfZPVLKb/vC4kZ9ZBS2aASyqpDd6//EmKayGQRc4DBW1LDc
	0unQjX34FMzmOfL27GGzrsBEyt2CQTY0K3YekPj5
X-Google-Smtp-Source: ABdhPJzslpbBTkBZ3coZd7t5JavMPBitkHrctHqYQ1MeTY4oO+M4rEae62HvWxHeD6/VvLbJ6ql3Pgg1eI26i3ys1SY=
X-Received: by 2002:a2e:bc0e:0:b0:255:9fa0:ed4 with SMTP id
 b14-20020a2ebc0e000000b002559fa00ed4mr10953078ljf.390.1654816723853; Thu, 09
 Jun 2022 16:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com> <20220609221702.347522-2-morbo@google.com>
 <3a773edf-f850-e83d-828d-19f91a373384@infradead.org>
In-Reply-To: <3a773edf-f850-e83d-828d-19f91a373384@infradead.org>
From: Bill Wendling <morbo@google.com>
Date: Thu, 9 Jun 2022 16:18:31 -0700
Message-ID: <CAGG=3QVkvvc+25zvrfigo5Ohx85+1FCka_VMC4pm0dWUFMOqkA@mail.gmail.com>
Subject: Re: [PATCH 01/12] x86/mce: use correct format characters
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Bill Wendling <isanbard@gmail.com>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Phillip Potter <phil@philpotter.co.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jan Kara <jack@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Daniel Kiper <daniel.kiper@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, 
	linux-edac@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-mm@kvack.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	Networking <netdev@vger.kernel.org>, alsa-devel@alsa-project.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 9, 2022 at 4:15 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 6/9/22 15:16, Bill Wendling wrote:
> > From: Bill Wendling <isanbard@gmail.com>
> >
> > When compiling with -Wformat, clang emits the following warnings:
> >
> > arch/x86/kernel/cpu/mce/core.c:295:9: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
> >                 panic(msg);
> >                       ^~~
> >
> > Use a string literal for the format string.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Signed-off-by: Bill Wendling <isanbard@gmail.com>
> > ---
> >  arch/x86/kernel/cpu/mce/core.c | 2 +-
> >  scripts/Makefile.extrawarn     | 4 ++--
>
> Where is the scripts/ change?
>
I'm sorry about this. The change in that file was a mistake that I
reverted, but I forgot to change this part.

-bw

> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> > index 2c8ec5c71712..3d411b7c85ad 100644
> > --- a/arch/x86/kernel/cpu/mce/core.c
> > +++ b/arch/x86/kernel/cpu/mce/core.c
> > @@ -292,7 +292,7 @@ static noinstr void mce_panic(const char *msg, struct mce *final, char *exp)
> >       if (!fake_panic) {
> >               if (panic_timeout == 0)
> >                       panic_timeout = mca_cfg.panic_timeout;
> > -             panic(msg);
> > +             panic("%s", msg);
> >       } else
> >               pr_emerg(HW_ERR "Fake kernel panic: %s\n", msg);
> >
>
> --
> ~Randy
