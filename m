Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F9928F1
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 15:02:00 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 27ADuNcA006903;
	Wed, 10 Aug 2022 08:56:23 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 27ADuLhX006902;
	Wed, 10 Aug 2022 08:56:21 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 10 Aug 2022 08:56:21 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: nathan@kernel.org, ndesaulniers@google.com, mpe@ellerman.id.au,
        Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else block
Message-ID: <20220810135621.GX25951@gate.crashing.org>
References: <20220810114318.3220630-1-anders.roxell@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810114318.3220630-1-anders.roxell@linaro.org>
User-Agent: Mutt/1.4.2.3i

Hi!

On Wed, Aug 10, 2022 at 01:43:18PM +0200, Anders Roxell wrote:
> Clang warns:
> 
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                   ^~~~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning

This note often is bad advice: hiding problems instead of investigating
and solving them.  Bah.

If silencing warnings is your goal, look no further than "-w" :-)

> Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
> always gets initialized, this will silence the warnings. That will also
> simplify the 'else' path. Clang is getting confused with these warnings,
> but the warnings is a false-positive.

If it is, please report that bug to clang?  It says "*is* uninitialized
when used here", there can not be false positives to statements like
that.  If the analysis was heutistical it should say "may be" or such.


Segher
