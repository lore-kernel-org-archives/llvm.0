Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759726FCD;
	Tue, 29 Aug 2023 23:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693351786;
	bh=Hw1MdoVIM7z3jMwdCP5UrPw0ce9Z1kH8tvbb7II820k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QfvQ29uhTdzH63I2LPmzE4pMW6sB4q58yprH7r00LPlP8GfiPvkJdzUwk22L0X9ee
	 U4IvzMi8AA0C58Fs8bV+3vHtqpyYUspsncoFr84y2WledhSO1jVEdDBrPLOF5ihZ9z
	 LMsXPmUabaghIbjaRonf4F64ldkHjp+kF7bHPneeqP70KIO1Al8W9JXHE/o/oIfgv2
	 d+sWvwiNVTHThb8U3HfzLq+uMcXm7mVuBhgYutMhaQHo5xkNfEtuBGagGft+wHZpi6
	 RYjFeD+ckj7T8Cg5HRtxWKbSsMNCQHEqygr9UVIOxP2oiUTjdxBwesQh7wO1sBEa/O
	 rhZACQLhwthLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rb3YP5754z4wy8;
	Wed, 30 Aug 2023 09:29:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Nathan Chancellor
 <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [linuxppc:next-test 85/129] arch/powerpc/xmon/xmon.c:489:12:
 error: stack frame size (2160) exceeds limit (2048) in 'xmon_core'
In-Reply-To: <CAKwvOdkO77jDijPwqkQJz6bGhjm5-3xWkTXbaxtXL8eZsqTi3g@mail.gmail.com>
References: <202308260344.Vc4Giuk7-lkp@intel.com>
 <CAKwvOdk=UvBxv7a2cV-Z_zK0CwzPSjBnQ0SQHaVAEUodA=hfQQ@mail.gmail.com>
 <874jkkvhzj.fsf@mail.lhotse>
 <CAKwvOdkO77jDijPwqkQJz6bGhjm5-3xWkTXbaxtXL8eZsqTi3g@mail.gmail.com>
Date: Wed, 30 Aug 2023 09:29:39 +1000
Message-ID: <87r0nlxw9o.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nick Desaulniers <ndesaulniers@google.com> writes:
> On Sun, Aug 27, 2023 at 4:32=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>>
>> Nick Desaulniers <ndesaulniers@google.com> writes:
>> > On Fri, Aug 25, 2023 at 12:17=E2=80=AFPM kernel test robot <lkp@intel.=
com> wrote:
>> >>
>> >> tree:   https://github.com/linuxppc/linux next-test
>> >> head:   c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
>> >> commit: 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb [85/129] Revert "pow=
erpc/xmon: Relax frame size for clang"
>> >> config: powerpc64-randconfig-r006-20230825 (https://download.01.org/0=
day-ci/archive/20230826/202308260344.Vc4Giuk7-lkp@intel.com/config)
>> >> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.=
git f28c006a5895fc0e329fe15fead81e37457cb1d1)
>> >
>> > Hi Michael,
>> > Given this report and
>> > https://github.com/ClangBuiltLinux/linux/issues/252#issuecomment-16903=
71256,
>> > it seems that it's still possible to trigger this warning (and build
>> > failure with CONFIG_WERROR). Is it possible to drop my patch at this
>> > point?
>>
>> It's too late to drop it, so we'd need to do a revert.
>
> Np. Sent: https://lore.kernel.org/llvm/20230828-ppc_rerevert-v1-1-74f55b8=
18907@google.com/

Thanks.

>> But rather than just a straight revert maybe we can do something that's
>> more tightly focused, ie. just to specific Clang versions?
>
> Seeing as the bot found a randconfig, I'm not confident that a version
> check would be enough at this point.

Yeah fair enough.

> Also, quite a few fires this Monday morning. I'd rather back this out
> entirely and revisit it another day.  I thought it would be a simple
> revert; obviously not!

No worries.

cheers
