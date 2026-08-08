Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C36175A88;
	Sat,  8 Aug 2026 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786211407; cv=none; b=B0MP/8pEsPhmu1w4rkFb0G8PPADPp9sLLYSR2DOobbrjVYOCpdj5BQLX21I8YJVcA80ZDLSCCoX8HCIKiLDtFgUft8qGEBZXofwmgQWJwYpYltjT1x+fTP5Q65CCQiFauBEKk1nsYVCFBhU4EAsZREWTX2GRTX3L+w9yz8TbkzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786211407; c=relaxed/simple;
	bh=DNtxS85ANYh0V7PQCbMCtn/8DgD3jigJQzcz3iOwmvA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=C+9Z47f5hrwP1kF+4jW7DAowMsjdXaLOnXpj/hnQMcuk58NU9ogrp8fz8ifoqx815vAe0oaJlyQfeq7PGCn1XQsmgs2Sn+6fxdExyluLIApcnoLc44qV5zNuetOdHsY5UHN19seKprUEdsqL5/sTpMK8a2CeYapM5BXffZ0B6YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wCOe1AkE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wCOe1AkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A260E1F000E9;
	Sat,  8 Aug 2026 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786211405;
	bh=n8UxEYwiXtGRy6UasZjIsNvai5CyzBr4mcUIXQMGrBk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=wCOe1AkE97Tzd7WEZ/jhU2cooj6BTh2yRoEwBzwjWmV+kPQIjnD6x2ystgj+vVLOX
	 G8fkQk72u8L2qsWN7MrPg1St/1xEa0PndNzX/mVF8sx33oc7mWpm1ADIZX1wSEZSZc
	 odCo79AhTi6ksq3Y0ojBKugMC3UuNkGS1wFyJq+0=
Date: Sat, 8 Aug 2026 10:50:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] lib/interval_tree: fix allocation warning messages
Message-Id: <20260808105005.de1bcf3aff8698f818879053@linux-foundation.org>
In-Reply-To: <20260808123608.73613-1-kmehltretter@gmail.com>
References: <20260808123608.73613-1-kmehltretter@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  8 Aug 2026 14:36:08 +0200 Karl Mehltretter <kmehltretter@gmail.com> wrote:

> WARN_ON_ONCE() takes a condition, not a message. The string literals
> are always true, so the warnings still trigger but the messages are
> never printed.
> 
> Use WARN_ONCE(1, ...) instead to print the messages and keep the
> once-only behavior.

lol, OK, thanks.

	fgrep -r 'WARN_ON_ONCE("' .

finds more.


