Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E91B8B
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 23:38:36 +0000 (UTC)
Received: (Authenticated sender: joao@overdrivepizza.com)
	by mail.gandi.net (Postfix) with ESMTPA id 3EEEF240004;
	Tue, 15 Feb 2022 23:38:33 +0000 (UTC)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 15 Feb 2022 15:38:33 -0800
From: Joao Moreira <joao@overdrivepizza.com>
To: Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen
 <samitolvanen@google.com>, X86 ML <x86@kernel.org>, hjl.tools@gmail.com,
 Josh Poimboeuf <jpoimboe@redhat.com>, andrew.cooper3@citrix.com, LKML
 <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
In-Reply-To: <202202151503.91E9B76B@keescook>
References: <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com>
 <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com>
 <20220211133803.GV23216@worktop.programming.kicks-ass.net>
 <CABCJKuciRBnz4JxBDJC=+kuJn4pU2uBkWPBov7-VL2o2j0F4SA@mail.gmail.com>
 <20220214222550.GB23216@worktop.programming.kicks-ass.net>
 <CABCJKuf-wouSCh4u43GPQHPPgG=mqOGboSoHPQRfmgQSBkFrMg@mail.gmail.com>
 <202202151129.1A5C5FE42@keescook>
 <20220215210550.GD23216@worktop.programming.kicks-ass.net>
 <202202151503.91E9B76B@keescook>
Message-ID: <4553dfb68285a686737969e117bf48cc@overdrivepizza.com>
X-Sender: joao@overdrivepizza.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

>> 
>> Mostly so that we can deduce the address of the trap from the 
>> retpoline
>> site, also the above has a fairly high chance of using jcc.d32 which 
>> is
>> actually larger than jcc.d8+ud2.
> 
> Ah, yeah, that's an interesting point.
> 
> Still, I worry about finding ways to convinces Clang to emit precisely
> cmp/je/trap/call, but I guess we'll catch it immediately if it doesn't.
> :P

This can probably be done more easily/precisely if implemented directly
in the compiler's arch-specific backend. At least for x86 it wasn't a
hassle to emit a defined sequence of instructions in the past. The price
is that it will require a pass specific to each supported architecture,
but I guess this isn't that bad.

Perhaps this is discussion for a different mailing list, idk... but
just pointing that it is not a huge wall.
