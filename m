Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369477C
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 13:02:53 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1650891765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2Y0dk0v2QhhujXXXiV6zOwcfBigja4CJ2899Lak04o=;
	b=lStpSrmmi4KYtp03TySWwHgabipO3ogBfSK5wdUnufrg7j0LlNeKzlwp5Ch5HiaPcMVhbu
	Y9hwchP4opHl2U5R3kan3RpEAWEdXo15bnkqpP+rk4VOEe5M8dUNZtRNQZ6g1qUmwhhRFB
	rmpZzivYfuJf17PIFWuRCewkaudD/0sPlCx5WAFWQamyQ0HVjMDoH10ozxQ0n7c5TwUx3f
	dcHM9Lt9EwMq+2WpOWEnAWQRNvJUQpD7x4NSzmm4AivvUj2pyECgUn57AyJTQgGvzrK5pl
	oDitvN7PZ/ypsO7eSiUqdsFttsb0Jv4ndX2LMasnkZv2QgziOuuYZDc9co7wlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1650891765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2Y0dk0v2QhhujXXXiV6zOwcfBigja4CJ2899Lak04o=;
	b=e2i6+Jb+88UVFeoH0DcTYq4uExD9X1HqWqx+jjouEVhdijW9+DqwoTLHMxFDre4EYVA8rP
	AQZYUOIOFr2iKeBw==
To: Colin Ian King <colin.i.king@gmail.com>, Tom Rix <trix@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] kernel/irq/matrix.c: remove redundant assignment to
 variable 'end'
In-Reply-To: <20220422110418.1264778-1-colin.i.king@gmail.com>
References: <20220422110418.1264778-1-colin.i.king@gmail.com>
Date: Mon, 25 Apr 2022 15:02:44 +0200
Message-ID: <87sfq11fkb.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Colin,

On Fri, Apr 22 2022 at 12:04, Colin Ian King wrote:

can you please stop using file paths as subsystem prefix in the patch
subject?

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

I fixed it up once more, but you can really spare me the effort.

Thanks,

        tglx
