Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C8915A7
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 00:50:29 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30A0i2SS030174;
	Mon, 9 Jan 2023 18:44:02 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 30A0hxZX030173;
	Mon, 9 Jan 2023 18:43:59 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 9 Jan 2023 18:43:59 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
        kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org,
        trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev,
        npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <20230110004359.GO25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org> <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <20230109222337.GM25951__25255.3859770828$1673303520$gmane$org@gate.crashing.org> <87cz7n2q7l.fsf@igel.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cz7n2q7l.fsf@igel.home>
User-Agent: Mutt/1.4.2.3i

On Tue, Jan 10, 2023 at 01:22:38AM +0100, Andreas Schwab wrote:
> On Jan 09 2023, Segher Boessenkool wrote:
> 
> > It is required by POSIX (for the c99 command, anyway).  It *also* is
> > required to be supported when producing object files (so when no linking
> > is done).
> >
> > It is a GCC flag, and documented just fine:
> > https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s
> 
> Most assembler flags are unrelated to the flags passed to the compiler
> driver, and -s is no exception.  POSIX has nothing to say about the
> sub-commands of the compiler anyway.

But this is not an assembler flag!

quiet_cmd_vdso32as = VDSO32A $@
      cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<

where

ifdef CROSS32_COMPILE
    VDSOCC := $(CROSS32_COMPILE)gcc
else
    VDSOCC := $(CC)
endif


The name of the make variable AS32FLAGS is a bit misleading.  This
variable does not hold arguments to as, it holds arguments to the
compiler driver, "gcc".


Segher
