Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3687A322C
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 23:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC4FC385AC;
	Mon,  2 May 2022 23:52:58 +0000 (UTC)
Date: Mon, 2 May 2022 19:52:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Message-ID: <20220502195251.5d862365@rorschach.local.home>
In-Reply-To: <819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<20220427095415.594e5120@gandalf.local.home>
	<1651129169.fpixr00hgx.naveen@linux.ibm.com>
	<20220428100602.7b215e52@gandalf.local.home>
	<819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 May 2022 14:44:56 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> If we do that after the linking, won't it be a nightmare with the 
> trampolines installed by the linker when the destination is over the 24 
> bits limit ?

Not sure what you mean. The locations I'm talking about is the full
address saved in the __mcount_loc table (data section).

-- Steve
