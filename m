Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5341164
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 02:26:24 +0000 (UTC)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 36B3F2015A;
	Tue, 15 Feb 2022 10:26:20 +0800 (AWST)
Message-ID: <9f042114f8ac89a59dca9759f3e866de41fcf811.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] mctp: fix use after free
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: trix@redhat.com, matt@codeconstruct.com.au, davem@davemloft.net, 
	kuba@kernel.org, nathan@kernel.org, ndesaulniers@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Date: Tue, 15 Feb 2022 10:26:19 +0800
In-Reply-To: <20220215020541.2944949-1-trix@redhat.com>
References: <20220215020541.2944949-1-trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3-1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

> Clang static analysis reports this problem
> route.c:425:4: warning: Use of memory after it is freed
>   trace_mctp_key_acquire(key);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> When mctp_key_add() fails, key is freed but then is later
> used in trace_mctp_key_acquire().  Add an else statement
> to use the key only when mctp_key_add() is successful.
> 
> Fixes: 4f9e1ba6de45 ("mctp: Add tracepoints for tag/key handling")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2: change the Fixes: line

Super, thanks!

Acked-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Cheers,


Jeremy
