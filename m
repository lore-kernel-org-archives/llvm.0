Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BE77A
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 15:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF555C385A1;
	Tue,  5 Apr 2022 15:02:44 +0000 (UTC)
Date: Tue, 5 Apr 2022 11:02:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>, LKML
 <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Sami Tolvanen
 <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>,
 llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild
 mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v7 3/4] bootconfig: Support embedding a bootconfig file
 in kernel
Message-ID: <20220405110243.21cdee07@gandalf.local.home>
In-Reply-To: <20220405235548.38344aba5a7fcb059924c367@kernel.org>
References: <164871505771.178991.7870442736805590948.stgit@devnote2>
	<164871509158.178991.12705786877340857725.stgit@devnote2>
	<20220405235548.38344aba5a7fcb059924c367@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 5 Apr 2022 23:55:48 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Have you already picked this series?

No I haven't. I do not add any patches until after the merge window, which
just ended Sunday.

> 
> Actually, kernel test robot reported an issue in this patch today.
> Here is the patch. Should I send v8 including this?

Yes, please send a v8.

Thanks!

-- Steve
