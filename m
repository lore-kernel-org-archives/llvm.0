Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A51D68
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 21:04:52 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1B9KGHTw015333;
	Thu, 9 Dec 2021 14:16:17 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 1B9KGGkw015329;
	Thu, 9 Dec 2021 14:16:16 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 9 Dec 2021 14:16:16 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Potapenko <glider@google.com>, Jann Horn <jannh@google.com>,
        Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        linux-toolchains@vger.kernel.org
Subject: Re: randomize_kstack: To init or not to init?
Message-ID: <20211209201616.GU614@gate.crashing.org>
References: <YbHTKUjEejZCLyhX@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbHTKUjEejZCLyhX@elver.google.com>
User-Agent: Mutt/1.4.2.3i

On Thu, Dec 09, 2021 at 10:58:01AM +0100, Marco Elver wrote:
> Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
> default since dcb7c0b9461c2, which is why this came on my radar. And
> Clang also performs auto-init of allocas when auto-init is on
> (https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
> aware, GCC 12's upcoming -ftrivial-auto-var-init= doesn't yet auto-init
> allocas.

The space allocated by alloca is not an automatic variable, so of course
it is not affected by this compiler flag.  And it should not, this flag
is explicitly for *small fixed-size* stack variables (initialising
others can be much too expensive).

> 	C. Introduce a new __builtin_alloca_uninitialized().

That is completely backwards.  That is the normal behaviour of alloca
already.  Also you can get __builtin_alloca inserted by the compiler
(for a variable length array for example), and you typically do not want
those initialised either, for the same reasons.


Segher
