Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6F372EC5
	for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303451; cv=none; b=tV/bcLXI+1Iadx8ON/WnsgT8wnaclY6AtIAWE3pZ8KUI1ffm8plPaRJAwtdfzTYRvWx4QNGM37fTqxpfrEDZoBsQ+tXUbwY32UDzR1l1mHcuDzEfqRvxMIXlFuR5bjOhRdlKThrFGmb4pxaJEpW+PvkS4gy9ZUl1SM0s5X345jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303451; c=relaxed/simple;
	bh=c2mOqcPvdD7LzOk5QYPPKRQfmBLDYjUOW3UfvOr/1i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UbBx6Qulz99mXuQFRtacED2Q4JxR/Xw/UnrLLc3QMbBGdy4GWvd3B2vd7ezVRO2DUkLl6R6vT+L8acxO5C/tN8aLgQrEv/cNg3ci/1OjMrI6JU+ifjCc/Np+yaMNMGYWQTW4AeNITKiGcn21ybtC5gHgPX238hwlsXX3qxi4g+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=onnw7U40; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="onnw7U40"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 264564E40E20;
	Fri, 17 Jul 2026 15:50:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDD5060361;
	Fri, 17 Jul 2026 15:50:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23ADA11BD0B40;
	Fri, 17 Jul 2026 17:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RlpOR2hQnjsKRnEmWR65VlWNVy2hx4ffoGcWJTmsnjg=;
	b=onnw7U403jrPUo24OjG95EFKfHyLNVy/reRKnJyuXJIQx6Nj9QWRERIuEzFt5urzyGAsv5
	BdhuzedMKbJ3+fHqyEqAEWy0kYCHrS0QjsQP7C6OCYvFaWUDrqT9lkv2Z+nncFQ/wjBHko
	Lf6TafpM6jRpW0cGd96LRMXirpaSKI0VcqH43YmmBtmO3N703iShRtmrbkES8EYN5A2mO9
	2blTb0OOUcOyz2DYCEbea4LWoQabcgYr8QuHKhXO65h48GwvGL3YM6NKg7FAA4htfU1bYG
	GjNyPCdlZKHJ08FmbriiSSDY659ZTXedTJJ3RdPlO1P1KPNA86OBbb1CeH8OVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
In-Reply-To: <20260713231722.1095470-1-rosenp@gmail.com>
References: <20260713231722.1095470-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: mpc5121_nfc: use platform for irq and ioremap
Message-Id: <178430344591.4129650.4707095787373481148.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:50:45 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 13 Jul 2026 16:17:22 -0700, Rosen Penev wrote:
> Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
> and devm_ioremap() sequence with a single devm_platform_ioremap_resource()
> call, which folds the resource lookup, region reservation and mapping into
> one step and returns an ERR_PTR on failure, checked with IS_ERR() and
> propagated via PTR_ERR().
> 
> Switch IRQ acquisition from irq_of_parse_and_map() to platform_get_irq(),
> which only retrieves the interrupt the OF/platform core has already set up
> rather than transferring mapping ownership to the driver. Drop the now
> unneeded of_irq.h include.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: mpc5121_nfc: use platform for irq and ioremap
      commit: 355efa360ba3b9ed242f444c69fbafa84a29a525

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

