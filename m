Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501701;
	b=d7D7CXm/uB0HX3mkXg0Nm6655wFsPunYz8JyGrMxEjw8Ar+98K/reDPYMUMAhnKC/Bs+
	 Pbt/xy/0tPwKIhBVdN5pHLJJHB4AbJeOxY9fnElYT2b5vPGtX2onEdBGWmr1Ad3PWUAYg
	 +Y7qeYC5ad6HeanYTVSs/t7+C8J6fJmZC/ExCDx67gO6BTO8I28zwWkmd5Jpegznt0lL5
	 AZxEouKD/9l8CP0+mx9t/11Xgih27jhKYscIwcL+slVxpUY2dR4fLND0eoeP67MDeNWjT
	 3QOP9g7GVR0Ywl7Zq8Nqes1iR2yBUfv9DidBF02WofTDPuhdknRDAWz5WLG6sJH9uhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501701;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=1fcGJc2c43brIG56b/Qs+vdC5upkl+d6pZbJFXhZhs0=;
	b=jsRDvROo1poeLVnnT7SnOLuf9mW95tId9hg36050kVRVEvjuE2xc1WyXw1GLqWFKgCCU
	 u762hASCJraMoigikeWOeTB+hawQA/l64sDNQ5N6jIKrR5jPLHvNFuwA4bGqBR7y/+Qkx
	 kR0K70boZzl9jwjAPGoskNuyZrEr/IQSBNvFB+RCKUfilqMKQtRKMFHJOj+5e1/Ksr+xZ
	 hrjDxrcLHoInDEpb3biQI2byVN7eicdxIpsoh3ROUHoPkvn2bozrUmrdZsQaWYyyBc2+s
	 owsr4eOInazctaPuU3tN+8KWjD3OS9Qeiu6EA6c+tE0flVz0GvWln0IqC8x5ubM1lVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=aDarNfvv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pabgxph9;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0FE606A31A
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 13:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=aDarNfvv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pabgxph9
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 65970EC01CF
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:08:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 20 Oct 2026 09:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792501700;
	 x=1792588100; bh=1fcGJc2c43brIG56b/Qs+vdC5upkl+d6pZbJFXhZhs0=; b=
	aDarNfvvr0kLe/bO0IaSvLGi6OcUKcKNqBtjJBqg0TgAw8HXysbvQm6oZJiqMT3W
	lol8xoyBNPnnxRArytI7ONk/h76mpXq7cah0TPziusOe4upXTo7Va01Iuco/psLp
	rmcRfTePJsDg4GnGkGziT3gUXo6xfkhua1etkAUrlIHGKDVb3OBMVpiZ+E7dDNgT
	+I0KergP2AVyZHwV7Kbnt5080oRBe56/E7mvhQMjzz2MPThU+/f+emVvYuc+ehM9
	bxkE+J6d3y9WWTBH4FEs54f/68c4jC83L2tPqg2SCZeBJqZXxoYpAsmX3H5t98Ll
	IHUAWZCL6rKNBbMpyeGzfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792501700; x=
	1792588100; bh=1fcGJc2c43brIG56b/Qs+vdC5upkl+d6pZbJFXhZhs0=; b=p
	abgxph9NaRBzMq3cqxlMUiKldAFoNWK0KudahyDoRSwFVWpD5SZuXViyEqSr1kje
	R6uFF4M9yK4ojE7xZtFYe1OybW4x85CP4mg96KTVVehtIc3UAvwq6mutvEyLvdhR
	fAsePZfPQJ3OztNL0ZGCs4NEpZqi6VPKjs3RAN1EThJrZLyFBV3Wu7wLsQTPaY9B
	sIvpttKSVA9zG31GP376I/bI24wTX5lCFn+vndSAOZ1b9Ep6YERuNm/75eOEW8s2
	BBUPFTE0eAqCD5YvQ7Z7DHsyk/Ejme5yRT8amwuLLzCXSyup7lRVBNPSyiWfB+7O
	cw0caPHxjuus3ev6s5EYw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792501700; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:YemD28IzRWcT+D4dU/wS1Jp2BxqzdSitAPbX4M2+nzvEkFI
	DROecqaIojDn9exq5pJ2WxgQyUpiwMfz9xOqKCccUEEt3K+sPlQec/6nZNKMLeMY
	GlXx6BHeT+Ls/OFvRY8EMS4WTC/smn0cEYPbwWTD50Q1/CBvwMEw/p2XU2jgPyzx
	O/KAV8b82Six7V3QPqGFQlDQcPhgqaMaNK7P9JiGtnrMF6scToO93RkMKJmSUrMO
	iIkP+wTIAfIPE5ND78TsqkOo9reVLP4p2HPbQwm43qovAqXysOT1IGiQ/5q8oKni
	PpR37dgc7tHdPDdqnQAdFT14qllmGHatcG3olbQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qbAdh8kc4GucgXYVTMAxxYXxDzaYcIzpvoIZQKld124=:bj8Pu1kZXIF8fstaL/ijy72Wbk++onNXXF/YcEfAkj4=;
