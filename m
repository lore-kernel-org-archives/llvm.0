Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277735;
	b=3eCGU4E4THj5TPGPYsVdVauhQfmlBsXWZCYStK3itpeWnKeJNg251036t+TST7dXcJ0w
	 qjQj/YfFfJM/DJxg9tlBL0tVizmmg5U3SacAgI7Tm72SiSkX9ccwMTbIPugPTkRHyluHr
	 osXWU18+T7CKcwaMvCt2k3wubvIMfYY0HBbO1ix7aJ813vlEkLczTMwLQklBZkF+iQuZN
	 UbIY+8YjpIqI40XLLBqjFVEwBeVsU5TOZqTmC/++mqunyKhBrXpd46UuIMSPsGzTpJkRq
	 NXBpQKG31+MXkrKu3Eij3Y29rwC5PvYoBO1DgDlHz3OVST/aW+/31xwa/7as+0hKdxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277735;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=d66C6wv4DLzU4mI043VbebszTBlofQJOPgwX8Cd6dwM=;
	b=fbcrVGX6mX0ZVN56nSlGDtTB7onXOgCiAuw8mrPhbVlVn0YIZ+SGYuJrR0QALnd+EcwK
	 wE/gXHIRjXQwJeBkfyYEp+3ynEDyeIfhFqEnjiZtX67/+shdW6BjEwILDOsBSjJYHCgGI
	 tHal+YGCnzrpRk/JJoG/QCZTUIEVf5qnD7QRY5LqpYErGDhSPTcNrY1BLMF5ZcpwW8a92
	 ACWoo4wUtr9GZEsC65A2qUTx5QQfWJcU0tDYcEAP1gFNoLJ/3RLEjV/NMb3FqDaBhreB7
	 0XFa8wvf9aUapK2OBG9fpuA42Cv0jNeWnUE0cgYdITJxKl1XtuWQ/3gqNxyZhfRiOiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=mdWwyzmu;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WuArQmNM;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E05F606A31F
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 12:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E05F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=mdWwyzmu;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WuArQmNM
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 12CA71D00052
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 08:42:12 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 29 Oct 2026 08:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793277726;
	 x=1793364126; bh=d66C6wv4DLzU4mI043VbebszTBlofQJOPgwX8Cd6dwM=; b=
	mdWwyzmuwDTzAvUsxCtWbuMCcTKNS4bJzaY2TEeIJrI7yuOx+1wIj7unZryo+WQB
	XMhpAa1cMaIixs85Y+pZ+n39ksYgSfcGdeTl3QocE/6oFU1GZY+wWZJLzfe5UPrj
	RlxUCaMP7bE6IEXHdu8grAu0AcWetmyHunksqNFfzkLCI7Mi6CwHhTAwJfKHXDPe
	e3Z3SzujDe5G9YaWhA5JuHlyJF3CeRwS3L84HJBtOJaKKfJNPa4hQooyxJgcnCYK
	XcvcxgL6r9Aif9Qgzzu0gvkovzR2Br2DU0YiTbeCmmpo+VlJuyfkkaEsu3ahM2y6
	ees+Y8fHHDuDkAduUCqpWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793277726; x=
	1793364126; bh=d66C6wv4DLzU4mI043VbebszTBlofQJOPgwX8Cd6dwM=; b=W
	uArQmNM2TdA/7IGGj8PR5oVaLYbgV0+e6zFBBnA/tb2D3vszfX+Wbo1Z+KKtli5l
	gAJ6+abnCgQPC7ansT10lcjTIsfVjbCLd6NNYM4126zLf3AuuVJLtl7ZdOS2cmPl
	tQLHLq+QaKTG3B86cdjNS4+1kCjLLctfMiEdEf1qd9PXhFxtY+TUxcNBReuC5T8z
	mrrh0V/Bq5LBWCuiFzDv3BREQFjfiH6EUL9YojdnM5ViGUn3UGG9TJmIXLQc5ngp
	pYQOUfQrGIQREYDkjxMVSb1n4QaDPTZQdRs/W4bi/h4C3iYSv+qw9s3et/4JUeYz
	c+mj6fwLRpDOhjJDAj2Mw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793277726; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:kLHl/h2itWZSosLXTFHz2zyKKp+W00RF79Q9/TNfeWSpcB4
	x/ckQUY/XwoFgQP0M9OFgFcQg2FzUGW03bfXGrAUiTu1PUUCoDlIwUvqlRdkFYt7
	wg5H4J1SlHPnEWCWlcF1mq4Db0gxl97oXoETLy9gikcWPCm3fH5mGfyc54w5kZKm
	1VBbjWNeq+cqoIEtd+mDivgt4al1ix+hcQ1DJ3RRE4A0Ay0414i+/HmuErpr9gT6
	rnucL0gVWDhoTpyLJK6AFjlV0b6JsqpbUGNCkUhD/vXjqsxieDYQIpyj0jjHaItd
	tSPyWI5avjxFxDZiDeNICecsoeH7LPdocK0kXWg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:pa8id8lezNHZnkKCJdOaeGBTdvPO8v5XG/p8liF/bjw=:zS2WM14JlEd46YHq+76lHPH8OxosPMsFWFrHE0AZa5U=;
