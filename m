Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13522F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 20:46:02 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z19so8426136lfq.13
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 12:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fm6/WM1aXFuwaAFInnacEGjjm7HROSKZyaeunWFy85Q=;
        b=EB+7VDo0oio3AfLjXuLSp6iozLxATOVsRvDCRYSKDC4dRHRa8GuGMgzNBg4tg2Xtaq
         uu3+nm502DKtfpnMjfCLhX47RbFHaPcqZ1Ap/cehsIkyFRU0CD109PV/k2UlXJs84mZk
         7Aft+fARjfKRk60pMw3eyxJoTpD+7y+rf4d478kXyMFZVg54TRtrY8xmylU8MmXJ9gmE
         qIsC8G8P8vgijQ6+XICJ4axatcywgPRfBO4gE8gGWY4b6j/mNfakbxaUe/IEeCuTE3K2
         fDz2vxKnxjagXfbK+K866SRGzKhDCVY9JxQOclVZz1dgNk13Zh0i2G4OkyCCxinuGBQ5
         nVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fm6/WM1aXFuwaAFInnacEGjjm7HROSKZyaeunWFy85Q=;
        b=eXoVus/u6u46xv+lPVJhqP5Bv32zRhMBMU6aGM9grSfUUhCWTKMubg7p+HVGMEMbaG
         UCzYII775PhHWedndi0Wz6/LzojCtCoJDuHtJPe+FjyO0dG2O7S45aChasUh52frUNrY
         YUCCDIhlc0gJUw33dtUshjfmADW/Ovyn2zUHtoBtVB6Rg2iTc5OQeRUvea9bKA1czD/v
         GJWN2108Klrh8g4Ds4Eq1orcRX8O+oBuCGXGwt5EWnyohbwFIw2Y79fdoiSGE/3ZLLJH
         I2ukBMdzOm33t+YZphd793ExJ4X8/RbmT5vkXUn2qo3rWSI3+9jKxO6dklxWJtEx4XlN
         9Wlg==
X-Gm-Message-State: AOAM530q4kMiJS0izaMx9TCGW/wSy0M8/tBwH8YkueC/w8OagLEY07j2
	7/cR2No0SreurwttXwe4SLjJHdkG3eBzTvIL2kARUA==
X-Google-Smtp-Source: ABdhPJzordyV/vbntEzNKU3NgMfL1TqdSMWainolMPsf5aYHMJtZbYurIZW+6FnXNlOUlgdQ/qO9YpSPM8DquTXJTP4=
X-Received: by 2002:a19:6449:: with SMTP id b9mr28158247lfj.82.1643921160689;
 Thu, 03 Feb 2022 12:46:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203204025.1153397-1-keescook@chromium.org>
In-Reply-To: <20220203204025.1153397-1-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 12:45:49 -0800
Message-ID: <CAKwvOd=7ZDMhnX6Da5_ZMM9yLgrnhjwwPhYwO-RT-3yrPy+RLw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/build: don't build CONFIG_X86_32 as -ffreestanding
To: Kees Cook <keescook@chromium.org>
Cc: x86@kernel.org, Arvind Sankar <nivedita@alum.mit.edu>, 
	Fangrui Song <maskray@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Andi Kleen <ak@linux.intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 12:40 PM Kees Cook <keescook@chromium.org> wrote:
>
> From: Nick Desaulniers <ndesaulniers@google.com>
>
> -ffreestanding typically inhibits "libcall optimizations" where calls to
> certain library functions can be replaced by the compiler in certain
> cases to calls to other library functions that may be more efficient.
> This can be problematic for embedded targets that don't provide full
> libc implementations.

While the bcmp shenanigans were ultimately resolved by
commit 5f074f3e192f ("lib/string.c: implement a basic bcmp")
(and this popped up again in
commit 1e1b6d63d634 ("lib/string.c: implement stpcpy")
).  I'm still very much in favor of this patch, and should have
pursued it. Thanks for resending!

-- 
Thanks,
~Nick Desaulniers
