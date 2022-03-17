Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6282F31
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:11:34 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 17so8351354lji.1
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GvRtkI+aajtqCy2c1b2F4MUYD+uMLWJPyiKwyzY7fBQ=;
        b=hne5dkL1r66jaWeZwLdqsQWeaYzLA0jCNqUeaPeX4MK0bcpogrmJFtTsAHSYPHTv37
         F31NNlIDn9bslKYtcs9T7Ma0331NI3pAKkY7Smg4Njyl7fKErwUzZLR77VAJgDJGt60n
         8yoAF2gzIx0ez9xH7e1/L5DkEJjrMCAG7htDNgWR4IVaW+tvIGLmwLqztCBKJVgv8JNg
         9J29bhh2X/xEUKQYCshpyqmTT6OTC0cbzKTXSYQzOMHmhryjwsJyMrPUTkPxAl/m9Ng8
         HHfV7rzkYosyidu3QWTr29KI54SAqAdUXPgypkWcpypqbuGZSPra+xml3A+fuJpxtgBF
         iU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GvRtkI+aajtqCy2c1b2F4MUYD+uMLWJPyiKwyzY7fBQ=;
        b=mfkCKyNTTtUoYk+0vzPtK5YvCHfQhu5RBNnNQqdJKJmXp2kDZv1a56D3qDvVX97GcC
         1/eoUceqgCNUs5H2YDchrO0XPXvKCJMfVr89zxdfF+a50lWtRcM97ZUMmlmXws2sMPzp
         C8eviNpqUPd1X2ecBusJrEeXnpOmlqT/mOOeTfcZqTas0ldBVr8+sU1mhvFU5u4Myi+k
         dgm/Y4l1toO0ogWtVAhAr5HQwIHAf7VQ2vFC4iA1lAyWN4w1J/UWNvLLwAlAgejKzpW4
         Fejqt+H8Avn66KZpm3YM2kV66+upl85F0fP8VPiQ/qFWEQ+x3XTj+kHigHPSZuT8P5Pq
         BBPg==
X-Gm-Message-State: AOAM5319w2vrkKl9e3w+V/KSWOeJcNlu3AQZE9I5H/S9Sj93s9aMZ2B/
	jJC73LfQUz4G6OE9EEP+0po+CCB7oO54WZpCEXFokQ==
X-Google-Smtp-Source: ABdhPJw321RYGnd+eSI0h5Spru1PQ/7vVF+BX9Nro0IcXN12RAcPjoehXMVZPqBvuitiGJFoQTKh96/tVTcy8uPYIkw=
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id
 bn17-20020a05651c179100b0024394bdd94cmr3596248ljb.468.1647540692501; Thu, 17
 Mar 2022 11:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
In-Reply-To: <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Mar 2022 11:11:21 -0700
Message-ID: <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bill Wendling <morbo@google.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 2:07 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 16, 2022 at 02:30:55PM -0700, Bill Wendling wrote:
> > When compiling with -Wformat, clang emits the following warning:
> >
> > drivers/gpio/gpiolib-acpi.c:393:4: warning: format specifies type
> > 'unsigned char' but the argument has type 'int' [-Wformat]
> >                         pin);
> >                         ^~~
> >
> > The types of these arguments are unconditionally defined, so this patch
> > updates the format character to the correct ones for ints and unsigned
> > ints.
>
> hhX specifier refers to unsigned char. It's a bug in the compiler.
>
> NAK.

Andy,
Our goal is to enable -Wformat for CC=clang.  Please see also:
commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
unnecessary %h[xudi] and %hh[xudi]")
and the lore link it cites.
https://lore.kernel.org/lkml/CAHk-=wgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+4TC=20e0Q@mail.gmail.com/
(I saw your follow up; this patch is one of the less controversial
ones though since the types are not ones that are promoted).

Bill,
I just remembered that we will want to explicitly set
-Wno-format-pedantic when enabling -Wformat. Remember that -Wformat is
a group flag that turns on other flags, such as -Wformat-security
(currently disabled) and -Wformat-pedantic.  See also:
https://reviews.llvm.org/rGcc01d6421f4a896820c02da2ea92b82d973b431e
commit a8735821d198 ("Kbuild: Disable the -Wformat-security gcc flag")

It may be helpful to cite
commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
unnecessary %h[xudi] and %hh[xudi]")
in future commits that change the format flags for types that are promoted.
-- 
Thanks,
~Nick Desaulniers
