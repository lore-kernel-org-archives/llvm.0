Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63620322E
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 16:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF69C385A9;
	Tue,  3 May 2022 16:25:41 +0000 (UTC)
Date: Tue, 3 May 2022 12:25:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Message-ID: <20220503122533.6033647e@rorschach.local.home>
In-Reply-To: <6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<20220427095415.594e5120@gandalf.local.home>
	<1651129169.fpixr00hgx.naveen@linux.ibm.com>
	<20220428100602.7b215e52@gandalf.local.home>
	<819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
	<20220502195251.5d862365@rorschach.local.home>
	<6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 May 2022 11:20:22 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Maybe I misunderstood. When you say 'after linking', do you mean vmlinux 
> or vmlinux.o ?

Whichever ;-)

> 
> In vmlinux, the addresses to be saved in __mcount_loc table might not 
> contain anymore a call to _mcount but a call to a trampoline that jumps 
> to _mcount, in case _mcount is too far from the said location at link 
> time. That's what I meant.

But how is that different than what is done today? And at linking,
everything still calls mcount. It's not until runtime things change.

The point I'm talking about is that after linking, if the linker
removed unused code (which would include unused weak functions,
right?), then the calls to mcount that were in the weak functions would
be gone too, and they would not be added by recordmcount, and for those
that are still around, then using their symbols as the reference point
would also not be an issue.

The problem we have right now is that the only symbol we have is a weak
function to reference the mcount call location in the __mcount_loc
section. But if all the global entries are not used and the linker
removes them, then the references using those symbols in the
__mcount_loc section will be "undefined". After linking, everything in
the vmlinux(.o) is set, and we are free to use that as a reference
point for the call sites.

-- Steve
