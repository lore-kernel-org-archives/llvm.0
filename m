Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069E410E0
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 14:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9269C385A9;
	Thu, 28 Apr 2022 14:06:03 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:06:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, Michael Ellerman <mpe@ellerman.id.au>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Message-ID: <20220428100602.7b215e52@gandalf.local.home>
In-Reply-To: <1651129169.fpixr00hgx.naveen@linux.ibm.com>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<20220427095415.594e5120@gandalf.local.home>
	<1651129169.fpixr00hgx.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 Apr 2022 13:15:22 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> Indeed, plain old -pg will be a problem. I'm not sure there is a generic 
> way to address this. I suppose architectures will have to validate the 
> mcount locations, something like this?

Perhaps another solution is to make the mcount locations after the linking
is done. The main downside to that is that it takes time to go over the
entire vmlinux, and will slow down a compile that only modified a couple of
files.

-- Steve
