Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77CD4C62
	for <llvm@lists.linux.dev>; Fri, 13 Jun 2025 00:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749772919; cv=none; b=TcG/v3leYcLasyBET+3I7bYZQXxVz3iWt8YzkKj5dz8wqKJ/ak5BbhvL81wIgnveeVZLPpUzZUYxvGNO03Aw/ITY9m8aOC4DV2auiRk0DgZPuFptjiPHtbbi/l+nww6NujYj13tE4bdiRuTZ/crHa7svNVL3kkSbQBNF6/YvbtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749772919; c=relaxed/simple;
	bh=o9CR3EhjQ+ZZzTzS7T0mZi/CsjrJv1pHR8dgVz8Pstk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=h4+eigJEh5DWfvU78ygOERFpGjpQTXEbewueyKK84qBmKUqz6QiCDoV8y8dDy1qDr8Qep0iRIt3Q9ZryBBkBaJty2pxrVw6m2cu/+g60rUR3JBCfQ6UALyjepKl+i4gTYYWJDzHRf28CmUS4Kelra+RshYH1NnJqT/6dWcMWRpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 19A1F1A041C;
	Fri, 13 Jun 2025 00:01:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id CE4C120028;
	Fri, 13 Jun 2025 00:01:52 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uPrtJ-00000001wnd-1nuZ;
	Thu, 12 Jun 2025 20:03:29 -0400
Message-ID: <20250613000329.286479259@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 12 Jun 2025 19:58:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 5/5] tracing: Call trace_ftrace_test_filter() for the event
References: <20250612235827.011358765@goodmis.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Stat-Signature: diua5zcqp9iczdgnfp1grmz7rqzmt3wr
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: CE4C120028
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX185jXjmEA5Il45s1+YOC9oxdiG1nQiFu4I=
X-HE-Tag: 1749772912-115042
X-HE-Meta: U2FsdGVkX1/9VScq6F1KmsgKUwBx7tW3d18olEMu635z4LH5QTHhZRhaSj4Nq44JUK/H3mU6rrMHNMTEA+SEwgG9SUd1ws44w/ZX4VjbEV1ejEOp4H+qlyxGuRFRr202al68PP9VkgBefYO6indgUyF7Seciuq8ZyKL3bqe5Kd9QkM8L1RiVqgiYmzvuxD+zjYRpRgTA1PslzjSv6egrWAJWLyE17IdcwB9WozTg8Xow80zlT+fINToknGQg7G3L7QnD0z5EM7Yoj/Ah3s8PehiUoi9jxeuuLNBYwHIIHVyF6gz7p7OwXEpIxjGMTwanOQriU0Q5IXzcFBFjYfuvT6dxJ8IMym4Uh/smzB/tD6SsWdE4C2tE3935tKNsd8jLFc+/U7Vgfe5U5nc+XcEZbg==

From: Steven Rostedt <rostedt@goodmis.org>

The trace event filter bootup self test tests a bunch of filter logic
against the ftrace_test_filter event, but does not actually call the
event. Work is being done to cause a warning if an event is defined but
not used. To quiet the warning call the trace event under an if statement
where it is disabled so it doesn't get optimized out.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index ea8b364b6818..79621f0fab05 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2902,6 +2902,10 @@ static __init int ftrace_test_event_filter(void)
 	if (i == DATA_CNT)
 		printk(KERN_CONT "OK\n");
 
+	/* Need to call ftrace_test_filter to prevent a warning */
+	if (!trace_ftrace_test_filter_enabled())
+		trace_ftrace_test_filter(1, 2, 3, 4, 5, 6, 7, 8);
+
 	return 0;
 }
 
-- 
2.47.2


