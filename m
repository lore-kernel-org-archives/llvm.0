Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FCB26AC5;
	Thu,  3 Sep 2026 00:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396716; cv=none; b=PwEc158QFcxsQkvULasBMzTjuf4hbnjBzb3Lopy9HOE6Uv3vjOwHXKyi4wL84H71Xcfxns/+8YMG+2v/RTXs4a4TJB2W62uiPiyhDbsHBaeN7jR03jiRCEvFYA8WrkyuajqymtFMkI0+mz/mL3Ngnsbu7CA3iqX2CTIcxnqh4hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396716; c=relaxed/simple;
	bh=ZzTPwPM53Ym9c5Cc55FpAc9i30nt8Zcdfv6SWe9WJW8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hswzQfWU85N5SXQcUBYWXfIAn+p/ztfp4WsfjQYuuQgTGwn7ofntqmfClp48lJX3lwO/C+vkvN/KS3xY5HoRLhDc/aoSGFwHw42CSWdE04q6b6CFRXb7I80EB1jLKst+K8Zyvk0ROByAl6SRDTQftSI5k20BkF7kP03AVXCR+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2hCete2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2hCete2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A873E1F000E9;
	Thu,  3 Sep 2026 00:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788396714;
	bh=fIKuesSizdElNkdJ/5ufIZdLWPZlgW2HJnI0fSJ3zoU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2hCete2Q6pLv0cc7u6+gQ51yP6uQYBh4DutR9/MDozNJvLD0TwUpZggwpvyKA1B/i
	 gdXS+CnzEDMpfjxCFzPgYRxwhnNO4Zn546wc+oGHWXhCMYAlx+rti/6VsTsnH+9rI/
	 Nl+hFcpan/rnmyOQsUFpcz58CqdpN63w97tOAfyY=
Date: Wed, 2 Sep 2026 17:51:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] scripts/checkstack.pl: support llvm-objdump disassembly
 for x86
Message-Id: <20260902175154.14870f981733146727c67c20@linux-foundation.org>
In-Reply-To: <20260902-checkstack_llvm_objdump-v1-1-edb4eca5f163@google.com>
References: <20260902-checkstack_llvm_objdump-v1-1-edb4eca5f163@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 02 Sep 2026 14:01:53 -0700 Nick Desaulniers <ndesaulniers@google.com> wrote:

> When running `make LLVM=1 checkstack`, OBJDUMP is set to llvm-objdump.
> llvm-objdump outputs disassembly with instruction size suffixes (such as
> subq/addq/subl/addl), tabs/whitespace differences, spaces after commas,
> and trailing comments (e.g. `# imm = 0x...`).
> 
> Because scripts/checkstack.pl used rigid regular expressions specifically
> tuned to GNU objdump format (e.g. requiring exactly four spaces, no
> suffix, and no space after comma), checkstack.pl failed to match any
> stack adjustment instructions and yielded no output when using
> llvm-objdump on x86.
> 
> Update the regular expressions for x86 to match optional suffixes,
> variable whitespace, and trailing comments.

OK, so checkstack is broken with LLVM.

Users of checkstack/LLVM in earlier kernels won't like that, so
should we backport this with cc:stable?

