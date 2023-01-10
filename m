Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8D19E
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 00:30:43 +0000 (UTC)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4NrWjY4SgXz1qybm;
	Tue, 10 Jan 2023 01:22:40 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4NrWjX0vSpz1qqlR;
	Tue, 10 Jan 2023 01:22:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id DiUuhnXlaHJ9; Tue, 10 Jan 2023 01:22:38 +0100 (CET)
X-Auth-Info: L9w5ayo6JQGgDusGnhVePL9x9OVfSDH16AZsAok4PJK/NjVMEjPpDaJpsfV403G4
Received: from igel.home (aftr-62-216-205-85.dynamic.mnet-online.de [62.216.205.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 10 Jan 2023 01:22:38 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 71E832C132D; Tue, 10 Jan 2023 01:22:38 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,  kernel test robot
 <lkp@intel.com>,  linux-kbuild@vger.kernel.org,  trix@redhat.com,
  masahiroy@kernel.org,  llvm@lists.linux.dev,  npiggin@gmail.com,  Nathan
 Chancellor <nathan@kernel.org>,  linuxppc-dev@lists.ozlabs.org,
  nicolas@fjasle.eu
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
	<20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
	<CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
	<20230109222337.GM25951__25255.3859770828$1673303520$gmane$org@gate.crashing.org>
X-Yow: Is this going to involve RAW human ecstasy?
Date: Tue, 10 Jan 2023 01:22:38 +0100
In-Reply-To: <20230109222337.GM25951__25255.3859770828$1673303520$gmane$org@gate.crashing.org>
	(Segher Boessenkool's message of "Mon, 9 Jan 2023 16:23:37 -0600")
Message-ID: <87cz7n2q7l.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Jan 09 2023, Segher Boessenkool wrote:

> It is required by POSIX (for the c99 command, anyway).  It *also* is
> required to be supported when producing object files (so when no linking
> is done).
>
> It is a GCC flag, and documented just fine:
> https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s

Most assembler flags are unrelated to the flags passed to the compiler
driver, and -s is no exception.  POSIX has nothing to say about the
sub-commands of the compiler anyway.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
