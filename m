Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E734E750
	for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761679381; cv=none; b=cGh0xl0tu6ZWLf1AuQ663ZXyI5sf4l9yRiFbCQAWrSKN7BwiaZuJXe8uHk+aBL5sh8CrEcM99uxarWZ3Qs/WdBb6H5bNr243c35yzVco/j+UTMjJNA+EqW6Jau0ayPg6QAc0GfqXoQS9BCIABpBDuJOE/ouZg9B3Cqwi7WEWKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761679381; c=relaxed/simple;
	bh=FF4Qf51HeniU4/6NrIYJ51oAsFYjuewiaqxPEZwmODo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVc38P8Cun9nJiYsMpEG5wo/UQcDKxagrBzM9vXLJy9iQ/k/rG9IXfdf8wMy0JDKUZIk8YokV8QlWsQOWKeb0ycLvOwGHymWOEa3sf1hqr8x+05Wuqb7Esr6SnUA3zXsXQKr3xgxZs0vb/Sux+b0JGOuHx1sQmYNl4pXvdDhG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=PrREbZWX; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="PrREbZWX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6F96284C45;
	Tue, 28 Oct 2025 20:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1761679377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hYvNMVjeKzw3MzT3PrZtTs9nPaVHSX4F+oxSbDdwhj0=;
	b=PrREbZWXHDEuoRfTiEJjARFeYMjjlovinN+BSgkoA/5g+0Bky4Jr7HnVE5wshV5jJiwyS4
	5PGtMsKEDQi5Yt6ZM1NyyX2a7XKDWbdLtTsOkfQrPMUupn1O58JXTdyP7WTaeMY0m1o8QN
	co2osOmSfBr8lWT3X4c/g08qCpWv2Q3+BF+lBIFPqhPIp9ZGi1jes5atFQU7OQUdPuhDcJ
	chcdyCu3nYsRnY96jgKOlm0oVToI7NjdAdUU6J8fl364FLip9wqCATFqs6pzkf/gOoxj6i
	KVWrFslZTk9zKq4lxed1bXEUJ+O5tSRQpRtFTJNsFLtJ+bxGF0EEI85AdRfTZw==
Message-ID: <ff40b07b-bc22-4588-ad17-c38b7b4d9867@cachyos.org>
Date: Tue, 28 Oct 2025 20:22:51 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang
 ThinLTO
To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Stafford Horne <shorne@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20251028182822.3210436-1-xur@google.com>
Content-Language: pl
From: Piotr Gorski <piotrgorski@cachyos.org>
In-Reply-To: <20251028182822.3210436-1-xur@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Built and booted without any problems.

lucjan at cachyos ~ 20:19:27
❯ zgrep -i THIN_DIST /proc/config.gz
CONFIG_LTO_CLANG_THIN_DIST=y
lucjan at cachyos ~ 20:19:45
❯ cat /proc/version
Linux version 6.17.5-1.3-cachyos (linux-cachyos@cachyos) (clang version 
21.1.3, LLD 21.1.4) #1 SMP PREEMPT_DYNAMIC Tue, 28 Oct 2025 18:39:23 +0000

Thanks!

W dniu 28.10.2025 o 19:28, xur@google.com pisze:
> From: Rong Xu <xur@google.com>
>
> ChangeLog:
>
> V5: Handle single quote escaping in echo _c_flags to fix
>      Piotr Gorski's reported error.
>
> V4: This is based on the reimplementation provided by Masahiro Yamada
> on May 26. The difference is that this version now saves the compiler
> flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> for the subsequent Back-End (BE) compilation.
>   
> Rong Xu (2):
>    kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
>    kbuild: distributed build support for Clang ThinLTO
>
>   .gitignore                 |  2 +
>   Makefile                   | 25 +++++-------
>   arch/Kconfig               | 19 +++++++++
>   scripts/Makefile.lib       |  7 ++++
>   scripts/Makefile.thinlto   | 40 ++++++++++++++++++
>   scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
>   scripts/mod/modpost.c      | 15 +++++--
>   7 files changed, 174 insertions(+), 17 deletions(-)
>   create mode 100644 scripts/Makefile.thinlto
>   create mode 100644 scripts/Makefile.vmlinux_a
>
>
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
