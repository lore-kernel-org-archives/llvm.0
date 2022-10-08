Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185C7E
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 14:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF22C433C1;
	Sat,  8 Oct 2022 14:09:01 +0000 (UTC)
Date: Sat, 8 Oct 2022 10:09:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor.Dooley@microchip.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, ajones@ventanamicro.com, ardb@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 samuel@sholland.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <20221008100902.0bbbc1cc@rorschach.local.home>
In-Reply-To: <20221008100748.1078fb3f@rorschach.local.home>
References: <20221006064028.548-1-jszhang@kernel.org>
	<20221006124144.abaz74g7nxrb5hxj@kamzik>
	<4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
	<Y0GBO77e2Lu/khkI@xhacker>
	<20221008100748.1078fb3f@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 8 Oct 2022 10:07:48 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> Link: https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
> 

This way tools can be used to map commits to links relevant to them.
They key off the "Link:" tag keyword.

-- Steve

