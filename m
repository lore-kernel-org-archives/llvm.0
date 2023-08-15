Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549814A81;
	Tue, 15 Aug 2023 16:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CFAC433CA;
	Tue, 15 Aug 2023 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692116310;
	bh=Fzs40tiStK6EkB/YuFNO47++s2pzGPjPobOJCKqNu8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m6yXaSAwx8X+r9uIAcVeX5zrd0VAUGDC+FSDKjY57xEz4o7w6VZxoqPpXrwP5GzkY
	 11KtwWsJFbX2wEHCng3rI/4RiDngUv+kHRaIat8tkqE1R+P7xJ8PkSs/pRFQP2PRpT
	 jbsWXAdmcb/HHGk8efWVlRkOqS9MBs7VOPo6f/MFH8Ugubvg2ciTCQvkMCjq84oOoD
	 ZoTjvVhLTzqP91Q67jijBow7hGlnmADOt1xY/GrleGc8pYlGGuJSFsU9UAzA02uskG
	 1jSqBkxZwkWo/RImvjoBlA4/+NqqBXJP6/i+ZAFX58iqK+LXVyaEpHu/rMJhGPUlfh
	 BlZX7cliEcWtg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4ff882397ecso1025288e87.3;
        Tue, 15 Aug 2023 09:18:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YyDtMfA6Aq1FPPD1xDKhNRR7M2b0Cj+tNYdCIExw/dd40l20QTo
	h+lBBEMpegWZ0kCQcHtv65WV10qLTOAkFcz8M7U=
X-Google-Smtp-Source: AGHT+IGSKxTJ19mqFeIIAz2Lk4itGkDuL8iY/S0R3KrwN8mSoHZ/GfI5rqOeRSLn2I6I+A/Oy27EIKyPND4S5+ihiKA=
X-Received: by 2002:a05:6512:3985:b0:4fb:740a:81ae with SMTP id
 j5-20020a056512398500b004fb740a81aemr10981306lfu.16.1692116308327; Tue, 15
 Aug 2023 09:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308150547.m54XHV12-lkp@intel.com> <ZNql2TqaVFnMKlzJ@shell.armlinux.org.uk>
 <7dfa4337-fc2f-4a02-a12e-f94feca7362b@app.fastmail.com> <CAMj1kXE_Rehybm_ANRYcDqPT8q7SPJ_Yxw9HLNNg9SsmTk17zA@mail.gmail.com>
 <ZNs/1GB10P1zq5bU@shell.armlinux.org.uk>
In-Reply-To: <ZNs/1GB10P1zq5bU@shell.armlinux.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Aug 2023 18:18:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG8Qb4vdbWiT3MOQziSbRRW-YMfotG9w1XMMTYFVQXC4w@mail.gmail.com>
Message-ID: <CAMj1kXG8Qb4vdbWiT3MOQziSbRRW-YMfotG9w1XMMTYFVQXC4w@mail.gmail.com>
Subject: Re: [arm:for-next 4/4] arch/arm/vfp/vfpmodule.c:324:13: error: static
 declaration of 'VFP_bounce' follows non-static declaration
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Aug 2023 at 11:05, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Aug 15, 2023 at 10:39:31AM +0200, Ard Biesheuvel wrote:
> > On Tue, 15 Aug 2023 at 00:16, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Aug 15, 2023, at 00:08, Russell King (Oracle) wrote:
> > > > On Tue, Aug 15, 2023 at 05:06:03AM +0800, kernel test robot wrote:
> > > >>    1 error generated.
> > > >
> > > > I'm guessing this is a conflict between Arnd's patch
> > > >
> > > > ae1f8d793a19 ("ARM: 9304/1: add prototype for function called only from asm")
> > > >
> > > > merged in v6.5-rc1 and Ard's patch, and that part of Arnd's patch
> > > > needs to be reverted since VFP_bounce is now static. Agreed?
> > >
> > > Yes, with Ard's change, the prototype I added is neither required nor correct.
> > >
> > > My series contained another patch that added a prototype for
> > > vfp_entry(), and this is also obsoleted by Ard's series, but you
> > > did not merge it anyway, so it's all good on that one.
> > >
> >
> > When you sent out that series, I mentioned the conflict with
> > vfp_entry() [13/16], but I failed to spot that the same series had
> > another patch that added the VFP_bounce() declaration, which is the
> > one that is now conflicting.
> >
> > So we just need a patch that drops the VFP_bounce() declaration,
> > right? Should I send that out and drop it into the patch system?
>
> http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=for-next&id=a6f307c20d649e5f1da280bee7ed160de74de2ff
>

OK thanks for taking care of that.
