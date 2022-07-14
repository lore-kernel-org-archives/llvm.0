Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB28600D
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 20:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B7DC34115
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 20:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657829482;
	bh=vX5XYwJlwh36w2T30Jc072ZaYDA3oVrG6mKHeqYxMy8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zi6XsLGzskNbk2zvP53cMtKno67LAoAy6wJTqa59iN42sOdg/QfPQGK0NTpjAA8Yi
	 52JpwB26rEl7RoYQ3d/reu45j4v/F/wwFHMIvvXCoGiyaDMz2teumgd2VCJy/zL+RB
	 OeCSO8u5sjYfyJ45xApHC8NwVq6+skTnir3ygho7RUjWg5UBH1ShHa+R/IoyNPiXwS
	 LyQfgbh4wWWYzb1r6H+QCuoOjfaW21WeHbhuWfqV5khRnm5v66b5wlsFqrmDuGB1Kc
	 I8NYYbxQekDhTLPQgi0gaXpUeChvgIgy3X9Hyrwk69SG9e+ByA+a8ycxPaUwASu1Dp
	 4pICso5vB6bEQ==
Received: by mail-yb1-f174.google.com with SMTP id 75so5137506ybf.4
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 13:11:22 -0700 (PDT)
X-Gm-Message-State: AJIora/qCOXZsgC6adwCWjlm4QhNez9SFN9XZ/RmuD5H1HyPdGp5LHFm
	1UICBUiFVnIVoLDrwIBOVtyzVXpocU/Iq0ZIQQc=
X-Google-Smtp-Source: AGRyM1uU6KK9BMu7ZsRkqFCb2hU/EUHcZhqQrz3bygKQY1JHhhhbnRzMbHVnH94SG1AlfNvjw9TcGNoj/p8E5hnK0i8=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr10623661ybq.472.1657829481462; Thu, 14
 Jul 2022 13:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X>
In-Reply-To: <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 14 Jul 2022 22:11:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a32LO_EdaWM12OZu=ibpQPUtdtHAg9OMKqj=D6OUd=chQ@mail.gmail.com>
Message-ID: <CAK8P3a32LO_EdaWM12OZu=ibpQPUtdtHAg9OMKqj=D6OUd=chQ@mail.gmail.com>
Subject: Re: help with clang build for mips
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 7:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Thu, Jul 14, 2022 at 05:39:39PM +0100, Sudip Mukherjee wrote:
>
> Unfortunately, I doubt there is much interest in that work, given MIPS
> as an architecture isn't being developed anymore. Might be an
> interesting hobbyist project though. It is probably best to just test
> configurations that work and make sure that those do not regress. Others
> are more than welcome to weigh in though!

I think there is still enough interest in the newer loongson64 mips machines,
which should work with clang, but the loongson2e/f machines are way more
obscure now. Debian dropped support for these a couple of years ago.

        Arnd
