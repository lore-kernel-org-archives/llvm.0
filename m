Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544D366566;
	Wed, 23 Sep 2026 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127886; cv=none; b=LFZPWZXhOh9+1wU22v3TWHi3foy5sk5qU234EZoR6EbEjZq6BXQYagS0irAMwu0yH6FWUvMocBwVnaR2XdXVQslLVqJxNS7fBrJg1R/a1HKDCnkLxqOhjc0sXO96MwkLeQfzeaDCSJlvP9Y3vFt8sX/9WgelAQiaRQ7YuXJHycc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127886; c=relaxed/simple;
	bh=3ddbw1aL+gQsXwkgg5/gEl2OpNWLOVLpEKctOnHJYUw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q12Lv+Zj0si/PtwxIyHpPxWbKrzAoYW+UMG+22Ik/7R4oP6TQG1534xwiqqTcpI8/0b6bPMOkPXja2x3X7xqdcl47p2nDr2AN8D1siBUOdVN7tNx9uJuhIg7xzLgKdONR6Cp35u44EWXrQQwezQNbAtaj8XuAH5yQkvnnLxFNag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/VRqXav; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/VRqXav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9871F000FF;
	Wed, 23 Sep 2026 01:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790127883;
	bh=/dLKjvL8/jGvcDgy2LXYRuDYbG8pKJo+VfODCzHN454=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P/VRqXavmzbBPgxHwXTzej7J8HceHH2tQDlhIAynNaR6DLwWv9nFm5LqrnXfKAg9M
	 tY1J6s2rr3fgPVimBDS8azGqgtkxmrnK7cJ1FdP2P06Jg4zj9W55lBZU7f3wauNCNw
	 JeDu2PS/QDsVGsw2i4pR5U8y1+xuJMQDMlJPekDZpH7Q1ShT7wQopYXP5AaX3h2Tqn
	 /BcSrDqUHy5ntTFMLWIOCDS8VxmGqkNML4RjlaWkvIfpZWQnypwmG0/sGJAk4aK//R
	 77hAo7/cZYDlUGrNPCQgXHJ6l9sGoVtNGLUHzq1suKCURkjSjU71YKFAb64I8kEMWQ
	 EDh0mkdAQeSdg==
Date: Wed, 23 Sep 2026 02:44:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Davidlohr Bueso
 <dave@stgolabs.net>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] memregion: fix cache invalidation warning message
Message-ID: <20260923024437.03f42bbe@jic23-hlaptop>
In-Reply-To: <aqUY5Zho3sKFP_84@gmail.com>
References: <20260808121943.72939-1-kmehltretter@gmail.com>
	<aqUY5Zho3sKFP_84@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Sep 2026 11:19:57 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> On Sat, Aug 08, 2026 at 02:19:43PM +0100, Karl Mehltretter wrote:
> > WARN_ON_ONCE() takes a condition, not a message. The string literal is
> > always true, so the warning still triggers but the message is never
> > printed.
> > 
> > Use WARN_ONCE(1, ...) instead to print the message and keep the
> > once-only behavior.
> > 
> > Found with a Coccinelle script. Clang's -Wstring-conversion also flags
> > such calls but is not enabled in kernel builds.
> > 
> > Fixes: 1156b4418db0 ("memregion: Add cpu_cache_invalidate_memregion() interface")
> > Assisted-by: Claude:claude-fable-5 coccinelle
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>  
> 
> Friendly ping on this patch.
> 
> Updating Jonathan's Cc address to jic23@kernel.org, as the original
> submission bounced at his old Huawei address.

Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> 
> Thanks,
> Karl

