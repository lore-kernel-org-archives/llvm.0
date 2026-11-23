Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461572;
	b=r+Cv6btq9Hlj2XOtPjD+8Ul5V2sq7pqki4gUf9Mv7Z8qb0lwQ612CgClc2kHAxzX63sA
	 TsIrTOtzrdGZQBz8u6YC592gviFa2oX5QIku519vWANnpLF6iZHBo0SCZeyu/sQ3DrFGu
	 we0IpXuSAGUkxh5r4dXZVtIWYI06ijVWBWip8lb5Zd/FBd3FvshVVRSBXTy5bVK3pGcj2
	 yo4shZVRJ+GX5QUX2VUhgERtaYF4l4xs/one75xRUQMUxeUiUk1mFaJCP12xBTBSbG71R
	 XJ/RQP08hzBYyDuSStjpZirtoSqeyI1GgIKWb88BYDPLOJx6zb7Xf2S9KCMfePUlsKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
	b=pRERc0lSKCdgFRkHVlgDkjNLRKvepwe/418Lo0GIzmjeJhvgAtpPi7y9hQLjPa4F5q1H
	 djXowdrW501cAvcrjXPKgdin4Hx5GNOGwwu84LpnkQ/e5lnKuOnHvjEM7Ze++QT1gZbiW
	 j653w4oVP9WhPLRQE7l6HngBJdrEICG86UDHBvtwAk02pL2w0qsFca6CeuD/APDPS/gVJ
	 mQjhRPnGZgE6oSqx4fjsb3ctIDHE7V5/msHuw+f3WnVQtSpD4sSyEYyxR8O2CoCSbOCBW
	 Eerl0QE22grgGOAR2lzg+wNrgPmTWEHWlXlq/IZUmZZfMndenDODLiT4ShoGD0eFL5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+KNX2en;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34282606A321
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 19:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34282606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+KNX2en
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a92144733so1795241f8f.0
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 11:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461570; cv=none;
        d=google.com; s=arc-20260327;
        b=D6S+M29mMwbqxt7orOpM4kNWOBvURc53/gyrWikla2PaLXTlRQEVIVWkPPrf+osw6b
         crd4MVnPn2Yl95DhPmLWrzfdjYKGoH5wlyIfbY896ZXpmmh5ruIVrEfaudtO9EKTaa3n
         5I+8PmQIr2UMEDhfqEAEMBtkSUsSTJZ+dYwgzzxvuF4+eOqaUpbNz1mif5B1LDlpmEPm
         1ETEh9Ywuv4UjsVrnJpoSr04C1iVzzsOkFlOLClU8PvG3WO/jAAQil7RHyen4ucpKHil
         uOTdsmW62x4iV3asTaXqzLlLZu6Jn9x86hwbNbbyBPevrB8JHNzLqYNXE/gHTsm4qTY9
         kbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
        fh=FOHVClq9ARPLiyCuEatXt3WfKJljkFBnotPbYfzT4XE=;
        b=BL/VEzUXrCLkQI3myZhkUGt/14QhClIcpdyeLnWpwDSvWSVyjyTm6I5P+NOYahOml4
         E7oOJwQooBsiBG63yZLBmaB6cB5VwEh0hUYZmqjs9gppeD4CFTdnUqZwXqOjmjhdz9Om
         mhpKuB/7kNRJG1GrH98hrbqDqlte8H8klHGMS2bRnZ3kpWj1rwNpRDBmMA9aO96n7M6T
         RlT3t15NWaDLmxiA940DCY0WDm0i6sOsSVUV7eusOTmwEKeltfq0Zq0ZuCEM1vofyr+E
         cXyCislXhmeszWMZRWTpAqBNuFN34qt+S6mcLXKqK7U7bspCmGZxJZSgEzo3T77LkGh7
         B8Kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461570; x=1796066370; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
        b=j+KNX2en4kxS04wW2YOY6QYYMt8vR41M/YyrjYelCFc0IWPO7pTetrym4rjrzOHbIr
         2wSmJP8xPu9hXgytZWqE12Gr24CsufVIHWo+2pcYxB/PTPnHHm7O4Oj0NmWmJ7f7Gr2a
         SExzcFCBc2i4KVRaX3zvLuIlXe2LJO9LpO5vRFoKvxMtq+N76Z8eYPN0bFaPh4veNty+
         8GM2c8r++RJuuRKXzwBMuwzYIREYTUGFa037keoqSpfKpOAp5ZoeEjmX9GkRmc4Q5jT9
         fgRgES8n4z+AMrvyv5uV/O/S3/udwmpp7juxsMPLO9hruQf5a4M9DHVfaCxfKWHBiuNE
         hsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461570; x=1796066370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdtdaLJVx2Ec9NjVpEtYoWbDg7RmNeMLfPas0G2BTrk=;
        b=UJpT+mJcG92lBf3kLVZKlPzVz3iisFhWXf40mvoQzY2hriL9kIm9dv3Y7dzyq6CEf+
         5pCmT3SlUadzrW+spLilfNefQtCB0Roe1jYzDMijpz6X7WIH1I9ACf9xlP9WHrogB1Of
         r5rCv6x6AOhsTV6KwLME1UmqLvw/cp0Jf9jaROMrAlx2M0+YtgPXxDMAmWNtYZLXZkZf
         OVClVK3XpotUl7//1j8EHqkW4utX6BTlee1qOH0UkjdS2tovAyCsLNa0wOHp23jKSA81
         xe8/TnJXuLFq2Ndij+GlNWVI6H3NNcU/h5NBaf1CWcnIYWHbbS0Q5K9H8ytt8ZyZr4g3
         pwHg==
