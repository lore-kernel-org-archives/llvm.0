Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86314317153
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 16:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195830; cv=pass; b=aFxr2D65CC/tXVIr2L2ZGGKBhRAQKlTuSZCfCZVZRa8LirxqFKeyvXsL00YKGZWjitKInlyEqKM995xmObFONJ/WIYym1EU/ckplhOQ0fEOGCz10MM6rdrnG2USiO51idzSKN3oEgVWn4WD5dDWFGmihiaNhCFEy1M5Hc7qs1rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195830; c=relaxed/simple;
	bh=uHfnAHi9x6mf9wjFGtM7b/sY/5O2/QimffWK1gabFXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GV8/OFUvYj80l4KP65sWlbPSRlglcaBtZqjha6Ekmqz+8RH5QxuJRf9s9XJG1if8phe02FAsf9m0wK08s0YNKyYH5rVLQVNMhDtNIYWB5/7traSFU+ycVbOKECou6lO24S0Bv7ulTSDSbW29a5fQT8ftCCdTJWnhkUYzQpuFv/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8cAD4Yg; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8cAD4Yg"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so47202a12.3
        for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 09:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781195828; cv=none;
        d=google.com; s=arc-20240605;
        b=lmYoJ7ozFEkVowOKnYoXQYYop/JfukHwV1xsORL5ToBChMWcpTy7kHuvxTvj8ZqAAP
         2kBZiNTJRGwmFxcYbFeUvPgL9kF+fMQgGHAS34bKR/ZJMMvibXr2/t9fVj4tULp7uu1S
         CvB43BSfe2SO9hZb74zrwYEUVqR6aX9pu8Y4ME+KgEiSyRTe0ulvSBb5S3loEICohO0n
         8WpYiIiIQ/o6BnLoaMdoD6rCvOu99AoHVO4UvZs0FMA0tUvZqTX70w7+ugCtJs/N4tfE
         xnJsVVHeo5CPnvZGkpVRvQ8HQG7wWLPFKn9xGhUJ+PJLPEhucjvhwjCDFP5ttLf29Rxc
         4EKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4DStYhYQsSipTicO46WKSDE7hgZDuh6T94LBB/5C16M=;
        fh=Od/V5TnOnuMCSPe9iG0B4xMaV+h86+KENLzIF4eV+K4=;
        b=QE9EcVLoUOdSx+qwX23xNLqRNZ6S7391kaAHFnwx1vLeLpk/imgUuQWjr31wGviGzg
         7aqLQHkPdTHsyVW/Ep3QKxVaFMNq/hF4H788c2juKoF4XiaPAzs011uCyXiJ9NuH+378
         g4hDRCAYLmiM09GpQoP8C+MiC0zCD9tGUkmh0fJkY9AI+o4ihy0jtPlUMUuWWellPjDb
         cJ2zMmLB+GG+EPVG8DleOWnmyTk1AHGvgXY4EP4eJgmmE911VrKTjWb/bVdydb//r3/6
         FG3q9T5vTinD08U2kZ/BvQyaiky6W7Cpudh+g+yhc7UNoXpxwwMg/VbqXO95myg2aEuf
         4wTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781195828; x=1781800628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DStYhYQsSipTicO46WKSDE7hgZDuh6T94LBB/5C16M=;
        b=k8cAD4Yg0gzESBo1XB52l2tIpt5mk/jFLSW8yR75ueIx8Bt3MvnlSTSvLAm4aL8bBv
         vVhQlhWWtQfiQLq4hL1XVShEZpuYp5q/ziKrMj4qgIzAHyrnSTYlVjzhNQ9+S7PQcrOK
         cfLSbWAIKjxbAv/JJ9zH3KLKyfYtwDzefgBFo3LDIBcRfbk/l86QYyEyMvyUHtxwT5ZY
         X0f15uV73y0yRWTtCng2h5Pxqt8jzOGSbwfqxyudVM/mPwnCBA2GAIcPlJ5Sp0ptqsZD
         SjMu1iIM5Ov2n5w5oFkuYmk/7gMn7SxrxG9+khE3/CnYQGa54xKBdQr0D8Hc4LTR/4QC
         muqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781195828; x=1781800628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4DStYhYQsSipTicO46WKSDE7hgZDuh6T94LBB/5C16M=;
        b=VCC1lK3PMpmS9Rc4Y64k2BSHjIPPHRYpYLUQ5xq8J1tjQaVxdKBYcKCdEiihbYZFTy
         nYOuV1MV1mCVSk7S/eoaIC9AQBg8A3KJXShthJWBJbrgBt0HG+Jh8M//pnwev4SzHtwi
         9g5HWJ/Q41FQt1IoIi+bDEcFUmt01fh1xJ8PuMtd469vBurKFEXq2jESn2vCoEWvJCkr
         ++RSE6EkmSIwvldz/viMvBsFfbEy8VG7zwaZYEO1FrzwzprwEX33yz3r6yBZlr3FKH/+
         Nzxr08TW5J9lxRxzUNpa/mGN4HqsSkZcSRrrRfYpdj0OQlEcNMsgz5YifuwVdU6iT7qR
         H/ZA==
X-Forwarded-Encrypted: i=1; AFNElJ9g6MtsEuN2fovrhiw3lyZjopl2xiBodh82TJrsELvJ5rZl1CpBTDapcELLmXxmzq0lOEqw@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtrtk77momosG4WkX/bNVK6aFJuYLBjqRbphytYFnBAsK1J4dK
	dooMkkLiIWUvUaNz7VYEWkGzOnTp/qCZ3w0jrFrnPtV594sGm0oXShINrU84bYyI4KXi7pfrxXV
	CMS15UFHJzHLlEJsOEM1ZQSPYMlFiIbo=
