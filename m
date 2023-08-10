Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039DD1E1CA
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 13:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BBAC433C8;
	Thu, 10 Aug 2023 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691674028;
	bh=npt7UXBpc0DNHjnEk6D3ZvNr6yBDAu9PrIPCFznBoGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGX8ryyyg4d0O7lOmmgQyO4vX5eS1tm7k30XmViZJqSf3xcwTekcq1pdoDd9PLYN/
	 E5DIsdu/39PvOpgNiUT4U5xABWHmW3ZlaFJcDvl0TyC6xNUB13wTLkLSyS3d+0wce5
	 EipP5IxOMQjCY92Q54wR6sMTXswFT6WpXEd0t4Am4HCGbwWYcDRKQKbZWbMGEx6MdE
	 B4KtB47GxTsTfFaqZgOT6IREWXL3sb5NMlcZWAgRLV5EBdcOpT2N/BCgF8xKudNT6i
	 az49MCXCSyWBVIufxpD49Jh5uprxQz3Wwi+sSpfYziocdPbXVpjjlSx4IARdInYFWp
	 5uyu/yI7XrfGg==
Date: Thu, 10 Aug 2023 06:27:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO
 mitigations
Message-ID: <20230810132706.GA3805855@dev-arch.thelio-3990X>
References: <20230810013334.GA5354@dev-arch.thelio-3990X>
 <20230810081038.GAZNSbftb6DOgg/U7e@fat_crate.local>
 <20230810090835.GBZNSpE6tCw+Ci+9yh@fat_crate.local>
 <20230810101649.GA1795474@dev-arch.thelio-3990X>
 <20230810125122.GIZNTdSuFvA3Cjfexq@fat_crate.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810125122.GIZNTdSuFvA3Cjfexq@fat_crate.local>

On Thu, Aug 10, 2023 at 02:51:22PM +0200, Borislav Petkov wrote:
> On Thu, Aug 10, 2023 at 03:16:49AM -0700, Nathan Chancellor wrote:
> > Just to clarify, this is the guest kernel at -rc5 and the host kernel
> > with the SRSO mitigations applied? If so, that's the problem. The guest
> > kernel does not have to have the SRSO mitigations applied to see this
> > problem. Sorry I should have made that more clear! If not though, that's
> > interesting because I was running -rc5 on the host without issues.
> 
> Well, how do you even build CPU_SRSO with clang?
> 
> config CPU_SRSO
>         bool "Mitigate speculative RAS overflow on AMD"
>         depends on CPU_SUP_AMD && X86_64 && RETHUNK
> 					    ^^^^^^^
> 
> config RETHUNK
>         bool "Enable return-thunks"
>         depends on RETPOLINE && CC_HAS_RETURN_THUNK
> 				^^^^^^^^^^^^^^^^^^^
> 
> config CC_HAS_RETURN_THUNK
>         def_bool $(cc-option,-mfunction-return=thunk-extern)
> 
> $ clang -mfunction-return=thunk-extern
> clang: error: unknown argument: '-mfunction-return=thunk-extern'
> clang: error: no input files
> 
> $ clang --version
> Debian clang version 14.0.6
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
> 
> Hmmm.

That option was only backported to LLVM 15.x+ because 14.x and older
were not supported any more when it was added.

$ clang -mfunction-return=thunk-extern -x c -c -o /dev/null /dev/null

$ clang --version
clang version 15.0.7
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

But my host kernel was compiled using GCC 13.2.0 from kernel.org for the
sake of testing to see if the compiler used to build the host kernel had
an impact on the problem and it did not.

Cheers,
Nathan
