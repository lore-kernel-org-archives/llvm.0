Received: from out0-193.mail.aliyun.com (out0-193.mail.aliyun.com [140.205.0.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA215CB
	for <llvm@lists.linux.dev>; Sat,  6 May 2023 07:50:14 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047208;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---.SZmu-5V_1683357546;
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.SZmu-5V_1683357546)
          by smtp.aliyun-inc.com;
          Sat, 06 May 2023 15:19:06 +0800
Date: Sat, 06 May 2023 15:19:06 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc:  <linux-kernel@vger.kernel.org>,
  "Thomas Garnier" <thgarnie@chromium.org>,
  "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Kees Cook" <keescook@chromium.org>,
  "Nathan Chancellor" <nathan@kernel.org>,
  "Nick Desaulniers" <ndesaulniers@google.com>,
  "Tom Rix" <trix@redhat.com>,
   <bpf@vger.kernel.org>,
   <llvm@lists.linux.dev>
Subject: Re: [PATCH RFC 00/43] x86/pie: Make kernel image's virtual address
 flexible
Message-ID: <20230506071906.GA99736@k08j02272.eu95sqa>
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
 <20230428152206.GA1464060@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428152206.GA1464060@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Fri, Apr 28, 2023 at 11:22:06PM +0800, Peter Zijlstra wrote:
> 
> For some raison I didn't get 0/n but did get all of the others. Please
> keep your Cc list consistent.
>
Sorry, I'll pay attention next time.
 
> On Fri, Apr 28, 2023 at 05:50:40PM +0800, Hou Wenlong wrote:
> 
> >   - It is not allowed to reference global variables in an alternative
> >     section since RIP-relative addressing is not fixed in
> >     apply_alternatives(). Fortunately, all disallowed relocations in the
> >     alternative section can be captured by objtool. I believe that this
> >     issue can also be fixed by using objtool.
> 
> https://lkml.kernel.org/r/Y9py2a5Xw0xbB8ou@hirez.programming.kicks-ass.net

Thank you for your patch. However, it's more complicated for call depth
tracking case. Although, the per-cpu variable in the alternative section
is relocated, but the content of the "skl_call_thunk_template" is copied
into another place, so the offset is still incorrect. I'm not sure if
this case is common or not. Since the destination is clear, I could do
relocation here as well, but it would make the code more complicated.

Thanks!
