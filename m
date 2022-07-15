Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84286640
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 10:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75708C34115
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 10:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657881038;
	bh=3d2eNOJ73y293lK7nbeTw+1aRNDgT1On5Kaxxmiv3bw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CbMDxzYHlLhRseYjVB6frWMrAR4DaiB65KojKTv2zN40omF4Im0C97WImBiFUWhSY
	 5B9Ro47TDoQ79cdDTQOwRyJZhVLxLCj0Wbx/YoU6VFqoNrMN4kUXoTZKV75jk95DQA
	 Bzbi9y8Io2LfoXqXtrQlPUKpZanyQhr+rgZchG99rDLZ9RNYn9OKQTJvZUMl488kUl
	 uICPaMeG0jMT96LA2bCSo3Wz5ZKGnj8lp1Zse9OWJVPrZ8GGNqolVvulc5nuMrpjqe
	 TPfJKfp18Hn/3fmvNm4hoHgP2DgcejWWeDgcz8Sws8tTbASAkuhCjAUNktWM9ymHvU
	 lrpd6KMjWMJZw==
Received: by mail-yb1-f170.google.com with SMTP id e69so7788620ybh.2
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 03:30:38 -0700 (PDT)
X-Gm-Message-State: AJIora+OKKA4G/ks89nsK+2US0tvw735+kVa2k4kn3hk6sQcDEK8Umko
	bm457NtcqSLSqtawNo2ZWwvkrhHG2DozxPrRQAg=
X-Google-Smtp-Source: AGRyM1ss/jk62QEyXPFBUlsYxdXXV8TIvayM/2iyZfCzVopjh5bTNvVugChcrTKT6UOczsOo5eoobk8rndLSP2QoepA=
X-Received: by 2002:a25:8b8b:0:b0:669:b37d:f9cd with SMTP id
 j11-20020a258b8b000000b00669b37df9cdmr13245803ybl.394.1657881037493; Fri, 15
 Jul 2022 03:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X> <CAK8P3a32LO_EdaWM12OZu=ibpQPUtdtHAg9OMKqj=D6OUd=chQ@mail.gmail.com>
 <CADVatmPnQofm+0ar2PRYpw2oSKhSSL5ZpeMi5dkSZ=yumFO-fw@mail.gmail.com>
In-Reply-To: <CADVatmPnQofm+0ar2PRYpw2oSKhSSL5ZpeMi5dkSZ=yumFO-fw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jul 2022 12:30:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3sOsVZ+Q9AVjCcABkud0r3wCo6fBuHAT7m=i7gMV42_A@mail.gmail.com>
Message-ID: <CAK8P3a3sOsVZ+Q9AVjCcABkud0r3wCo6fBuHAT7m=i7gMV42_A@mail.gmail.com>
Subject: Re: help with clang build for mips
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 15, 2022 at 11:59 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> On Thu, Jul 14, 2022 at 9:11 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Thu, Jul 14, 2022 at 7:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > On Thu, Jul 14, 2022 at 05:39:39PM +0100, Sudip Mukherjee wrote:
> > >
> > > Unfortunately, I doubt there is much interest in that work, given MIPS
> > > as an architecture isn't being developed anymore. Might be an
> > > interesting hobbyist project though. It is probably best to just test
> > > configurations that work and make sure that those do not regress. Others
> > > are more than welcome to weigh in though!
> >
> > I think there is still enough interest in the newer loongson64 mips machines,
> > which should work with clang, but the loongson2e/f machines are way more
> > obscure now. Debian dropped support for these a couple of years ago.
>
> And, here is a complete list.
>
>  unknown target CPU 'r4600'
>  unknown target CPU 'r5000'
>  unknown target CPU 'r4100'
>  unknown target CPU 'r4600'
>  unknown target CPU 'r5000'
>  unknown target CPU 'r4100'
>  unknown target CPU 'r3000'
>  unknown target CPU 'r4100'
>  unknown target CPU 'loongson2f'
>  unknown target CPU 'r4100'
>  unknown target CPU 'loongson2e'
>  unknown target CPU 'r5000'
>  unknown target CPU 'r4600'
>  unknown target CPU 'r5000'
>  unknown target CPU 'r8000'
>  unknown target CPU 'r4100'

I wonder if we could just change the kernel Makefile to fall
back to mips2 (r3000), mips3 (r4x00, loongson2) and mips4
(r5000, r8000) respectively.

       Arnd
