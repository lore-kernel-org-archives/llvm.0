Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83495149C69;
	Mon, 20 Jan 2025 17:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737394086; cv=none; b=CeWixnKdTv51+gOQc847KxzRqJc5K70qHYlJY2I6XcWBKUSydamZUIutQSI0lVeij+IKUjiiTKglCB4YSJRJw19YDa8uIBdu9QJ1XlpJFRRrisXQT2IEg9sBrT4al8IgtWtxyO4FtPMWtScvmwX+i5BuwbNYn7pKs6mXdv20OAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737394086; c=relaxed/simple;
	bh=DqKIYhCijoCYjhEWxRiSkK+awojLAukuNdSxYG2X3fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDyqD1hgU727Ok7bKEOwGcv2S5h52VsBPkVJ/9et9uiU8iasfv8qJ44ZAMWo/0rP943yU9jXtyUHZ8av7xloCBWFTLLnm1XubDi4x6FM3k5Fu8MKFAopZcurKwz4uLzJkRJuNt4c20xzU64PuXXvOTC7J53Oo0dxoIe1VTnuK7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOZbloD5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOZbloD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE77C4CEDD;
	Mon, 20 Jan 2025 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737394086;
	bh=DqKIYhCijoCYjhEWxRiSkK+awojLAukuNdSxYG2X3fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOZbloD5KSXaW0/stIm2D9ft2eETof/VawN44/S2RkNt5uuj9OUZSMqJegjgoWa2v
	 ZE+AncCluNoji6utnYk06vf9SCeSEteZQjIg3OWklzabenA4TB8u1hATtHzHdCxxxA
	 dy1a3v7jYCfxy6Qw9fFQC+6PW5fPM22f9gHN3kQ+7zDHHx1tOc+sF+TOTYdw2AGzup
	 apUqYYbzcpZjZIfB6jbZRElrg2ORmBcwssjkm2FSvJ5ZWlI+iUHlDMuhg881F8k/E6
	 DXmLPRO5IulwhDW8f1WhIV/90tv1eP5RITq+H7u5gkrz+l/dMYtwYF3WbddR5BA2EQ
	 RyZFQuD5NisDg==
Date: Mon, 20 Jan 2025 10:28:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <20250120172802.GA955657@ax162>
References: <202501201840.XmpHXpQ4-lkp@intel.com>
 <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus>
 <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus>
 <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>

On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> If only these test report were easy to report instead of me having to build
> the massive llvm-20 dev version...
> 
> Any hint if anyone knows if precompiled cross tool are present around the web
> (with llvm-20?)

I see this has been resolved based on my understanding of the rest of
the comments in this thread but I figured I would comment on this bit.
You generally do not need a version of LLVM from main (i.e., 20 right
now) to reproduce these reports, it just happens to be the version that
the robot used to flag this issue. I maintain precompiled versions of
stable LLVM releases on kernel.org, which would show this issue with
that same configuration, no building needed :)

https://mirrors.edge.kernel.org/pub/tools/llvm/

If you try the latest version and the problem does not show up, feel
free to comment on the report (which should have llvm@lists.linux.dev in
CC) to let us know and we can see if it is an LLVM main problem (and
bisect it to get it reported and fixed upstream at that point).

Cheers,
Nathan
