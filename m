Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3C332637
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461289; cv=none; b=IwQAFUnS+CkaW3UcVGISx3NuN/cbvdmRAFGy1f5fxVGY8KwRxXSgs5vEkTteCRyRmklPQYWo4pSTC01ctWFfGX2epe40oKIVvvKO2XhO8mk/pUYuabcFppjgjCyOoKmUPutxhgxUunClJqmNPd8J7tKl5wE3LGy5MuIaEWtxPVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461289; c=relaxed/simple;
	bh=ON3ZXNp2mNn0teuGO1Qch5RiWn/snTfcpl/leGkxYho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYJJ6++SetY0N1/8qXGGoUKy/Tv2xilQbqs2BR88d3C42LeRQQvYx2OXyJhAHb39hul2yY0jao0biw5JcyGo1QDL53QA0TBXbAj16hTtzQxYIaX+gVjHaM/cacfx84ZRsUxsFi8oLBsOlP7nquWt6ETjrfHql0BJ34n/Ri28rPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nUIBLiwh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nUIBLiwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777461284;
	bh=ON3ZXNp2mNn0teuGO1Qch5RiWn/snTfcpl/leGkxYho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUIBLiwhS6K0U2ji2ZtCW8eb1K2wMFJlY3SD7I5H5EGw4KPX0AQoBXWopwJu8LbGX
	 tAo8L3j/r5oy7oVLVN7IfKLFC9S6xwdvCU1t1nvLiLuiXdLPhjGX/uqorTIBv94PyH
	 W3lS2bGH6mEWcFr2Lx3I71qjsh4T2o05mj9lTFAY=
Date: Wed, 29 Apr 2026 13:14:42 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: David Gow <david@ingeniumdigital.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Subject: Re: [PATCH 2/2] kunit: qemu_configs: Add or1k / openrisc
 configuration
Message-ID: <19c00a88-ea92-4f17-afb6-9fa5da247d21@t-8ch.de>
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
 <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
 <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>

On 2026-04-29 18:10:58+0800, David Gow wrote:
> Le 28/04/2026 à 12:04 AM, 'Thomas Weißschuh' via KUnit Development a écrit :
> > Add a basic configuration to run kunit tests on or1k / openrisc.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> 
> Thanks very much. This works well here (assuming CONFIG_KUNIT_FAULT_TESTS=n,
> and either a long timeout, or slow tests skipped, as qemu-or1k is not fast
> on my machine).
> 
> Reviewed-by: David Gow <david@davidgow.net>

Thanks!

> Do we want to split the series and take this patch via kselftest/kunit, and
> the generate_compile_commands one separately, or just pick both up in the
> same tree?

They should go through the same tree as otherwise kunit.py will fail to
build the or1k architecture, as it always tries to generate
compile_commands.json.

(...)
