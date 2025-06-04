Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD233D76;
	Wed,  4 Jun 2025 23:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749081124; cv=none; b=M96iDwWShNIf7yB2nonfG7sNq8t6MmGgNy02UDLTdrtZmII1qdBqMUdKiYHLAORH5Cta7Dfl51hom4zUdzqw0DULimJskM/5R49HGR2A2gw/s20zQAz6saMQ4+NTHyPX9WtwYVtV/WrHMY3OOR7sQLM5kgjYsZ0f/QYrsLd1Qg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749081124; c=relaxed/simple;
	bh=6OktB7fwEv0XQZwQcmwtCy2AsDYgMr3RSaQzYuuEuJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kh33+rnzEnDzXxFma/sDiPdfB66qwTLF+kevnsKCwUBzh9QuUxhHh6EZutIXyMS6yEKNIaQ/a/uNzX+D1OozpPp8PjbgwDtkPgGBdpkete9+xy4HSsBioj2D+ShVkzlP82zK9YW5MTeicf+mE+WAoRM5iDpYkesW5GAlkaElBIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KE7jtlKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KE7jtlKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A759EC4CEE4;
	Wed,  4 Jun 2025 23:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749081123;
	bh=6OktB7fwEv0XQZwQcmwtCy2AsDYgMr3RSaQzYuuEuJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KE7jtlKMDYZOPfxbJvkDek3qmxBHRmuCDTSv3BV+2j1RnMa5qgIctW4Xn0iaWPpRu
	 jEMymV7oXa3vniPxj1e3MBRC6X1947Y/JUekO9cTVTbWZpafssbZPyAaTaStegD7Qe
	 NIqmVoF1GCitSjNN5BxDxuurBLXIDG4hTBcSxfzF4QYjpQLU3YWzmUpf39WRHYPQku
	 g0I7w4ZzVVIpzHQ65bwJnA1xBZBTmElx3/XmHlsNRkEovlJ0qP+Di9Id93LBjQXuJP
	 2RGJi3ISeuNXmRSBhvnwLGJRTGdOqBThIEk6NFIm+nNyrQPPfs528l9360Vd00Aw6w
	 m6gkDKzjmlv6A==
Date: Wed, 4 Jun 2025 16:51:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Backports of d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca for 6.6
 and older
Message-ID: <20250604235159.GA4185199@ax162>
References: <20250523211710.GA873401@ax162>
 <2025052722-stainable-remodeler-d7f7@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052722-stainable-remodeler-d7f7@gregkh>

Hi Greg,

On Tue, May 27, 2025 at 05:19:34PM +0200, Greg Kroah-Hartman wrote:
> On Fri, May 23, 2025 at 02:17:10PM -0700, Nathan Chancellor wrote:
> > Hi Greg and Sasha,
> > 
> > Please find attached backports of commit d0afcfeb9e38 ("kbuild: Disable
> > -Wdefault-const-init-unsafe") for 6.6 and older, which is needed for tip
> > of tree versions of LLVM. Please let me know if there are any questions.
> 
> All now queued up, thanks!

It looks like the 6.6 backport got lost?

  $ rg d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca
  releases/6.1.141/kbuild-disable-wdefault-const-init-unsafe.patch:commit d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca upstream.
  releases/5.4.294/kbuild-disable-wdefault-const-init-unsafe.patch:commit d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca upstream.
  releases/5.15.185/kbuild-disable-wdefault-const-init-unsafe.patch:commit d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca upstream.
  releases/5.10.238/kbuild-disable-wdefault-const-init-unsafe.patch:commit d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca upstream.
  releases/6.14.8/kbuild-disable-wdefault-const-init-unsafe.patch:From d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca Mon Sep 17 00:00:00 2001
  releases/6.14.8/kbuild-disable-wdefault-const-init-unsafe.patch:commit d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca upstream.
  releases/6.12.30/kbuild-disable-wdefault-const-init-unsafe.patch:From d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca Mon Sep 17 00:00:00 2001
  releases/6.12.30/kbuild-disable-wdefault-const-init-unsafe.patch:commit d0afcfeb9e3810ec89d1ffde1a0e36621bb75dca upstream.

Are you able to pull it from the original message? It still applies
cleanly for me.

Cheers,
Nathan
