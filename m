Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317341F345
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168839; cv=none; b=Ax3cBlp8T5coLp9eIG4OWcmB1lVo1k6shhqk5zMKom5UsQM0Nm0oRwF5AwGpSqEK01teFfDLOlFVIkjN+lHhYgmsVi5kgM3pwCohUUG15gSClOUWQpWVjAMhTNR23U56k0qxk6GMfx84bmMT1/XtflldzAjiVoFM5sBwtTe+zYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168839; c=relaxed/simple;
	bh=J0n/2MDbprP+4/BOE8uYIGx9Y6a65nQVuhCVSGqFBks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fifVFxgRIPIqqun+ppSorY1bERfjuZFe6qqPSkaJO0pepT5WjSyjF3GPMm6mJ6Gi25Yqrq8PrMpO6FR2Q7j9bepZsjLPK7dGD4yXLoGxSMT8KSlNVeoRvDk4dcpCFfep99NF1AhIyaus6Ot3gFSKmSTZdoMTqILXV7CeGNvn1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Fvd5NXUP; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Fvd5NXUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785168827;
	bh=J0n/2MDbprP+4/BOE8uYIGx9Y6a65nQVuhCVSGqFBks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fvd5NXUPs/btBdkE97/4uM3WTFpd0GZqzY3gOXubh4fggNFJlllhKxiIO/ndiOwWK
	 JyArMXVN4sqrQB0hEJZUkHYY4tbWo928N5+LBsJH5X02LygR53FgticDjrvoXfgksd
	 t8St5Lttbv4UgTRi133nzsMFH03FzJDsffpPuRGU=
Date: Mon, 27 Jul 2026 18:13:46 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Willy Tarreau <w@1wt.eu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 3/4] selftests/nolibc: add abs() range test
Message-ID: <625278ef-06fc-466f-8b69-9a37d5097b18@t-8ch.de>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-4-ammarfaizi2@openresty.com>
 <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
 <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com>
 <4e22086c-8a60-4965-8d78-a946dc54eaa3@openresty.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e22086c-8a60-4965-8d78-a946dc54eaa3@openresty.com>

On 2026-07-27 09:01:09+0700, Ammar Faizi wrote:
> On 7/27/26 8:32 AM, Ammar Faizi wrote:
> > On 7/27/26 3:00 AM, Thomas Weißschuh wrote:
> > > We have _NOLIBC_OPTIMIZER_HIDE_VAR() for this.
> > 
> > Oh, I missed it.
> > 
> > > Maybe it can be made variadic.
> 
> Oh wait, tools/testing/selftests/nolibc/nolibc-test.c is compiled
> twice. One for libc, one for nolibc. The test cannot use
> _NOLIBC_OPTIMIZER_HIDE_VAR(), it breaks libc:

Good point.

> ```
> $ make -f Makefile.nolibc run-libc-test
> nolibc-test.c: In function ‘test_abs_range’:
> nolibc-test.c:1756:9: error: implicit declaration of function ‘_NOLIBC_OPTIMIZER_HIDE_VAR’ [-Wimplicit-function-declaration]
>  1756 |         _NOLIBC_OPTIMIZER_HIDE_VAR(ll, l, i);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> make: *** [Makefile.nolibc:278: libc-test] Error 1
> ```
> 
> What approach do you prefer?

Do we need to hide the variables for a regular libc?
If not, we can have a dummy definition of _NOLIBC_OPTIMIZER_HIDE_VAR().


Thomas
