Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42412396D25
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194127; cv=pass; b=af2m0XSDqvJrpbwRMbPbS1aXjEKixX7Y8AKnX5MyuD9VINfKMYH69Z9+vMKiMnGJjrN7ZeqOXKeb+fM0ICqTIgAFd18w9FhejCiETVouP9SWsFuF4k5zgsHGBDLavndG6rIJpSClMUE+I1Vsppga96/TFNHJXW/31CXhxLIV+d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194127; c=relaxed/simple;
	bh=sj2FS3py+P6ghioGl4/Lb8GGlbT9xXdYa6q6BQWvjtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asa8iYPNjx7ti5iIQQefJRSZEUZWgXtMU9ownZ3RwT4N+/IGLNFyHmKONPjwQTSVYBIHEwmDT9KRfw7t0XOshPe4odEDgutv0Ye0mijsiG/MLp8Ko6hL/LfbAK1qX9W/WM95htGhHDNSspAdbmvRidxoeLGXn9zyc9PoPdS5OIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R48pi0+k; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R48pi0+k"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so1194857666b.2
        for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 09:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781194125; cv=none;
        d=google.com; s=arc-20240605;
        b=lYqo6AnPjJQ+DglZCyMc3mik+8OEuKn36BJA3+XrWWrMky+KvfPeL4imdG+Ht7ZKrY
         H985onlfPQ0PeL64CpkEg/nnULSPDrca1kCwFVqfQPgcY5DD+LDqyoP+Ga0m9m7R51Rs
         RKxe9r9jWgf9X2BPPGdA4VmEX+GeVouLEyGfLxAjgo4NqYsJ4gR7bbuZXUpnWyQM2/2B
         sBQSH3ZB1hhG9UAhbjsOtDA1J2kBvCTjvu49nPcK7ccXhDj2Rk7fqMD3tL0oMTj724GR
         ON/ZnJwkgTAF7tFSUi780D1AyMylGqOj8FXAgwgiJOhCNFT6EhemWRopS1eN5Kq1ktq0
         UIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BPhvT50VQuK2+y7zbXq9J0IJLvfRaU5Y2kOZciKetk=;
        fh=zA8m62LWzMiRJQ4MI1ngSLd/KodBZR3O3JSnwdKGASw=;
        b=V5p5ATSSPqUq8xXbh+gWbzI4dRAn/RLNOB9YEAeSYSV6VYeiFrSAWLoRhJq/LFhs+4
         Bk16i+fek/wFpXkGu47CUU0o8Q96Wc1hR9YT8hMEfPuSdDEq/oSZGhX4yz4513lrLLAM
         GbYw5QbyEJZsQm1CVPft3tv2mPlFaeD0TInrKRiQ7d/gLhr2a4cd8/P105UnmXX8Tr6a
         NrnPsHXBydSThxng+JuE62omKGefu/65lSpg8Z5MD6BHTedRTaDWpx+Tg1Q5TtHy+uao
         kGbBlZbXQgnUsEuagKqFx0SFQDmsBSuS5Yu+2IfJv87/g5FRXoAuKVmdO8etO8asW+hL
         YBmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194125; x=1781798925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BPhvT50VQuK2+y7zbXq9J0IJLvfRaU5Y2kOZciKetk=;
        b=R48pi0+kED1K9uuEZVyLa1fYdR/oPIYI/NH9PFyHk9vqz2UiSjBivAPlA8fGusaVXp
         YRDDcizmrkxlfAcIP+Z5+hSsKKfntlkfOoYicLK6oIb6KE7axEWC7jcpFc1O0oXYsh/y
         OGc1Bz3H+I5MbI1PEuhZQXwJ946FQsaNz+neNx0gg0f1PfIGdHRYmn78UHVO9JDlTOZM
         08H5iamzPGXWzyNhEMbt4uN+XrlT+nCiHRXClvcv9+qTidRbZZ8ApdNkpXy4Uw03qe9q
         sClGRNQYEv6REyhF2BX+8e/WJsqt3TBdTaZhaYCQHGcm0GiAmqbuvx0KcZbOTYvEV3pW
         /Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194125; x=1781798925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0BPhvT50VQuK2+y7zbXq9J0IJLvfRaU5Y2kOZciKetk=;
        b=rwWPIITO4QMi/Kt7gyGQKjKCBLptYfmHIBw1Civl1LM1DO9bbbGTIG2FWVlR2nJdhs
         GSvNSPKOHpEe2RaYUGSw6mU0+POoV/GaYr2BOvkUjy6gH/UomIOGxBjcKUJS2C6K+KCO
         kQ/MxRTb3DTariHzpIfhE+ZA5RbAoLfcrkLHYsIGVAyRBGFHj228N7MUNe6OadM6ucpD
         kJnSlAcAB4zC4kAEieSCdRsewBAjjuJJ1wv2EOi680n2nK1BlnLwWR7+/TSL5sB6lkaU
         iUQ/mb2n728vFrcAmZDARc2nHXy16Leh5sGE5g2QmSVjhLj6wEfcRXOzEPkxrZZT3ZPU
         1/xQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AyFFPHT8At0CGHsnd2UOCSLGhSUCs/f2n+17cs0iYJqTA0qmL3CPXGbQot5hDLBhZvYgq@lists.linux.dev
