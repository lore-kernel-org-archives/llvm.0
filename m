Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EAB138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:23:03 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id t25so28018293lfg.7
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 14:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0X13uqjNwYdIdWF5gsH4FGVLE1+a8Dz5UwUWTgnJlnA=;
        b=sDdIuJSBLpwXUzgV/cidT7T3qcWOdU7KajEF1YzNd/JRtNz/CLGSzqsrvOxCZzMWp7
         Jnys5cE+YBGvLmz6gGNuzdNjv8fK8wRl+jmqsW+hSKvsIY0PuTiLpoDG9qBwjTX0SPIl
         ejOpeMDPHIPdCFPNWemfNB60WYn9uYtBijGiVUSQsqQnBcre8eXTW7iYm258/CRjL0/l
         Bikup4FGjM8uRIedMPAguPjGx3+DLWrqWiG+GLESgbRY3vnIq3Awg9mz2TEQdqU9zUvK
         7chJcLIxJCt6FD4g/vbWnJHEX29bkdQq99LeK8xzL8xDsQmxg2V2eUYZI16SrA2xFPTj
         h/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0X13uqjNwYdIdWF5gsH4FGVLE1+a8Dz5UwUWTgnJlnA=;
        b=Xx4sP6mMZ2UHj71dLMXr70qjvOFPcXxAN3OAsC0yNsxvgvA/Q0iPV26XDR4696lydB
         YPcp4/2DWW1Z7pvPywnzbyJm7WwXhyJRIilxE+FsGNho9eJXxl27gvpTeQAlNMpHAgHK
         oBC/lSZhMzmPvzHXROtor9Vu5tkDaQ4GGt7kD6j+sa09xmJlsXsoFTFw3aPFybabS1t0
         VYOrfmdrKaTjtu9bm+oHEqIBEHbfzsiIPezROCx+7pI2sqrBIz43LKm1iXp3xWHs+nCf
         gg+y6GkvPrxV+TI/pz7HtOMnfWj6fYaVkUrTWu7Jxos5YmKGAJ02iHSG8Xt+Ryp61h8S
         f/DQ==
X-Gm-Message-State: AOAM530E7PSbNXZQThXT1FeXP+eQUm8F0BPUs9OnnUoS+4dJvUereo6h
	1B+A3SmzNQe7iAxkJGtRI+HkZwXgc/sGxMo0IGAjMw==
X-Google-Smtp-Source: ABdhPJyoZlfgGcyXBwCgV/a8OHUAiXJ0ELcBg2e2lZ34zKTVoYlJPwz1ktnYj23HVuUWIkL7HHmLVdBPtWvVtWOyx1o=
X-Received: by 2002:a05:6512:1291:b0:473:b522:ef58 with SMTP id
 u17-20020a056512129100b00473b522ef58mr14566653lfs.190.1652736181566; Mon, 16
 May 2022 14:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220516130047.3887590-1-trix@redhat.com> <YoJ0I/XPoj1B/+mm@dev-arch.thelio-3990X>
 <d34498ad-0230-7c73-8f1f-9ca59fbf930f@redhat.com>
In-Reply-To: <d34498ad-0230-7c73-8f1f-9ca59fbf930f@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 May 2022 14:22:50 -0700
Message-ID: <CAKwvOd=-H+rvt83rgrR3GyXdSDe+n0aG8CFLEshij9jNAzCQtw@mail.gmail.com>
Subject: Re: [PATCH] misc: rtsx: Set setting_reg2 before use.
To: Tom Rix <trix@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nathan Chancellor <nathan@kernel.org>, arnd@arndb.de, gregkh@linuxfoundation.org, 
	ricky_wu@realtek.com, kai.heng.feng@canonical.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 10:06 AM Tom Rix <trix@redhat.com> wrote:
>
>
> On 5/16/22 8:56 AM, Nathan Chancellor wrote:
> > On Mon, May 16, 2022 at 09:00:47AM -0400, Tom Rix wrote:
> >> The clang build fails with
> >> rts5261.c:406:13: error: variable 'setting_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
> >>          } else if (efuse_valid == 0) {
> >>                     ^~~~~~~~~~~~~~~~
> >>
> >> setting_reg2 is set in this block
> >>    if (efuse_valid == 2 || efuse_valid == 3) {
> >> ..
> >>    } else if (efuse_valid == 0) {
> >>      // default
> >> ..
> >>    }
> >> But efuse_valid can also have a value of 1.
> >> Change the 'else if' to 'else' to make the second block the default.
> >>
> >> Fixes: b1c5f3085149 ("misc: rtsx: add rts5261 efuse function")
> >> Signed-off-by: Tom Rix <trix@redhat.com>
> > I am not sure if this fix is correct from a functional standpoint (i.e.
> > is treating efuse_valid == 1 the same as efuse_valid == 0 correct?) but
> > it is better than not handling this value altogether. For what it's
> > worth:
>
> I looked at how the code used to work, this seemed better than
> initializing to NULL.
>
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > As a side note, it is unfortunate that this change made it into -next
> > when there was an outstanding report about this warning:
>
>  From the clang side, this is a build break and my static analysis infra
> goes down.
>
> These build breaks seem to happening every week, is there a precommit
> clang gating test that could be done for -next ?

Probably worth asking Stephen, though I don't think there's _any_
gating (i.e. presubmit testing) for -next, since that'd increase the
build capacity needed. -next is tested post-merge (i.e. post submit
testing) IIUC.

>
> Tom
>
> >
> > https://lore.kernel.org/202205100220.WyAyhKap-lkp@intel.com/
> >
> >> ---
> >>   drivers/misc/cardreader/rts5261.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/cardreader/rts5261.c b/drivers/misc/cardreader/rts5261.c
> >> index 749cc5a46d13..f22634b14dc8 100644
> >> --- a/drivers/misc/cardreader/rts5261.c
> >> +++ b/drivers/misc/cardreader/rts5261.c
> >> @@ -403,7 +403,7 @@ static void rts5261_init_from_hw(struct rtsx_pcr *pcr)
> >>                      setting_reg1 = PCR_SETTING_REG4;
> >>                      setting_reg2 = PCR_SETTING_REG5;
> >>              }
> >> -    } else if (efuse_valid == 0) {
> >> +    } else {
> >>              // default
> >>              setting_reg1 = PCR_SETTING_REG1;
> >>              setting_reg2 = PCR_SETTING_REG2;
> >> --
> >> 2.27.0
> >>
> > Cheers,
> > Nathan
> >
>


-- 
Thanks,
~Nick Desaulniers
