Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0132C80
	for <llvm@lists.linux.dev>; Sun, 10 Oct 2021 10:54:58 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id k3so6515406ilu.2
        for <llvm@lists.linux.dev>; Sun, 10 Oct 2021 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5XE9nYv4QLj7PH0x+jUZTOYUi6igVt6xodhzd4pePic=;
        b=AVi63/mMVoi7nSP5HLzyyGjhmHmtLENmB+z+r/yNTGifrIQVg+Kw5XPmKbywcpi/D2
         FQ3KIq41i0vut5jWOAz5NaTrBk2nlkR9BmYmC6llQ0k6jRX/rF57TYagfGya2D6zCA5W
         qsH+AtsYUgzeWCe8wTIvJKLfKRD59VUhoSNhfgKHNxXSlAwWOE8lMAjSj+6A67FmObBv
         G/G3a/jG7s7kEUAQUAcC1y7kh05tt9pyyQVaAbX8QC12zsnw9SlYb6fZwCBK00kXmlxg
         nyHi6d5bLaddpt6eIS21Xcdfj2Ed5osPLRUfUhrhbAiax0BCpM2VW+dwMoBkZVw7buuj
         iSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5XE9nYv4QLj7PH0x+jUZTOYUi6igVt6xodhzd4pePic=;
        b=WZmAXk7vhjuxIHoRMlHJI4jmoof+amTqttsHEySDdlTBojjGcczMjAEZHO2RptqFAx
         yZTazkyegz98AX5dCAeYVrhgxJiExHCDfOA48Ae0Kb2r0Xfgm+xa6jLfBAExDIOVwc75
         EvCI7yPlUKipQjcxrzrq5TGIsc/TBfItExFqoTGAXeN6t8twC2Se4KpOnApVXDcOusHX
         eeJ3v7OBGxr17PCuNFEj1NteFp9QfgBv2IVjiZK1yC5v1Z1d15wWzIvVyEglYClb9JH8
         UkXO8CT+2So6KWk5hXLjDL7VJG1mwu4Osfx6K09aYQrvAu8Na2sor0Go9vzqDnuAR6Gz
         A2iw==
X-Gm-Message-State: AOAM531MM3vQfmJriCE98GH7hryLFEZJxYszhhJFPnSDE/F0r5zcoe2O
	i46zQwlWLarbRUapUtIi5mHhJYKvUmgi6CeRq/E=
X-Google-Smtp-Source: ABdhPJyS7AiaHFm4pLpQVcJeOIj1vQ5N2xYulagQKC2cqTzcR8laa2/7yzM0teidB/4sqL5yvuezOqjRBmlxAGh1P4E=
X-Received: by 2002:a05:6e02:20cb:: with SMTP id 11mr15319369ilq.237.1633863297374;
 Sun, 10 Oct 2021 03:54:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110100514.3h9CI4s0-lkp@intel.com> <d6e8064803598970b463da0e9bab116b@kernel.org>
In-Reply-To: <d6e8064803598970b463da0e9bab116b@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 10 Oct 2021 12:54:46 +0200
Message-ID: <CANiq72=-2t=ty2SFX=ZTNvcWC05-0AiaVBdy9s-rENEb53EFUw@mail.gmail.com>
Subject: Re: [arm-platforms:timers/tval-ectomy 2/17] drivers/clocksource/arm_arch_timer.c:156:3:
 warning: variable 'val' is used uninitialized whenever switch default is taken
To: Marc Zyngier <maz@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Oliver Upton <oupton@google.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 10, 2021 at 11:37 AM Marc Zyngier <maz@kernel.org> wrote:
>
> I think the problem squarely lies with the compiler (or the
> way it interprets the BUILD_BUG helper). If it cannot see that
> BUILD_BUG() trumps the control flow analysis, then this warning
> is totally useless.

The fake, generated `__compiletime_assert` should be annotated
`__noreturn`. That gives enough information to the compiler to avoid
the warning: https://godbolt.org/z/x1v69jjYY

And we should also move `__compiletime_{error,warning}` to compiler
attributes since Clang trunk has it now, so that we catch the error
earlier: https://godbolt.org/z/jd8Eb9Mf1

I will send a couple patches.

Cheers,
Miguel
