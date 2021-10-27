Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99FC2C81
	for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qiwDhiE5qZyUEx65yCwdeMlo4Osd1LcxqqP81yccako=; b=D2e4rp2fhx8Stgk4puwwlpXhOm
	0EzkX+nWYe4hi4T9XVf1sL9f6tfjMjGKkP+hd9bw3JaOPz2XVeR3HCcNAMApQtBLpF61e1W+Ewpr2
	AK6sTazD4aNkw+Veg9JpXNyhDoxp4mvhIeFhBZv72KtGYC8n5+sGWf03ZGVRFPZU3T1vk1fYRtHbw
	5xMlZefpKVY16VZXRJY6Cco9k6s0yxnvsoDIL4sS4ULKKVeUMXc3QMr5ybEyaFsUP7IvQr178G3Lx
	BMsX2rL8r6EKUJ0q3Wn3wh2IMdpPFFSjtzTlXBi6wsF6ZgkbeCibmtD26gZWb/WMBChdiTiZsw7dZ
	9hVsImMg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfi8T-00CYQA-Oe; Wed, 27 Oct 2021 12:34:30 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 520A5981FD2; Wed, 27 Oct 2021 14:34:29 +0200 (CEST)
Date: Wed, 27 Oct 2021 14:34:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Paul =?iso-8859-1?Q?Heidekr=FCger?= <paul.heidekrueger@in.tum.de>
Cc: paulmck@kernel.org, will@kernel.org, boqun.feng@gmail.com,
	stern@rowland.harvard.edu, parri.andrea@gmail.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	elver@google.com, charalampos.mainas@gmail.com,
	pramod.bhatotia@in.tum.de
Subject: Re: Potentially Broken Address Dependency via test_bit() When
 Compiling With Clang
Message-ID: <20211027123429.GE174730@worktop.programming.kicks-ass.net>
References: <YXknxGFjvaB46d/p@Pauls-MacBook-Pro>
 <20211027121747.GI174703@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027121747.GI174703@worktop.programming.kicks-ass.net>

On Wed, Oct 27, 2021 at 02:17:48PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 27, 2021 at 12:19:48PM +0200, Paul Heidekrüger wrote:
> I would personally not consider this a dependend load. The result
> depends on two loads, but there is no actual ordering between them.
> 
>   r1 = *x
>   r2 = *y
>   b = 1 & (r1 >> r2);
> 
> (more or less)

melver pointed out on IRC that I missed the whole BIT_WORD(nr) thing.
And with that restored this should indeed be an address dependency.

Still, I wasn't actually expecting test_bit() to be one. Nice find.
