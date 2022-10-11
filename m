Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0852F3D
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 11:55:51 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id u2so7006189ilv.6
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X9ELJWsFEOA9ZjR8vqRc+1/Kb4xOZiuQUQY31p1h+Q8=;
        b=DZszs+gH1es+xg6y+a7l0fAdLt1s52gSgAZiIDQumcRtKI4eEhlGm+9JR8DSEWZR7t
         I8sigBB0KtgDK6bFwuAQbJ6nT2M0FgHcR93WYRgrV9HcCYk4FmCdYeksFA4Q/AoLgGt+
         3C4/KXreibaj3FvFT4nynzieUW3Hsuk7PVMTZRA/3WrfBnlKy+KUYHcIOaoIgq21QAqF
         Gp45E8UcByMRn8YstbmTXUQ/c19HZIhtTlxc1jD9CxuyPT7l37ZuBk14F6ZOm3pM/oOt
         kh3DASTrFByWwriz90Cvt3/a38lVOCpTXRcI4McEVEutLlAVrRouROph3+xL2iHzkU4w
         wf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9ELJWsFEOA9ZjR8vqRc+1/Kb4xOZiuQUQY31p1h+Q8=;
        b=RneNvhS2/LmTqj5vStz5fINi8cHVjy0MZ2WQ1ly7Jqmz+VFBNpfqfdeooeiXkh1lD6
         VwGQ8rgIDvExLbwC1h9UlDlABWSxYkGs3+yDpegen14ON4r7d3Xse2f0bFt9b73j9zfF
         wzM2XdzrRK5NewLoM1eSm0WpCUReoQGh/66Xly8zKX9bQtfWKK0bWGvFVXQsyfFd5QSb
         wFG8TO34xYa6WxoI5hC2Nh8vP/oa/CIcnqT3bvaGM7ZZPhAz40dkwoK6sdFVndIg33cX
         Upr8HOBgTc51sN7eDYeJexbHG4DlgYD6CFiLQY2mWh3QPX9TwTN6dFn7GE7CXQTh3gft
         C94Q==
X-Gm-Message-State: ACrzQf2m8FN3B8ZXj6K+0Y8gkX+GYEvhTxzvLrrGunqBniQT2Q8/NMNm
	sRyph4wDdVqpq+iWKh1xuABaSWmCxj4lomVcj8Y=
X-Google-Smtp-Source: AMsMyM5+gu5fEJL3u/z9fh5zuGtorQ255IKQ4OfCeJYH5cGS9UtuhnZ0j68AmjbTrs1kGnaP/bv1mWaQfSHEJHHX7Pc=
X-Received: by 2002:a05:6e02:b2d:b0:2f9:e735:a010 with SMTP id
 e13-20020a056e020b2d00b002f9e735a010mr11659127ilu.151.1665489350477; Tue, 11
 Oct 2022 04:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011031843.960217-1-masahiroy@kernel.org>
In-Reply-To: <20221011031843.960217-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Oct 2022 13:55:39 +0200
Message-ID: <CANiq72k9wAVCbHKVZFE=E3xv+2ZamUMsJ=uV43NxsSUQ4wXGdw@mail.gmail.com>
Subject: Re: [RFC PATCH] Remove Intel compiler support
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ia64@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, Len Brown <lenb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Robert Moore <robert.moore@intel.com>, 
	Tom Rix <trix@redhat.com>, devel@acpica.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 11, 2022 at 5:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  include/linux/compiler-intel.h            |  34 -----
>  include/linux/compiler_types.h            |   2 -

You can also remove a few lines from `compiler_attributes.h`:

    * Optional: not supported by icc

Thanks for this!

Cheers,
Miguel
