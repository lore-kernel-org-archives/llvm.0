Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793774999;
	b=avzvmq45aIkmBHyo/26EOXf6TcUVGmyHgGEvl82T2p76T1XALhC0H+6KibXAa4IxB5iF
	 qUtfKdrktIH4SEvrQWDsrupevIlxYBOdwf8o5r6DJXXOqeAdHVD8Oivuq12RVvad5wN8l
	 yA1oNDKhlp3omhUP5j1NHuskhzh1R9R8j2GP179CB0QCgPJBT5wPOik2PsRnU8kmIXYG2
	 ZwgMSu8Ht2TZ+mmCovXJEzu0yKSBOMC0Ppg8aFGk4pMpoT5PEJWFURtCbk4IM7/KqZQpJ
	 LawQqe/+CUA6N4A9JjdJVyl70JY0mK4zCenuZx0/dJ1N7PhWDlxPZYAPPFXbIn8tWrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
	b=me/ebg7jy7IEjESf495Od5crLzkYmK3mBz23Hog9+WCcwcqvsDzklSbppxHLYSOsyVHS
	 4YA7kB4jgwG0zPhoIGJw4UT5NSb85iNM9nti8UwJogsHhkqnYMWWu1J0P6/gBlarJM8M+
	 LcMpD0sPjxCL1LcenLNOlrhZCf5ebocJbNUUWMSM07HItim1mC+1R+7bAr6qdPd8y05uL
	 KWdQCaWCpLONiFzQAl3wyOhZZjyEwMZyN4eSScaWNjJ3F5D+KJXypmhh8Zva1e85OnocP
	 Klfs0zoxAEDmZsnDGvqBxUx/LbMCw6xyj9v0aFlKmfVlWYt+L1wBJoIwhCUzJtwDafg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAWMkYBG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE76606A31B
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 06:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE76606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAWMkYBG
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e30c26a4so281279366b.0
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 22:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793774998; cv=none;
        d=google.com; s=arc-20260327;
        b=Nf/SdFk/c4xvZ83rI8nWU5dRGkNE3NJ1VkmMYZq7gZfJsGzNZzGlZv0tj322geSmz9
         +dxfdX3ToSFbDTLtqdKZCu4+RxlTTuhNYRDxnCB44beIFs92v0ZQsVBVnag3dPfRSif/
         5DqO4yPu4fH8UBC+tDO9nLHl9gyDveYlUWgA6zM1SXwovPXbBVw92ESvN4bRwAsR7vja
         SGn1N5XpS11Ett2lN72wQ/NOYrI+vbhoilUSQiOdb5jdWYar66remTw1ArUYUHessiPt
         6PYjlJfRGyxlYNQdnNtn5l/FZwGPBLxaf+bi+v5xnvZEl4DuxtsoQQeUr3VMFEAMowsr
         +Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
        fh=SixAPS/yq0EyxgWyTedVotZjua0et9XX1FTzqGR83S8=;
        b=qtN+OztWbC/M0JlK3RME6ludySf1ku6hxjveGOzz08cHLsKvfnHJL0WdxTC/GJ50EA
         /iXwhrJNFkxD2QvQchxjA0Em4ojyfNfMxwRhet8yCsoys5c48o5oiraFsJxJP2TtOLtK
         kY+tVCD0dJpxMT6DlZhoPDmHoOuX4bZkz5tBroyXOuMWICP71CAzlbKunJCrexy9A1+F
         /LkjINH99gC+tnuWRNnEAUBdO+OFQB1cAHCZ1Iv3U+zn5kggwQ7Ar1hUafVbIG6ShY1z
         /VJ+ZfDzOD6M2oy6QodR4lfBaM+G4vG5rYwSDRurkgUox4slh5yqEoIx86qpFgTwk/Lg
         ci8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793774998; x=1794379798; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
        b=XAWMkYBGssKwfZv/qDhrUKmpEk7KDQI5FcEJPhsUVe/xSovq5eMrX2lQOJwem3BOgv
         HXxVn0nhDJRvZEqcQWsZns6wyQJqfTkoKmrwocSSNzDhzipp4dt/pZLtbtiHZ9rhdUYl
         SgnTJttnC/h85v2/9AR/4VANiD3SPsF9lcf5MXrMLT0nDJobr73dlBhlNKknuIIYTkoc
         4O1CAt1Bq8Unm8wyHWS34hqzj6ciGo5fiASjhyqG5B7qtG6+Ttmu1s1HKv62+vL5pUly
         zjrUq6Id3Rxwgga35R7whSzYpwabc+SL398yyzIcLCwUJQ4vqRWWFxrUcSDu2VPW8BSi
         LLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793774998; x=1794379798;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
        b=Zk8ApT+omp8xf2PHBufI6dYbOB+5T2JUR9LrRCWT/MVVxYNPjEvHDEQ0p88b/OklN4
         okSqHNxs1yg3SAJFSGoWVHnfN6iFhQybvtTMXVqJ/W12r1Q51ROrvJa56LT5yIRy1vaJ
         zdf4r/sW8NOfndg8I42D03ziWBkIFV4UKp9adLVo6fFyrR6dBwDqHJOR1MYLXZ83ik64
         v7tW4lxSMAUEvPt5ByS4es7t4tkLCRoBdC3BkM2cBySkTjkqokmdZ8W1c3XJ+Kbd8yfZ
         YpMgyk6P+IoM9R+X87KyySW0FanjIcaIbY6nnAv6dUlDZw96Ex+92PMB5aYmcYJpotkx
         WPuw==
