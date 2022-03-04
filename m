Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965C7E
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 17:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291F7C340E9;
	Fri,  4 Mar 2022 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646414446;
	bh=eBv9jut7wP9w+t8Vy7DWHS5Hr/iPXveBdSkIPoOi+Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMtuq4ePoajN08irP3k2CnSq6fl9Aqcvf4pqeUQpNoDKVTkUpnutb8ZOoPhkHCiOc
	 mBsN7wf4mqA6T7xsVQqgBLEioMYCfSMrg46QNcP69nIVbBRvQYJYEvwqjGNdosdb5/
	 A0AFNja8pcTTH2l0+DBhS0uYzHVuZ8mjGN/tKQdatey9EOvRvxT1pEK5xWeI1nsy1q
	 GBzKZYxuQUoq3oZybVSTVVlH6U0C2iCIuKPkJnrbDCo3xHvPOOaMIydw51ptOCvZYz
	 xg/Gw6tsabP3VvqYr8AzletAICuloXw35IIzqXCHbh64cDfu4AP1s4RDbNGTe3K0Js
	 VpVS0LPqT5hxw==
Date: Fri, 4 Mar 2022 10:20:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sam Zeter <samuelzeter@gmail.com>
Cc: mhiramat@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/2] *** Fix reformat_objdump.awk ***
Message-ID: <YiJKZ2541K0ll0Ed@dev-arch.thelio-3990X>
References: <YdeGWyzvsXxntcAT@archlinux-ax161>
 <20220304031611.5763-1-samuelzeter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304031611.5763-1-samuelzeter@gmail.com>

Hi Sam,

On Fri, Mar 04, 2022 at 02:16:09PM +1100, Sam Zeter wrote:
> v1 -> v2
>  - coding style commit message amendments.
> 
> Samuel Zeter (2):
>   arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
>   arch/x86/tools/objdump_reformat.awk: Allow for spaces
> 
>  arch/x86/tools/objdump_reformat.awk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thank you for sending v2!

Since you only updated the commit messages (i.e., no functional
changes), you should carry forward my tested-by and Masami's acked-by on
both patches:

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

Additionally, for any future series/revisions, I would recommend leaving
the rest of the cover letter's message intact, so that people who missed
v1 are not in the dark on the purpose of the series (link provided for
convenience):

https://lore.kernel.org/r/20220106023606.283953-1-samuelzeter@gmail.com/

Regardless, those are just small process suggestions. I think this
should be ready to go, if the x86 maintainers have no objections. Great
work!

Cheers,
Nathan
