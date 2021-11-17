Received: from smtprelay.hostedemail.com (smtprelay0163.hostedemail.com [216.40.44.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DA2C82
	for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 16:54:23 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 160FD18488BED
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 23:17:27 +0000 (UTC)
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id 5E0CA837F253;
	Wed, 17 Nov 2021 23:17:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 49AB3900065E;
	Wed, 17 Nov 2021 23:17:16 +0000 (UTC)
Message-ID: <dd3b7e0a1b71ab669fc1c0df434bf49eb3dce976.camel@perches.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Sort sections with
 parse-maintainers.pl help
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Linus
 Torvalds <torvalds@linux-foundation.org>
Date: Wed, 17 Nov 2021 15:17:18 -0800
In-Reply-To: <20211117190553.36144-1-andriy.shevchenko@linux.intel.com>
References: <20211117190553.36144-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 49AB3900065E
X-Spam-Status: No, score=-3.13
X-Stat-Signature: n9bupe7doqj5hygd79w1p9qt1qrjrf6s
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+rro6zIGaj4O46vOHsG7C1p1dc+9K9qn0=
X-HE-Tag: 1637191036-854386

On Wed, 2021-11-17 at 21:05 +0200, Andy Shevchenko wrote:
> Sort sections with parse-maintainers.pl help since quite a few
> got unsorted from the previous run.

If this is done, I think adding --order to the command line would be better.

For next-20211117 this gives

$ ./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS --order
$ git diff --stat MAINTAINERS
 MAINTAINERS | 826 +++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------
 1 file changed, 413 insertions(+), 413 deletions(-)


