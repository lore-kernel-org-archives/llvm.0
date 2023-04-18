Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C034C2572
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 13:13:49 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pol9R-0000YG-01; Tue, 18 Apr 2023 15:13:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D72A4C0116; Tue, 18 Apr 2023 15:09:45 +0200 (CEST)
Date: Tue, 18 Apr 2023 15:09:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev,
	ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH v2 3/7] MIPS: Detect toolchain support of workarounds in
 Kconfig
Message-ID: <20230418130945.GB12456@alpha.franken.de>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-4-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414080701.15503-4-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 14, 2023 at 09:06:57AM +0100, Jiaxun Yang wrote:
> LLVM toolchain does not support most of workarounds, detect
> those supports in Kconfig so we can hide unsupported workarounds
> to user.

again hiding something, which then needs to be digged out is IMHO not
a good way.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
