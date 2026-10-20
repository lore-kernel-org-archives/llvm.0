Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502075;
	b=g61cadUG1XDbphlbrGE3fKeLSidq/YD0BWTnnT+4SRlId1ixfEkflbGdL5A+rVBQUZlP
	 B0RzRB5BesKH4EEYFWM5Mj8lgEY0Ttj6Y2GhxRFr35905kjDVycZbMJadVbRFoHsqgTMS
	 y0O0d7HNHODqoUtoRbQn4BMtwngdazVotQcTWWVNtyJkWl+MsVn3XfFXM8aQALIrupkGU
	 nm4twFHAnWJ/PUAxskwf0IrV3rbNIfvJWN5Yi07YNIKpswb0H/DqwlY2vFz3WhTtJ/KTS
	 OojJcjo0GuB4Cr/jKqaegc4g5rgxXxnHqtW4nRpMM8j90nwI1763ok15094iUh/CAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502075;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=8G/au8IGCgWkCQlmR0nxChmBB3BGHgTEyZFF4LAB4C4=;
	b=Qgd65v8x0RCVxequ+q0ycaBeQ9DR+T+ckGkXciAmA0r/fqNJ/aUTqvPssiJ0jLRkF/7h
	 zQNAQZPMnQ9J6u2tmc5ZSI+m/TjuSCNUAQ6APKcDGPhGDhjw0txp5oQVlEhvIBOkdg9n+
	 0dpFhDXpuF98Uum7SEWxtYbcNpJ7AjZpStlOkY68pofmDDcccRcHe0x8R7waVYwsqYoy7
	 Ky/b9nAXM9HTbIom/1VWdduXG/dIjUsMCb1zJfGapj6ZRpbgNSk4nZq4kh3nfqn1KESIf
	 N3h0eq7kLv6FQZkTm9hxHKwUOdVuk4F4cvxylLQCg0vENrX6C38jIL6n8Lu2YUOO9MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=WTzFghvi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SPzTeEbQ;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FDF606A321
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55FDF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=WTzFghvi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SPzTeEbQ
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 9EEC7EC01D3
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:14:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 20 Oct 2026 09:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792502074;
	 x=1792588474; bh=8G/au8IGCgWkCQlmR0nxChmBB3BGHgTEyZFF4LAB4C4=; b=
	WTzFghviK6RW1DfTiPPD4S7JqXJkWrwROjfMJptCgvx0aSsDd91VV76gsFE65qAw
	WGsWUY3H2WZD9T0G0e2gSpLvr/AtjHJsG1DaG4/WNvrcQXGWEOdkMBwRQMTrnp3j
	7X/1NH49jUbRbJmhVKjPwZUSlZDks3XNc0fp78uxAnCs8652c/XyThzZrtQM4UlR
	vgAV8nNSXy13ZW9xQkj8hQEgu99h29OMjNGOKb834I+wfAPoYe6NDXjGqvt/XyeA
	V8BFLSUzMU7nsrz0YPAkE7V1rBwYJS5SB7RRAzY70vEr8Z/xDpC8ab/ooSkZxlNi
	NJmyU6fBGt43U/fo/LawMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792502074; x=
	1792588474; bh=8G/au8IGCgWkCQlmR0nxChmBB3BGHgTEyZFF4LAB4C4=; b=S
	PzTeEbQSy52/r/MutL+B10kvqV8k9sHEeEsQL6flF4P3j5YAiYwhpCB912ahSYqk
	XDafSOzgUKmOKRP8j5xX6b1klmKacXr3/8oWxODZaDOGYjDrEVB/h3n9e7AEvMzR
	/vhL/4MAQnm1LE1a1EaFZZ6J8vtBHySy7bf9l9QSGUMjVOf5UC3h4ov8MHBKer+X
	QD+5IGLBdznF/sddKdhuTmZkDXkx8ISIePFkNbwLQkXQxesfGOCpVsRfO5CYUFqt
	8ii8eEFlVJONoLNX9BGSY9BWi5zm+p+OJvpYrvZtZQ74gMMwvVbOs30jmjuXe/f1
	AsQs0+XH/rQLL0PJikljg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792502074; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:tzxbisWlXoa3LPHsnEABMMP96ILwr1aZt07iCy8E/juQanJ
	90gE6+Q89bU3yX1RjPlzsixP+du+Tk5ymYFVSLlupslkWkjaSWMr6qODP1V8r6DF
	/v/J0hvnFt1Ma2bRXiJTV7slk8nQZzu+B4dEH/eOlXHotcZ08i85QcQMGSDepCiO
	i1McrHS+FNARb0E3msan0TBu4vnbpJVN5AXe+O/gTheRY1cxSKK+mOnIq4ape/RS
	C7F58OF18nPso4+m1kDyELbV6SXEERisgIz/0V1eqsNmgd5MGJxdUVmOfddD311i
	AmNHVLHVKcPc8nVrZowXqaiaA5vqGrFkMYJfVrQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Jp1uw6NDC0LelkgrEQDre31XjjsqFJ/cxJg2BXyPQQs=:8G/au8IGCgWkCQlmR0nxChmBB3BGHgTEyZFF4LAB4C4=;
