Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D0720EC
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 15:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B6AC3411C;
	Wed,  6 Jul 2022 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657120689;
	bh=2LMCaO6vTDabZN1rCyMlGwYle38IzOCU9E5FKXLU4xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHAS5hO8Qd0Vxrz8bJaoEiIlz3cHUsjwG3WHfMl8xfsCktprX8aSH+GubgCn6gKmA
	 Ozlv6TogZzbAjGU57tvF+DLFveasqNAqvMlv4CJVFoz9B8oolSAvShKqF191yeIyQO
	 0C/2lZRokiXKj9nyXgbD7abP+vLpDlj58arQgP2dz0Pnm0wPkFNRvbqH/dgkNd2pgh
	 lGUVZ/Rrbkt/y1HxVqOmnA+O9/H6utlH36yr2FBef5lRXkaSdA8mjzWJAYta/O7KVc
	 xKY32yxmNyzj2cV9CcKGyOySCxYfijyibMrokebbfY7gfNjDslmiWoE9H3XYeUPNih
	 ZwePqIZcMeBpw==
Date: Wed, 6 Jul 2022 08:18:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Zhihao Lin <zh.lin@mail.utoronto.ca>
Cc: clang-built-linux@googlegroups.com, llvm@lists.linux.dev
Subject: Re: Generating LLVM IR
Message-ID: <YsWnr0C2hFNSAqch@dev-arch.thelio-3990X>
References: <YT3PR01MB8756D354EA9FC06D5009E205A0809@YT3PR01MB8756.CANPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT3PR01MB8756D354EA9FC06D5009E205A0809@YT3PR01MB8756.CANPRD01.PROD.OUTLOOK.COM>

Hi Zhihao,

On Wed, Jul 06, 2022 at 10:57:53AM +0000, Zhihao Lin wrote:
> Hello, I'm trying to build the kernel using LLVM and generate LLVM IR.
> In the makefile, I saw there is a target "dir/file.ll" provided.
> However, I want to add more attributes to the IR file generated, such
> as adding debug information. Is there any way to generate personalized
> IR by either modifying the Makefile or changing Makefile variables?

You can add additional flags to the "dir/file.ll" compiler invocation
with the KCFLAGS make variable:

$ make KCFLAGS="-ffoo -Wfoo" dir/file.ll

Additionally, there are kernel configurations, such as CONFIG_DEBUG_INFO
or CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT (depending on the kernel
version you are working against), which will add the compiler arguments
to generate debug info.

If you have any further questions, feel free to let us know! I have
added our new mailing list (llvm@lists.linux.dev) to the thread so it
can be archived at https://lore.kernel.org/llvm for future travellers,
please use that list if you start any new threads in the future :)

Cheers,
Nathan
