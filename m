Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2133C9
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 21:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D915C385A4;
	Tue,  3 May 2022 21:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651612705;
	bh=5BPzPsQgQVhPUESQkAYmLMPg3Qkr8AVEli2l3iy6iQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yvqrx16CyABXx/qMS6yl5yjz6+MDYt1CgURKw5QpEKEQPeKoFLOwdDboUNuwfFkOW
	 +CgGt7/Un1jhTMnATT7OMRi9RLE62SEk55icgvqX8/uQwbxXcp8cGrH24WA1eiKYfu
	 1llmJOZ/BtuRYaMwXDQ7yF7gOwxjvSnkU1BnIfIxtzMDzwZW03B+GxvwReiP0rbX3o
	 TcazWbHBVxJgjCd97SpPj1CF/m3dwOYFQn4YmhVAELrJAYlm1Lwik97vM/RmdxqPh+
	 1zGn3fhZ2CVj7eJc2P273gN0W567PLczYOAfLRoe1vRkwq+sOgl6jmTnZmTTqvECvn
	 UmItRosj6zlTw==
Date: Tue, 3 May 2022 14:18:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nikita Popov <npopov@redhat.com>, llvm@lists.linux.dev,
	ci_notify@linaro.org, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Subject: Re: [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset
 representation
Message-ID: <YnGcH8helepu/pqV@dev-arch.thelio-3990X>
References: <962475179.3377.1651244787786@jenkins.jenkins>
 <CAKwvOdkR3tVWo9iGLryoAzY4x7BfDMCLDSx9jnd+p7-hKXD5qg@mail.gmail.com>
 <7230BF09-41E5-44C7-A3B4-C1FD017C277C@linaro.org>
 <YnFLeL93iHk+3vBd@dev-arch.thelio-3990X>
 <0143746B-3EFA-4E83-8864-93A25AE026C5@linaro.org>
 <CAKwvOdkXY-E_tod8vMF+a7o0iECW+7ag7fysfwpq=6ute1ZR4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkXY-E_tod8vMF+a7o0iECW+7ag7fysfwpq=6ute1ZR4w@mail.gmail.com>

On Tue, May 03, 2022 at 01:59:50PM -0700, Nick Desaulniers wrote:
> On Tue, May 3, 2022 at 9:59 AM Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org> wrote:
> >
> >
> >
> > > On May 3, 2022, at 6:34 PM, Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi Maxim,
> > >
> > > On Tue, May 03, 2022 at 04:35:04PM +0300, Maxim Kuvyrkov wrote:
> > >>> On Apr 29, 2022, at 8:20 PM, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >>>
> > >>> On Fri, Apr 29, 2022 at 8:06 AM <ci_notify@linaro.org> wrote:
> > >>>>
> > >>>> [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset representation:
> > >>>> commit b9dc5651477b4c3c132662e763308b27963248a9
> > >>>> Author: Nikita Popov <npopov@redhat.com>
> > >>>>
> > >>>> [GVN] Encode GEPs in offset representation
> > >>>>
> > >>>>
> > ...
> > >>>> # linux_n_obj:
> > >>>> 22258
> >
> > After the patch LLVM can build 22258 .o files of the kernel ...
> >
> > >>>>
> > >>>> # linux_n_obj:
> > >>>> 22260
> >
> > ... and before it could build 22260 .o files.
> >
> > >>>>
> > >>>> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> > >>>>
> > >>>> This commit has regressed these CI configurations:
> > >>>> - tcwg_kernel/llvm-master-arm-stable-allmodconfig
> > >>
> > >> This is reported against "stable" Linux tree, aka linux-rolling-stable branch [1].  So yeah, it's not a report about a new regression, but rather a report about regression reaching a stable branch.
> > >>
> > >> Does this answer your question?  Or is the report still looks not right?
> > >
> > > I think what Nick is getting at (or at least where I was confused by the
> > > initial report) is that these warnings (or errors with CONFIG_WERROR, in
> > > this case) have always been present in this configuration in the
> > > linux-rolling-stable branch, so I would not have expected these being
> > > present to trigger a regression report for LLVM.  In fact, the "last
> > > good" build has the exact same errors and results as the "first bad"
> > > build, with the LLVM hash being the only variable from what I can tell,
> > > so I would not expect a report to be generated in that case, but I don't
> > > know the conditions under which bisection starts.
> >
> > The metric tracked in this CI is number of .o files produced in the build of Linux kernel, and bisections identify commits that cause this number to decrease.  Note that the snippet of warnings and errors tell a very approximate story about the regression.

Ah, interesting metric!

> > In this particular case the regression report is about drivers/staging/rtl8723bs/core/rtw_security.o, which could be compiled before the patch, but after the patch we get:
> >
> > 00:32:31 drivers/staging/rtl8723bs/core/rtw_security.c:1288:5: error: stack frame size (1040) exceeds limit (1024) in 'rtw_aes_decrypt' [-Werror,-Wframe-larger-than]

Odd, because that warning appears with earlier versions of LLVM. For
example, our CI sees it with LLVM 13:

https://builds.tuxbuild.com/28MYg0V58x4yhMURqDk8yUD0gBz/build.log

https://builds.tuxbuild.com/28MYg0V58x4yhMURqDk8yUD0gBz/metadata.json

> Nathan,
> I'm trying to remember, was it that CI systems should be disabling
> CONFIG_WERROR? Wasn't there some other config to denote that "I'm
> testing" that has implications for CONFIG_WERROR? Perhaps the config
> I'm thinking of should be set for these builds?

CONFIG_WERROR is 'default COMPILE_TEST' and CONFIG_COMPILE_TEST is set
with allmodconfig.

It has been a little bit since I have looked at how close we are to
being -Werror clean on arm64 and x86_64. Last I checked, this issue was
the only blocker to that:

https://github.com/ClangBuiltLinux/linux/issues/1592

I believe stable 5.15 and 5.17 should be clean for those two
architectures though.

ARCH=arm needs a bit of work, mainly due to KASAN. I might be able to
look into that this week but if not, I will make it high priority for
next week. In the meantime, it might be worth it to explicitly disable
it for 'ARCH=arm allmodconfig' to make hard errors a little bit more
obvious but that is probably not necessary based on the object file
tracking.

Cheers,
Nathan
