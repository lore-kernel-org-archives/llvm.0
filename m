Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA12596
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 17:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65FFC385B4;
	Wed,  4 May 2022 17:06:48 +0000 (UTC)
Date: Wed, 4 May 2022 13:06:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Message-ID: <20220504130642.7b9a301d@rorschach.local.home>
In-Reply-To: <72d17597-874c-f3a3-9398-0cc944350c5b@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<20220427095415.594e5120@gandalf.local.home>
	<1651129169.fpixr00hgx.naveen@linux.ibm.com>
	<20220428100602.7b215e52@gandalf.local.home>
	<819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
	<20220502195251.5d862365@rorschach.local.home>
	<6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
	<20220503122533.6033647e@rorschach.local.home>
	<72d17597-874c-f3a3-9398-0cc944350c5b@csgroup.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 May 2022 16:50:58 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> In vmlinux, relocations are resolved, trampolines are installed for 
> unreachable destinations and you don't anymore have a section with all 
> the relocations to mcount. It means 'recordmcount' or whatever tool we 
> use will have to read the code to find all direct calls to mcount, then 
> find all trampolines to mcount then find all calls to those trampolines.

OK, so what you are saying is that in the object file, we can see the
site that calls mcount, but when it is linked, it may not call mcount,
but instead it will call a trampoline that will call mcount, thus the
tool will need to find these calls to the trampolines that call mcount
as well as the locations that call mcount directly.

Did I get that right?

-- Steve
