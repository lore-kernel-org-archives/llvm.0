Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119B73FCC
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 16:21:38 +0000 (UTC)
Received: from oasis.local.home (unknown [209.210.2.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 93E676108E;
	Mon, 27 Sep 2021 16:21:38 +0000 (UTC)
Date: Mon, 27 Sep 2021 12:21:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Chris Down <chris@chrisdown.name>
Cc: Arnd Bergmann <arnd@kernel.org>, Petr Mladek <pmladek@suse.com>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Jessica Yu <jeyu@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, John Ogness <john.ogness@linutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, YueHaibing
 <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] printk: avoid -Wsometimes-uninitialized warning
Message-ID: <20210927122138.56cb1d8e@oasis.local.home>
In-Reply-To: <YVHE1qclD6ZyjvvD@chrisdown.name>
References: <20210927125007.1581919-1-arnd@kernel.org>
	<YVHE1qclD6ZyjvvD@chrisdown.name>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Sep 2021 14:19:18 +0100
Chris Down <chris@chrisdown.name> wrote:

> Having IS_ENABLED and then an #ifdef seems to hurt code readability to me.

I agree.

Would this be a better solution?

-- Steve

diff --git a/kernel/printk/index.c b/kernel/printk/index.c
index d3709408debe..ce3a0c8c5770 100644
--- a/kernel/printk/index.c
+++ b/kernel/printk/index.c
@@ -26,10 +26,10 @@ static struct pi_entry *pi_get_entry(const struct module *mod, loff_t pos)
 	if (mod) {
 		entries = mod->printk_index_start;
 		nr_entries = mod->printk_index_size;
-	}
+	} else
 #endif
+	{
 
-	if (!mod) {
 		/* vmlinux, comes from linker symbols */
 		entries = __start_printk_index;
 		nr_entries = __stop_printk_index - __start_printk_index;
