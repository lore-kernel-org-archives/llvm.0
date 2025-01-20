Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14854EC0;
	Mon, 20 Jan 2025 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737396161; cv=none; b=T16vqU2Kzsj8oU4jCl4lWhHwtnlrSonRCh/Qvguw1t7NdiJAGM5rEHW8Jl3hJLf2BLalwNOJxKyNtLaaWA5sTWimmDmvdQBgEX/1MQIBIe3ZdGitsfFpTtzxNh3tPGtuqs4PZTwXAYfcOIlLHJrradLg4N2w5xQEkjzkY3smtgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737396161; c=relaxed/simple;
	bh=5UY3CnzO23/FfdGkctCqfbY/bk5Ng1X3KfWkPn0IDKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWbiJRWu8hdOa0qUvwObYTN1QnKiqabwJQ2y3f/3PBzsPcfP/QjSuVevIN4mO/vYcVRdJuGeX5d3tK2JN0RBJa62HfN+d1LG70AeB79IN3vDCnwi+PnPDQaWNSLCIZNSd/L0RhaXuJX1kMrClgv4hv7w7SC5P+HPibA4t+iiLCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8tjOrfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8tjOrfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15761C4CEE2;
	Mon, 20 Jan 2025 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737396160;
	bh=5UY3CnzO23/FfdGkctCqfbY/bk5Ng1X3KfWkPn0IDKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8tjOrfTJ9gX/jTcGqYcP4rbqsSFZW+pycrmMVpJ/5clNc4aVUCxaRV5DUia8W9Zv
	 sJJv7wk4UuIUhf7bNFSf4Z1FqQzjIelTRMx3Xa0BEG7yCXATd0AeWJZwHJfv6piMzp
	 QfisnPdgqHvUW7uSOkLC0XabnSsArKuDVkDsZ2rkJ+XOO4xwTrhV6dRg9cNcLaPLxY
	 6EyGfLORxBHTk7X2sNObd8uBZunlonh7oyAT5OclH5bCuAk3aPcZZxDaGRjte8lRSG
	 rGKx0mZY1WqM/8KBj+XhXSgieWdtbAOp2zChoHqhfWKxsNuKi8RX0wuCzCeJPhjgGC
	 nQOId2D3EYIQQ==
Date: Mon, 20 Jan 2025 11:02:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	kernel test robot <lkp@intel.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <20250120180236.GA484463@ax162>
References: <202501201840.XmpHXpQ4-lkp@intel.com>
 <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus>
 <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus>
 <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
 <20250120172802.GA955657@ax162>
 <CA+_ehUw2wxDk=bqYoH0XYGVFzbzndCrd2Uz9BUTmEaLH6zUtWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUw2wxDk=bqYoH0XYGVFzbzndCrd2Uz9BUTmEaLH6zUtWw@mail.gmail.com>

On Mon, Jan 20, 2025 at 06:39:10PM +0100, Christian Marangi (Ansuel) wrote:
> Il giorno lun 20 gen 2025 alle ore 18:28 Nathan Chancellor
> <nathan@kernel.org> ha scritto:
> >
> > On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> > > If only these test report were easy to report instead of me having to build
> > > the massive llvm-20 dev version...
> > >
> > > Any hint if anyone knows if precompiled cross tool are present around the web
> > > (with llvm-20?)
> >
> > I see this has been resolved based on my understanding of the rest of
> > the comments in this thread but I figured I would comment on this bit.
> > You generally do not need a version of LLVM from main (i.e., 20 right
> > now) to reproduce these reports, it just happens to be the version that
> > the robot used to flag this issue. I maintain precompiled versions of
> > stable LLVM releases on kernel.org, which would show this issue with
> > that same configuration, no building needed :)
> >
> > https://mirrors.edge.kernel.org/pub/tools/llvm/
> >
> > If you try the latest version and the problem does not show up, feel
> > free to comment on the report (which should have llvm@lists.linux.dev in
> > CC) to let us know and we can see if it is an LLVM main problem (and
> > bisect it to get it reported and fixed upstream at that point).
> >
> 
> Hi Nathan,
> 
> I would like to first thank you and anyone involved in this kernel boot test
> project. It's a life saviour and helped me a lot to catch all kind of corner
> case with randconfig.

Heh, thanks for the high praise but I do not maintain or help with this
service. I am focused on maintaining the LLVM build support in the
kernel and our list is CC'd on reports that use clang so we can help
with issues that appear only with clang (such as this one). Sorry I was
unable to jump in sooner.

> My main complain is that a lot of times, the repro step reference clang
> version or also gcc version that are actually not present in the download
> link making the repro step (and script) not usable.
> 
> Now I can use and try the previous version but given some compilation
> error happens only on the most recent build tools (due to additional
> warning and check introduced) It might be hard to repro.
> 
> My honest suggestion to make this even more accessible would be
> to also provide beta release of the build tool. Or at least add some
> comments in the repro file suggesting also to try with the previous
> version.

This sounds like good feedback for the LKP folks. I have my own wrapper
and processes for reproducing these issues because I do it a lot so I am
unaware of the potential jagged edges with the reproducers. They are
usually pretty responsive to requests/reports of problems with their
stuff in my experience.

Cheers,
Nathan
