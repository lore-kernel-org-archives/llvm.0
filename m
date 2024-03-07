Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D07129A75;
	Thu,  7 Mar 2024 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709831118; cv=none; b=GT5vt4gCOwkCLa/fYPYgBzn3k0YSShiohQSO1cdrl3kc4E9pF6P69dBqb80x4bVJqw5mdSfXmKhTaUsx2psP14he8LXI5d42IDgIBSi1G94RVQq/prK+9ol8BqbYAbd+z9/rScIjGDLaSTsQXgIld/zTayGNIIi+cLg2so9oYq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709831118; c=relaxed/simple;
	bh=TtRbN1VOqJxpNVhvXT2fV/GNQQc/3umHhKwYdaOj9mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbpuH0n4keoz5sWaYCtcchDJ4nr+edszcxY7CtH4ujXsjVmLnDMKXJq5S33DNoBIcmp/W4h9BSXnoduHqWdpbY9Xl0SHLvsSsI8lKfyvVatr0+cWpg0sSVkP8N2zHZa2c54TKIMd4/hzQhK0vKdPfCqcotcZykiGhStxZnp1jcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoNGmWt9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoNGmWt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2150C433C7;
	Thu,  7 Mar 2024 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709831118;
	bh=TtRbN1VOqJxpNVhvXT2fV/GNQQc/3umHhKwYdaOj9mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoNGmWt9yUrrzrEv9bdRujivJMyEWfMA9MEUM7fQYCGwnYqfEr9d8OHb89SWMqKez
	 gygulVqQvk2N2CEUYhVxEwLUfZ+1izTwBe6siXtgrPEHwtttKGsiinm9kg4bKJVJyA
	 zrDEoEl5CGFXhIkDZL2VuOm/gv0HWKhJAJTlndbmga6fNvHO8Q7IJANSdETHS9mgQL
	 88HFdOS8DNeu6noSxt3KQDbDmegzm5c63eR70wtiwL2jcoIi84dKjaCYGEYm9v1yEn
	 3GBYXyBZq8j9cWCZSnwJkWqdvY0O952PK522kNDBMRTPk4F5NNrHbrPuvLVo93tVLl
	 78IWO4SW0LQTg==
Date: Thu, 7 Mar 2024 10:05:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: Migration to Debian Bookworm and compiler updates for KernelCI
Message-ID: <20240307170516.GA1780841@dev-arch.thelio-3990X>
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>

Hi Denys,

On Thu, Mar 07, 2024 at 01:02:26PM +0200, Denys Fedoryshchenko wrote:
> Hello,
> 
> I'm reaching out on behalf of the KernelCI project team to discuss our
> current compiler setup and planned migration to Debian Bookworm.
> 
> As you may know, our compiler images are currently based on Debian
> Bullseye, which is approaching its end of life in July 2024. We have
> been testing using gcc-10, which has presented us with some recent
> challenges, notably a significant bug that results in false positive
> compilation errors (specifically, the -Werror memcpy issue in
> security.c). This situation has prompted us to consider an urgent
> migration to Debian Bookworm. Additionally, the migration is
> necessitated by our requirement to upgrade to a newer Python version to
> support KernelCI v2 development efforts.
> 
> However, before we proceed, we have a couple of pending questions that
> we hope to get clarity on:
> 
> 1) We've noticed that the minimal available version of clang on
> https://apt.llvm.org/bookworm/dists/ is 15, whereas our current minimal
> requirement for the Linux kernel compilation is clang-13.0.1
> (https://www.kernel.org/doc/html/next/process/changes.html). How
> critical is it to continue providing compile tests for clang-13 (and
> potentially clang-14)? This information would be vital for us in
> planning our compiler support strategy moving forward.

Coverage of the minimum version of a particular toolchain for building
the kernel is important but I would not describe it as critical.

While apt.llvm.org's Bookworm distribution does not have clang-13 and
clang-14, the Bullseye distribution of clang-13 and clang-14 does work
on Bookworm, I personally do that for my Debian development containers:

https://github.com/nathanchance/env/blob/12927502f12ec63f50a460f842c9d0a70a82c629/podman/dev/debian/setup-env.sh#L54-L64

Have you explored using the kernel.org GCC and LLVM toolchains instead
of the ones in Debian?

https://mirrors.edge.kernel.org/pub/tools/crosstool/
https://mirrors.edge.kernel.org/pub/tools/llvm/

That would potentially give you more flexibility with distribution
upgrades and stable/deterministic compiler versions around that. I
maintain the LLVM ones, which are optimized at build time to be quicker
than the Debian one's, so that would save you build minutes over time.

Cheers,
Nathan
