Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D03BBA0C
	for <llvm@lists.linux.dev>; Tue, 10 Mar 2026 19:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169243; cv=none; b=EWhTrO4wudZFfrhVa+FuKlXw53FxZDeRLbRg3nddVd1ZnD3tOkjdVlggEJ0e7ayrVOufyfaBkG330lP4x2R7teKyOqWxrNLovPujNfYSIV8486cK3XP9FiWsYgaYG/5OdeMr/Z9wiRMKh8t6F0EuCw30sfryqf7qPal6/w9m1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169243; c=relaxed/simple;
	bh=h1kVvZyG+gLLU/7Q842ol8WN1mRiir9mvGE/U/D8Pdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hh1R+DXjIrg0k6bIWozKsb5F3ZGgaOj7xzz9kxS/wn+FJXy2lKiYV8Oc346mQpymVLC/+DELNZeWAqy7I6g7hYQApdsFsdO/8F04/nVNAOIqOHsFI1peVQGRHajuXXLx7YXx5YY3SiOlPr8Y9cdhbQ3De+ZwlcNRRg5I8CRG9dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CDyDNCj+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CDyDNCj+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h1kVvZyG+gLLU/7Q842ol8WN1mRiir9mvGE/U/D8Pdk=; b=CDyDNCj+O0QrZNh2HsGSooKDzU
	Zgr08Ge7ZSguwe01MELBY8GENSRbhpH8Jx/Mg1b+3ZH8LmG1TYUh48eMmatnCYziumKlM63gdU+X7
	h7MfecIy8n6GEDApWwnRndFNQo90uUNlg8wePybfIWgwhofgoSbogQgSZwuFDTAYdv+4LxO/L1GIL
	abKqUCUpyqhAgkZF0OHEpKFzChJjtf5b6d4Zqe84lCE92WCqV1dDVLXEO7eC6oCv+EGvZToC6FdoT
	gT60zdaDdmqQ1YveXbkCjxEnNnelPNkDs51/jBGz2qSWSUKN+Aex6mvQtKfB+cuIwHMaDVm+DUK+U
	OK+N4Jmg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Ja-0000000FNZC-2rfJ;
	Tue, 10 Mar 2026 19:00:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2857B300462; Tue, 10 Mar 2026 20:00:22 +0100 (CET)
Date: Tue, 10 Mar 2026 20:00:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: urezki@gmail.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
	samuel.holland@sifive.com, dave.hansen@linux.intel.com,
	jeremy.linton@arm.com, weixugc@google.com, ljs@kernel.org,
	ryabinin.a.a@gmail.com, rppt@kernel.org, bp@alien8.de,
	luto@kernel.org, jan.kiszka@siemens.com, mingo@redhat.com,
	david@kernel.org, mhocko@suse.com, akpm@linux-foundation.org,
	andreas@gaisler.com, kas@kernel.org, Liam.Howlett@oracle.com,
	morbo@google.com, thuth@redhat.com, catalin.marinas@arm.com,
	ankur.a.arora@oracle.com, kbingham@kernel.org,
	nick.desaulniers+lkml@gmail.com, andreyknvl@gmail.com,
	dvyukov@google.com, corbet@lwn.net, leitao@debian.org,
	hpa@zytor.com, tglx@kernel.org, yuanchu@google.com, ardb@kernel.org,
	vincenzo.frascino@arm.com, tabba@google.com, joey.gouly@arm.com,
	nsc@kernel.org, will@kernel.org, yeoreum.yun@arm.com,
	nathan@kernel.org, maciej.wieczor-retman@intel.com,
	skhan@linuxfoundation.org, axelrasmussen@google.com, osandov@fb.com,
	surenb@google.com, justinstitt@google.com, kees@kernel.org,
	vbabka@kernel.org, hsj0512@snu.ac.kr, trintaeoitogc@gmail.com,
	jackmanb@google.com, maz@kernel.org, glider@google.com,
	linux-doc@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v11 00/15] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <20260310190022.GI606826@noisy.programming.kicks-ass.net>
References: <cover.1773164688.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773164688.git.m.wieczorretman@pm.me>

On Tue, Mar 10, 2026 at 05:51:19PM +0000, Maciej Wieczor-Retman wrote:

> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86. Patchset does seem to compile with gcc without an issue but doesn't
> boot afterwards.

Can you put all that under a specific CONFIG and make that depend on
CC_IS_CLANG?
