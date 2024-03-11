Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858540847;
	Mon, 11 Mar 2024 19:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710184238; cv=none; b=Lq6+fIesyV6G/jbKNotbZgyGUVULkZfrLkQTz9VMXhKuqSRBusdL9xlmIAWKWkGlSAB5LZ9Zlkt4tOZcblyvx57OPwro+1zmvvEqgla6IqFHoVocz89W4eeEE5Z0ONn8j3U9b2ajUmYvLXd+Sm0UKn/MbsfqsDJp+jmVcFEVy0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710184238; c=relaxed/simple;
	bh=VsEHveQZFFBF7KGgLhMD1cwewwydOONh0arOy0629Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9V24GSG5WblfyUm/6Eb+La3ViHP+sJRDY4tcO+R6m91ugLDYRdGX30jOdF6692CidnyXfXDVMQcvv+3uq89F7r+cPBStDMGrsmWJIxKmSPG0J0QL5t6QGFowM5VK8ClTU+zlkSrfiS74y+Jdr7XkhaDXtIiKc0TlMPRsFjpk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=d3qp6/WZ; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="d3qp6/WZ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 218B8FF803;
	Mon, 11 Mar 2024 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1710184232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E31McDAacylKlEbTy3S6AVH7WHxyqIAf3sUm0he+cT4=;
	b=d3qp6/WZGVBJqQdRusTqvxoxDZFtxU/VTqX1ThxN/HmLpFMzmFFEefkuk+MuUX9IFVbVoc
	bIfbC0MMrljHJi8tDCChpwGBXmUT8bE3tNPjoF0JnNBf0+qFoP7YipwS46PD4MM5CBG/SL
	T74vKXOKTEkF6joFVlwOlRC6/2pdW8k+T+QNzsXyLkMf0mqe9MmcNTFHazhNeK1/PqykRG
	DiuIybZBLrW5OzL3L+oYPAvOgJNLupOxQ+jMwo9MdTowwQ0D34g9jeiRCulHucn43W0x3w
	wQaEs8GE9gn7Ze7g/BeXcksXzuZ0aoXvjeimm20I3BTU9VmY80v5VocNdb8Jdw==
Message-ID: <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>
Date: Mon, 11 Mar 2024 20:10:31 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Migration to Debian Bookworm and compiler updates for KernelCI
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux <llvm@lists.linux.dev>, Miguel Ojeda <ojeda@kernel.org>
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
 <20240307170516.GA1780841@dev-arch.thelio-3990X>
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20240307170516.GA1780841@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io

Hello,

On 07/03/2024 6:05 pm, Nathan Chancellor wrote:
> Hi Denys,
> 
> On Thu, Mar 07, 2024 at 01:02:26PM +0200, Denys Fedoryshchenko wrote:
>> Hello,
>>
>> I'm reaching out on behalf of the KernelCI project team to discuss our
>> current compiler setup and planned migration to Debian Bookworm.
>>
>> As you may know, our compiler images are currently based on Debian
>> Bullseye, which is approaching its end of life in July 2024. We have
>> been testing using gcc-10, which has presented us with some recent
>> challenges, notably a significant bug that results in false positive
>> compilation errors (specifically, the -Werror memcpy issue in
>> security.c). This situation has prompted us to consider an urgent
>> migration to Debian Bookworm. Additionally, the migration is
>> necessitated by our requirement to upgrade to a newer Python version to
>> support KernelCI v2 development efforts.
>>
>> However, before we proceed, we have a couple of pending questions that
>> we hope to get clarity on:
>>
>> 1) We've noticed that the minimal available version of clang on
>> https://apt.llvm.org/bookworm/dists/ is 15, whereas our current minimal
>> requirement for the Linux kernel compilation is clang-13.0.1
>> (https://www.kernel.org/doc/html/next/process/changes.html). How
>> critical is it to continue providing compile tests for clang-13 (and
>> potentially clang-14)? This information would be vital for us in
>> planning our compiler support strategy moving forward.
> 
> Coverage of the minimum version of a particular toolchain for building
> the kernel is important but I would not describe it as critical.
> 
> While apt.llvm.org's Bookworm distribution does not have clang-13 and
> clang-14, the Bullseye distribution of clang-13 and clang-14 does work
> on Bookworm, I personally do that for my Debian development containers:
> 
> https://github.com/nathanchance/env/blob/12927502f12ec63f50a460f842c9d0a70a82c629/podman/dev/debian/setup-env.sh#L54-L64
> 
> Have you explored using the kernel.org GCC and LLVM toolchains instead
> of the ones in Debian?
> 
> https://mirrors.edge.kernel.org/pub/tools/crosstool/
> https://mirrors.edge.kernel.org/pub/tools/llvm/
> 
> That would potentially give you more flexibility with distribution
> upgrades and stable/deterministic compiler versions around that. I
> maintain the LLVM ones, which are optimized at build time to be quicker
> than the Debian one's, so that would save you build minutes over time.

Ah nice, Arnd suggested a while ago that we used his GCC
cross-compiler toolchains in KernelCI but it got stuck at a
slightly lower priority than everything else for core developers.
It has always been considered a nice thing to do one day, and I
guess there may be additional reasons to pick it up now with the
need for a wider GCC version coverage and LLVM/Clang too.

Out of interest, is there going to be some Rust toolchains there
as well?  Having all the reference toolchains to build the kernel
in a single location would be great I think.  Of course Rust
support is still a moving target, so maybe it's still a bit too
early right now - just wondering.

Then in addition to the tarballs, one thing that was discussed
with Linaro in the very early days of tuxmake was to have a
reference set of Docker image with the toolchains already
installed - to save everyone creating their own like in Nathan's
GitHub link.  Has anyone done that already?

I started looking into it while I was writing my tutorial to
build a kernel last month but didn't find anything, so it's kind
of going up on my TODO list now.  It would greatly help unify
kernel builds across CI systems in particular and improve
reproducibility.  The TuxBuild / tuxmake Docker images were
forked from the KernelCI ones so that's already something that
could be reunited at some point.

Cheers,
Guillaume
