Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A8389444
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 17:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581883; cv=none; b=N438u9nWNNeCX1nO7liSuYhle1or1BRQoRJvQKYCc1e7to8aIS4tjxC/dZyidx77COkn+7pVgp19B6+Y4gLz0n5d8OMcXTgaDfJ8bTcxWwnXzz/U5y8D7mldnHjXrA2aYrsLywzzMKCZJ+1ST8zmCj2ui4JcwwEwAM14l46EbjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581883; c=relaxed/simple;
	bh=DCRjbbD5nUfgVs64TkqzEiJJweWStyo3SApcQv+wRPg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IpTtNXFqYCdBjjFHwvRv/lCz3Eqz3cmPZ/9pxi3aX5OJRHDAX9Xc7xrfBqDFvMpkYghUQRwjj20S5dWybpxrf2J6zcejGlLgKDLtR9zQ2tN0X7wA6EnaZRHpvHYeaimGwIV4Lr4622cAWKCkTWxJuYvPRRU+N38D7C1mJU1w0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id AD9681608F1;
	Tue,  7 Apr 2026 17:11:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id ED61020011;
	Tue,  7 Apr 2026 17:11:11 +0000 (UTC)
Message-ID: <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
From: Joe Perches <joe@perches.com>
To: Ian Rogers <irogers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt	 <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,  Arnaldo Carvalho de
 Melo	 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 07 Apr 2026 10:11:10 -0700
In-Reply-To: <20260407165551.3075684-1-irogers@google.com>
References: <20260407165551.3075684-1-irogers@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: zbbuxma4kp85bnjwzxdnbcf43rg8qd7u
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: ED61020011
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19nLYsWr51xC9SOjYJOyCkDD0HFoxo6JUw=
X-HE-Tag: 1775581871-488854
X-HE-Meta: U2FsdGVkX1/Ukp1YPTB+DfV1ahROPhK75ecpw9CX13/+QmiK6+l+lGY9cMaKQ4rqrZnN4PCn7WIn1eUw+3Gb3x7X3S+BB5NNwLWUjSfQz4HjCU1LI+iol3U6Y5jeucC/U8uI7irqwdpG1e6d/pN5GcsmGg4lCf87yt4rDT17X++q+pbSYiO0on1WKkRXnm/YaYkV2jZA/d72Pbb7qH4sv0tpCml99NmG0tg0OcBCYfJdn4I90mQfTl/DzDdu3sxy9ZSYNeHeQT/gdNAv9OeO2aiK31gUCO47jQTS0Tvcwdt/nPMXPfX9njhABIUtHtToF04IGIduruu0L80uRPiE7TT5VTz8yzpb

On Tue, 2026-04-07 at 09:55 -0700, Ian Rogers wrote:

> Sorting headers is desirable to avoid issues like duplicate includes.

Perhaps.

Some others prefer reverse-christmas-tree by length ordering for #includes
though I think it's poor style.
