Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415D136B
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 22:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0ECC385AD;
	Thu, 28 Apr 2022 22:42:14 +0000 (UTC)
Date: Thu, 28 Apr 2022 18:42:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] ftrace: recordmcount: Handle sections with no
 non-weak symbols
Message-ID: <20220428184212.18fbf438@gandalf.local.home>
In-Reply-To: <126aca34935cf1c7168e17970c706e36577094e7.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
	<126aca34935cf1c7168e17970c706e36577094e7.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 Apr 2022 22:49:52 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> But, with ppc64 elf abi v1 which only supports the old -pg flag, mcount
> location can differ between the weak and non-weak variants of a
> function. In such scenarios, one of the two mcount entries will be
> invalid. Such architectures need to validate mcount locations by
> ensuring that the instruction(s) at those locations are as expected. On
> powerpc, this can be a simple check to ensure that the instruction is a
> 'bl'. This check can be further tightened as necessary.

I was thinking about this more, and I was thinking that we could create
another section; Perhaps __mcount_loc_weak. And place these in that
section. That way, we could check if these symbols to see if there's
already a symbol for it, and if there is, then drop it.

-- Steve
