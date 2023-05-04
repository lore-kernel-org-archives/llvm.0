Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849BA93E
	for <llvm@lists.linux.dev>; Thu,  4 May 2023 17:24:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-959a3e2dc72so132889066b.2
        for <llvm@lists.linux.dev>; Thu, 04 May 2023 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683221049; x=1685813049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjowc/gRt/pdKPtgyZqkM5OSn7+TcLpFEiLZrM6tdM0=;
        b=hEQ+VutEhKDPZsOTY3XnPqGUM+jUOkVftCAYeNoJ4w3CBdvYz51hSrfFPk0ItbcABz
         d5+QMeVED0eT+5bv3KPIY9pNk5a73FBGTDiBm3+TJ2Ox5W0Lb6EnhHjXGnvPD98mvCJw
         BME8+zc6On0S4WeykifZ3C8b1Io1CQrXYoYoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683221049; x=1685813049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjowc/gRt/pdKPtgyZqkM5OSn7+TcLpFEiLZrM6tdM0=;
        b=aUn/g8wVXDEzCZ71NtLcxBmQ5dVHWkjEGycvjcqTvwN1H/b6RFngrhtk8kyroq1iNz
         BbW1ux3ee0HuR8WKJlGubQ50jITx2HZ2s/GaKLyFnpb61HXDScyVKhUu8Eer4OUueYvP
         i4x9z/XGZg4IWrqXP2683BCgrecimXiZOwr4CdWLBAMdyUfmpns45Z5CeXCmfVpC+YO4
         CLOmFqW/6cLq+6kZeZclQoGcmjnCZXxaPgRsaEkTXXl/mc1h3KeGKFcLMf7vwfcvfLbr
         B8xY3BEKwACwvdVQDyVRrBLTRxWe966+OZ+TC24lvvy16uAz2+ixGtzAtNvKKbUmYbxr
         Qopg==
X-Gm-Message-State: AC+VfDxmMONpUuLKE1+IDj7/azeQ2SrBZ0Bv7g/0CpX7KCrhCnpl+Rd4
	ls3eIAp+Bmfmf/TTX90atuQo8f7jzsbrAl5/tBbN+F2+
X-Google-Smtp-Source: ACHHUZ5xcKQoSrLR8tEiZMhVEhzgVoDYx9oyvL5hAStG5J0ZrxpJGcfd0Xqw2wb32/IEczwmw11SOw==
X-Received: by 2002:a17:907:62aa:b0:961:2956:2ede with SMTP id nd42-20020a17090762aa00b0096129562edemr6883200ejc.44.1683221048759;
        Thu, 04 May 2023 10:24:08 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id bp23-20020a170907919700b0094f44bdf7acsm19140538ejb.57.2023.05.04.10.24.07
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 10:24:08 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-958bb7731a9so135239666b.0
        for <llvm@lists.linux.dev>; Thu, 04 May 2023 10:24:07 -0700 (PDT)
X-Received: by 2002:a17:907:3205:b0:90b:53f6:fd8b with SMTP id
 xg5-20020a170907320500b0090b53f6fd8bmr6290287ejb.31.1683221047723; Thu, 04
 May 2023 10:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZFI74eeUzVPKhi4f@matsya> <20230504150624.GA1000378@dev-arch.thelio-3990X>
 <ZFPPucb9VNLB8r8v@matsya>
In-Reply-To: <ZFPPucb9VNLB8r8v@matsya>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 May 2023 10:23:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi-ve0h02vsNrzuox58rLXSbzcjay+k=XnUueWRh6cO2Q@mail.gmail.com>
Message-ID: <CAHk-=wi-ve0h02vsNrzuox58rLXSbzcjay+k=XnUueWRh6cO2Q@mail.gmail.com>
Subject: Re: [GIT PULL]: Generic phy updates for v6.4
To: Vinod Koul <vkoul@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Phy <linux-phy@lists.infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 8:31=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote:
> Sorry between vacation and travel, this was missed.
>
> No worries we have process to deal with this, so this shall go in as
> fixes.. I will do the needful shortly

You need to do it *now*.

You should never have sent the pull request to me in the first place
if you hadn't checked the status in linux-next.

The point of linux-next is to find failures. And if you don't then
*care* about the failures, then it has all become  entirely pointless,
and it's effectively the same as if it had never been there in the
first place.

So this needs to get fixed *PRONTO*, and it needs to never ever happen agai=
n.

Because if it does happen, I will consider your code to effectively
never have been in linux-next, and thus just not be an option for
pulling.

This isn't debatable. You don't put things in linux-next, ignore the
reports, and then send things upstream anyway.

If you don't have time to check the status of your tree in linux-next,
you don't have the time to do a pull request. That's just how it
works.

                      Linus
