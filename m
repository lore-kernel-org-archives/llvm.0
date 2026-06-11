Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC24D9902
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203844; cv=none; b=SaAH74ZSS687bhHhwZX2qMlCdYG75Yv4Mr6H2InRPUQdGGdip7NH+Ab313KM3/9XVxmxs2jv8XfpGZdKgdhR+8eNhpo3qu7csIyRGnNy5ba/ijowk9xybhAplgLeDoVClBRkRtTyA7/IC+/ixWyv2pRJCx8JUCQkjdrfwEdA278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203844; c=relaxed/simple;
	bh=VUW8ZZgWRO6oBI/K1zuIFj0/8C/+Pr+bZK7RoXtN3jc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RM+/7Sww2wzyJhLJw2ET2eKWB842ZaWvyP7/9oWCsWBGw9EN5Op7dwJHMtLMnlhRtyLa2YhB0Cup4XblURdFbaTCPxiYuwugdgp1xcrhWXK94d25U8hXyy52eldR9qTeYCm3f2qUOOszg2McPLduv3fyiN9W8S5fZ1hO5OrFusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBCz2JEc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBCz2JEc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45efb698ef2so80971f8f.3
        for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781203840; x=1781808640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUxfWJt8IGWDlV52x/Qd1ZFtz3KlHMm4m7NO0v4ch/g=;
        b=gBCz2JEc1cY+xP5LkHM1trEtwzQ/oIwFWjvf2LGdBB1Dg8Sk5hP6vZ9e7/zn1vp6d7
         BGhIJlfhqqI3iXGKRnviBAoHtPrT7PcgidMBleqjPD1coxaSVQDnpr7OtJqTkbUbzRqg
         pgo7CQw47VxeeJOX9mmg39AlSJMOb3bAAfhQlsFi6HYIF5dI0kp+tMV67e9sirLc5wHP
         uGjCAixbC8xszdDYfdQ2H4vAadzcozEsCDlE2H4yLrUEo+vMfnaKnMvBK0VKE0ne+7ZS
         VYF3E8WvaTjqRyCD+drZ2i825KHpqdR/oluX6MvjAH6Z+HQ4wKeSliYb9gphnMy8L4cg
         Yv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203840; x=1781808640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUxfWJt8IGWDlV52x/Qd1ZFtz3KlHMm4m7NO0v4ch/g=;
        b=qU/EjvTe+vy6/JCEAhfbKu3NZrL9UIicj7/hW5AVgIuOaMvDEGMcsIJmH9o8osPRxp
         HFkSfu8k5uyb56NjQrMi7b5YKcIOlNh1AX7Uy/MrPmjQMGYbwjwIO7wdyNzS/cW8iBWz
         MVuKtpG589qBY5B7tibjb+IlBjEJ6OtZmhY5nW7h+JSAqxFCuk1JtADfKH+203qhn8zA
         t0h3BvZyfslorMR+ouJz8k9NUHoEBlWvR4MkEnCCy0IZB5vHND9n0AcnusZze7/AfXuY
         t4RDVM2G1Q7g3O7i+n0CJ3zWLPnBvK+mh87FFS+YnvwzcfMj8cC8McsbUgh5/odZ36+k
         WGVA==
X-Forwarded-Encrypted: i=1; AFNElJ+LPiktZP/KEkkb869E011ypuf7oxncEYJbiQusDo9HExR44C0Q650LRcmR28dcHm6oLS8O@lists.linux.dev
X-Gm-Message-State: AOJu0YzgmZ+9e+Ny8QS2lJbnrwi500UWW62PSLHzBzyCBNA642Tb2Ake
	W0qBF2bP8XLds5Uwogki3O+u4lQgVFR8hrgbPv/XQ085XDtW/8QFLDR7
X-Gm-Gg: Acq92OHyEzsgUJSDJKi6RhjZOH0wh8lc5nFkv31X1YjeY4z45yYY1rq9rHDhStKBJ86
	TM4QIPsa6jdCz9Nlv85dcnkdZhgfRjvcwJv06wJmqYKMIu/okomuIz/fplOXiGeizK6X78ANMTB
	1dPTEveN+/dBKm1p4ajRrv+qw1kWRtU4suKzfaEikB4Mmla5hyppDv94BywopHQS7d/SjnTmnd1
	7zsov5OV3PeDpeSIOZiFmkwIJ55qI4kO+SCpCLAfCH+t1VtTsMqlED9pKrhQws7D19SIShHpScO
	wIoixYjQRezjt7jXUm5MTRSaUpwL24j9jLFj1Uu9UqiSpI9tBTCPBzpHgOONBgyqjlkobhCf2CA
	NRIB/V1Nk/Q6VxZrFU3gN4wuSrXcqpqHzKBxYpZ5BR+8g4n4m3VfQoCqaPRShkT4y1q0Z/MEz79
	1RgANqaLkPa6f3B/RQa6Zu6F44DF1QPngr1JUCuDKbMz3Acvec5JvBlc/SCwtc
X-Received: by 2002:a05:600c:8b31:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-490e55c3ca2mr57651865e9.8.1781203839529;
        Thu, 11 Jun 2026 11:50:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea7c09bcsm3579135e9.2.2026.06.11.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:50:39 -0700 (PDT)
Date: Thu, 11 Jun 2026 19:50:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Ravi Jonnalagadda
 <ravis.opensrc@gmail.com>, Quanmin Yan <yanquanmin1@huawei.com>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] mm/damon/core: reduce kernel stack usage
Message-ID: <20260611195037.1adec04d@pumpkin>
In-Reply-To: <20260611125704.3386176-1-arnd@kernel.org>
References: <20260611125704.3386176-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Jun 2026 14:56:57 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The main thread function has recently grown to the point of
> exceeding stack frame size warning limits in some configurations.
> This is what I hit on s390 with clang and CONFIG_KASAN:
> 
> mm/damon/core.c:3440:31: error: stack frame size (1352) exceeds limit (1280) in 'kdamond_fn' [-Werror,-Wframe-larger-than]
>  3440 | static int kdamond_fn(struct damon_ctx *ctx)
> 
> The largest stack usage here is inside of the kdamond_tune_intervals(),
> so by marking that one as noinline_for_stack, the functions individually
> stay below the warning limit, though kdamond_fn() itself still uses
> hundreds of kilobytes for some reason.

Does that actually reduce the stack use if the functions are called?
Or just stop the compiler bleating and running the code is still likely
to overflow the stack.

I keep thinking it should be possible to get (say) objtool to output
the stack offsets of every call.
With (I think it is) fine-ibt the hashes can be used so separate all the
indirect calls (although you might need a 'salt' to separate the different
'void (*)(void *)' functions - that probably ought to be done anyway).
Then it is a SMOP to generate a maximal stack depth for each function and
to detect the recursive loops.

I did that many many years ago for an embedded system (no indirect calls),
the outcome was that we didn't have enough memory to allow for the worst
case stack use!
The deep places were all (the equivalent of) printk() in pretty
impossible error paths.

-- David


> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  mm/damon/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 265d51ade25b..69f38c48ac08 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2002,7 +2002,7 @@ static unsigned long damon_get_intervals_adaptation_bp(struct damon_ctx *c)
>  	return adaptation_bp;
>  }
>  
> -static void kdamond_tune_intervals(struct damon_ctx *c)
> +static noinline_for_stack void kdamond_tune_intervals(struct damon_ctx *c)
>  {
>  	unsigned long adaptation_bp;
>  	struct damon_attrs new_attrs;