X-Forwarded-Encrypted: i=1; AKwUvBwidWS3vo1u2L2LY8Ne4CrPHgHsQIWFF680hE1hnNIBCHGfY2lbTwk7hdI4aMSAaFwhilvu@lists.linux.dev
X-Gm-Message-State: APuU4Z/MFZFntEQdsPHv805uGy2bhmc9ltSvdwcdCODeYFGIuL5BHOwW
	v8cRpcYeczsmbXIdmWH3FnJOKOCK9D0YDgx7tuLC2LOltV6BLDoUj/ThKswHYWfEglYvioa3Kjf
	VwbzwWfirmr+daAWZze+S3Q/KPTh5HlE=
X-Gm-Gg: AYBFou3whY1maHigEz6WXmoYln9p4dlMYenmQyBFrYBm5sZHOhVSrrtfrXEqmddKAvD
	Pqya0ki5O1nquLtOSAviUqhwuKEib/DsGoMtc51MRQu/pHf3SSgzZEg3tmj+vk50GsVT2f0Q+wr
	CnoXUuRaDNnM+BrEEjKdFk7vKpZ8nI0/QzbLKKNXAb1+cEQKavhLwDZOkuc14xJezKTJsQnc4IM
	Tapm+Z+sJZhO6anjj6OQ5lljrxAXFGJUvYoqr6VuRn4n0ibpqNU296Geh4jEFSKjKCDmlxflS7W
	ecM0r6+BDugvj/xnZxKr6Nxx+VZuxVvvpNfheBS8IySDzOIrz1x3JDg990R2BvwhpgpCclbPKFo
	MJSTzcpk9hF0AFrNMXu0xFzEL/oxVYsfWDcKadIMl0CkPidZh/WWtKU7ITZU7PXtcTdNgFQ==
X-Received: by 2002:a17:907:3e19:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49d1307e11mr1648258466b.14.1793774997661; Tue, 03 Nov 2026
 22:49:57 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com> <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com>
In-Reply-To: <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com>
From: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Date: Wed, 4 Nov 2026 07:49:46 +0100
X-Gm-Features: AclHuK8oh8kpHv8oZjgJYiffPFA4E30_6N-HyxL3xKPXCKJkWV692Org4-Ci9f0
Message-ID: <CAAFOosZkUXst22MOVUyJW6mdjnAO2XgKWJ_NuFp37QJWk_nk-w@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andi Kleen <ak@linux.intel.com>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"

> Thanks for the patch!
> Is there a reason to have the cast vs simply use "r" constraint and
> deref in the inline asm?
> asm("prefetcht0 (%0)" : : "r" (x));
> https://godbolt.org/z/xezh15oMe

I mostly did it to be consistent with the 32-bit prefetch() and prefetchw()
in the same file, but it also has a codegen benefit. With "m" the compiler
can put an offset or index in the prefetcht0 itself, while with "r" it needs
to compute the address into a register first:
https://godbolt.org/z/j311eYzsY

Thanks for the ack!
Martin
