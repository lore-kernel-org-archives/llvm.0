Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675433F2
	for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KdZYtJLDRb9x+/tacCvutz61fqLYajL5kPnJqkf0xhM=; b=LK6fVQE7Ey5+B3j7gHOi5eOm5y
	0TcSfYAy8s/ZBadf3MKVq6b944bzYM5noq5/+ZkDJC4oiaYWYMCZfuF/Ot8FNE8fi++CiTpfoirk4
	vFchFv39449g/A41kDy2376QCvoFJPcSTTuUXz3yDOq2OBinOngRmgZzC+PnJAn4YJHqPcfdwoHcb
	wlW4BxPDt4MAP6Y2pdmw/FFXGO99i0sQ7GzgyGG90IRlceF0QGWdmKSd7bDknIhvsxw3VfpIP/cUC
	YdIvJ8CeQ9o67hON9mEQuOn9KnFQVv6XwqtzUdUOkBEBXjOiJxBpWr3MMd+2UZRwjcoSfiXjNnwRL
	n7+tY16g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7HhT-000p6L-Bf; Mon, 19 Dec 2022 15:05:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 39E1F300348;
	Mon, 19 Dec 2022 16:04:55 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1EEFC202FE50F; Mon, 19 Dec 2022 16:04:55 +0100 (CET)
Date: Mon, 19 Dec 2022 16:04:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Li <ashimida.1990@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Marco Elver <elver@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Song Liu <song@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uros Bizjak <ubizjak@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>, Borislav Petkov <bp@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Aaron Tomlin <atomlin@redhat.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Changbin Du <changbin.du@intel.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [RFC/RFT] CFI: Add support for gcc CFI in aarch64
Message-ID: <Y6B9l/aDnsek8Zyl@hirez.programming.kicks-ass.net>
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <Y6A/k7/KrCCDuux6@hirez.programming.kicks-ass.net>
 <20221219132731.6ng4sz2nv6ujvu7i@ubuntu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219132731.6ng4sz2nv6ujvu7i@ubuntu>

On Mon, Dec 19, 2022 at 05:32:04AM -0800, Dan Li wrote:
> Hi Peter,
> 
> On 12/19, Peter Zijlstra wrote:
> > On Sun, Dec 18, 2022 at 10:17:58PM -0800, Dan Li wrote:
> > 
> > > 1. When a typeid mismatch is detected, the cfi_check_failed function
> > >    will be called instead of the brk instruction. This function needs
> > >    to be implemented by the compiler user.
> > >    If there are user mode programs or other systems that want to use
> > >    this feature, it may be more convenient to use a callback (so this
> > >    compilation option is set to -fsanitize=cfi instead of kcfi).
> > 
> > This is not going to be acceptible for x86_64.
> 
> I'm not familiar enough with the x86_64 platform, could you please
> tell me why this is not acceptable? Is there a similar situation
> on the arm64 platform?

Mostly because the call would be a 5 byte instruction while the trap
(UD2) is only 2 bytes.

I suspect Argh64 has a similar problem if the to be called function is
outside the immediate range (26 bits or thereabout), in which case you
end up with a multi-instruction sequence to construct the call target or
so. A trap is always a single instruction.


