Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A42C82
	for <llvm@lists.linux.dev>; Fri, 12 Nov 2021 15:51:45 +0000 (UTC)
Received: from localhost (cpc147930-brnt3-2-0-cust60.4-2.cable.virginm.net [86.15.196.61])
	by mail.monkeyblade.net (Postfix) with ESMTPSA id BBC4A501046D3;
	Fri, 12 Nov 2021 07:42:44 -0800 (PST)
Date: Fri, 12 Nov 2021 15:42:38 +0000 (GMT)
Message-Id: <20211112.154238.1786308722975241620.davem@davemloft.net>
To: kuba@kernel.org
Cc: tadeusz.struk@linaro.org, elver@google.com, nathan@kernel.org,
 ndesaulniers@google.com, jonathan.lemon@gmail.com, alobakin@pm.me,
 willemb@google.com, pabeni@redhat.com, cong.wang@bytedance.com,
 haokexin@gmail.com, ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, keescook@chromium.org,
 edumazet@google.com
Subject: Re: [PATCH] skbuff: suppress clang object-size-mismatch error
From: David Miller <davem@davemloft.net>
In-Reply-To: <20211111095444.461b900e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <CANpmjNNuWfauPoUxQ6BETrZ8JMjWgrAAhAEqEXW=5BNsfWfyDA@mail.gmail.com>
	<931f1038-d7ab-f236-8052-c5e5b9753b18@linaro.org>
	<20211111095444.461b900e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Mew version 6.8 on Emacs 27.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Fri, 12 Nov 2021 07:42:51 -0800 (PST)

From: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 11 Nov 2021 09:54:44 -0800

> I'm not sure if that stalled due to lack of time or some fundamental
> problems.

ran out of time, then had a stroke...

> Seems like finishing that would let us clean up such misuses?

yes it would