X-ME-Sender: <xms:w2fXainD-oSzHvIF4Rqv_BoZw8v1Bw3spMtpNMcRf76vwkUMH0Yntw>
    <xme:w2fXarOFAsQh7yvp5_bsUiizowUSplmzfQMjHLZV_MN-h_eEKvUcHEe30DKdduPBz
    osMKxUekgunonjNCobOQY27Za6jwM8SmRZknuLS_DeLvQXGUtVfaNGS>
X-ME-Received: <xmr:w2fXap5-7M9LPidJFaKJ0rG9l3LIe40frh1CL7x1XlhcaHODdJoBgivANbbn3oGrTKfkhxQ9p8NfZW9aOYBqrFwh>
X-ME-Proxy-Cause: dmFkZTGNsYCO3d+S2Ruq5JOvFTJ8LPDRWNTJDw9ZkZQnBTLOz8nHQRJ90r1bviczDBcHa2
    UdJ+HHvT6KFFj4hoNCup6OXiDDHyH5qrgDzlXtDOM7SdsJKyZ7z2tsMZHUCMPbllpkacbr
    5Uas5qTEy7z5NeVbHthvWrm7iqo8WgBmHuuLR8Z9n9y7HCXb25dVqgeB2SK/qYMwfs/vKO
    vmYvZQJCG+rPPlL0WmiZVFIPOA7+3vEk2Yb+UeKhIRNSz+Refur063HSbp5NUzhzYuAPuD
    tElBWQPDmcMhbksp7MjVlr87m8brH0Oi+szAou2/o0RYBEnkByEelDtKhUJK686UnoBwLn
    kA62GQEhps3EcWzhiQ97ddCDqcojQpdvXYf+Sp61qr0qtqHtBEmcnsnUky5wDAMBQ3rBuh
    LuIF5EVN46Mb+4Vcz6hXN+DyDCdoJ1QwRKlPiJslER2jxPlHTQBa3oTpZ68jQubA0y/qRs
    /5NpELOzRf6GXHoc7bdDio8ydgXsnEUS1x75+dKE1DHPHRmVZ1gmhp6osK2UXlugo6AuM/
    Qeoh/THiGJDUkGXbHyGswMm+hivFGtmPH1G/yM1wW3SYe5T6vA465GnazPOhRoZNOfhuyQ
    LEYsoiSf/OQbl2kM0AnjKDCz56d/pui6nxGSjm2wfgP3koOBLpq5wKNQspLg
X-ME-Proxy: <xmx:w2fXau2TEsPo3vPF01z7zqtKobHAPkrhq0YUkY6ywTQqp63cjY77UA>
    <xmx:w2fXanrz8bkYlFn4pzkgE_Nc5BQa1WSRkJ8J5D4fKqr2TOuDxYPqXg>
    <xmx:w2fXaomkH-KFVkeLD2MzBcKJCQK8Yc4PUBNXt1R3MDW7LkBo0XmlqA>
    <xmx:w2fXapR2h-MxItrABHW8aWy7h5v40L0VXi2qSDv3_6ejJ5TyzTOF9A>
    <xmx:xGfXanwEg4N8vn2NHgtL_P42GzZv_sacNQYWeqP22L4vcKqIzcOFr7cS>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 09:08:15 -0400 (EDT)
Date: Tue, 20 Oct 2026 22:08:13 +0900 (JST)
Message-Id: <20261020.220813.1441983911289970850.tomo@flapping.org>
To: ojeda@kernel.org
Cc: nathan@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/2] rust: bug: hint `warn_on!` conditions as
 unlikely
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261016162446.121509-2-ojeda@kernel.org>
References: <20261016162446.121509-1-ojeda@kernel.org>
	<20261016162446.121509-2-ojeda@kernel.org>
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

On Fri, 16 Oct 2026 18:24:46 +0200
Miguel Ojeda <ojeda@kernel.org> wrote:

> The C side `WARN_ON()` macro hints the compiler that its condition is
> unlikely to be true, both for the branch that reports the warning and
> for the value the macro evaluates to, so that callers such as:
> 
>     if (WARN_ON(x))
>         return -EINVAL;
> 
> get the warning path laid out of line.
> 
> Now that `unlikely()` is available, do the same in `warn_on!`.
> 
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DJUY1ZYYW5K6.39XJ3ZV7DGZQW@garyguo.net/
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/bug.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
