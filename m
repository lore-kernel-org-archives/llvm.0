Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C0138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vKe1O/08xax1V/m6L9bI7x35tnQuI4QqNSLdWeAAtRc=; b=jHCc4bH6LdXjXBLdU8eD04/agW
	vjVNarXQu5dDy7/lac0+WfgLcxwkRXvAFWfnLQvPH9v1cNoVSlfvNdQarYzWHzk6YoAF0Lp5Jz5Ca
	6ZcI8I5dJmgjainqJrDfFW47GRZR6QPStuF4aYzS6oZSkmyqYmopHlTJjJIMd6XuFJA+XSQ54VnrL
	eJPkO+bYqHaU2FTn7TGXdHd9/gc5p9qSm4XbvjTmQ9+swnxz4gsBi/CSudUbW75t2lZ4L5VsNAeRN
	Dsn8+uhNXmLP9rWjbd4vXlAOaM9N++sEHf/9cG3YURS4neuu7ANHLoShuqBOgP5dHi+9IsHYUxSBd
	LQK73wLg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqiVj-00121p-5O; Mon, 16 May 2022 21:44:15 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id A9D32980DCC; Mon, 16 May 2022 23:44:14 +0200 (CEST)
Date: Mon, 16 May 2022 23:44:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Sami Tolvanen' <samitolvanen@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
Message-ID: <20220516214414.GR76023@worktop.programming.kicks-ass.net>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com>
 <f65c01979b884174965802a13cf6b077@AcuMS.aculab.com>
 <CABCJKueo+cw1DHH6N2dUjD-U7OKqmkJUyimm0ychv1drt5U9Rg@mail.gmail.com>
 <19b3e040302d4d8aa240eee43427dfaa@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19b3e040302d4d8aa240eee43427dfaa@AcuMS.aculab.com>

On Mon, May 16, 2022 at 09:32:55PM +0000, David Laight wrote:

> > The compiler always generates this specific instruction sequence.
> 
> Yes, but there are several ways to encode 'cmpl imm,-6(reg)'.

Yes, but we don't care. This *always* uses the 32bit immediate form.
Even if the immediate is small.
