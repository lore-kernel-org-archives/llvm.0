Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C722ACE5
	for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863917; cv=none; b=ehoI4CzGWor5Rcz2Ma0TDHNj0/LzTasHJUe8gxa/P7kVPIcpu7rGGGJDOoQPtQoclkOjLrDmsqyWPugqlxBKFAWD0BphXGuVEACqHIvy/IJgCt27uo/YGWhomH185F+fSmNlqEFIUOkcHY4FkOKWKMCGrBe3jh1wAkN4QRPhgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863917; c=relaxed/simple;
	bh=mRThUMpoJI0H65y7D/bNtmiOmzV709Z7Dn6YssAAgC4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfHFwOrxKO0hmpnXDpFaLWU6iCNtQzIz0TTti8N2IKoVx6HMHjhzBX5Yq1BIC2WZYDQxtk4oow5fuBuL9onodFD92DZ2QjsTA+Iiqvj/CwKayLZ4xVr4ojSkhIA7lNqR7Uk9ZiBGEsyL1Ejc7RUgRFblonHStkEJE/+Dw7WnMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2Bsmq8h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2Bsmq8h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434f7f6179aso20980985e9.0
        for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 12:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733863914; x=1734468714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=301wRSRs43OjUWzhsOWOTGwAS/3EIoBXGoWH5/9Rzns=;
        b=Q2Bsmq8h8ijxz50YHIuQvEWru99d8WrmjgpoO4E0WhzG98dc24VhQ37DxDdjKaWETl
         Wc9BUqtHu/vKo5FqMIiKM/Hp4eYuuI19HtEie1YLlWR4to0Oel6L67kIh2o43Q2nPExb
         h56Ici9BgZumwFvFO/Wl8dakuZX2Rrc7MoCPDN47r/SK3X41XCvMjeX1wSoMnxYI3dhH
         YPCIWVGF+X0fgeFoZQO8zH6bCsglVF8+PU/plP4RTjFCR1VyO9SGNFlcakoYq2emTN3d
         m991scfvS9FrTyJ4GM5nVoV8DO0WhvXCEcxsJBbuTPAxqqEBOVj2xIPZLsXTTc33PWZD
         fYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863914; x=1734468714;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=301wRSRs43OjUWzhsOWOTGwAS/3EIoBXGoWH5/9Rzns=;
        b=L6ENAhPFB917GwZt6Iz1tk43FR+badCI0w+K/QmlPXTbkXFVSDv7LFueDTyBuQh4V+
         +EBDterHhbWRBAOyBeT4MnGDT4FOZo7LgluniGDUOMJQtrgkqWqZZGnb2yFtDYoHdvAb
         btqe/2oPEMtJ54chSG/GlfzEnTevxM286d/jIKcOkKJBWOduyTJu9iwz82A2xjsrVsOU
         nuVnQM6qn1F1zLmL9u1ZVyJXek+GOXveUG/a6uRZiJ271BgU/xqZg9FYcA9PAb20M82/
         1NQYkofVj2nXqmiYvSMKy1N1PNOH5zVPhTN7rJJ2kodyVo9D2OOf6p/a+U7qyy2RQ5Dk
         2kkg==
X-Forwarded-Encrypted: i=1; AJvYcCXdAtk/tVCYeuGrVaucVzod5tivVerYVL+1XsexN686jvhc2zPiyuHpf+xaLjfk40P6EJ01@lists.linux.dev
X-Gm-Message-State: AOJu0YxBp809i7oBYz9mjQPI2M0uUYh1CpwZq8sloXsm4a0TRhVp46BB
	j+eLNxMZvJFYgVtjqxCJlf2z9R8gRu/VkZRQNakRf1ARV1nttR+Z
X-Gm-Gg: ASbGncu0ogEmjA1ieItRu4DmualNY/ZG5mYPhr2AQ2j3MOOA5sqBOder2FIZLNIwFh5
	mpE5ZIV1E+qTjVUwwiM3ohG1VwIfHTAkwGWkEHbb6hjZHtNABlDZ+EVSN+/2UAJtkaW1ai4h22J
	pzQjRhnRxCbf40FfBRiQ3slHZt1O0E0ByXbRGk0eDRKrnZ5IbDyGZ14KssiT8wIluXPsL6cPfoh
	5OAIojos+wBMoD/yUtFybQS8XBACqCKO+KiW29gBOGoJ+4L59XiZxgtdvbm2IJlm/YCnEUoneK4
	SFYyBAng5A==
X-Google-Smtp-Source: AGHT+IEtgELmozDZndyAbIw0+22SolVOahQ6RzPmvQx0tKDwUunyJxMT5/Exd2L84f60qzvt/DM14w==
X-Received: by 2002:a05:600c:8718:b0:436:aaf:7eb9 with SMTP id 5b1f17b1804b1-4361c429eaamr1449815e9.20.1733863913580;
        Tue, 10 Dec 2024 12:51:53 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434fe9bff74sm57024695e9.8.2024.12.10.12.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:51:52 -0800 (PST)
Message-ID: <6758a9e8.050a0220.b60b3.184c@mx.google.com>
X-Google-Original-Message-ID: <Z1ip5hA_x5WEHz6W@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 21:51:50 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, upstream@airoha.com,
	Richard van Schagen <vschagen@icloud.com>
Subject: Re: [PATCH v7 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
References: <20241112015920.22564-1-ansuelsmth@gmail.com>
 <20241112015920.22564-4-ansuelsmth@gmail.com>
 <Z1e0LHycNGcWqd2q@gondor.apana.org.au>
 <67582c1b.050a0220.83ef5.c8df@mx.google.com>
 <Z1guyCJy-Cpo7U11@gondor.apana.org.au>
 <6758312f.df0a0220.100594.1c3a@mx.google.com>
 <Z1hB2WftNhyGt9oj@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1hB2WftNhyGt9oj@gondor.apana.org.au>

On Tue, Dec 10, 2024 at 09:27:53PM +0800, Herbert Xu wrote:
> On Tue, Dec 10, 2024 at 01:16:42PM +0100, Christian Marangi wrote:
> >
> > Oh! Ok, that is neat. Just to make sure everything is clear,
> > to complete the request it's the same used for final, the
> > ahash_request_complete(). I tought the -EINPROGRESS,
> > ahash_request_complete() pattern was only for final.
> 
> Correct, the same calling convention applies whether you're doing
> update or finup/final.  One difference is that after final/finup
> you don't have to export the hash state because it's no longer
> defined.
>

I just sent v8 with the thing fixed. Hope everything is good now!

As always I passed it with the test flag enabled + extra and fuzz set to
10000.

-- 
	Ansuel
