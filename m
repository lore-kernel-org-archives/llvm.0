Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770436;
	b=zOo823amkbekVbHbY0btaVYs5NrSZu0EkLbRgTGirZEw2wVft5MEr/0RJlc60kmaq74b
	 PRJSyobOlim157kROCE868YRr/3RJfPhEpLrAnHoYeKHGVFq6SBYSr6XkKtxU+vJ12jzG
	 8NQ3lqFlPpGOC9K/+I0ksgjwqbVGxvWZ9/P5E3LjUVpNMTE+Xby5Rm+iPjx7JqWZqVuRv
	 +dd7/rOzdo4FB9GDg6yoyjvFa6RMZRXsbX4V2+PhHUfKnWUdce5j0FiUbENO8b7ANkrOi
	 XRRfpjZBSnsRMmElLp1sHu/3mR9XEdP39eT9RE8aSsJIzNqOOw8bpKyT2b+ra4p6yiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770436;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LBxLVBAzhD8PnAjoJ0Ac22ybO01a1W4k52zwzB7Vd/s=;
	b=mm0MI4ZlHgvRa0h62aJmAJpmBzc5SyqBqQqE65r22ZBnw/RmWojZNewHVzsbypl5vPty
	 5YtTrAL/UW6bbXg/v1SVT5oJ33MUqXG7tc8TciXW6Zfv8rFsEGF2J1mxAJBn3+39phWVg
	 xTV3Cxs0YP4m8FeW81P5f6xGv/ouWTvKXnGhhyhZpeadpDK4GPnkGUi2/36Bs3LaJYx2U
	 OcXOEPcENGDhIQOGECL9/Tp1Gib0chFM+V00zIy6JXc3IdJsXOz0NFNMGEaKSFb/l3H4z
	 qhVjCiuEt58d6rEKN6H5JqljT2L0uNwoH7hazgMVNw96pZ6PSzxCt4hcFyxLOYlS8ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nr1MGqpR;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A99606A31A;
	Fri, 23 Oct 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nr1MGqpR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792770433;
	bh=LBxLVBAzhD8PnAjoJ0Ac22ybO01a1W4k52zwzB7Vd/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nr1MGqpRXovpKxwFNCUnab+BhHhBam7aazQ3MqZ5YGJMAII1f5QLuELu6yycitAAj
	 ZqSg89TRyQNQ1F9CS/6kVMw3tnMnDT4mIAuVRRpctkDXxwUcDBqDPhgGisW6EAvhqK
	 2MKmE7cEhfpeYz5/8Cs5AZeGWeYAm6lnSExusphw=
Date: Fri, 23 Oct 2026 17:47:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/13] treewide: Replace __ASSEMBLY__ with
 __ASSEMBLER__ in header files
Message-ID: <2aa62156-9139-42a1-b993-4e01ef408da0@t-8ch.de>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>

On 2026-10-23 08:48:37+0200, Thomas Huth wrote:
(...)

> I split the patches per architecture / maintained subsystem to ease
> the review, and I also split the uapi headers from the normal ones in
> case we ever decide that uapi needs to be treated differently from the
> normal headers here and the patches would need to get reverted.

Nit:

The UAPI split doesn't really matter anymore, now that
scripts/headers_install.sh normalizes all UAPI headers.

(...)


Thomas
