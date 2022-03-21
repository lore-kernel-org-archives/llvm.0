Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEB2F24
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 10:09:11 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h1so17168715edj.1
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 03:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SkmT2FABHkpew7E/cN4TVjK7zuvf5Ns9Fgh4qceQpwU=;
        b=g4lAMpd74Jf9YpklzhPxjUQUv6yx2iLEHHrQvVOpWo0P6cDCLzRZeaI8Ih5pJWPbGJ
         7n9oX0SwQOmCtFvFMO+G0Rd7mU2awVCk3z91ghHm05HGrCDAvQZ0f2zaZnGvMZ4hlKEX
         5eiCaY073OpARgfDga9fO5BfL+P8wcEuBgQ7JDSbqKpY27/QvKbKHHjqQETF9em1iDlL
         rqtc0HINi+FpQRfRa1B6wy1sZD6SqeNwJSePP5ZpNj131PXVDScJBe/hZka2doRISQWL
         rYX3PVx1wQ8RL3d9Oiu/hooyx/FRX/yCufrU//hVvfe66KcR66FATEP8nwhUWSd2EzEX
         apNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SkmT2FABHkpew7E/cN4TVjK7zuvf5Ns9Fgh4qceQpwU=;
        b=MnkZ4wsKcphcj8y3DRj0tvLkwVnZxQvXYSv5E23vzSS+oswV0c7O/tf7M6sUSH1omt
         wg6CHXh+fQA+LW2Q+yAnnOWGbXzuxPOJfrCssb6LKQesLPqxscwhPoGgCKCt3xbdA1eW
         T5MYDh0rjqSzNHiS68Z2eNDzJk9TwbuGPH/lKDLJlKYdZwoPP9wh8ieD2KyaxA0sfOND
         Z1JyN6wk+qCQBgorVvK73b5u9Na4TYyD8TvqkBs3vyUfr4cMi83+SX2+MTYdNPYT6+gg
         NQRYJVFMZF/SsNG4x8n6M3I5nNOZMMLYUf8Nq1AZJ8Pscwh+aHxsHww6jdiNVgJaNX3p
         xPAA==
X-Gm-Message-State: AOAM531/f2lycG4Jvz5TTZSDZy+l66oFd1DVLyPUf4T4BT0bl0ySYFnl
	0tIVyDO6oFI9TEWj6rywuPmjpjEJKNVb494NTMu8Chvkg+I=
X-Google-Smtp-Source: ABdhPJwjMzeDiM1jhIZC9vO3K6bKkPd1fvqJ2Pl9h9z60Lq9e+0K81GLeFaZGDHFPc4KxsZDKtn8yaYZu4f7CiF1fUc=
X-Received: by 2002:aa7:c30f:0:b0:419:2af:4845 with SMTP id
 l15-20020aa7c30f000000b0041902af4845mr18184178edq.296.1647857349742; Mon, 21
 Mar 2022 03:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <20220319222228.4160598-1-morbo@google.com>
 <CAHk-=wh4B42bYZmGoY8=UsqHDuq_th2KN7TmXuTnhwyYWzQ5pg@mail.gmail.com> <CAHk-=wgH3kbKcNwBO7os3BuU523Gd2aqdu0dVvf50bJbLKrLJg@mail.gmail.com>
In-Reply-To: <CAHk-=wgH3kbKcNwBO7os3BuU523Gd2aqdu0dVvf50bJbLKrLJg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 21 Mar 2022 12:07:58 +0200
Message-ID: <CAHp75Vc+T3eM9=yu9XccXKmf1ZnR6dz1ZP_eL4faPnM8ZNbbnQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: acpi: use correct format characters
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bill Wendling <morbo@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 20, 2022 at 1:06 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, Mar 19, 2022 at 3:54 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:

...

> End result: I think the simplest and cleanest option is simply this:

Would you sign off on this? I will then replace the original patch
with your version.

And for the record I have a follow up patch to clearly show that pin
is always unsigned, induced by this discussion.

-- 
With Best Regards,
Andy Shevchenko
