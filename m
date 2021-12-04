Received: from smtprelay.hostedemail.com (smtprelay0153.hostedemail.com [216.40.44.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787222C9E
	for <llvm@lists.linux.dev>; Sun,  5 Dec 2021 00:16:13 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 8AAC7180E1367
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 18:20:34 +0000 (UTC)
Received: from omf12.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id 2F8DC837F24C;
	Sat,  4 Dec 2021 18:20:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 8CB391C;
	Sat,  4 Dec 2021 18:20:25 +0000 (UTC)
Message-ID: <429227f33cf14aee6f0668a3d98aa220b54383d6.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: Sort entries using parse-maintainers.pl
From: Joe Perches <joe@perches.com>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, 
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Date: Sat, 04 Dec 2021 10:20:24 -0800
In-Reply-To: <20211204175255.1361385-1-j.neuschaefer@gmx.net>
References: <20211204175255.1361385-1-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: foo3f1u3hgn5jmzzcthbws61qao1rhua
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 8CB391C
X-Spam-Status: No, score=0.10
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/cyDD7NO8kshW4/mXLo5/vMS1r9aOWN88=
X-HE-Tag: 1638642025-813990

On Sat, 2021-12-04 at 18:52 +0100, Jonathan Neuschäfer wrote:
> The MAINTAINERS file got slightly out of order again, making it
> difficult to put new entries at the right (alphabetical) position.
> 
> Run parse-maintainers.pl to restore the alphabetical order.
[]
> Checkpatch warns about a few unordered "F:" lines within sections, but I
> left those alone because I wanted this patch to be as automated as possible.

The --order option does that.

$ ./scripts/parse-maintainers.pl --order --output MAINTAINERS


