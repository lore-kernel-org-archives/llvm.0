Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6137235C1BD;
	Wed, 25 Mar 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432548; cv=none; b=ijvA9nitjXkVpK6SuIx2/xrQEenDpctYKun51F+yWvUQ6HxyR4wUGw4ccXKTKAo7NEWXoJ38zJsP2TSj589L2qKxRnxyM4u4kyU9oTGJRk2f5LFkBNxql/CyrkmsLKuKaEqG2o0wNje5ENs+F6YJmkqrdJs9Jdh7mRXGW1ETN4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432548; c=relaxed/simple;
	bh=2/MZaZbYqEpUfKHxTXqAQthx/7RrgnN8/1v1V38getM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/yesBZbAoDMotVKCzNUUxBi46VP5Qtcb9jePhk2Kl4DqcM57sDs6yhfRgI4fBwcyuoE3vIaUOU26JmhTgpGduC4g6C4Xeyl/LuoxJtnOO2+ouFt67XTNt95snFgt1q9OSgHehThIzP08dr4F+czp1Tg3y6YV2ZZ+WnSB8yi7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=aIBhr24x; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="aIBhr24x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=8/B7VBBqGmBiYJMGJFhUPu9zQHFdUibQvXtbqMoNvCw=; b=aIBhr24xYZQu75cmqhuxNcY/J9
	Ygz5csRlKh6oA714CxjJTq//0W+zsQm855ks2NGbyBLUIy9raKk6Hu7/l8XWIUtgqboXzlUxBdGY1
	EJ2f4JQBwfRbJ11fpEztE7XHQ0rocM2Ljid26ciwSexjEA4NXth9CVId0+oGif2uZ+cbTGJMC+snS
	60iW8CMfbVe7xbbhlxTnfJsRmmcKs7uSJkAkqGHeYdtnxL7qdCqLYc2boI5/tujdJefdxKnuESh4P
	FOAs4UVSX8N0zj5UsTSjOKPosHMnz/IFYCQI0RRb1ZXM6LT1Al01HDWIs9MkdRT0QnXOdPM4Y4OJy
	8W4J9UBQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w5Kxh-008zbx-NL; Wed, 25 Mar 2026 09:55:40 +0000
Date: Wed, 25 Mar 2026 02:55:35 -0700
From: Breno Leitao <leitao@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:bootconfig/for-next 16/16] init/main.c:437:20: warning:
 stack frame size (4192) exceeds limit (2048) in
 'bootconfig_apply_early_params'
Message-ID: <acOw2YXMZZEQ1UUz@gmail.com>
References: <202603251010.5Ui0yrB2-lkp@intel.com>
 <20260325155227.55cdfb9f4ce96c335d0c7f18@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325155227.55cdfb9f4ce96c335d0c7f18@kernel.org>
X-Debian-User: leitao

On Wed, Mar 25, 2026 at 03:52:27PM +0900, Masami Hiramatsu wrote:

> >  > 437	static void __init bootconfig_apply_early_params(void)
> >    438	{
> >    439		char val_buf[COMMAND_LINE_SIZE];
> 
> Ah, this COMMAND_LINE_SIZE is too big to allocate it on stack.
> We need to make it as a static __initdata variable.

Ack, I will respin it. Thanks!

> Thank you,
> 
> >    440		struct xbc_node *knode, *root;
> >    441		const char *val;
> >    442	
> >    443		root = xbc_find_node("kernel");
> >    444		if (!root)
> >    445			return;
> >    446	
> >    447		/*
> >    448		 * Keys that do not match any early_param() handler are silently
> >    449		 * ignored — do_early_param() always returns 0.
> >    450		 */
> >    451		xbc_node_for_each_key_value(root, knode, val) {
> >    452			if (xbc_node_compose_key_after(root, knode, xbc_namebuf, XBC_KEYLEN_MAX) < 0)
> >    453				continue;
> >    454	
> >    455			if (!val) {

I also found that val cannot be NULL here, given
xbc_node_for_each_key_value() returns an empty string ("") instead of
NULL, so, I will remove this branch here as well.
