Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196526;
	b=WsPbYiQbaxNwAdJ69ls7BZDmf6B5rD914k1d5DpPFQ8Q9SmoNeahLM+yZ0RYMGiQBsi1
	 ZgJer2EtOG+RFNox8q+swTAJ2Bf/zHOZWEjXI30lPu0HBc4fhyFR2/QUOU0a3jlh/0lP6
	 ZsiF1dv4fU/Z9hiabPVjRfLviE3xRzlHYZU7R1eHDfCYQziBD/KCoBPIUSmJAaeTzOga0
	 Qnt6z0EOleyvNlrxjraWx7rbU+D9PRXDv7WLqTLmj1vIvi1mb4VsGibxddL+0ANBSK7DY
	 jiG57JVyElt1gh0tOzWr09sWHu5ps4HSNh2UcGnSKO0/7rX0poNn5HLDSkFG2paBwPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
	b=OMz/JwREK5HpfG7loaEMU2R2xv2v9nTRAgtoaQpC55Q3geNV1AM638XDewenME8Jveaj
	 jetrb5dGzvqP+0st9FjMACkZjtDJlro1oX16xnBFZD99HavWLF2MMsFS01o47UK7OuX/j
	 oBu/8EkMOODxbresE6TGBmpVm9UzAON47JjrhO1k5As5nzsyZn7qMCS927enSaTXTKg/6
	 n1imhZSiGzJoMZIsDU/PLjwldBHZFkj1QM445KQm9oNLBvzzq1ruFpPDyEHwTC25wGKtw
	 p3ma+CUQ7tF1oA2iW/JxHIFWju+xgUA3A9VtG0XrGH+DuX5T+VXbmIxBi5w4yvJf+tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH58M6p5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D18606A7C1
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D18606A7C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH58M6p5
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55c7445cf85so321531cf.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:42:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196525; cv=none;
        d=google.com; s=arc-20260327;
        b=eQzd+EGR5w06Mlpranj/bbl2eGFwIuWnYDJjTWQmgPlgMsT4mdi7v8M6kloymCA9Q4
         sgwY1IERJ3eKlLH8EXi6l6mpuYbekaFauWOJf5xy0rKtSpK7t5gZv4sYwfIOLrpOOr49
         MPuEU4Rg9dqODv1PXromVqIT+xdRbjHaXBK7o5ywrPzxhF1NYAvIj8NcWNa4SG9QNWwO
         yOIggHKm0F5pGvytRa6BZ8JiGj4e8KRWM9zSifKUy5YPBsTZBpg7FPooWx8VDtzxcp8Y
         jJqCZVh69dStfpr/L5cd017OXWkOx+ZB+UxIWt8B3/gSq+ichr16Pk5WBhg8b9Bpsb89
         71pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
        fh=rFs/Xj29kF8ecpa152+j4f4OX2o3Qeg6CvC+5b6JM6E=;
        b=IN9uBXLrNq/ip3PvyJZhPwPw9CKrc4k9K+IIGjyEcLLRZIzCqqp1dzMia+pi5L+k0R
         eNkNBP86ruhP66b43MIXP7iVYyaPJA4MSGS+UHu7lPKmkSWuihePiBgyCnk1S3WfdCd3
         osoc9hgELlvcWr3T1SLZyxMs33T+j2mC20NO5xe/Gd9Ei2xqF+7I6SbNGXP4FK9u9x3m
         G5a8YOtSx4PRtq7efcPkR2d427SJiEXPYmxZWh7rqndyAgKs8JlqsW2TxaFFVPNW+C6k
         L8exPXayD4zvq2LQhWtNov5TToDw1OttFzLkKjlpShuPjE93GNWg094S5sBKIqVnUhvg
         IeGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196525; x=1795801325; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
        b=OH58M6p5bFNLON5JC9LJO714KU0ZeRqOS6l9uk7NXelDnGO7AGsOWX936lxKRMJGFc
         wErCKj5xLJMwnO9QbiJsKBxs4B/urj4eiluhVY1/mmWhXp9oUzCtLeJ0N5NoU0Ls8mt/
         d9t0ml4pi/mjRpESiT37bO44yUOrVhpM5v2u7YFFdOsNg13Mg1hQGnyiIoBL4qtydy6u
         zDGXu0S9wK3TXeGvy7ExHLlpZ+1UXnZH5Bgi5FSe6EJNaup0v2vf1lg7dvXwAI42qbvR
         6v7H6ijQZixLJGZS8v4WfpFT/l+xX93tZ9hUYw8lkWTgRmvVuU/LigYsZ78lGYUnKX2+
         Mleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196525; x=1795801325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
        b=Ss6FJFvcztUwdM4VDShE94azQ8ITs2V9xR8gYGT52xY1YS8oAI76vV74eVNFPvPvNw
         vUxvOcjRqdn9v749bMNWpNF7hzojn7ezYKpsT8+lFkFChZIAbK9bMhkm6J4hWp8jLoWi
         lBpCacOg5vHdKfxjfIKEHHCXYMHYo1h/OPf5DhCLZxgiDOZSc4SKwhnfgHpGFI3HnN5U
         3FrzER4qCd6QeMxEFdZibquh5H9mYLnHAfd7UxVY+vAX1lOse34l0++Q8a8Uz5O2pdYI
         vZVwS09Adq3hM9QWAsrks5d0sheKBNYPLtKpNDvlnpYEX3wUsdY9OWtl422X6Yz32QO/
         FHfQ==
