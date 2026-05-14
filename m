Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D882ECE86;
	Thu, 14 May 2026 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774407; cv=none; b=YCYstVUTSxp9fwBIK7zBmd8Vpih4HAA487R5seOFX7o4ErAh+1AHX3lYNQdC787HzaoU2bZRHoMxgFi5n0eULOPj4xrjTUWx2kUJJQXVi3Qt8SUKf2+O2q0DBRfM8uOwlrbKg/nNU2UlrNRYwqKNv7yrpOIlC1XZ/2QqPj3gkW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774407; c=relaxed/simple;
	bh=q5/VhU58XtrtzTa4DbZsJlvi90sfrjimd/qYfuuU138=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0WfF2Mxd3qK+L0aTAXODzbL5PTxrXOEGUfaFk3p5AM6OkZRi+v0wZXzmsArAs7NQ0B+ck973JKf3GlBlOXZnYRoXBgHh7ybzz//6LBMsEQ6XQtwPV0H6C5d8Y7HRZzSaS11VUG8gm3d4W9HdnJ5plc6ZhRc9RC3cPeqa9HAazA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9IVcWgV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9IVcWgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472A5C2BCB3;
	Thu, 14 May 2026 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778774406;
	bh=q5/VhU58XtrtzTa4DbZsJlvi90sfrjimd/qYfuuU138=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9IVcWgVnrDfqESMTvVf2KTFSa748rJsxwBxM2uxFN7DAXW89CZCKGTFCzpxTNYo8
	 USsjyqR83RBJwuOGiLu5WthXn8en5EU7FMzvwSleN8H+y0Xauub8+7YUTX7es3wTzl
	 rkCor1NuAB44NpOjFGUw96L60Ikc0J0o3msu31Wpfh0rQrep58ykbNYCxp8VOv3uRR
	 hF7ETINDUiPZiwMzCRv+itk4ZiqWeBPJl7RhTG5DdaVTPHaTn5P2uIiurzAo/E8+Zj
	 14rFUWv9ueJIeJhJBky/jDHy0Ja8utk76MbqaPcIGdia2XRTlRyDrMOWdf7+dGlVeC
	 c/eQLOLtoUOOw==
Date: Fri, 15 May 2026 01:00:02 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Klaus Kusche <klaus.kusche@computerix.info>
Cc: llvm@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>,
	peterz@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: linux 7.0.4 + clang 22.1.5 with thin or full lto still fails
 with objtool error
Message-ID: <20260514160002.GA2229579@ax162>
References: <3138b173-cdad-4cb6-bb10-98d164513e6b@computerix.info>
 <98f7c318-c571-4204-a4df-f70221ef8c39@computerix.info>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98f7c318-c571-4204-a4df-f70221ef8c39@computerix.info>

On Thu, May 07, 2026 at 09:31:36PM +0200, Klaus Kusche wrote:
> 
> The error I reported for linux 7.0.3 and clang 22.1.4 (see below)
> still occurs with 7.0.4 and 22.1.5:
> Compiling the kernel fails in the "LD vmlinux.o" step with
> "vmlinux.o: error: objtool: bad .discard.annotate_insn entry: 
> 599 of type 8"
> 
> This time, I reproduced it with the vanilla kernel,
> not the gentoo kernel, so there is no gentoo involved in the build.
> 
> It happens with both full LTO and thin LTO, only no LTO works.
> 
> My kernel config reproducing the error with vanilla 7.0.4 is in 
> https://bugzilla.kernel.org/show_bug.cgi?id=221460

Just to close the loop for other folks in this thread, this is now being
tracked in our downstream issue:

  https://github.com/ClangBuiltLinux/linux/issues/2162

> -------- Forwarded Message --------
> Subject: 7.0.3 with clang 22.1.4 and full lto: objtool error
> Date: Mon, 4 May 2026 20:46:50 +0200
> From: Klaus Kusche <klaus.kusche@computerix.info>
> To: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, peterz@infradead.org, Nathan Chancellor <nathan@kernel.org>
> 
> Hello,
> 
> with clang 22.1.4, I get an error in the "LD vmlinux.o" step
> (full lto):
> "objtool: bad .discard.annotate_insn entry: 609 of type 8"
> 
> Same kernel & same config compiles and runs nicely with clang 21.1.8.
> 
> I've attached the kernel config to
> https://bugzilla.kernel.org/show_bug.cgi?id=221460
> 

-- 
Cheers,
Nathan
