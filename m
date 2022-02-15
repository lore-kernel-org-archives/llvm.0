Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09891ED0
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 00:53:33 +0000 (UTC)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED1BC2015A;
	Tue, 15 Feb 2022 08:44:57 +0800 (AWST)
Message-ID: <daabe69d3863caa62f7874a472edbf2bc892d99e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] mctp: fix use after free
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: trix@redhat.com, matt@codeconstruct.com.au, davem@davemloft.net, 
	kuba@kernel.org, nathan@kernel.org, ndesaulniers@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Date: Tue, 15 Feb 2022 08:44:57 +0800
In-Reply-To: <20220214175138.2902947-1-trix@redhat.com>
References: <20220214175138.2902947-1-trix@redhat.com>
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

Looks good to me, thanks for the fix.

However, the Fixes tag will need an update; at the point of 
4a992bbd3650 ("mctp: Implement message fragmentation"), there was no
use of 'key' after the kfree() there.

Instead, this is the hunk that introduced the trace event:

  @@ -365,12 +368,16 @@
                          if (rc)
                                  kfree(key);
   
  +                       trace_mctp_key_acquire(key);
  +
                          /* we don't need to release key->lock on exit */
                          key = NULL;
 
- which is from 4f9e1ba6de45. The unref() comes in later, but the
initial uaf is caused by this change.

So, I'd suggest this instead:

Fixes: 4f9e1ba6de45 ("mctp: Add tracepoints for tag/key handling")

(this just means we need the fix for 5.16+, rather than 5.15+).

Also, can you share how you're doing the clang static analysis there?
I'll get that included in my checks too.

Cheers,


Jeremy
