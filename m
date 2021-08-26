Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27383FC8
	for <llvm@lists.linux.dev>; Thu, 26 Aug 2021 14:15:15 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17QECso4020353;
	Thu, 26 Aug 2021 09:12:54 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 17QECseB020350;
	Thu, 26 Aug 2021 09:12:54 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 26 Aug 2021 09:12:54 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with asm goto
Message-ID: <20210826141254.GB1583@gate.crashing.org>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu> <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu> <YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain> <87h7fcc2m4.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7fcc2m4.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i

On Thu, Aug 26, 2021 at 01:21:39PM +1000, Michael Ellerman wrote:
> So there seems to be some misunderstanding with clang, it doesn't like
> us passing an expression to the inline asm.
> 
> AFAIK it is legal to pass expressions as inputs to inline asm, ie. it
> doesn't have to just be a variable name.

It certainly is.  That is the whole point of inline asm!  This way, all
of the C code "around" the asm can be optimised.

> This patch seems to fix it. Not sure if that's just papering over it though.

It is, and it makes less optimised code (also on GCC), as Christophe
points out.


Segher
