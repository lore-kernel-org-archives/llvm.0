Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F373FC3
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 03:31:01 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id s12so21159731ljg.0
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 20:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XZIR+OW7AmJfiUUZaovaqUuh5fl5BCbvBkZHwqEmM5s=;
        b=oGsn/ceGkKMWMj9f4jo/W14bJX9G+0Z/LiU08GQvTestqrH/T5OMHZPXh2zJfypSBw
         Y8dWSO1mhHMwDNvo09ttuwSEW1EFz9FMs4bjkrk2FAHdWeFCuh+YKsKoVDx9kYnB//Xc
         u8v5BIN+PcVwmpUj/PbYWKnNLiYdoiqzV1YJvoEzL10WDsrJ2wwdMF4T+kyrIHT4DgCb
         dCJZWkKbtLRxZoLiezKw8TlqXkptq9NyoLsRyTjEFgYANMF7DDJp0swD0VJ80rrRuxv8
         BnQIvr6XdIz6qgS+ABNCFlYRKblIm7qXcPrMpDmTiV9ZPC/u6AUxVvZ2Dl7Ylon2JzcW
         HftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XZIR+OW7AmJfiUUZaovaqUuh5fl5BCbvBkZHwqEmM5s=;
        b=RK5ZU5yCUQqe7dS/8y4zcvqv3wjVlkXnqIne+HG4ysc3l0bVaPaPyeP5HAy3yEPfA4
         SV01wWZY7B5v0uRO9sc1JcuU/gJUhh/LpAxYBlSKyLWZ8bo6X4a/lER7q2gpedgjiko1
         eA9b0/O2C29pu4NA6Eg5Q3f3yEyYbPNGyXQJtbG5+PS6hUgOnShATLoRDcKkBfsWka7d
         KKwoxHqAXhj6TsIBm22dQ3UE2pqW061yohKFN4G7hLv12u7OHAk8qeR8PzV/GBAN89cK
         oDF+MljrIfG2JW+NQehdxlqtprMoO1E9/qrbIdJW7xIGSUsj7adZ/448M1t+AymhmSEM
         ncDw==
X-Gm-Message-State: AOAM532CaGtZav4uDfBVQZ2wEwJ4cd5kv1cAIWHY+vzj82ukJwmWsdY+
	ZZVR6ijKxVRjNf1OkQwNamRP0hqC0t0ZQtMNjm+c6w==
X-Google-Smtp-Source: ABdhPJxsklrQbsfLjhitFiOJAIdaSVB2Q4vQsF6CmpEM723SCg4xtM+4+qNHsdeFn5JHJW10oxNDP3Vxyk7uipi9vEw=
X-Received: by 2002:a2e:8808:: with SMTP id x8mr13766486ljh.220.1631590259172;
 Mon, 13 Sep 2021 20:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
 <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com>
 <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
 <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
 <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com>
 <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com>
 <CAHk-=wjP2ijctPt2Hw3DagSZ-KgdRsO6zWTTKQNnSk0MajtJgA@mail.gmail.com>
 <CAKwvOd=ZG8sf1ZOkuidX_49VGkQE+BJDa19_vR4gh2FNQ2F_9Q@mail.gmail.com>
 <CAKwvOdkz4e3HdNKFvOdDDWVijB7AKaeP14_vAEbxWXD1AviVhA@mail.gmail.com>
 <CAKwvOdmtX8Y8eWESYj4W-H-KF7cZx6w1NbSjoSPt5x5U9ezQUQ@mail.gmail.com>
 <CAHk-=whjhJgk7hD-ftUy-8+9cenhMDHqaNKXOyeNVoMxZRD-_A@mail.gmail.com>
 <CAKwvOdnFRhKDZ3XuePSGsuxhOpuS5RmZ1u+MeN=PRPPKSS3wFg@mail.gmail.com> <db321a38-f5f6-34cd-2f4f-37fc82201798@huawei.com>
In-Reply-To: <db321a38-f5f6-34cd-2f4f-37fc82201798@huawei.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 20:30:46 -0700
Message-ID: <CAKwvOdmMHFOke5kzzgBDwKySzP799-cnp-61cohJRJTS4cFmzQ@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: "libaokun (A)" <libaokun1@huawei.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-stable <stable@vger.kernel.org>, 
	Hulk Robot <hulkci@huawei.com>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Sasha Levin <sashal@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 7:13 PM libaokun (A) <libaokun1@huawei.com> wrote:
>
> =E5=9C=A8 2021/9/14 7:23, Nick Desaulniers =E5=86=99=E9=81=93:
> > On Mon, Sep 13, 2021 at 4:00 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >> On Mon, Sep 13, 2021 at 2:15 PM Nick Desaulniers
> >> <ndesaulniers@google.com> wrote:
> >>> Sorry wrong diff:
> >> Well, this second diff was seriously whitespace-damaged and hard to
> >> read, but while it seems to be the same number of lines, it sure looks
> >> a lot more readable in this format.
> >>
> >> Except I think that
> >>
> >>                  default: dividend / divisor);
> >>
> >> should really have parentheses around both of those macro arguments.
> >>
> >> That's a preexisting problem, but it should be fixed while at it.
> > Ok, I'll send a revised v2 based on _Generic; Rasmus can help review
> > when he's awake.
> >
> >> I'm also not sure why that (again, preexisting) BUILD_BUG_ON_MSG()
> >> only checks the size of the dividend, not the divisor. Very strange.
> >> But probably not worth worrying about.
> > I sent a not-yet-applied diff of my not-yet-applied diff.  I was
> > playing with this last week, and IIRC we had divisors that were less
> > than 32b being promoted to int. But I'll test it some more.
>
> How about deleting the check_mul_overflow in the __nbd_ioctl as follows?
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5170a630778d..f404e0540476 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1393,7 +1393,6 @@ static int __nbd_ioctl(struct block_device *bdev,
> struct nbd_device *nbd,
>                         unsigned int cmd, unsigned long arg)
>   {
>          struct nbd_config *config =3D nbd->config;
> -       loff_t bytesize;
>
>          switch (cmd) {
>          case NBD_DISCONNECT:
> @@ -1408,9 +1407,10 @@ static int __nbd_ioctl(struct block_device *bdev,
> struct nbd_device *nbd,
>          case NBD_SET_SIZE:
>                  return nbd_set_size(nbd, arg, config->blksize);
>          case NBD_SET_SIZE_BLOCKS:
> -               if (check_mul_overflow((loff_t)arg, config->blksize,
> &bytesize))
> +               if (arg && (LLONG_MAX / arg <=3D config->blksize))
>                          return -EINVAL;

64b division is going to need do_div(), yeah? Besides, this is likely
to pop up again for other callers of check_mul_overflow(), might as
well fix it.

> -               return nbd_set_size(nbd, bytesize, config->blksize);
> +               return nbd_set_size(nbd, arg * config->blksize,
> +                                   config->blksize);
>          case NBD_SET_TIMEOUT:
>                  nbd_set_cmd_timeout(nbd, arg);
>                  return 0;
> --
> 2.31.1
>
> --
> With Best Regards,
> Baokun Li
>
>
>


--=20
Thanks,
~Nick Desaulniers
