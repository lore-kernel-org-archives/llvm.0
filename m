Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7DD2104
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 03:37:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 624CAC0B96
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 03:32:57 +0000 (UTC)
Received: (Authenticated sender: joao@overdrivepizza.com)
	by mail.gandi.net (Postfix) with ESMTPA id 834F1C0004;
	Wed,  2 Mar 2022 03:32:47 +0000 (UTC)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 19:32:47 -0800
From: Joao Moreira <joao@overdrivepizza.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook
 <keescook@chromium.org>, x86@kernel.org, hjl.tools@gmail.com,
 jpoimboe@redhat.com, andrew.cooper3@citrix.com,
 linux-kernel@vger.kernel.org, ndesaulniers@google.com,
 samitolvanen@google.com, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
In-Reply-To: <Yh7fLRYl8KgMcOe5@google.com>
References: <20211122170301.764232470@infradead.org>
 <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com>
 <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com>
 <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com>
 <20220211133803.GV23216@worktop.programming.kicks-ass.net>
 <Yh7fLRYl8KgMcOe5@google.com>
Message-ID: <f07f50b634e160f543c2a77ec39a2b4f@overdrivepizza.com>
X-Sender: joao@overdrivepizza.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2022-03-01 19:06, Peter Collingbourne wrote:
> Hi Peter,
> 
> One issue with this call sequence is that:
> 
> On Fri, Feb 11, 2022 at 02:38:03PM +0100, Peter Zijlstra wrote:
>> caller:
>> 	cmpl	$0xdeadbeef, -0x4(%rax)		# 7 bytes
> 
> Because this instruction ends in the constant 0xdeadbeef, it may
> be used as a "gadget" that would effectively allow branching to an
> arbitrary address in %rax if the attacker can arrange to set ZF=1.
> 
>> 	je	1f				# 2 bytes
>> 	ud2					# 2 bytes
>> 1:	call	__x86_indirect_thunk_rax	# 5 bytes
>> 
>> 
>> 	.align 16
>> 	.byte 0xef, 0xbe, 0xad, 0xde		# 4 bytes
>> func:
>> 	endbr					# 4 bytes
>> 	...
>> 	ret
> 
> I think we can avoid this problem with a slight tweak to your
> instruction sequence, at the cost of 2 bytes per function prologue.
> First, change the call sequence like so:
> 
>  	cmpl	$0xdeadbeef, -0x6(%rax)		# 6 bytes
> 	je	1f				# 2 bytes
> 	ud2					# 2 bytes
> 1:	call	__x86_indirect_thunk_rax	# 5 bytes
> 
> The key difference is that we've changed 0x4 to 0x6.
> 
> Then change the function prologue to this:
> 
> 	.align 16
> 	.byte 0xef, 0xbe, 0xad, 0xde		# 4 bytes
> 	.zero 2					# 2 bytes
> func:
> 
> The end result of the above is that the constant embedded in the cmpl
> instruction may only be used to reach the following ud2 instruction,
> which will "harmlessly" terminate execution in the same way as if
> the prologue signature did not match.

FWIIW, this makes sense IMHO. These additional pre-prologue bytes are 
also what might be needed to enable the smaller version of FineIBT that 
I suggested in this thread some time ago.
