Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A848B68
	for <llvm@lists.linux.dev>; Mon,  1 Nov 2021 15:09:19 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 616E160E90;
	Mon,  1 Nov 2021 15:09:18 +0000 (UTC)
Date: Mon, 1 Nov 2021 11:09:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [rostedt-trace:for-next 58/100]
 samples/ftrace/ftrace-direct-multi.c:8:6: warning: no previous prototype
 for function 'my_direct_func'
Message-ID: <20211101110916.47de8ccc@gandalf.local.home>
In-Reply-To: <YX/88QsleYGkt7PG@krava>
References: <202111010507.F9ud1mUL-lkp@intel.com>
	<YX/thIXtDzfhljX7@krava>
	<20211101102434.47e84754@gandalf.local.home>
	<YX/88QsleYGkt7PG@krava>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Nov 2021 15:42:57 +0100
Jiri Olsa <jolsa@redhat.com> wrote:

> ok, I'll send it.. should be on top of you for-next branch?

Yes please. I'm about to push it to Linus, with a note that I'll be sending
him another pull request later this week.

-- Steve
