Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3BBA3B
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 13:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A50CC385A9;
	Wed, 27 Apr 2022 13:54:16 +0000 (UTC)
Date: Wed, 27 Apr 2022 09:54:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Message-ID: <20220427095415.594e5120@gandalf.local.home>
In-Reply-To: <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Apr 2022 15:01:22 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> If one or both of these weak functions are overridden in future, in the
> final vmlinux mcount table, references to these will change over to the
> non-weak variant which has its own mcount location entry. As such, there
> will now be two entries for these functions, both pointing to the same
> non-weak location.

But is that really true in all cases? x86 uses fentry these days, and other
archs do things differently too. But the original mcount (-pg) call
happened *after* the frame setup. That means the offset of the mcount call
would be at different offsets wrt the start of the function. If you have
one of these architectures that still use mcount, and the weak function
doesn't have the same size frame setup as the overriding function, then the
addresses will not be the same.

-- Steve


> We don't need the non-weak locations since they will
> never be executed. Ftrace skips the duplicate entries due to a previous
> commit.

