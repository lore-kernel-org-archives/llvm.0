Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD4C20E4
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 08:55:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286431515;
	Tue,  3 Jan 2023 00:56:15 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.37.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8F2E3F663;
	Tue,  3 Jan 2023 00:55:28 -0800 (PST)
Date: Tue, 3 Jan 2023 08:55:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dan Li <ashimida.1990@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
Message-ID: <Y7PtfkuE3KimY4Gq@FVFF77S0Q05N>
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <Y6A/k7/KrCCDuux6@hirez.programming.kicks-ass.net>
 <20221219132731.6ng4sz2nv6ujvu7i@ubuntu>
 <Y6B9l/aDnsek8Zyl@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6B9l/aDnsek8Zyl@hirez.programming.kicks-ass.net>

On Mon, Dec 19, 2022 at 04:04:55PM +0100, Peter Zijlstra wrote:
> On Mon, Dec 19, 2022 at 05:32:04AM -0800, Dan Li wrote:
> > Hi Peter,
> > 
> > On 12/19, Peter Zijlstra wrote:
> > > On Sun, Dec 18, 2022 at 10:17:58PM -0800, Dan Li wrote:
> > > 
> > > > 1. When a typeid mismatch is detected, the cfi_check_failed function
> > > >    will be called instead of the brk instruction. This function needs
> > > >    to be implemented by the compiler user.
> > > >    If there are user mode programs or other systems that want to use
> > > >    this feature, it may be more convenient to use a callback (so this
> > > >    compilation option is set to -fsanitize=cfi instead of kcfi).
> > > 
> > > This is not going to be acceptible for x86_64.
> > 
> > I'm not familiar enough with the x86_64 platform, could you please
> > tell me why this is not acceptable? Is there a similar situation
> > on the arm64 platform?
> 
> Mostly because the call would be a 5 byte instruction while the trap
> (UD2) is only 2 bytes.
> 
> I suspect Argh64 has a similar problem if the to be called function is
> outside the immediate range (26 bits or thereabout), in which case you
> end up with a multi-instruction sequence to construct the call target or
> so.

Either that or a direct branc to a PLT.

> A trap is always a single instruction.

Indeed.

I strongly prefer the BRK for the reasons I've given in my other reply, which
include code size.

Thanks,
Mark.
