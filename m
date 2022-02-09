Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0E72F21
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 05:26:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 5AC8FC7ACE
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 05:18:54 +0000 (UTC)
Received: (Authenticated sender: joao@overdrivepizza.com)
	by mail.gandi.net (Postfix) with ESMTPA id 5123B1C0002;
	Wed,  9 Feb 2022 05:18:44 +0000 (UTC)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 08 Feb 2022 21:18:44 -0800
From: Joao Moreira <joao@overdrivepizza.com>
To: Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 hjl.tools@gmail.com, jpoimboe@redhat.com, andrew.cooper3@citrix.com,
 linux-kernel@vger.kernel.org, ndesaulniers@google.com,
 samitolvanen@google.com, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
In-Reply-To: <202202082003.FA77867@keescook>
References: <20211122170301.764232470@infradead.org>
 <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com>
 <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com>
 <202202082003.FA77867@keescook>
Message-ID: <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com>
X-Sender: joao@overdrivepizza.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> Ah, excellent, thanks for the pointers. There's also this in the works:
> https://reviews.llvm.org/D119296 (a new CFI mode, designed to play nice
> to objtool, IBT, etc.)

Oh, great! Thanks for pointing it out. I guess I saw something with a 
similar name before ;) 
https://www.blackhat.com/docs/asia-17/materials/asia-17-Moreira-Drop-The-Rop-Fine-Grained-Control-Flow-Integrity-For-The-Linux-Kernel.pdf

Jokes aside (and perhaps questions more targeted to Sami), from a 
diagonal look it seems that this follows the good old tag approach 
proposed by PaX/grsecurity, right? If this is the case, should I assume 
it could also benefit from features like -mibt-seal? Also are you 
considering that perhaps we can use alternatives to flip different CFI 
instrumentation as suggested by PeterZ in another thread?

Tks,
Joao
