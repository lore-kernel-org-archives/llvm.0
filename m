Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D436D8827;
	Tue, 15 Aug 2023 08:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C897C433CA;
	Tue, 15 Aug 2023 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692088785;
	bh=ULR/LJmJop8m9SzNUZY7aRaboUHSVPAyHXDpF/pVl0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=svnY0lYbPAM6mWfDHz/Pp+3OJ1nufsCIPQue37P9gFR5g+vTU1PcruCTHtrpOnmwA
	 DpzkTCUssHGGU1+ghH9rRXExtqMMlU4eDuBA1Lw1WYgd8hbT7YtKZUlX2PlUIFew99
	 vhlExxIwp85b38O8EbzJQkNAMwe3TtLeUWnGeuskDGElLUaO5TdobzxNDLjNyoR/Lt
	 /VPLw5PGvQ3U/Fm5itZgnFWiqrirZ/Gc+nfK/ChtvqEm+EDhlD2ffQVtUk9wU96uE7
	 /xvu9fOas5grWN+jnR+Qsrwjui2KaOa85OLckdewNCeFwfJneyXwr45ySvLLfyt6ED
	 XPnRa+S1L/nww==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso77326841fa.0;
        Tue, 15 Aug 2023 01:39:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yybq0eIE66/PBjmDlX1WN8tPPYWj7pwzq3H5JJORKBlH6Z/vWPH
	0pW/wYlJC1ef09XNnWCKdIE2yRyVA4kAXIhhmO4=
X-Google-Smtp-Source: AGHT+IEIT8MahIepibK4xdDLVQuazVm5rHzLyVif6FF7VNQF7xOx2D6IW9IXCJWv24q019GJA3LUl2SNC7Z5oXS40pU=
X-Received: by 2002:a2e:9048:0:b0:2b9:4821:22b6 with SMTP id
 n8-20020a2e9048000000b002b9482122b6mr8399730ljg.10.1692088783340; Tue, 15 Aug
 2023 01:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308150547.m54XHV12-lkp@intel.com> <ZNql2TqaVFnMKlzJ@shell.armlinux.org.uk>
 <7dfa4337-fc2f-4a02-a12e-f94feca7362b@app.fastmail.com>
In-Reply-To: <7dfa4337-fc2f-4a02-a12e-f94feca7362b@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Aug 2023 10:39:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE_Rehybm_ANRYcDqPT8q7SPJ_Yxw9HLNNg9SsmTk17zA@mail.gmail.com>
Message-ID: <CAMj1kXE_Rehybm_ANRYcDqPT8q7SPJ_Yxw9HLNNg9SsmTk17zA@mail.gmail.com>
Subject: Re: [arm:for-next 4/4] arch/arm/vfp/vfpmodule.c:324:13: error: static
 declaration of 'VFP_bounce' follows non-static declaration
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Aug 2023 at 00:16, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Aug 15, 2023, at 00:08, Russell King (Oracle) wrote:
> > On Tue, Aug 15, 2023 at 05:06:03AM +0800, kernel test robot wrote:
> >>    1 error generated.
> >
> > I'm guessing this is a conflict between Arnd's patch
> >
> > ae1f8d793a19 ("ARM: 9304/1: add prototype for function called only from asm")
> >
> > merged in v6.5-rc1 and Ard's patch, and that part of Arnd's patch
> > needs to be reverted since VFP_bounce is now static. Agreed?
>
> Yes, with Ard's change, the prototype I added is neither required nor correct.
>
> My series contained another patch that added a prototype for
> vfp_entry(), and this is also obsoleted by Ard's series, but you
> did not merge it anyway, so it's all good on that one.
>

When you sent out that series, I mentioned the conflict with
vfp_entry() [13/16], but I failed to spot that the same series had
another patch that added the VFP_bounce() declaration, which is the
one that is now conflicting.

So we just need a patch that drops the VFP_bounce() declaration,
right? Should I send that out and drop it into the patch system?
