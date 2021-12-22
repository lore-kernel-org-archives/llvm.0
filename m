Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E13429CA
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 12:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794B1C36AE5;
	Wed, 22 Dec 2021 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640174881;
	bh=ih0yNi3pYBYHvZ9jpRfJHj284bDIF50JlTo6vHdU8CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yiSy49mNv9FWGkjQkslm+E5fTyVfqW3+1fg+K/DSxOZrQwiMUe9kXI7wQhSOp9eYB
	 XG7ZDyrbmSIl/BVkVobL1QukM6cCPXEg5SxJjitMbsgT1Y+p60tNRzgZ6uCY/8yHwb
	 n4kYCIrd/URQ8GaS9M3gMa1YLQ+E+VRjpj/vaAJw=
Date: Wed, 22 Dec 2021 12:58:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sasha Levin <sashal@kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Stephen Boyd <swboyd@chromium.org>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev
Subject: Re: CROSS_COMPILE_COMPAT cherry picks for linux-5.10.y and
 linux-5.15.y
Message-ID: <YcMSzCt3vZ75UQ5c@kroah.com>
References: <CAKwvOd=3ZSuiLxWbRWicTWF2WX4biS=-+EEXbSJiuLEborbD6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=3ZSuiLxWbRWicTWF2WX4biS=-+EEXbSJiuLEborbD6w@mail.gmail.com>

On Tue, Dec 21, 2021 at 04:32:12PM -0800, Nick Desaulniers wrote:
> Dear stable kernel maintainers,
> 
> Please consider cherry-picking to linux-5.15.y:
> 
> commit 3e6f8d1fa184 ("arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd")
> 
> Please also consider cherry-picking to linux-5.10.y:
> 
> commit ef94340583ee ("arm64: vdso32: drop -no-integrated-as flag")
> commit 3e6f8d1fa184 ("arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd")
> 
> They landed in v5.13-rc1 and v5.16-rc1 respectively.
> 
> They allow the command line for building the arm64 compat vdso to be
> shortened by dropping the need for CROSS_COMPILE_COMPAT for LLVM=1
> (and LLVM_IAS=1) builds.
> 
> linux-5.15.y:
> from:
> $ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make LLVM=1 -j72
> to:
> $ ARCH=arm64 make LLVM=1 -j72
> 
> linux-5.10.y:
> from:
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make LLVM=1 LLVM_IAS=1 -j72
> to
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1 -j72
> 
> This can be verified with the above by checking .config for
> CONFIG_COMPAT_VDSO=y after running defconfig or building
> arch/arm64/kernel/vdso32/.
> 
> I also verified these build with clang-10, which was the minimum
> supported release of clang for linux-5.10.y and linux-5.15.y
> (Documentation/process/changes.rst).

Both now queued up, thanks.

greg k-h
