Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3291E377D
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728061799; cv=none; b=hkGgixQlTCdTPR9lLYJmTU/oqzvETKsZumb1++FCpQykBOXLX5AsSIk3f1ArkrFl+N7f4QPYeEO/7p/zG/3fiGJ1/PQLxmYReQJ2/hq4jC7q6No1P/71e/HQHHkKSLLcq120iVKc/b0CEGVED9rpcsh3slcCFmoyS14jAGmRMWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728061799; c=relaxed/simple;
	bh=LUkUba7EaRRDA3CYbTh4UVG4afh4dr+wG8m4Zn7PW3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTCFEgwGIpX467Fh+qsEsU2cN78v4kB0ORLkwC+O4pxiBVhMuJC1Fbh4igCw5uWnqF9H+slblVnyChSUWyOGwuPsmBU4ujvssSWdb/ENPlR74WmXqCvKGqUTuGkDY7AW2lBtFMd6Vgn6wVcnoyT/2uYbYbrlLpbE5L81C05qDuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jX2VoPs2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jX2VoPs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C55C4CEC6;
	Fri,  4 Oct 2024 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728061798;
	bh=LUkUba7EaRRDA3CYbTh4UVG4afh4dr+wG8m4Zn7PW3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jX2VoPs2MVR5bcece3I+MLQJ1EChjUXsudOtFW2wJ3e+pLqBwQpGg5t0NpATzhsk/
	 WTT0LiyiacOymg7AKs0e1e0bBAF6F1JQzyUQevWTjMZRzdg++1y7+uUVycVBsuLyZq
	 TdbjdVbjaHPyKhiG15pRC2CVv1akgF87Fw7i+2yKYD/eEr2umobhXBrYr3Ia1CYp6D
	 lcih2xRbdyXWUK30hQZ/VcxOdJ1Z14/ZuWrakb1X7IT1uIcyRr7UMGuICCGS/gzL4J
	 OsE4EiFr1UWQHHNm1OEmVDg4eBNKmfz8iZsy5jY+ppWPum6aPO7XabROZYzm6WnfeW
	 CG7QNDSKttDFA==
Date: Fri, 4 Oct 2024 10:09:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.11-rc4-291-g16531118ba63: Failure on aarch64
Message-ID: <20241004170956.GA2245471@thelio-3990X>
References: <465803567.16378.1728025503417@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <465803567.16378.1728025503417@jenkins.jenkins>

On Fri, Oct 04, 2024 at 07:05:02AM +0000, ci_notify@linaro.org wrote:
...
>   | commit v6.11-rc4-291-g16531118ba63
>   | Author: Denis Benato <benato.denis96@gmail.com>
>   | Date:   Sat Aug 24 16:11:22 2024 +0200
>   | 
>   |     iio: bmi323: peripheral in lowest power state on suspend
>   |     
>   |     The bmi323 is mounted on some devices that are powered
>   |     by an internal battery: help in reducing system overall power drain
>   |     while the system is in s2idle or the imu driver is not loaded
>   | ... 5 lines of the commit log omitted.

This should be fixed with

  https://git.kernel.org/jic23/iio/c/506a1ac4c4464a61e4336e135841067dbc040aaa

which is on its way for an -rc release.

Cheers,
Nathan