X-Forwarded-Encrypted: i=1; AL+hErHky+Dl2bSWvOlQhLgWfnpPgN7LLqiKnhdjfXL8UN4OOY+lIPTH8OKf9mNcMwk/Gyv1WCap@lists.linux.dev
X-Gm-Message-State: APuU4Z+a5PxHXs5Tm7U3n7SOCDoHJJWV01ZRuuMBTeuT+YJAz7bVzrR8
	GPgU5U3RH+hS4xZhthKqpP3jCjZokPyJfpV+U6nqsvjx4uHiEiTUQULnvd/xf+CHSYnef7zAZG0
	nF5VpFh9ya6VWKiqYNbH47ed/Mc7M7KDId0FF1Us/
X-Gm-Gg: AYBFou1Tmu/lzHqmSMbIb5+svWMGerXC6GLwVQqA77SuJVwqh4EN4exJlIpFPAeY3cR
	IN5mIpLvYVw15rIoWmY8JkExStO0vjqXp8qKqL5AKNnGyu/ycG75w/D/IB8kHFL25XuGERyfIb0
	8W7lWpr9rvDLKytAgbqiTjZRqx7gCQSAL3rdBrHUZlxyh3mgGq/cKHdYUBt7ElPv3PS0bIQD1qL
	CXssceGZ11LN4+DO7VeKSoCWOft1vsZNvsxzsH+qKWTzJ4C5cyeiK5OxHdp18zy7/PzpWoIKKT4
	KYjqXPRx2sAb5ClLlNXFgdVI6fsWO6Dljo6D9XGp+eB7ZEPhE9yzxvFIXV4k21izqlupdUYpsTs
	RpmozI1Fz1zOOzapl29gHHS/dJpvc4+Do41rH
X-Received: by 2002:a05:622a:5a17:b0:531:282:6560 with SMTP id
 d75a77b69052e-55d7a3bb532mr19021551cf.15.1795196523725; Fri, 20 Nov 2026
 09:42:03 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119170722.1524088-1-irogers@google.com> <20261119-magnificent-ecstatic-alligator-3f4816-mkl@pengutronix.de>
In-Reply-To: <20261119-magnificent-ecstatic-alligator-3f4816-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:41:50 -0800
X-Gm-Features: Aa3M54ogoNwKUPyvyvGecVyjPhxTJ1dmEEtQ54WzRJLYnFxgBCjMRa5J1U0aCPg
Message-ID: <CAP-5=fUxckfL0ZCa9nVf2sOAdinw_HoVkd1CY8PwYnpKFxLWww@mail.gmail.com>
Subject: Re: [PATCH] can: softing: lock card->fw.lock unconditionally in softing_card_shutdown()
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:27=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 19.11.2026 09:07:22, Ian Rogers wrote:
> > softing_card_shutdown() calls mutex_lock_interruptible(&card->fw.lock)
> > with an empty if-body ('{ /* return -ERESTARTSYS */; }'). Because
> > softing_pdev_remove() invokes softing_card_shutdown() before
> > unregistering netdevs or removing sysfs attributes, a pending signal
> > while card->fw.lock is contended causes mutex_lock_interruptible() to
> > return -EINTR without acquiring the lock. Execution then proceeds unloc=
ked
> > through IRQ and DPRAM teardown and calls mutex_unlock(&card->fw.lock) o=
n a
> > mutex not owned by the current task.
> >
> > Use mutex_lock(&card->fw.lock) in softing_card_shutdown().
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wextra-semi-stmt enabled; fix and changelog drafted with an AI coding
> > assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and -Wextra-semi=
-stmt;
> > not tested on Softing CAN hardware.
> >
> > Fixes: 03fd3cf5a179 ("can: add driver for Softing card")
> > Fixes: 47fa0336c1b7 ("can: softing: softing_card_shutdown(): add  brace=
s around empty body in an 'if' statement")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> The driver is being removed in net-next.
>
> https://lore.kernel.org/all/20260815103428.117201-1-socketcan@hartkopp.ne=
t/

Thanks for the heads-up, Oliver and Marc - please ignore this patch!

Best regards,
Ian

> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
