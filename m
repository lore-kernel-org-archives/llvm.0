Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9555478D
	for <llvm@lists.linux.dev>; Thu, 12 Feb 2026 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915713; cv=none; b=EU7jTg75YVp8MFR1cklvSW1V/tz5RucjOqZH8t3UZaEwPMKFJiWNl2CmjOE7m3jZgbLVN36zPTZm6yOkx33JK4H0vR9yw5II+TWFyWQVlwp4HSwaSHu8MtqyvU51qZjqXjIMhUY45dCIOv6J30XgU22foG5N8p0MysOr8IvYLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915713; c=relaxed/simple;
	bh=b7T33PJtvGBPBtpcmkzCx4thk7d25jUwSrCF9Ynrzv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHeieFjTtqugWNn2kZHO0MxxR+4qDW0Mc4kfJBAx+HWNTQ70jwLSAqt0HI94k9WtRaoBW58MuYiNLAejzBWaw7fegEIFLpPvtmbh5ElevlphwZ6qP12sCwBFMEKExZjHEnnETRNigFcRmCQW1JKePCt1e1KsIdNRaTTH6/LhkL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dsiychv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dsiychv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFFAC4CEF7;
	Thu, 12 Feb 2026 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770915713;
	bh=b7T33PJtvGBPBtpcmkzCx4thk7d25jUwSrCF9Ynrzv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dsiychv+cru1SEtLn+e4+RUGEQzYFvDRs5vejhLYoaY1CVQ0nbCwcoucuhuFYWSKf
	 xcIhLxgkEdiZScfDXJfKGEin8Axa8weELzwh9sow9UQdbc6zhMMH8Gto0JG9kqfR/N
	 XRp63+4L386/zg9I85f1ypC3BXNuXfH901hZ5cBYCoo98Pf9JYKVg967HQChtpRf/b
	 dFBLl+P9CbQa3BrA7SfqzECtcSkivtsWaiDPLcZ6ECvP5Al1pBCer0GJzHuhU71pbR
	 +o/ZZfq2BCdqZnYAFii3QYOfy2XDDgGnvy/iue+qJg8W0iB8l74tRprf3E3RdN3fIN
	 H/zNbQ6jyIDoQ==
Date: Thu, 12 Feb 2026 12:01:49 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Aaron Ballman <aaron@aaronballman.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Marco Elver <elver@google.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Bart Van Assche <bvanassche@acm.org>,
	"Jose E. Marchesi" <jemarch@gnu.org>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
Message-ID: <20260212170149.GB1036664@ax162>
References: <aYhfK3tB0X6Y_GyV@gmail.com>
 <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
 <CANiq72k6ZHbW+tnX8jjOUaj4aSMigEaH4SEkODX==OJBseKCug@mail.gmail.com>
 <20260211195139.GB3482274@ax162>
 <CAAt6xTtmrrZh-+H-jV+bcteZwG1jabraTxWQ-uLJ_N9h1ZLxdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAt6xTtmrrZh-+H-jV+bcteZwG1jabraTxWQ-uLJ_N9h1ZLxdA@mail.gmail.com>

On Thu, Feb 12, 2026 at 07:22:26AM -0500, Aaron Ballman wrote:
> On Wed, Feb 11, 2026 at 2:51 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > It has always been on my backburner to try and get a build of the Linux
> > kernel as part of LLVM's continuous integration but I have never had the
> > time to sit down and interface with folks to see what exactly that
> > entails (I figured it would involve integration with LLVM's build bot
> > infrastructure but I have not dug in super hard to the documentation).
> > An arm64 and x86_64 defconfig build would probably catch quite a bit of
> > initial breakage and it would be easy to pin Linux's version and only
> > bump it when thoroughly tested.
> 
> FWIW, I continue to be in full support of adding post-commit CI
> resources for testing Linux kernel needs. I'm not super familiar with
> the infrastructure side of things, but I'm happy to help make
> connections with the folks who do know if it's of help.

Yes, I would greatly appreciate that! I would like to see what it would
entail in full, as I could potentially carve out some time this quarter
or next to actually get it going since it would be beneficial for both
sides.

Cheers,
Nathan