X-Forwarded-Encrypted: i=1; AL+hErFphC+el7DQdZSpJhIVFlnENjzIdrFwRUuM8h6Zg6Lee5elZl407yqix3K37OSTuBVhQus1@lists.linux.dev
X-Gm-Message-State: APuU4Z+V+pJMADfBPOtWfdH0l9qNeREWhZe88E9P4Me+Uw6dzdgM72qV
	2VAo9s67OMYwMEMa4j0K+3w0l6Mq75bt+/SrcAABeuHc5B+8SmdY8bWxsrQrxGMaWEa91/Bh5TL
	DfiemTxhT1BUCljjY3QL1gZbETDrftObc+JuXuOEX
X-Gm-Gg: AZFdTZcRjUGctNxG6sN9bLQm4+rdz3k+KtYKFDmfJj7SQS7t6XjQVdnQJR/1Ujj9Ujh
	AY+R1I663+taMVQ1FxMjJjm1zvx+PhNIGTnX2V3G6757iGpqu83TLmpgef4IMLfFFx3rf5YVTDP
	aJPDSktsOWy60oRFvDdgXjRKpYLiZEs/yrwAmKvL7Dm7VhPEY1Aa9R8U+9LgMTxnbmoSjhiI1Yb
	yTvWcJKyYbJ05TMIeTtCeYhhSbh6UeP40YVsM8Nns3k0NtGb2Qyx+6klOI51q+03PeCqC4aOgXu
	Noo8rVfIK2+me4qjo6xh68AoXb6q+/bbm1BV2GvWFk15J3gCTkQrgeBCrYxYDbqXgSIPAektUH5
	NpzcOmJtUqRWCEi1metig0ag6c+oDXMMslE3MVqYu6f2sxRxCh0hytUflETJnCLrNETPleiz7vI
	q4erDI6SSGb+v92Q+2gDoVyWeN4SmYrD3sQlb9hu+ZGaJxRG/pDo66ISNUflPYaS2kGNns/wzlO
	fu5ZWsZUfo6fBH1kOx4eZDrKFcsWB+/9uG35A==
X-Received: by 2002:a05:6000:2c04:b0:48e:7470:9e98 with SMTP id
 ffacd0b85a97d-4abb683b5edmr27126763f8f.39.1795461569942; Mon, 23 Nov 2026
 11:19:29 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com> <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 11:19:18 -0800
X-Gm-Features: Aa3M54oD0fqb0QzJ1JxemEFVbLUl9eeKO0PJLFfAF9BIgQm0rAlM82UhzRRGwNw
Message-ID: <CAKwvOdnoH+dunhAeK0y8T-qYyJrLCwHP56DzaLEAkbZEpKU8Ng@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb+git@google.com>, Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:12=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Ah, a week after that commit was authored, the same author filed
> https://github.com/llvm/llvm-project/issues/93449
>
> (currently assigned to Bill; Bill, can you PTAL?)
>
> They also filed
> https://github.com/llvm/llvm-project/issues/93449
>
> https://github.com/llvm/llvm-project/issues/187893 looks like possible
> a dup of one of the above.  Bill, can you please take a look at those
> 3?

2! 2 bugs.  I was up until 2am with a screaming 2yo who has an ear
infection. I think I'm seeing double...

--=20
Thanks,
~Nick Desaulniers