X-Gm-Message-State: AOJu0YwDNTqFfagmRwz4FPt5vwamxVg11cVJ8WLmFcYQnonnWXUj0YXd
	t9qochyfELmQkfGTZCJv3QpeGEt8ZpRCE1D0GTKbRHmytNmSuj6PWBJ1VhGWa14NtOta9Ekk1Nr
	qk04nihNQ5HBVGe9prL1EJtdKyrTK1Vo=
X-Gm-Gg: Acq92OGkdDZIqhFdEQbb+nHZQeuxl2wGAFeDiJ6iQe1ByT4L5IYzPU3pvJ5ffF43rkR
	C9Fl6nHow0Zs+iFOTaEmAHMxx3QVLrBmRnwnLfAEkV0h8MVekUpLFyizo8DcnXiLF8obn5WQqfE
	9RnfeeFkBM+MuMsfXHQz7mGoUPJ5uXHhUM1QuDMwMFWLoYgbsXri0jJJKwjhw0IpukASTQx1j7c
	x4LcovATKr+ec2qrNE14CMJs4KZtluSM+T4ouiNejjxyzo4vdHuhylqIYVDJs2F7pLgn0T9NliE
	bJfcIZ77sTr4tB8qem1PB9It0B+DqmRq2WqRg2EUTFecXqm+AoT79Ofs6FgH3ktXyd5GT8gkyPF
	eKaRBB/3tHZLwjWLhIl8gsT3ozis+OXdCAHyLzv51BEg5kddmKO6kJV2J
X-Received: by 2002:a17:907:1dd8:b0:bec:f0bb:66f5 with SMTP id
 a640c23a62f3a-bfc87c0cb2bmr131123066b.30.1781194124409; Thu, 11 Jun 2026
 09:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611035245.13439-1-rosenp@gmail.com> <20260611035245.13439-12-rosenp@gmail.com>
 <airV8Wm3yyY4hTQP@lizhi-Precision-Tower-5810>
In-Reply-To: <airV8Wm3yyY4hTQP@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 11 Jun 2026 09:08:32 -0700
X-Gm-Features: AVVi8Cd07wPKVB64G5JpfGCeLGfe3Dlz_RdVLBiqMrIH7Js6qZaJUTS5GxMh3qw
Message-ID: <CAKxU2N9QNMo9u0s_MfYG8qfiWsHqwuB9ax_qbf6gbxA0syOiaw@mail.gmail.com>
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

On Thu, Jun 11, 2026 at 8:36=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Jun 10, 2026 at 08:52:41PM -0700, Rosen Penev wrote:
> > Convert fsl_dma_chan_probe from kzalloc_obj() to devm_kzalloc(), tying
> > the channel lifetime to the parent DMA device. Remove kfree(chan) in bo=
th
> > the probe error path and the remove function.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
>
> If use flexible array, needn't allocate channel
Not sure what you mean. A regular array avoids that as well.
>
> Frank
>
> >  drivers/dma/fsldma.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> > index e4a3315a7d9d..0df09789187d 100644
> > --- a/drivers/dma/fsldma.c
> > +++ b/drivers/dma/fsldma.c
> > @@ -1114,11 +1114,9 @@ static int fsl_dma_chan_probe(struct fsldma_devi=
ce *fdev,
> >       int err;
> >
> >       /* alloc channel */
> > -     chan =3D kzalloc_obj(*chan);
> > -     if (!chan) {
> > -             err =3D -ENOMEM;
> > -             goto out_return;
> > -     }
> > +     chan =3D devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
> > +     if (!chan)
> > +             return -ENOMEM;
> >
> >       /* ioremap registers for use */
> >       chan->regs =3D of_iomap(node, 0);
> > @@ -1200,9 +1198,6 @@ static int fsl_dma_chan_probe(struct fsldma_devic=
e *fdev,
> >
> >  out_iounmap_regs:
> >       iounmap(chan->regs);
> > -out_free_chan:
> > -     kfree(chan);
> > -out_return:
> >       return err;
> >  }
> >
> > @@ -1215,7 +1210,6 @@ static void fsl_dma_chan_remove(struct fsldma_cha=
n *chan)
> >       tasklet_kill(&chan->tasklet);
> >       list_del(&chan->common.device_node);
> >       iounmap(chan->regs);
> > -     kfree(chan);
> >  }
> >
> >  static void fsldma_device_release(struct dma_device *dma_dev);
> > --
> > 2.54.0
> >