X-ME-Sender: <xms:OWnXalljNuIn7qruDdHLMsPX6PtzDa3gsFMZO7QEzawtbg-bP89-lQ>
    <xme:OWnXaiPakFQoF9eXxI7qrIYLewLd3x8pGzZjwBjbqPzxJlad-pF29p0wHM2YyKjDX
    B1x6pvMwGUzfK_3stakdYmA_7sini8aXJGZGIGLLLnosybOplawpBHQ>
X-ME-Received: <xmr:OWnXak4SozNrdkL1quQPoXwwU8sL1xoD8zYaacZCqzT-YdmlapUtXitdRfGXJjS4xtiv5ayyYYdqWqkDBuQQ36Sn>
X-ME-Proxy-Cause: dmFkZTGcfW0MA6TedKDhIOan3Q5qiQfjgOELCWuy0M/BqXUjlCAkZFfjhKzTb0Q+ICIFja
    EBqOKSR600uavTtm8+sspp11Xi1eCtqH751mma2VreIvr3n1a1CBLpJmX4Wczketli9I8h
    b8ndnefBNjnp4wiM1tpaIj0rzKE6Q8DKi1x4+Pv6I7BFchydJghUCtnRGExzcOe9vuSblE
    PmY7I2kmxDzTyWyDWpay50sjJ/JS7eXhquSNucMdAydYZHgenLhfVJfzzpyMETwW6akjvB
    VGMF7TfbgidX9ytwGRYDc0QytjZ7ELrSjIlEldxbhhvvO8vtj/sj+0JYnoAXm8l8Iyj4qh
    eY4axpAufvHtjuucCfCaOO5hYLkKH3TbyBXffIpdejrIqsUoKiGF9NP5Hwmc0WhU54OTKA
    NFl78xvyt6TcQxBqxHMQ6anPKMtI45n6V2nNaBlzmKJiT85Y/gmIH9Q0/hdzkp1Zl9OavD
    2HHLhUCOSIM2gZ7O/Fz5Ybk51ZGmu9zYqSzurRJTdV1VDGUyIYJ0ddJOevQjyN/ETVAspV
    SllW/fOmwxQNzFZVWu/H/GxAS8UWL0XRMGfo9EXXehkgSTEu/hSjoehuoFLFmPrJ6viDfc
    2QVv5LUXLiuViUQ7O4+U2b21tSVnWm3NQ5mYAD+wmH2ebhc1DhKBPAN/N20Q
X-ME-Proxy: <xmx:OWnXat2VvwaeN7epPJFuWtkfLCu3PDBrTGvF-xzxrzHYKd7mewkDrg>
    <xmx:OWnXaqpmmeMn1ULhaZEmaep_IvY76P4LFQI0MOyZ_kBoLTxCV06piA>
    <xmx:OWnXavnPKOCJGF6DVGMdT9CmWamRVbA2nKL4Ikhk77-P01WaP_PU-A>
    <xmx:OWnXakSVtXWXDrCFSnaCLEOu4__cjj-SGY55JxzXDG1XWm5IInmxNg>
    <xmx:OmnXamzm9ssA-QIqgLpFuk89QsHS8hqjkc2tfSYWjvOyaVbE57c7yQcQ>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 09:14:29 -0400 (EDT)
Date: Tue, 20 Oct 2026 22:14:27 +0900 (JST)
Message-Id: <20261020.221427.1259003459217579110.tomo@flapping.org>
To: ojeda@kernel.org
Cc: nathan@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/2] rust: std_vendor: add `likely()`, `unlikely()`
 and `cold_path()`
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261016162446.121509-1-ojeda@kernel.org>
References: <20261016162446.121509-1-ojeda@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 18:24:45 +0200
Miguel Ojeda <ojeda@kernel.org> wrote:

> `{un,}likely()` are commonly used macros on the C side -- there are
> more than 25k occurrences in the tree. Rust is likely going to provide
> functions (not macros) for the same purpose: `core::hint::{un,}likely()`.
> Currently they are unstable under `feature(likely_unlikely)` [1].

[...]

> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
