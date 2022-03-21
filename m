Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C624289
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 13:24:16 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 327BD1F37C;
	Mon, 21 Mar 2022 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647869049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E7U5uKaIQLUvkNLhP5oQgV7mc1DnEGBbOz9yuTiVwsc=;
	b=lLqP4nm6FvptzyZodFT83i+DUtjxZfsnYChrSh44AqUSurAS1CaHpsnPVSJPEKKRNsGut5
	hmfHDG4J34S2R3N8MbMaZFgF4TXK6tB1pzwVILSkEt9oXGXsiKdnZZAJ6TF4SFk/Jwj2eq
	hz5E+vzeNQyD8sY6Te9uTg2tQYOr44w=
Received: from suse.cz (unknown [10.100.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 12740A3B81;
	Mon, 21 Mar 2022 13:24:09 +0000 (UTC)
Date: Mon, 21 Mar 2022 14:24:05 +0100
From: Petr Mladek <pmladek@suse.com>
To: trix@redhat.com
Cc: jpoimboe@redhat.com, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] livepatch: Reorder to use before freeing a pointer
Message-ID: <Yjh8dX1iMsHUF4nU@alley>
References: <20220320015143.2208591-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220320015143.2208591-1-trix@redhat.com>

On Sat 2022-03-19 18:51:43, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> livepatch-shadow-fix1.c:113:2: warning: Use of
>   memory after it is freed
>   pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The pointer is freed in the previous statement.
> Reorder the pr_info to report before the free.
> 
> Similar issue in livepatch-shadow-fix2.c
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Strictly speaking, the freed memory is not used.
pr_info() only prints the address.

Anyway, I agree that the reordered code is cleaner.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
