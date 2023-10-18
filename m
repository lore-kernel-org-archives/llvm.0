Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140E7374F3
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3cQz036"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB57FC433C7;
	Wed, 18 Oct 2023 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697648158;
	bh=FhJt2vNLVuhy7x9s2wmhEtB3RvSozgHH/YZh9yYPj4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3cQz036JQg3nyZgCDH2boZgyUF6nTnxBXrYb7RH6+XduR0hU21m9oh5M6+bCuKYZ
	 J4pg5smzBj5uG44HDZVsNQJNCSIKp25eAlha1DymuL3TVRm/hurMUmHCA79FKXl/ME
	 z0O93xG2uhS1OtXHMLnSzSzuDb2/2ReI0z7GspQ2isDYSGTtJmsidvm33pCdrjdqS2
	 /g1xPQRCvu1UnCBYJNs2qGfUdcuvyz1NzXDVFVKjfOaNenfXLfWFDRMD44xMIBiB3U
	 ZONOH1PO5UwFdYlrVjIBry1fZMgaOXOs8TRl3KMn6UsrN9XWF6QguZ3jZ3nHZlR8jl
	 31ZuH141YOH0Q==
Date: Wed, 18 Oct 2023 09:55:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] lib: Kconfig: disable dynamic sanitizers for test builds
Message-ID: <20231018165556.GA3842315@dev-arch.thelio-3990X>
References: <20231018153147.167393-1-hamza.mahfooz@amd.com>
 <CANpmjNPZ0Eii3ZTrVqEL2Ez0Jv23y-emLBCLSZ==xmH--4E65g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNPZ0Eii3ZTrVqEL2Ez0Jv23y-emLBCLSZ==xmH--4E65g@mail.gmail.com>

On Wed, Oct 18, 2023 at 06:22:14PM +0200, Marco Elver wrote:
> On Wed, 18 Oct 2023 at 17:32, 'Hamza Mahfooz' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:

<snip>

> > diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
> > index ef2c8f256c57..eb05c885d3fd 100644
> > --- a/lib/Kconfig.kmsan
> > +++ b/lib/Kconfig.kmsan
> > @@ -13,6 +13,7 @@ config KMSAN
> >         depends on HAVE_ARCH_KMSAN && HAVE_KMSAN_COMPILER
> >         depends on SLUB && DEBUG_KERNEL && !KASAN && !KCSAN
> >         depends on !PREEMPT_RT
> > +       depends on !COMPILE_TEST
> 
> KMSAN already selects FRAME_WARN of 0 and should not cause you any
> issues during build testing.

Yeah, this particular case is a bug in the AMDGPU dml2 Makefile, where
CONFIG_FRAME_WARN=0 is not respected.

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index f35ed8de260d..66431525f2a0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -61,7 +61,7 @@ ifneq ($(CONFIG_FRAME_WARN),0)
 frame_warn_flag := -Wframe-larger-than=2048
 endif
 
-CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) -Wframe-larger-than=2048
+CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_util.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml2_wrapper.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml2_utils.o := $(dml2_ccflags)

I will try to send that patch soon, unless one of the AMDGPU folks wants
to beat me to it.

Cheers,
Nathan