X-Gm-Gg: Acq92OG/RcBdo7DMB+C79yibQIz1exL/ONkDxzYJgxTKNA7648MmGrFgf1YcJHMdL5d
	JpRcrYOJ2/EyIvUwoupMqLZs2e7r+MUWisyCcUZBAXJ+lqfxKdHx6DE0ty8bAtBisLbCQ8mt2Be
	GmDh3T1VLdisq5uayPGiYyDY0hBaMhIABppetY+HnoQFLzCRf+fmfl5/6RKAfTLJnREyj6FtenV
	Plsrn9wt0z7lM3ajD7YRXYAHnYToLOBSwlfIGP6U+hL/GJH0zG6rqBT6Y3FctSR+AOjuJAJGUzq
	4AshhH+4d0djHl63gTF+I19ZStCKXX1hLCvWUMA3u1MGHV9pg8d0ZsC5NW7AYLsXdQsaXkAnzaB
	BY4vig8rbbAmgjozY52R3iLBqzeC6hdk9/wehVgfUnp8+nM/9v5MmHGrD
X-Received: by 2002:a05:6402:358d:b0:687:1c98:a19a with SMTP id
 4fb4d7f45d1cf-6930e2b5e6fmr2054888a12.13.1781195827845; Thu, 11 Jun 2026
 09:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611035245.13439-1-rosenp@gmail.com> <20260611035245.13439-12-rosenp@gmail.com>
 <airV8Wm3yyY4hTQP@lizhi-Precision-Tower-5810> <CAKxU2N9QNMo9u0s_MfYG8qfiWsHqwuB9ax_qbf6gbxA0syOiaw@mail.gmail.com>
 <airjMsF-YPGSt3-S@lizhi-Precision-Tower-5810>
In-Reply-To: <airjMsF-YPGSt3-S@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 11 Jun 2026 09:36:56 -0700
X-Gm-Features: AVVi8CdY6DBOq_Kf9XCWgkvqCE4_jbHsMoVYEFsNT-EymPwcj5ekivftZTICTTw
Message-ID: <CAKxU2N9aaQhtmYjA+sQqSmgGDoeqEJc=8WFppWN=Q-i=0oPRMA@mail.gmail.com>
Subject: Re: [PATCHv4 11/15] dmaengine: fsldma: convert channel allocation to devm_kzalloc()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Zhang Wei <zw@zh-kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE DMA DRIVER" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 9:33=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jun 11, 2026 at 09:08:32AM -0700, Rosen Penev wrote:
> > On Thu, Jun 11, 2026 at 8:36=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com>=
 wrote:
> > >
> > > On Wed, Jun 10, 2026 at 08:52:41PM -0700, Rosen Penev wrote:
> > > > Convert fsl_dma_chan_probe from kzalloc_obj() to devm_kzalloc(), ty=
ing
> > > > the channel lifetime to the parent DMA device. Remove kfree(chan) i=
n both
> > > > the probe error path and the remove function.
> > > >
> > > > Assisted-by: opencode:big-pickle
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > >
> > > If use flexible array, needn't allocate channel
> > Not sure what you mean. A regular array avoids that as well.
>
> Yes, consider only max 8 channel. Now the common method is
>
> fsl
> {
>         ....
>         int chan_count;
>         fsl_chan chan[] __count_by can_count;
> }
>
> scan children node to get total number
right. allocation happens on two compatible strings currently. I guess
it's safe to assume one of each is present in each child.
>
> devm_kzalloc(..., struct_size(fsl, chan_count)) ...
>
> Frank
>
> > >
> > > Frank
> > >
> > > >  drivers/dma/fsldma.c | 12 +++---------
> > > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> > > > index e4a3315a7d9d..0df09789187d 100644
> > > > --- a/drivers/dma/fsldma.c
> > > > +++ b/drivers/dma/fsldma.c
> > > > @@ -1114,11 +1114,9 @@ static int fsl_dma_chan_probe(struct fsldma_=
device *fdev,
> > > >       int err;
> > > >
> > > >       /* alloc channel */
> > > > -     chan =3D kzalloc_obj(*chan);
> > > > -     if (!chan) {
> > > > -             err =3D -ENOMEM;
> > > > -             goto out_return;
> > > > -     }
> > > > +     chan =3D devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
> > > > +     if (!chan)
> > > > +             return -ENOMEM;
> > > >
> > > >       /* ioremap registers for use */
> > > >       chan->regs =3D of_iomap(node, 0);
> > > > @@ -1200,9 +1198,6 @@ static int fsl_dma_chan_probe(struct fsldma_d=
evice *fdev,
> > > >
> > > >  out_iounmap_regs:
> > > >       iounmap(chan->regs);
> > > > -out_free_chan:
> > > > -     kfree(chan);
> > > > -out_return:
> > > >       return err;
> > > >  }
> > > >
> > > > @@ -1215,7 +1210,6 @@ static void fsl_dma_chan_remove(struct fsldma=
_chan *chan)
> > > >       tasklet_kill(&chan->tasklet);
> > > >       list_del(&chan->common.device_node);
> > > >       iounmap(chan->regs);
> > > > -     kfree(chan);
> > > >  }
> > > >
> > > >  static void fsldma_device_release(struct dma_device *dma_dev);
> > > > --
> > > > 2.54.0
> > > >
