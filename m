Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25161F30A9
	for <llvm@lists.linux.dev>; Fri,  3 Jul 2026 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783100288; cv=none; b=h1QeO6fnyCVkrpxaiYUv8vqY/oAVvTIOduIvY+3i3Z7g/cbZ3h7BwtiIAy6Fm68JbOjLvi3coeQS1oTI4ljg7ieuO4LaEuRwjTYyH69Q742GO1WGLANqwbycwowF9HPsYM//OEXatNNWir7IAFl1ydy4lGXrhTu9UQkWHtn/wm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783100288; c=relaxed/simple;
	bh=pLtsCsOfijt8xo3gRyBBTroxn7rCT5iIyFQSa01dmjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNZFpPGpbE9CzFy4NcQ3AkBMh5EpsG/67GHBIQA82V3mpYACKMAV8uipZowmkQix6UFIP5TCv3kgKYWX/RVqXFe09jCMQ16Ai9g7QGWcFV2X8hY5Ze0eqx90+Ov34wqD+8gyCvmXfSx4PAjwXq0KuXCt2orvEBBSrVw6mlniuYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=P4yv3Hc4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="P4yv3Hc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783100284;
	bh=pLtsCsOfijt8xo3gRyBBTroxn7rCT5iIyFQSa01dmjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4yv3Hc4qBgE64KqV/gBRr8j4dLkhq0/E5NaPyGOn1qoolAYBic+bSezLBIkuAlzy
	 m1ns2cje7JPKi4iO19Va0r+WBdPlpKFlh+raoVg9bne0zGaOdScyYb0Nu95DE/Wpj3
	 aHLfXm1bG/vwHVj9E1gaeXVDZVmU4XebXvvZbugU=
Date: Fri, 3 Jul 2026 19:38:01 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] selftests/nolibc: Add test for getcwd() and
 readlink()
Message-ID: <24e874dd-9bf0-46b2-b22e-73ec3c6ff941@t-8ch.de>
References: <20260702085101.3304547-1-daniel@thingy.jp>
 <20260702085101.3304547-4-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702085101.3304547-4-daniel@thingy.jp>

(+Cc clang/llvm folks, scroll down to test_getcwd())

Hi Daniel,

On 2026-07-02 17:51:01+0900, Daniel Palmer wrote:
> Add a test that uses both getcwd() and readlink() so that both
> are exercised.
> 
> First the happy path is tested by fetching what should be the
> same string via getcwd() and readlink() and checking they match.
> 
> Then a few different combinations of bad parameters are passed to
> getcwd() to make sure it returns NULL and sets errno in those
> cases.
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>

Applied, thanks.

> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 53 ++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index c1c1ce43a047..ad3f6e0751be 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -854,6 +854,58 @@ static int test_dirent(void)
>  	return 0;
>  }
>  
> +static int test_getcwd(void)
> +{

I removed the static from this function.
When it is inlined the tests fail on SPARC on clang.
It seems the system call register is clobbered before the syscall is
invoked. It works fine on GCC.
The fix in [0] makes things a bit better, but not completely.

To reproduce:

* Check out the branch for-next in [1]
* Apply [0]
* cd tools/testing/selftests/nolibc
* ./run-tests.sh -m user -l sparc32
* Only run the problematic testcase: ./nolibc-test syscall:1

(The "sparc64" configuration is also broken,
it looks like the same issue)

This happens for me with clang 22.1.6.

(...)

[0] https://lore.kernel.org/lkml/20260703-nolibc-sparc-asm-v1-1-c7fe73e2e777@weissschuh.net/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/


Thomas
