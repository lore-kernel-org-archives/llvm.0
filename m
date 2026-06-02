Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A903EDAA0;
	Tue,  2 Jun 2026 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414781; cv=none; b=TAc5RUdRHqpecPDaq6nW/2fkuSxEUG37nfSd/Hfhvuf16CqfRMvKvgpiEI+ho188scUoMrwJPRqwr7ov/ZtDSVDAG10A+j/9Q3FqrXK4xyOK4u+EArfZjn/xsozZGaehk2uYXyFDmRjmyxB/w6aaP2088mY1wrq96piMjajnOcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414781; c=relaxed/simple;
	bh=duWFMQSTCLt95k26YHk17X8pJ+R8BAvvovbK9QZT69Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fXNSozG/+SOhLGSKRbN/D8WWKSZJVAJZUhK8AR5U0SBVjMtbTfxiFwx2bTuiTJJs26R4lQcqLiGUrBC2IdScz11o8g7tiXvWYoRcnNIp/v5ivw9ypYmybZonPUBG6TO+PEN+VUHwg70biZCWmnX3Fa31/fFpQwpfaGYnEPPSca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id C6556931F4;
	Tue,  2 Jun 2026 15:39:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 8504D60018;
	Tue,  2 Jun 2026 15:39:31 +0000 (UTC)
Date: Tue, 2 Jun 2026 11:40:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Nathan
 Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Dennis
 Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Arend van Spriel
 <arend.vanspriel@broadcom.com>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Vlastimil Babka
 <vbabka@kernel.org>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] tracing: work around -Wmissing-format-attribute
 warning
Message-ID: <20260602114019.0b468183@gandalf.local.home>
In-Reply-To: <20260602150904.2258624-1-arnd@kernel.org>
References: <20260602150904.2258624-1-arnd@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 9rzk53wd7afo7uzkpczt1q8xzbbfeezs
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 8504D60018
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18uK80cPUvu0PcxYHkVoO/Exws1tsbni8g=
X-HE-Tag: 1780414771-736166
X-HE-Meta: U2FsdGVkX1/JQy9GCXGniipFNPGU2/D3baRLikCzvEb/c0R5WH6io7xo03B1mD3aoAD9Mr2VfseVaCfnhwe4JtZ89AAYxSil5f1k/mPcMnDVMf+n+MtW10tFiQs7Dm5oNbVYLmQTP7Mfb5pfuZSYRVv1av6Chl/lXBhHHNZKH3DQAzktM4iXx2pHPYb5H+2P97gWwqAJdkQcA5f59T0WFdJUrelc+XnaNcLl4OcglAo18/oaZrm8z7TK50lhUoedlNq0uoflvgP4/GRocsf/SZAWwQiAzbr/806rT+hA/dB2OKGAkiK1+Z2+6WJ7ES2hon/HMzBxR/fJ9fN2EgC7/i+QCfge5Zn+1uf2ysa0wQumJE0xJOWsgg==

On Tue,  2 Jun 2026 17:07:05 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> @@ -2979,6 +2975,12 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
>  }
>  EXPORT_SYMBOL(vsnprintf);
>  

Should add a comment here for why this is needed.

-- Steve

> +int __printf(3, 0) __vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
> +{
> +	return vsnprintf(buf, size, fmt_str, args);
> +}
> +EXPORT_SYMBOL(__vsnprintf);
> +
