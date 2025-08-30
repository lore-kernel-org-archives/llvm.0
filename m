Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE1522A4F8
	for <llvm@lists.linux.dev>; Sat, 30 Aug 2025 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756547316; cv=none; b=sjc3gIhwQEwE3TpbCMgQq0NR1ysg+L4p/+HW4AdQBaZxV1CQCK6w9LDebBBNl3rsLTN9cSkqJgiot6hYZ5xnQ7qr7nYHsdkx9tghbgQGRPSVbz6EsjkI14yHFKWX9kzCtL2W0OSGvdzqW0OuoxApF7yT8jZ5JECS/xKRtvwzmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756547316; c=relaxed/simple;
	bh=k8rdPyp5NnXLNmLAM5692d7carYniAWw+sO8SLajSu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLcbxoWZvG+QEV32GLIm1cX6xuNEoyFrs7vIfkIfcynSsfGckRxwCip3GuHQH5QMFmX8u0as56y/hMRr6VGU2TJOueXBF4jzUeABpyFdFy35Y5whZQLdX8YbOD9GvOpCpzHCl/ZVc7TkOoMjErzBoJzI4yjnPfRYsbkeEitOzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WJvv16L5; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJvv16L5"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7ff7e7e2652so8019385a.0
        for <llvm@lists.linux.dev>; Sat, 30 Aug 2025 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756547314; x=1757152114; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O53sSv19BO8/CcZChzTjPzbh29PlzUTaZHAX/6sSM9k=;
        b=WJvv16L56QsHf+yQ+KaMOkCV3s5XfEUpk32hCbioaUrFxcYGoB4TkSeaSDl6XQ1E4q
         qR7JXDtlzlqlWeN9ACp2kM6xITrnrzfLets4pfThM1e/b5/WQEo/DLaG/DJuspyDyhRD
         O9mRcPWR7zIMR5A3zIyYW7uGV8Ll9vz1XoLQ3JV53EfoW1JyCM1fvidg1VHXXwNv6kso
         8VEO32L4uMI3BVF4thMQElDl5AWAHb73e47pLowqBF6EhsF3j3HHoENKG4Y+CDp1VDlJ
         2sDdzYsW2zaHA0pcp9OETZ/ZedKeRQ7ULQVBVe1JTU6bA7RPGUXVcCkTswDT99lP4zP7
         W0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756547314; x=1757152114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O53sSv19BO8/CcZChzTjPzbh29PlzUTaZHAX/6sSM9k=;
        b=VqW989CTjmevKvENxbIrgm/y2jyXdrHqrwKAJbyhU47JncA6E5sKLFuaLyBwfqELwz
         KcQ86TCdWochKeDHc5X2whAgp/GK8d4CZOpE+0tjleALkhLL39jjhrqInG15Gy52sDiY
         hT3JfHtbTfcoLqVFmZB+jCXlUJSeG18iFTWF9zfcvJjKLwy/qPeoigt0ucoMcGh6M7m2
         NndcZoRDuZ5ZHfhBLGCUWJvsN2siCravRO8gmRNfkmXDVVD351mNaKOOqfocJn1ay6tc
         lN5Xd3lEyUxkVrjtx08c/A5/9klWsC7tvpxHMw/z1mXmHkjQuEVaRRBBYxTGuXtrlLlH
         IGog==
X-Forwarded-Encrypted: i=1; AJvYcCX7jIOEcocHqzcZjhNYAlW6evtMkE2IAwyYO6JVJ6u2Z0pT5gsfd9ZZQPw/o0Uk97/oJTDs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz14Q1DwlCwtBd0t3489s54V/GJUqq+36zc+dPgGAwRDfbpLVkU
	3T0fjeZhEE8/Q0/R8xc6e6qP0YGFrIIhmmKaBwRoRUevhMjekYLWMsBmgBraXmh7xkPNzOSXDmx
	4UcUA7ZwmbvPcc5Fwivr0CmTDvw0MukNBsT0KQkloUQ==
