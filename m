Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20A246761;
	Tue, 19 Aug 2025 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755621891; cv=none; b=DS6EZclEGwhdg2ZmlDELIozO5n3/yC6q6Ex7tM7kNX0nftRjBN41z131FcsE93kIAJ7MugoQOECGTIfsb36hc22LK5M3DBloxyyXhEBUbPAbcIIqnt320bhHsvu6181tFsJAZo+lTYTVp7S0TrIsZi3DT0mo1cSE8xRdCYn61sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755621891; c=relaxed/simple;
	bh=RU7nlGe30M46gbBtEbh2P8n5jWs2/CHoeEBSBsFHfeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GC0gTnO7iM8oOkZ2KFkKWIjuJa9oknZxY8s7pm2F+ezoJzJuDM30HrBvgmNtQbxYoaKUavcrdNfoDtXRUIjIKwH5mPS9i6IaEesCVMd2iZolQZxrfOdkipMW2XUee7iunuRzWeWOeMJv2nhR5TZU5aoeI1RaHepKgOndnIjpoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 2156713662A;
	Tue, 19 Aug 2025 16:44:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 9C6192002C;
	Tue, 19 Aug 2025 16:44:40 +0000 (UTC)
Date: Tue, 19 Aug 2025 12:44:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [koverstreet-bcachefs:bcachefs-testing 315/315] ld.lld: error:
 duplicate symbol: __tracepoint_io_read
Message-ID: <20250819124440.67f0f6a5@gandalf.local.home>
In-Reply-To: <ujqytz6ysengalwiukpf5j24urkdyijq255ys7zgzevkzkyu2o@7ye2os3lu3a5>
References: <202508192038.S6x4nOyC-lkp@intel.com>
	<ujqytz6ysengalwiukpf5j24urkdyijq255ys7zgzevkzkyu2o@7ye2os3lu3a5>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9C6192002C
X-Stat-Signature: rfyutshmppwz5rw6grdhwdyi6kz87ra6
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+KvaYYPUqBKDpTIrlnEUx7XrwXn1AwNAA=
X-HE-Tag: 1755621880-601068
X-HE-Meta: U2FsdGVkX1/lkLskUhTUMbjbO473JCVwq+5OlmuV/A4q4ncq8SoTPwMHX6oy2UoyEe/mSup/iqNqRKYYAcpAk8EmrATZ1h1mwrGZh7hHeCUP8k8WiB0fC/PChEltPr4OexFjwD3h4qUMoHv6Ekn9eAKKe4QVMVsIXGBr2pqkYBYFjSrdOXmLTpmstYE/h3YIk+A/+K+1FqYeEna8VdCNz0nYumEdmqh49cZja7op578KU1AODL3sCpejoy3R/wD0SEBd9CRkhijPpboc2cQucsupbwNHu7OmiEEFI22uuiBNGmkbQxZTB9Jr7DiiEwTV

On Tue, 19 Aug 2025 10:57:19 -0400
Kent Overstreet <kent.overstreet@linux.dev> wrote:

> __traceiter_tracepointname - is this something easily fixable, or do I
> just have to rename?

Best to just rename. Two static tracepoints can't have the same name, which
is why I recommend always appending a prefix to them.

Which is why we have: /sys/kernel/tracing/events/sched/sched_switch
and not just: /sys/kernel/tracing/events/sched/switch

-- Steve
