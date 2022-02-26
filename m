Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5F7A
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 00:48:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C2A08C70A2
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 00:30:02 +0000 (UTC)
Received: (Authenticated sender: joao@overdrivepizza.com)
	by mail.gandi.net (Postfix) with ESMTPA id 0B58720003;
	Sat, 26 Feb 2022 00:29:49 +0000 (UTC)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 25 Feb 2022 16:29:49 -0800
From: Joao Moreira <joao@overdrivepizza.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Peter Zijlstra
 <peterz@infradead.org>, x86@kernel.org, hjl.tools@gmail.com,
 jpoimboe@redhat.com, andrew.cooper3@citrix.com,
 linux-kernel@vger.kernel.org, ndesaulniers@google.com,
 samitolvanen@google.com, mark.rutland@arm.com, alyssa.milburn@intel.com,
 mbenes@suse.cz, rostedt@goodmis.org, mhiramat@kernel.org,
 alexei.starovoitov@gmail.com, llvm@lists.linux.dev
Subject: Re: [PATCH v2 05/39] x86: Base IBT bits
In-Reply-To: <YhlTRhh7qj538ygM@dev-arch.archlinux-ax161>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.307406918@infradead.org> <202202241627.EEF3D5D2@keescook>
 <YhgnA8O4Bp19hfse@dev-arch.archlinux-ax161>
 <YhlTRhh7qj538ygM@dev-arch.archlinux-ax161>
Message-ID: <605731324a76f36aafa87bd9390808c3@overdrivepizza.com>
X-Sender: joao@overdrivepizza.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> https://github.com/ClangBuiltLinux/linux/issues/1606

Candidate fix: https://reviews.llvm.org/D120600
