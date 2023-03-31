Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F823BB
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 08:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BB2B061989EA;
	Fri, 31 Mar 2023 10:37:32 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JxIpvu6PJe5z; Fri, 31 Mar 2023 10:37:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 27F0961989E6;
	Fri, 31 Mar 2023 10:37:32 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GaVCXV-EezY9; Fri, 31 Mar 2023 10:37:32 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E485264548AA;
	Fri, 31 Mar 2023 10:37:31 +0200 (CEST)
Date: Fri, 31 Mar 2023 10:37:31 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: davidgow <davidgow@google.com>
Cc: anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	linux-um <linux-um@lists.infradead.org>, x86 <x86@kernel.org>, 
	llvm@lists.linux.dev, 
	Rust for Linux Kernel <rust-for-linux@vger.kernel.org>, 
	kunit-dev <kunit-dev@googlegroups.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	SeongJae Park <sj@kernel.org>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, mingo <mingo@redhat.com>, 
	tglx <tglx@linutronix.de>, 
	Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <2128345299.463203.1680251851757.JavaMail.zimbra@nod.at>
In-Reply-To: <CABVgOS=pr=jXq4qRrKaCy47xczDaFXFKCPanVvaZ+MfQmtwK8A@mail.gmail.com>
References: <20230318041555.4192172-1-davidgow@google.com> <CABVgOS=pr=jXq4qRrKaCy47xczDaFXFKCPanVvaZ+MfQmtwK8A@mail.gmail.com>
Subject: Re: [PATCH] arch:um: Only disable SSE on clang to work around old
 GCC bugs
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: arch:um: Only disable SSE on clang to work around old GCC bugs
Thread-Index: KRbe3B8OBuNHdw1xcXwa3ZqHhmy+Sw==

----- Urspr=C3=BCngliche Mail -----
> Von: "davidgow" <davidgow@google.com>
> An: "richard" <richard@nod.at>, "anton ivanov" <anton.ivanov@cambridgegre=
ys.com>, "Johannes Berg"
> Any chance we could get this picked up as a fix for 6.3? The UML build
> is still broken with older gcc versions.

Sure. Just got flooded with other stuff. :-S

Thanks,
//richard
