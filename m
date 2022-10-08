Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406967E
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 14:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B9EC433C1;
	Sat,  8 Oct 2022 14:07:47 +0000 (UTC)
Date: Sat, 8 Oct 2022 10:07:48 -0400
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
Message-ID: <20221008100748.1078fb3f@rorschach.local.home>
In-Reply-To: <Y0GBO77e2Lu/khkI@xhacker>
References: <20221006064028.548-1-jszhang@kernel.org>
	<20221006124144.abaz74g7nxrb5hxj@kamzik>
	<4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
	<Y0GBO77e2Lu/khkI@xhacker>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 8 Oct 2022 21:55:07 +0800
Jisheng Zhang <jszhang@kernel.org> wrote:

> > >> [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> > >> [2]https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/  
> > 
> > 
> > Could you please make these normal link tags.?  
> 
> How to make these link tags? I just used the permalink in
> lore.kernel.org

Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
Link: https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/

-- Steve
