Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3265C10A24;
	Tue, 20 Aug 2024 18:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724176868; cv=none; b=A19koQMj6A1A8uH8EGEY/+RlFgYe1Imridcs2qJWVm+gqpXRW7sw1bNS2cHqn4znJqCHmpVpGyUaZrvCaEpp89T3x4PgG1voiPWDcogacTA1XaIjq5egSRwMb5HrfTQm7Rb5m51nodAe6QEjXdg0svC3zGIzoq67n9h9ANvj3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724176868; c=relaxed/simple;
	bh=Wz5zu3e4yNGxCKPiy8sFDBCZddqZsU6MWcCyrl7HgAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYOxpvmB9n9reeZBpaoQjEUmSEiUyulWZROUfubGuZt7ZnGin3/vHzdGCnZwGK+IocsEo6O+0HVTVd1I/pGGIPghnW5cgJPTBH2icKMhq6c74IWmaEaF5oxaU8aEzNlVTkb1Dkvd4DOuFp3SCoO2cYpDQIckHO3CVhdXGRs42Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH0xHI1R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH0xHI1R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D146C4AF15;
	Tue, 20 Aug 2024 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724176867;
	bh=Wz5zu3e4yNGxCKPiy8sFDBCZddqZsU6MWcCyrl7HgAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RH0xHI1RT8+KfxYSIe9YTr7m8nN6HPSbrKESjKd/X2FZYToUuktD87acbNTNJJNtH
	 ezwaWv8AcA6+VIjdUd5PeOqy8Pp4BReAKNJc8MwOC2RRKUUbOXA/MY1QXUbCGkX9Wf
	 z9BZFdkpkCl3gcGqo4DM18zRFQA0sbuPySE6YG/ubAEf3SBgOfqTAHbAwxe6sCPMVg
	 OaeqmKnHjPCOz1OsQ2HXfNVn8ixCv4T0NEzyrt4/enib/TS3y1cx53Zgv0Ybd6lnl0
	 TflpsiftrvlaBMz741JUKZOnnH5hsbM0JySbl9AvBYVTbLe/gC5a4boMwIDl7yrCmn
	 ZzIoI+C6lYmqw==
Date: Tue, 20 Aug 2024 11:01:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 19.1.0 uploaded
Message-ID: <20240820180105.GA2061291@thelio-3990X>
References: <20240820175944.GA2015979@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820175944.GA2015979@thelio-3990X>

Ugh, the subject is obviously supposed to be 19.1.0-rc3, this is not
final yet... Ah scripting woes :)

On Tue, Aug 20, 2024 at 10:59:44AM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> I have built and uploaded the third LLVM 19.1.0 release candidate to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
> 
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the initial
> 19.1.0 release happens.
> 
> Cheers,
> Nathan
> 
