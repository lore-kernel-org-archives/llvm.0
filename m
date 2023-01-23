Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A339633D8
	for <llvm@lists.linux.dev>; Mon, 23 Jan 2023 15:29:20 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30NF7JXS005826;
	Mon, 23 Jan 2023 09:07:19 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 30NF7GUt005822;
	Mon, 23 Jan 2023 09:07:16 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 23 Jan 2023 09:07:16 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org,
        trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
        npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
Message-ID: <20230123150716.GJ25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org> <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
User-Agent: Mutt/1.4.2.3i

Hi!

On Wed, Jan 11, 2023 at 08:05:04PM -0700, Nathan Chancellor wrote:
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> are several warnings in the PowerPC vDSO:
> 
>   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> 
>   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]

There is nothing wrong with the warnings, but as usual, -Werror is very
counterproductive.

> The first group of warnings point out that linker flags were being added
> to all invocations of $(CC), even though they will only be used during
> the final vDSO link. Move those flags to ldflags-y.

Which is explicitly allowed, and won't do anything, so nothing harmful
either.  It is not a bad idea to avoid this if that is trivial to do,
of course.

> The second group of warnings are compiler or assembler flags that will
> be unused during linking. Filter them out from KBUILD_CFLAGS so that
> they are not used during linking.

And here it is even more obviously fine.  If you need obfuscation like
in your patch, it is better not to do this imo.

The warning text "linker input unused" is misleading btw.  It would be
good to warn about that, if it was true: very likely the user didn't
intend what he wrote.  But a linker input is an object file, or perhaps
a linker script.  These things are just compiler flags.


Segher
