Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D43FCF
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 20:37:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id k13so23725952lfv.2
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 13:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=uNcqj9xjWIfQIY0QflXDG20YjitmguOx4ywcCWl73/U=;
        b=ilWLGdi3Cf8peiOJcbZixLNgXePN5jQ7FtqkR0ne0wGyCRK96xVTx6VujOtvGJnwOA
         t29LDmRG+oQphsKQLnpgKx0qT0UFM0awAHItWH/qAMoFwuMy1QfcQ+Htb6PtxMKA0yfi
         FfYper/cc47ppbEIm94dxrSsOZzWauuRFeUEGD1On65oseTwVG4b7swRd5bBE7KJ9ugH
         muU1CEublYt5PHRS7COzLUHbPECVYPxwPrD9v0OcSC5aw/MKDfgo+UWjHNk1XfiEJZSA
         QEUvgjOv/V+CZ1qNhRAAq28FWdx6nR1p3+erxw08PjXPab3mgwlZu/7cKFrCj+ejmrOK
         9Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=uNcqj9xjWIfQIY0QflXDG20YjitmguOx4ywcCWl73/U=;
        b=8Q1mU5wctP/nK3li81tJIOE12B19HhPd4DicgdyrRgP+xbTYPR7gSzKoPMtiY+Oo5g
         rWyYVs76jgIiDFgzBY4RFdQ5rbqAHzcZZbK6yellxHiIh12WbMarScpofMYfpJqfWInA
         6BJfsGIPIfceBFadRNnqtVFjRdT6yQa3mQnBvfH9GiB4/QtvQPRl1oT0aeQuaPGz3blW
         u5A+vgnTMfxmBRVh5npOB7xRdXpojZ2XySew1uEp8GyLOggZn5vHJu0gphhullr9jR83
         vkj9UGHHuaFycpv8iik45hYnH/u4HJ5rDDubX9WJYPIwNaAaV+gECM1GvRL4kESKPTAC
         1E3Q==
X-Gm-Message-State: AOAM533iBxaDdYsg65uHcmdN8VLI+LdW4qKvS4wGtl1GY9B4nWhyX8pj
	HhlqzC/y6M7N++5y1X7pu/tmsQeiumnfll5ezLKk7w==
X-Received: by 2002:a05:6512:1114:: with SMTP id l20mt4770215lfg.550.1631565420008;
 Mon, 13 Sep 2021 13:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <20210913131114.028340332@linuxfoundation.org>
 <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
 <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com>
 <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
 <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
 <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com> <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com>
In-Reply-To: <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 13:36:49 -0700
Message-ID: <CAKwvOdkpsvNK2x+=S80crW0reFBH-vwuNop7-2mFayajFMcqog@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	Baokun Li <libaokun1@huawei.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-stable <stable@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev, Kees Cook <keescook@chromium.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 1:16 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Sep 13, 2021 at 1:10 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Mon, Sep 13, 2021 at 1:02 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Ha! I pulled+rebased and this code disappeared...I thought I had
> > > rebased on the wrong branch or committed work to master accidentally.
> > > Patch to stable-only inbound.
> >
> > Side note: for stable, can you look into using _Generic() instead of
> > __builtin_choose_expression() with typeof, or some
> > __builtin_types_compatible_p() magic?
> >
> > Yes, yes, we use __builtin_choose_expression() elsewhere, but we've
> > started using _Generic(), and it's really the more natural model - in
> > addition to being the standard C one.
> >
> > Of course, there may be some reason why _Generic() doesn't work, but
> > it _is_ the natural fit for any "for type X, do Y" kind of thing.
> >
> > No?
>
> Man, c'mon, I just got the __builtin_choose_expression() working! It's
> not...too bad...ish. (Besides, I'd actually have to learn how to use
> _Generic...I've never quite gotten anything I've written trying to use
> it to actually compile).
>
> Do we have access to _Generic in GCC 4.9?

Follow up thread, sorry/not sorry for not taking the full cc list:
https://lore.kernel.org/stable/20210913203201.1844253-1-ndesaulniers@google.com/
-- 
Thanks,
~Nick Desaulniers
