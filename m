Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA673C2776
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835098; cv=none; b=SNRiUWZLJliDeZSGKnOzzEG+ZgUKs4fhY5ctF1WqcZRXQQOhpq6wX1mPpOulDBGhmQ6pjU7kq5ByV/+Xcy9OAn0p4iPNPvzThsr4sjcfsfZf3k/Syz24jTD4M/U1mqIyCVtLS2zzFLJvCU0Zo7CL7KYrcvwU8MxnK8qS8DJqyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835098; c=relaxed/simple;
	bh=yoooEs//GPJ/PF++t092q8wkbjRyD1lfx/6xw0QEA2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVaceZp/1CpMFG4vKwhDYTqciS0ZuH81oIKd+PoC15aK/adcxwc8sL6ZCzwJ/CQlIudesPWr/z0IopZP64DuaBBXxmpUUBUkQ+6jSlwwhpB04Mpa6GsDq0RnhJl4ZQNaDG+lBzlfgqDRivNPFpbdYOPFVscxLC9Ek1SuC9qt/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 62IBw0VZ966706;
	Wed, 18 Mar 2026 06:58:00 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 62IBw0G0966705;
	Wed, 18 Mar 2026 06:58:00 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 18 Mar 2026 06:58:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Geoff Levand <geoff@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
Message-ID: <abqTSG-wg-9ahRTe@gate>
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
 <abqRvDiAI85w2bCe@gate>
 <dfb53d65-ee34-47bf-b305-5694c7224ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfb53d65-ee34-47bf-b305-5694c7224ec7@oss.qualcomm.com>

On Wed, Mar 18, 2026 at 12:54:30PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 12:51, Segher Boessenkool wrote:
> > On Tue, Mar 17, 2026 at 02:08:24PM +0100, Krzysztof Kozlowski wrote:
> >> Return value of ps3_start_probe_thread() is not used, so code can be
> >> simplified to fix W=1 clang warnings:
> >>
> >>   arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
> > 
> > And this is exactly why -Werror is harmful.  A boring harmless warning
> > turned into a build break :-(
> 
> -Werror does not matter here. We do not want warnings either, assuming
> of course they are correct.
> 
> So if this warning is correct, then patch should be applied and WERROR
> is irrelevant.

The build is broken.  -Werror is positively harmful.

Yes, you want the warnings fixed, but maybe something else has priority
right now?


Segher
