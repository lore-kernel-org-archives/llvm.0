Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5961135C182
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834712; cv=none; b=o4aeyWK/FVY9HT1NXSOJuDRxKNk9rPfWBpT/RmX3imkUAuLlX53w6Cqhe+C78z7FvUSZUtstCXjh/gm9gHQWAxslLVrbEjCafkP/8Xxe6paZkJ/jdEaQi8lm9vtlfKhFfnT9NAInXYvQOtmhqk5ZwDIWHa6UscFfqcrx1wB04vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834712; c=relaxed/simple;
	bh=GPwuBGs6YzbKqMVvvMnF/NkroSbeEseMllhaWUAtXhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eExP+w40tzSOTOc7GFU/7DQ61+iViBCBPXzBvVSqEPpuedbKRhv503gfXP7oDOV++QzrwSYPqgEHUSN8iVsj8gpwIlHOBLco/SPXcaj8N5mqC3xAxZCjp/m5f2tjXD5jBYqVUPvXPbtnvkUUjXiAGZdOnuRIoeuskjtBWkoDZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 62IBpPiG963920;
	Wed, 18 Mar 2026 06:51:25 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 62IBpO97963917;
	Wed, 18 Mar 2026 06:51:24 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 18 Mar 2026 06:51:24 -0500
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
Message-ID: <abqRvDiAI85w2bCe@gate>
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, Mar 17, 2026 at 02:08:24PM +0100, Krzysztof Kozlowski wrote:
> Return value of ps3_start_probe_thread() is not used, so code can be
> simplified to fix W=1 clang warnings:
> 
>   arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]

And this is exactly why -Werror is harmful.  A boring harmless warning
turned into a build break :-(

You can sometimes usefully turn *some* warnings into errors, and any
user is of course free to invite as much pain as he or she wants to
bear, but heaping nonsense like this onto unsuspecting users is just
evil.  And it is even worse when the warnings can change with compiler
version!


Segher
