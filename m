Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359918B0C
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 20:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Se1dRTlwycZbc9kSpJwmLvgZk2vvUpDv6XHiE4EnDTI=; b=PbuwlmbXbqRR39QfTZssqDsDpe
	oD5hnOA5/0gfVpmZTG3UcdVjoL0TA9j2T4yG50PO7ZSZNz90OBHpdW01zESSvktAULDNpl3Mc/DLv
	9w1SbugAcidKpTnglwW6tdJrgM8wlfr+wG1Z5ItvkwRJWpPChhm/h7sysC4ITFSort/k+GABJ5psE
	Y/Jiu4tTTZvai58L2LPxQn8ynGvi4yR8UrPKrPoyEvsXLtHFiLjOtwFwtz2fztgdJ4KeO72yzumwP
	57R9PsweG5eO8a56XP4XSNYGumvWVFPRDcxsi2eTQGmS8kPFUi0cjKaBC3Ef8LAciw58FpZaIZ1l1
	g9GrMefw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQ8C-00Fcch-2C;
	Thu, 21 Sep 2023 20:18:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4655B3002F1; Thu, 21 Sep 2023 22:18:37 +0200 (CEST)
Date: Thu, 21 Sep 2023 22:18:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fangrui Song <maskray@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] x86/speculation, objtool: Use absolute relocations for
 annotations
Message-ID: <20230921201837.GC39480@noisy.programming.kicks-ass.net>
References: <20230920001728.1439947-1-maskray@google.com>
 <20230921072655.GA14803@noisy.programming.kicks-ass.net>
 <CAFP8O3+_8H+fetuoqwwcfqJLNtYmpsWZhY2arD7HMuPmcN+X_g@mail.gmail.com>
 <20230921153537.GG14803@noisy.programming.kicks-ass.net>
 <CAFP8O3K6Lgxe=Res9d2GKipRYdXqzv3wa_0PLtDcyn7g7H=z5w@mail.gmail.com>
 <20230921171900.GB29413@noisy.programming.kicks-ass.net>
 <CAFP8O3JpkWTXnxYxa45uANNMQ34g2VUPnfj7-oWn3oq9egUb-A@mail.gmail.com>
 <20230921192253.GA39480@noisy.programming.kicks-ass.net>
 <CAFP8O3Kmep3zXNk3=s5qpMQ3-TnfEYxeCkLi3e-DTqQc=Fs4TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3Kmep3zXNk3=s5qpMQ3-TnfEYxeCkLi3e-DTqQc=Fs4TQ@mail.gmail.com>

On Thu, Sep 21, 2023 at 01:07:09PM -0700, Fangrui Song wrote:
> On Thu, Sep 21, 2023 at 12:22 PM Peter Zijlstra <peterz@infradead.org> wrote:

> > Anyway, thanks for bearing with me.
> >
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Thanks!  I assume that the patch can be picked up without me doing anything :)

Yep, we'll get it sorted. Thanks!
