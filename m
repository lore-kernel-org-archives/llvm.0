Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4042C83
	for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 12:10:33 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AD10B60EB4;
	Tue, 12 Oct 2021 12:10:31 +0000 (UTC)
Date: Tue, 12 Oct 2021 08:10:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Ingo Molnar <mingo@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Masami Hiramatsu <mhiramat@kernel.org>, Tom Zanussi
 <zanussi@kernel.org>, Tzvetomir Stoyanov <tz.stoyanov@gmail.com>, Yordan
 Karadzhov <y.karadz@gmail.com>
Subject: Re: [PATCH] tracing: Fix event probe removal from dynamic events
Message-ID: <20211012081028.1305cef7@gandalf.local.home>
In-Reply-To: <202110121423.x2xd94xu-lkp@intel.com>
References: <20211011211105.48b6a5fd@oasis.local.home>
	<202110121423.x2xd94xu-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Oct 2021 14:49:49 +0800
kernel test robot <lkp@intel.com> wrote:

> All errors (new ones prefixed by >>):
> 
> >> kernel/trace/trace_eprobe.c:128:2: error: use of undeclared identifier 'slash'  
>            slash = strchr(argv[0], '/');
>            ^

Bah, I fixed this after creating the initial commit, but never amended the
commit with the update, and sent out the broken commit.

Will send out v2 shortly.

-- Steve
