Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C258B2C81
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 21:42:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 010CB6058D;
	Sun, 14 Nov 2021 21:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636926131;
	bh=QpxOx2hlB8LK9k1Al6jjy8pp6tVeoOJsm14sAGQEYsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Si4J9oT0AW9pz68sOQs2yWuLSNK1LdjLKVATZnbyEX7JquRebWCS95pGPq/fJ5q6w
	 ++w48qv5y9SwLUabN7IRmIOIj0zVgh5phndvU76Y48C/004Rk78NPyaoJiawyNIa6x
	 SEHxpqtiKMEERuumhxQ2ybbZ3cSyouhgvwcyGXCjQTY3p9NsMA5Wu7kgsfNUChOQmZ
	 x5S/Z17aPyc3zQK/RlGQ0wZcm7Tk0xKfkyaXUEASIUCE2g46BJlJxqu0PRIRz1q0TC
	 zvhzFOmyJMZXuAyqqHDF4NAnb3kw4osAcggPDg1Cd1wIzHRS5Mzb6SZ3R2tXsWsfvg
	 J77xYKzuKwNxA==
Date: Sun, 14 Nov 2021 14:42:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [arm-platforms:hack/m1-pmu 8/8]
 drivers/perf/apple_m1_cpu_pmu.c:100:32: warning: initializer overrides prior
 initialization of this subobject
Message-ID: <YZGCrpVfY5xng4EC@archlinux-ax161>
References: <202111141650.o5b2LSZU-lkp@intel.com>
 <0b7463e699956abb0f8b0da7a9254500@kernel.org>
 <CAMj1kXE5T4pWVBUPiZRqw1S122DHVQkZn9GwNHx2cr4=MfndeQ@mail.gmail.com>
 <CANiq72nhQuRPgVMqDkr9OZqSLpT_2VVwkBaY97PbuqhbuNJnJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nhQuRPgVMqDkr9OZqSLpT_2VVwkBaY97PbuqhbuNJnJg@mail.gmail.com>

On Sun, Nov 14, 2021 at 01:24:16PM +0100, Miguel Ojeda wrote:
> On Sun, Nov 14, 2021 at 12:07 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > +KBUILD_CFLAGS += $(call cc-option, -Wno-initializer-overrides)
> 
> I don't think we would need `cc-option`.

-Winitializer-overrides is the clang version of the flag, as opposed to
-Woverride-init for gcc. A compatibility flag was added in clang 8 so if
this is changed to

KBUILD_CFLAGS += -Wno-override-init

it should work for both compilers.

Cheers,
Nathan
