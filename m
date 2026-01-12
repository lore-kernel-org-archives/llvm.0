Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840FB32255D
	for <llvm@lists.linux.dev>; Mon, 12 Jan 2026 06:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768201186; cv=none; b=flwUMf7SLmfd30+xNPU0hKDWUmnzlQc8aw2U/yhu6hWpZSDMmkQeXu86ClB7s4rBCv7j4A3tZjQZwo48TcSZrXAaN4xNO1nyqw4BoS5p9YZtBmmtS0zeZcLPN34LZKhZG+z9Mh334pGbt8mzAgyD+pFdbNoRdvOrScjam7y9exQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768201186; c=relaxed/simple;
	bh=oRyjKdNg/v9ive8iDfdtnkjz8govXIBNQ6b2i4vlAwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCsmRC+2cg848lbtPhwcyQ3wkjrk2T93VyCJ7NipCHqBA1quxZ2JTFDAor9fgKBPlcyn8j5W/agKEbbqkS5b07RkMB7Fq4EypLzXkQqQlx0NH9aAJ6sVxBpw2nE/SEM8ZQUq9YXLhSslSLLWF6fveLap7w5/LomcE++hwki+gqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=Zk8GcjYA; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="Zk8GcjYA"
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 906D820229
	for <llvm@lists.linux.dev>; Mon, 12 Jan 2026 06:59:36 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 637A13E8A5;
	Mon, 12 Jan 2026 06:59:29 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 0D246400D5;
	Mon, 12 Jan 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1768201168; bh=oRyjKdNg/v9ive8iDfdtnkjz8govXIBNQ6b2i4vlAwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zk8GcjYAu2zvrLLl59YbRMOkXnz9r2+hkE6ZSDcL3YcHQ2HwKPyLLcUCznS+rSg+r
	 89e8MRKzHXt8Q/CoGds0uFRmfuAifkn+C90xAtUDInzlF73X/58g+icnKGeidozmtC
	 T9Nolu+ogVi4MF5xT1ASPXOt9lrzDsNHbVSj5Eyw=
Received: from [198.18.0.1] (unknown [142.91.109.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 53D0940ADE;
	Mon, 12 Jan 2026 06:58:36 +0000 (UTC)
Message-ID: <d43c85d0-4d84-44df-a436-09fca7a11b07@aosc.io>
Date: Mon, 12 Jan 2026 14:58:08 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Reject unexpected values for LLVM=
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0D246400D5
X-Rspamd-Server: nf1.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[lkml];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_TO(0.00)[weissschuh.net,kernel.org,gmail.com,google.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Thomas Weißschuh,

On 2026/1/12 14:43, Thomas Weißschuh wrote:

> The LLVM argument is documented to accept one of three forms:
> * a literal '1' to use the default 'clang',
> * a toolchain prefix path, ending in a trailing '/',
> * a version suffix.
>
> All other values are silently treated as '1'. If for example
> the user accidentally forgets the trailing '/' of a toolchain prefix,
> kbuild will unexpectedly and silently fall back to the system toolchain.
>
> Instead report an error if the user specified an invalid value for LLVM.
>
"Falling back to the system toolchain" may be an acceptable behavior; I 
think reporting a warning here rather than an error would be more 
appropriate.

Thanks,

--

WangYuli

