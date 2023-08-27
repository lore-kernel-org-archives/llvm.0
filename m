Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BB463A5;
	Sun, 27 Aug 2023 11:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693135922;
	bh=5T04emPiqpwjpNOBK+5sgoQ1jikwwcTW1EnGrCwmyWI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pWlsL+flxMUz3Q14GgXrF5FSQcEnP9YkMOy1C5dUcQTGzK4Y7QfnFIgoBeVCIc4tn
	 8b0Ev6/OX3HA2zcg1iutNZCPZbobXD+5I8CgyyYWQM+c8grkscZL6gQDnYE/0KskaD
	 fowZiu/2ueFkNQycn7boPlbPuaPHnML1o5rbp/z2Rtk6v1cPh8/FvnhZXybHYUL81C
	 huRq1tUsiHoKYsRmtqNxjmHKAXuJLBY2DDGTYZMt21RHai7q6rMKJmPteRLlsYBqov
	 QcmWzJ2k15ukvKdX2AYllASLh65JWwXMatNs83rKOy8bb50WoiLFWFQg3bOGYv38jI
	 upoNjBk1QIyqg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RYWkB32t0z4wZn;
	Sun, 27 Aug 2023 21:32:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Nathan Chancellor
 <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [linuxppc:next-test 85/129] arch/powerpc/xmon/xmon.c:489:12:
 error: stack frame size (2160) exceeds limit (2048) in 'xmon_core'
In-Reply-To: <CAKwvOdk=UvBxv7a2cV-Z_zK0CwzPSjBnQ0SQHaVAEUodA=hfQQ@mail.gmail.com>
References: <202308260344.Vc4Giuk7-lkp@intel.com>
 <CAKwvOdk=UvBxv7a2cV-Z_zK0CwzPSjBnQ0SQHaVAEUodA=hfQQ@mail.gmail.com>
Date: Sun, 27 Aug 2023 21:32:00 +1000
Message-ID: <874jkkvhzj.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nick Desaulniers <ndesaulniers@google.com> writes:
> On Fri, Aug 25, 2023 at 12:17=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
>>
>> tree:   https://github.com/linuxppc/linux next-test
>> head:   c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
>> commit: 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb [85/129] Revert "powerp=
c/xmon: Relax frame size for clang"
>> config: powerpc64-randconfig-r006-20230825 (https://download.01.org/0day=
-ci/archive/20230826/202308260344.Vc4Giuk7-lkp@intel.com/config)
>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git=
 f28c006a5895fc0e329fe15fead81e37457cb1d1)
>
> Hi Michael,
> Given this report and
> https://github.com/ClangBuiltLinux/linux/issues/252#issuecomment-16903712=
56,
> it seems that it's still possible to trigger this warning (and build
> failure with CONFIG_WERROR). Is it possible to drop my patch at this
> point?

It's too late to drop it, so we'd need to do a revert.

But rather than just a straight revert maybe we can do something that's
more tightly focused, ie. just to specific Clang versions?

> I'll need to go back to the drawing board with these configs +
> specific versions of clang to better understand what's going wrong
> here.  Sorry for the trouble.

No worries.

cheers