X-Gm-Gg: ASbGncv09UkrO6kwXqjuGgVFPUjmG98gMBQ0834XCqufsgnrDJEClDQIuHyoccAQWLv
	aIg7b+BM4tdQYhWVILdgFefUbzDPEKZVsY3E9oWoVcK0L9BLLVrcpaVN8MBYKQiHnzLr2Cg8/Du
	OAXaFkbp7tk8PAtTXIDYxOKmH9zk+4miID9+PtIPswaBjTL9D1tOe+u2NFzYndnuwwJetUgI/q2
	85cVJKFSigNH6JD
X-Google-Smtp-Source: AGHT+IGE0Py88CGitXRrUiODaco5VRpXPPZYcuL5qgF4c2qTNFu2t6a/n3uB1c8tKAquQX4FMnnHmvhUsQyxAUhJNQs=
X-Received: by 2002:a05:6214:d8f:b0:70d:ee9b:9cf3 with SMTP id
 6a1803df08f44-70fa1b8793emr30990516d6.0.1756547313850; Sat, 30 Aug 2025
 02:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250829131346.3697633-1-anders.roxell@linaro.org> <20250829232132.GA1983886@ax162>
In-Reply-To: <20250829232132.GA1983886@ax162>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Sat, 30 Aug 2025 11:48:22 +0200
X-Gm-Features: Ac12FXyHu3hHuGLZl4KhxlWVoLXmzpAgyCiaFhzljq-f-0aBvo2YQhrSZWoV0xY
Message-ID: <CADYN=9JgDeXByZy7PhUyaY091775G0Md+QvoFMb7AZa9vcKQqw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ti: edma: Fix memory allocation size for queue_priority_map
To: Nathan Chancellor <nathan@kernel.org>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, dan.carpenter@linaro.org, 
	arnd@arndb.de, benjamin.copeland@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 30 Aug 2025 at 01:21, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Anders,
>
> On Fri, Aug 29, 2025 at 03:13:46PM +0200, Anders Roxell wrote:
> > Fix a critical memory allocation bug in edma_setup_from_hw() where
> > queue_priority_map was allocated with insufficient memory. The code
> > declared queue_priority_map as s8 (*)[2] (pointer to array of 2 s8), bu=
t
> > allocated memory using sizeof(s8) instead of sizeof(s8[2]).
> >
> > This caused out-of-bounds memory writes when accessing:
> >   queue_priority_map[i][0] =3D i;
> >   queue_priority_map[i][1] =3D i;
> >
> > The bug manifested as kernel crashes with "Oops - undefined instruction=
"
> > on ARM platforms (BeagleBoard-X15) during EDMA driver probe, as the
> > memory corruption triggered kernel hardening features on Clang.
> >
> > Change the allocation from:
> >   devm_kcalloc(dev, ecc->num_tc + 1, sizeof(s8), GFP_KERNEL)
> > to this:
> >   devm_kcalloc(dev, ecc->num_tc + 1, sizeof(s8[2]), GFP_KERNEL)
> >
> > This ensures proper allocation of (ecc->num_tc + 1) * 2 bytes to match
> > the expected 2D array structure.
> >
> > Fixes: 2b6b3b742019 ("ARM/dmaengine: edma: Merge the two drivers under =
drivers/dma/")
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  drivers/dma/ti/edma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> > index 3ed406f08c44..8f9b65e4bc87 100644
> > --- a/drivers/dma/ti/edma.c
> > +++ b/drivers/dma/ti/edma.c
> > @@ -2064,7 +2064,7 @@ static int edma_setup_from_hw(struct device *dev,=
 struct edma_soc_info *pdata,
> >        * priority. So Q0 is the highest priority queue and the last que=
ue has
> >        * the lowest priority.
> >        */
> > -     queue_priority_map =3D devm_kcalloc(dev, ecc->num_tc + 1, sizeof(=
s8),
> > +     queue_priority_map =3D devm_kcalloc(dev, ecc->num_tc + 1, sizeof(=
s8[2]),
>
> Would
>
>   sizeof(*queue_priority_map)
>
> work instead? That tends to be preferred within the kernel so that the
> type information is not open coded twice and it helps avoid bugs exactly
> like this one. See other uses of devm_kcalloc() and "14) Allocating
> memory" in Documentation/process/coding-style.rst.

Thank you Nathan for the review, that makes sense. I=E2=80=99ll send a v2 s=
hortly.

Cheers,
Anders
