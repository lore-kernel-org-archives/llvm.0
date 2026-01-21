Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B748B39B;
	Wed, 21 Jan 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005871; cv=none; b=JAls+syRYtvHH1uuCNaYDUPZJnUR+uZh3MHtPuWAA9BImeBin0CCC5gFhBcqyRlHOTp0mo9rsa1kUPTG7kyva+SmAzR4OMmLAK9fVZAmEWoStsmc9Ooqrbz1JJbMX/+t1bEs7DQwGE162mFBjmNveGXOWGFVDFoTYjl8YgB0E3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005871; c=relaxed/simple;
	bh=RcFQXjdzTBzBy/KUud4PkCuLezMUyAi8Xu6V7ddqz0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNzSpENoiZDcy6N1DhXVY0IrjEB3DrG4utjkqny2PdhK4wQ8UdrjARrRhZ08hVD6HnJ6c6APRbA7sqlv7iNmN4w6r5ltrAHMGDPdXluRhXYX4Rc9OhbFmOc+6EddLxeYSxN2dmWjVXmkaI6mWueTQfolVqeFioRObIxyIDqtZQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GsM9Ugm+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GsM9Ugm+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RWqYwnqDJ799o8YIF56S5CIu7d4I7YfRi8rNkXkluL8=; b=GsM9Ugm+PIFu7fz2Groda0bvwW
	ocAKrMGIDi7pYHU6Actlte7ieP7qsgCRAs7ZACDIekYnlgApQCzZVlPsCUcGxnTfjKP61cxn8DGPa
	ClvUKNIHfwrZn3av18o2Ee9usJDcDlG1s2g5RTvu2yhM2opfBpla37h1P31BFobb4RDfPwR1GRyCl
	WeitjCanILM1RT9B1DtcWqHy7Sq4o475K4BrlSQGPUvUiKaxtg6GtVdGhEyD1VKdo6+BEWs1G3Dgd
	eELvgHP53vMgS+R/EQNVBBNaHSgkqRFEVvPUPiKVSuiyR3h/dB7zUAuO55QloPbxPRlABZ8Y3IRtK
	p8r6NERQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZEc-0000000GCKs-14pX;
	Wed, 21 Jan 2026 14:31:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4866D3007E1; Wed, 21 Jan 2026 15:31:00 +0100 (CET)
Date: Wed, 21 Jan 2026 15:31:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Marco Elver <elver@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [tip:locking/core 24/43] mm/huge_memory.c:4055:8: warning:
 spinlock 'xas.xa->xa_lock' is not held on every path through here
Message-ID: <20260121143100.GC166857@noisy.programming.kicks-ass.net>
References: <202601212251.RuHvsKd5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601212251.RuHvsKd5-lkp@intel.com>

On Wed, Jan 21, 2026 at 10:27:16PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
> head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
> commit: 6e530e2e31191d88f692e6c8d3bd245e43416e4f [24/43] debugfs: Make debugfs_cancellation a context lock struct
> config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212251.RuHvsKd5-lkp@intel.com/config)

Again, that is:

 CONFIG_WARN_CONTEXT_ANALYSIS_ALL=y

Robot folks, could you filter out those configs from the randconfig set?
At this time, it has no value reporting these.
