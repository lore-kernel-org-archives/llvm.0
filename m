Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F47C
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 18:47:31 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id h23so7193151ljl.3
        for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 11:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gnUSbe8CiTQ19HP1QRaMovzHPwVV5AH7oRueQxzbr2w=;
        b=psqvyg4bPOOObXvl93Zxro9XA/ODLoG6iBN8VzURq2kWrUR7F3BHDeeHNMu0CFKyIh
         Niks5hKvSuVELNC275GXW5lNVLONvG604XONrgXtzQCBbODYI+FiNC4UHOy01ziKEw6P
         PnJJ8X8mCYdNE116ke64zsX9sSqEcXHCfXLltO9UXIpqgB60u1m1gOJgKSvqZ2Vu7Rt3
         Fab5Mj4u35jsb3FBf1q2tLM98qhaB60LVo3lH+ODCh+pfDogtGE59OZmPCThjZAo5F3C
         uARnmPJ0E0/9jMWP5IEUMjK7PRjAVPO04tktB/Od36POLALwftkbezadySNHJrj1LtR7
         bRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gnUSbe8CiTQ19HP1QRaMovzHPwVV5AH7oRueQxzbr2w=;
        b=1CMQ3DCoZbW2/1ZhPPq81NINGPnEimD9+4ElGmBaww0vp+H1ADpr9XbRqhrK6WwEd2
         R/M5ZE954gvxLa6I7ubr3och5CU+jRchbfRGBsNgzeE17NkZRRpFJLz8PAM76TjfyuQH
         alo4u1ZLdLECvvwmPRQ422udMXjTguEynQEjWXrlH817XQiifkBWbq7tPZhdFyQAOZ7q
         PYjvjtPANJyQ+ReUdZO4UD0t9oDo+zHYEqnM0h+zIGk0GTPlS7sP22R8wtdJ39mN2nzB
         suFBbeLR/SS306JCFDw1JAW2m95/uZ2aiexmAjILGLUa6mDWaOc5B78GbvxE319B19mk
         4oNw==
X-Gm-Message-State: AJIora+UlaqL0uuOyFRMU7TpZPYCQavzfwZ+/c178gTmgYCAsC8zPQI6
	DWIbVxJpgEMXxj9FsLM3Nm8+e2AcPaYjT021/IJ+
X-Google-Smtp-Source: AGRyM1uMA1RswQj/kRbYWxpa2gpbkIqW/H3Lhp9QgKWhkKjVKtC7uz71CWdrVgWOGoL64GzPA+QRw4qUugKbzHueGjo=
X-Received: by 2002:a05:651c:1581:b0:255:48d1:fdae with SMTP id
 h1-20020a05651c158100b0025548d1fdaemr472476ljq.286.1655146049852; Mon, 13 Jun
 2022 11:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com> <20220609221702.347522-9-morbo@google.com>
 <YqYTExy0IpVbunBL@equinox>
In-Reply-To: <YqYTExy0IpVbunBL@equinox>
From: Bill Wendling <morbo@google.com>
Date: Mon, 13 Jun 2022 11:47:18 -0700
Message-ID: <CAGG=3QVc4STHym0hszpr1SP=RYWag5=J-MB-zhz4JzNZnRnbvg@mail.gmail.com>
Subject: Re: [PATCH 08/12] cdrom: use correct format characters
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Bill Wendling <isanbard@gmail.com>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jan Kara <jack@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ross Philipson <ross.philipson@oracle.com>, Daniel Kiper <daniel.kiper@oracle.com>, 
	linux-edac@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-mm@kvack.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	Networking <netdev@vger.kernel.org>, alsa-devel@alsa-project.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 12, 2022 at 9:23 AM Phillip Potter <phil@philpotter.co.uk> wrote:
>
> On Thu, Jun 09, 2022 at 10:16:27PM +0000, Bill Wendling wrote:
> > From: Bill Wendling <isanbard@gmail.com>
> >
> > When compiling with -Wformat, clang emits the following warnings:
> >
> > drivers/cdrom/cdrom.c:3454:48: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
> >         ret = scnprintf(info + *pos, max_size - *pos, header);
> >                                                       ^~~~~~
> >
> > Use a string literal for the format string.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Signed-off-by: Bill Wendling <isanbard@gmail.com>
> > ---
> >  drivers/cdrom/cdrom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > index 416f723a2dbb..52b40120c76e 100644
> > --- a/drivers/cdrom/cdrom.c
> > +++ b/drivers/cdrom/cdrom.c
> > @@ -3451,7 +3451,7 @@ static int cdrom_print_info(const char *header, int val, char *info,
> >       struct cdrom_device_info *cdi;
> >       int ret;
> >
> > -     ret = scnprintf(info + *pos, max_size - *pos, header);
> > +     ret = scnprintf(info + *pos, max_size - *pos, "%s", header);
> >       if (!ret)
> >               return 1;
> >
> > --
> > 2.36.1.255.ge46751e96f-goog
> >
>
> Hi Bill,
>
> Thank you for the patch, much appreciated.
>
> Looking at this though, all callers of cdrom_print_info() provide 'header'
> as a string literal defined within the driver, when making the call.
> Therefore, I'm not convinced this change is necessary for cdrom.c -
> that said, in this particular use case I don't think it would hurt
> either.
>
> I've followed the other responses on parts of this series, so I
> understand that a different solution is potentially in the works.
> Thought I'd respond anyway though out of courtesy.
>
Thanks, Phillip.

I pointed out in a separate response that this specific warning is
disabled by default, but when I ran into while hacking stuff there
weren't a lot of places where the warning popped up (at least for x86
builds) and thought it would be a nice cleanup. I understand if you
don't think this patch is necessary for your code. There are some
places where visual inspection of the code is "good enough" to ensure
that nothing untoward will happen (Greg pointed out a similar thing in
an mm/ file).

Cheers!
-bw
