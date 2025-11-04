Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9E21CC56;
	Tue,  4 Nov 2025 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762280653; cv=none; b=hikFP2OdASaZp3gfCY1AvNtr56vqZumTMYr2t2YxHySskLKZb6QWIxsk9/kSnWMqTuquBRjbN0gcjC+ctJiZ+N/qW6w0Q/XWnDTdwPjkG50+XSwY1iAwUOTuwgV7Jge7R3lN0BGlrQKxUAduezkaWqslBTO2IWXIECJ7EOwsIW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762280653; c=relaxed/simple;
	bh=OHIn8q90OJylMF2qPR6+tu/JPgOmZtPJBrqLQ9ErzLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCiI/NkMxofxrL6vbUfC1hyUZigT4haAwfTuCzPLEJt8QSvdUQ0+xqVBjeScsp01aC+9lKiufM+OYRB9MvHInGkFXU0SzsnAcWvcFe51MbLbhv8Oyt8LagFo1m4PBnTrb+LHbzTWhUn1LTKof4hGpudI+Z9KmFNAXsYcYAizVCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUrVTv8P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUrVTv8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC1AC4CEF8;
	Tue,  4 Nov 2025 18:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762280653;
	bh=OHIn8q90OJylMF2qPR6+tu/JPgOmZtPJBrqLQ9ErzLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUrVTv8Pmv0U9t24gVSoqNwG9wJh1qm2qfoLHKaRK7BVyZilDA0cYTlHZxKJT+ztH
	 EldPKa69zEVF4ZQPbTk9bQ/Mxp0uW6xQgsvVv2IVwWhjbePhmaHWtLZ35ViYDTNAxV
	 Qrjs1oydk3LiNoDbNjj+qnvkAJNqbbwXDg6+2SDdXeDKIWR5airm+zzTjr64UhQQqZ
	 /Old+R3wwb5nOcpZYHDfH4uKuoJ0+tcXtfnM3zeVHckPt48o5gR6Y3S+XZKnJTcyoJ
	 HxG1/Nl3QfgqBVcnWSQqx7IQVjVjxcqXOnPmyX4jFIWsMC412b7OfPJdK6z/UEoW/C
	 He9zgXoYesztw==
Date: Tue, 4 Nov 2025 18:24:08 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, nd@arm.com
Subject: Re: [arm-perf:for-next/perf 6/8] drivers/perf/arm-ni.c:433:13:
 warning: operator '?:' has lower precedence than '+'; '+' will be evaluated
 first
Message-ID: <aQpEyPNVSH1piLXh@willie-the-truck>
References: <202511041749.ok8zDP6u-lkp@intel.com>
 <aQnzF7BNIgp37kcd@willie-the-truck>
 <5bba40c3-bfab-481d-8252-4f5a62e2b79e@arm.com>
 <aQoAUPtvbBrlymuA@willie-the-truck>
 <3e9e655f-eccd-425f-a243-161e84d801a8@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e9e655f-eccd-425f-a243-161e84d801a8@arm.com>

On Tue, Nov 04, 2025 at 02:04:57PM +0000, Robin Murphy wrote:
> On 2025-11-04 1:32 pm, Will Deacon wrote:
> > On Tue, Nov 04, 2025 at 01:26:11PM +0000, Robin Murphy wrote:
> > > On 2025-11-04 12:35 pm, Will Deacon wrote:
> > > > On Tue, Nov 04, 2025 at 05:43:40PM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
> > > > > head:   989b40b7578a2be7b0388522d33d751b257d59d9
> > > > > commit: 8fa08f8835e57e1fd5e2994c9cf76c84dadc1235 [6/8] perf/arm-ni: Add NoC S3 support
> > > > > config: sparc64-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/config)
> > > > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
> > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/reproduce)
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202511041749.ok8zDP6u-lkp@intel.com/
> > > > > 
> > > > > All warnings (new ones prefixed by >>):
> > > > > 
> > > > > > > drivers/perf/arm-ni.c:433:13: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
> > > > >        432 |                 hw->event_base = (unsigned long)cd->pmu_base +
> > > > >            |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >        433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
> > > > >            |                                  ~~~~~~ ^
> > > > >      drivers/perf/arm-ni.c:433:13: note: place parentheses around the '+' expression to silence this warning
> > > > >        432 |                 hw->event_base = (unsigned long)cd->pmu_base +
> > > > >            |                                  (
> > > > >        433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
> > > > >            |                                         ^
> > > > >            |                                        )
> > > > 
> > > > Hrm. Doesn't that mean this is completely broken or am I misreading the
> > > > report?
> > > 
> > > Bah, my arm64 W=1 build (which I did do in the hope of catching any such
> > > sillies...) fails to flag that :(
> > > 
> > > Truth is this is a fresh refactoring of the mess I originally wrote that got
> > > tested by someone else 18 months ago, and I don't have any hardware to
> > > functionally test it myself. Feel free to drop it and I'll send a complete
> > > v2, or I can do an incremental fix if you prefer (I already realised I could
> > > have streamlined the version check to a one-off in event_init as well.)
> > 
> > Damn, it's not ideal that we don't have any test coverage for this.
> > 
> > The patch is buried under some others now, so I can either revert it or
> > take fixes on top. Up to you.
> 
> I've managed to break my git-send-email setup at the moment, so I hope
> an inline patch is OK!

Sadly, this appears to be whitespace corrupted in a very strange way. The
version I see in mutt is different to the version on lore, which itself
renders differently when viewed as "raw". None of them apply :(

Will