X-ME-Sender: <xms:GD_jars-SiAZ94GhE4p5hGsN425X319VhlpSOuAvB0LAROqjAyGhDA>
    <xme:GD_janSL602wCkOQBa2SEr4zFhG4eIMO8EKrbNAwWQFXh8GcwITo-tvIXnuq3t91s
    2LNX1sux-UXIYBpnlfhlpQplJRFIWpWAEkb5bnqK5fMK67C7I5OS9EI>
X-ME-Proxy-Cause: dmFkZTF1xeXukoYxtIemiSr7RmgPQKVnIlQT+D5fkGBom82nl7QChx9FOS7mWdlUT9+ErJ
    kw8oCVFb8WcQicGskO3E4Bh8+FW6iiADuk0vexDdjlt6X6rnIPM/vaAWSAPvg7m32O14hd
    4D6mdwnuYRucC5ycg1z5ZC0g+33fkdixQJ9HuIlbPD33vvSXXoIUXMZOQMIkhblzBPz2Vn
    7Ha5MO8EXCdb4tOozCTfzfSXc6MQGpeRgufwg7Qs3KqpNn/Vbvhv7sWjDtPhqOMGV2TXho
    fhLYxhQuYIqSHePKOBrv13qC0NDIX5Uce4IQBcqlvqWT7EvTBRwO0UPSz2t1/wqZMVf5Cn
    SeLTQy1cF4VBH0fDdeKaDRkjA/3wX1svU9lp9S8/oBjK8016WKz/aMHS6UQ5HgnaN0bY6t
    xaibeWvLblU9HiJXGCl4QjQq8Q7Qr1N1Mbuia8GstGHix762UveSr7WaxKt5RQDa94+WKT
    REql0mFBWF+Zk4InDt1jMYAGzfcfJowE47U6LsU0UVP+dwSwIpxwH0G2GqUD6rwOC1twnu
    6nOMfTmidcHMDvAxPUsoJqNL/9IqnryByrUiikyPrZUsuxmBlyw/HoV37yo32VLdxhBvep
    VBZx4EE37nNZMEGfrSEVJvVvvB/Rv5Ojdcee0+nR3b5Z1dC+aT0kKBQp/2Cw
X-ME-Proxy: <xmx:Gj_jaqSh7hEkubgpWYjB74-ubspQz37C-J7HMabAvLe7G8X6oqIluA>
    <xmx:Gj_jaj7N-fx7uAIOncAl0IKrd2aD2t_4ZwXY3qeB0UT0gsn4Nj8pzg>
    <xmx:Gj_jak3WLme5pxtj055C-QzyS0Ylbif5tgmetW7xpsnzy4QLdxNDzA>
    <xmx:Gj_jagkJWBtj3aPUQBTOXlRTD9KYjJd5p28VQdS-a5WImaSxJDjchg>
    <xmx:Hj_jauxjz1r3cHXoIDfeJxPTV9VljSckPEplyQ2UGA_vJLqeDvPhijTu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 014FC32A0099; Thu, 29 Oct 2026 08:41:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Auj5kB-x7wqJ
Date: Thu, 29 Oct 2026 13:41:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Huth" <thuth@redhat.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Alexandre Ghiti" <alex@ghiti.fr>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Message-Id: <f7533c95-8b42-4154-b76b-7d0dfb56148c@app.fastmail.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
Subject: Re: [PATCH v5 00/13] treewide: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 23, 2026, at 08:48, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers (and
> also other compilers like Tiny-C or PCC) define the macro __ASSEMBLER__
> automatically already when compiling assembly code, too, so some kernel
> headers are using __ASSEMBLER__ instead. With regards to userspace code,
> this seems also to be constant source of confusion, see for example these
> links here:
>
>  https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>  
> https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>  https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>  https://github.com/riscv-software-src/opensbi/issues/199
>
> To avoid confusion in the future, it makes sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurrences of __ASSEMBLY__ into __ASSEMBLER__ and
> finally removes the -D__ASSEMBLY__ from the Makefiles.
>
> I split the patches per architecture / maintained subsystem to ease
> the review, and I also split the uapi headers from the normal ones in
> case we ever decide that uapi needs to be treated differently from the
> normal headers here and the patches would need to get reverted.

I have started an asm-generic branch[1] for 7.5 based on today's mainline
snapshot and applied the series. I'll rebase once more after -rc1 is
out to ensure this can be tested in linux-next.

Thanks a lot for getting this finished!

     Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/log/?h=asm-generic
