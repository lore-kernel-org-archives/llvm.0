Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A823E345;
	Wed, 12 Mar 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741790159; cv=none; b=arMJoa5Cr4C1Pz3jNv8QZzRoAUyHl27v/t+RATsiKvAKuAhDTpET7KQP/Gp8uPuBv2ts7WwLWRYMvFOhcSUymOdV/TO1+FYzSWZRDLPHOn6rBmrfRqOQo6AiDyEGuNU1L1Hsylm5T9PDQGeOT/EUURqI0XnbV35sDms4OpEG5Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741790159; c=relaxed/simple;
	bh=Om1dY/YB49JIrwM2DHxW+NLsKtSKh/1ViElkmGpC3uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+aBWOWC6mRaCBGq2hDlXhG8229/V0tZSGZWPyglgjY57H1fYFuituTnuJZFYq3Jj8JKcuGG1i1vHWKokJnqqt06606wHVg53anU/TaYJr2rOPKhFS10Z8tw1eXij09WfS7oigCmIiAL85ueQE360B0WC9mRiRXtzry7ogPKsA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fnm0Djy2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=asnlqnL4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fnm0Djy2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="asnlqnL4"
Date: Wed, 12 Mar 2025 15:35:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741790155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ClJDl6j0UFvDIvPSJP05QyfAB7EqRFriBxe7t9nz9E=;
	b=fnm0Djy2gDuQHHOi5jg3VXD4fGJ/OzNh1CZbp4T4i6mbBq2IuAJ5mBd8NbNk+rB6mz6pJW
	RkOqYdKHN6411WcQ1S0fA/64PEHW7+hEopT+k9mQ7in30Y58/mXoJ8I8r76AluO4VrvH7R
	RI9QP2x2RlXS6phH/tZk6t1Nog763AGV2W84UcqAMO3lRwNtO1ZqQTwxEwtf0fdzkj6/+Z
	MYT83BIEbZetDPWby0c03AiiGK4HsSypw6z6WT8GxQj4QbB2VPP332tut83oaFMJOUxy4D
	JmdoaBqHLwvRGMWl3mZowOGkCQN7whSqHIYzMahZ++zBtmYu2czrwshiGBjbtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741790155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ClJDl6j0UFvDIvPSJP05QyfAB7EqRFriBxe7t9nz9E=;
	b=asnlqnL4oz7pqr8vjwxp1kegecdt6RwQ3IDFKcZG7BJOPZ54ZDirGWGIdfRFslODljTj53
	e80gC94IPPh6edCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [bigeasy-staging:futex_local_v10 16/21] fork.c:undefined
 reference to `futex_hash_free'
Message-ID: <20250312143554.wRAwcanZ@linutronix.de>
References: <202503121056.u2KwsVBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202503121056.u2KwsVBf-lkp@intel.com>

On 2025-03-12 10:22:27 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v10
> head:   1a9133756e6eeef39468a2076cf712331180694b
> commit: ccbfa01ed2ba7957ac35cd762f8a26dbf3e1db97 [16/21] futex: Remove superfluous state
> config: sh-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121056.u2KwsVBf-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121056.u2KwsVBf-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503121056.u2KwsVBf-lkp@intel.com/

Thank you for the report.

Sebastian
