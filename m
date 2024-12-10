Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EA91A0AFA
	for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733833011; cv=none; b=HlKVmDwfKv1/VS5Y+DM2sRvh0Sjwjxv/kXqUxgG+qIgCEOIFRl8IcYWBghnbHuJqM6CZpzNA4Ad6LF17XquB7ZMvQTs2j7pa8zSZF2MdYvnPctHZdR2e0lmLH8z7PR3ekkX38jxax2HJRFebC6FpGKrtCERlgeISJuiu1IKaK5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733833011; c=relaxed/simple;
	bh=WDfgjmse2TMOfKgkubZlX/dUuqS21zwt9rwCmWHbd2U=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxfW+mF0VPbsmlOU/bIEKvsMqxYTMMmQLdoGPDvrCFsdR0iIOtNGpkgxEeUvR//ZW/ArzwYnHt78zoxdeN8gkEVypvsJ+IS1fBjyDECNxCvx2xtjX08XhGBnt1ThV14OQbhkkOtAkkBrlhqTwcdEz2QCBBkWCdplC0Wdj+j/MYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIuyig5S; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIuyig5S"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e3621518so3660309f8f.1
        for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 04:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733833008; x=1734437808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yf1CFLxebCAG5P70tlgOYPGg7XUceZtr9bdXkbq3ysE=;
        b=VIuyig5SdUeHqbRfetiVFGec2WpVPN8e50UwLS4qnwq62xCH6b/+6kqObBFCXATvx5
         aIuAp+S5eAoC66WyKFh+GPhKlxLbZ72gd+MsqMhNBbmKgGTtp6WdYEw7xLoz9PYayMqQ
         bkWdqwoo88H/FROaXbIr2WD7iRqNNr3/Hp1yZQtslY7VTAu0DNr5Ca+z13CeF8W66wfD
         oyuX4KCXvuChVN3KWHB/dZt8R0ggjCkFSm8YknP1lR65o8tV9EiaMV+l0pl++ht627p4
         mXO5G6ciaQI8aBfZmERODISC0p+pM7ymLW7t0nvRaosQ6goE4tTFaNnf1untGWhTZJHW
         Z5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833008; x=1734437808;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yf1CFLxebCAG5P70tlgOYPGg7XUceZtr9bdXkbq3ysE=;
        b=TOTY1D1B9fggEpJVQqrciy52xXE23h4FSgoPifwnut42lpT46wvbJQAttdf99BozA+
         g0em0gNSWfRlV1YPoFaHxfLL1k0O1kM/hQQDmwfd48cni3LCZbA5qLvqV7zMAxfFIA9L
         PLDR7Abk4ixwK4EMtZnNOwbYiqOvojel9hE/Kzu+lJZ3yuFbjN4ZwPaFHYVex5CirAD2
         NGPE7iks3INVJKaXb8Y98wphBd6HbyKAz9sCeBgrDoD5IBUw0BBn1xoPAd5+1pGBWSf5
         EIgfhlnSFnNJzofQzmVm3oklUkZ8jDzuTFjwHD+DTffyD7CcCpSMGhbWXgwep4RlWR5Q
         9ksA==
X-Forwarded-Encrypted: i=1; AJvYcCU2ViMj2vgINLyqAGyNssx91oitr/QKqMQMkbsS493XTlvH4RV2GT/SsZ22FIeTm0/qqsfk@lists.linux.dev
X-Gm-Message-State: AOJu0YxKpouR3faUzw3nBMKwSHnU6qk8YPhUF5lsVSSLGNhB/tQK5QyY
	5/KWS8nWW/wjsOQkkbSwKLdCGHYgEHBO2uzoiuFoIXEJHJWiZJad
X-Gm-Gg: ASbGncvPlUx1NhSIeubLZE5wqxV6bJewnyhbehz3xXAjwsX4CUYA21EKlnFGUJED/sR
	r/D12epVQVNTnrYcdzzgQOwCPzjyhsgcyvUYgCGXEd+VLZtuHbX5fMiOBmdLPNaj5FMYVXygTzs
	I9gi/j+tirZnGYkatJOR0vNB+q68kiCzjaPIbnMMJpVXqvbG8UK30vAf61PjpJmZzcrNnqTpJrY
	PhfgEzChBNEg/sOSHtv9zZ7P8A/7cEULps1k/Hll8sZDC66s1//xgUY+tKvp2TA6LNZJSalaKz+
	50Uxs1AP1w==
X-Google-Smtp-Source: AGHT+IFBSN43Psq6k+DTijIAspWlXZR8HbAtwGfM6dwGhrpaSfysjOOAtiOSQbKYF3yUXI06CWd3KA==
X-Received: by 2002:a5d:64eb:0:b0:386:3918:16a8 with SMTP id ffacd0b85a97d-3863918193dmr7873771f8f.13.1733833008325;
        Tue, 10 Dec 2024 04:16:48 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3863afc16b0sm7398163f8f.37.2024.12.10.04.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:16:47 -0800 (PST)
Message-ID: <6758312f.df0a0220.100594.1c3a@mx.google.com>
X-Google-Original-Message-ID: <Z1gxKlFB5qeuJpfc@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 13:16:42 +0100
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
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1guyCJy-Cpo7U11@gondor.apana.org.au>

On Tue, Dec 10, 2024 at 08:06:32PM +0800, Herbert Xu wrote:
> On Tue, Dec 10, 2024 at 12:55:02PM +0100, Christian Marangi wrote:
> >
> > The main problem here is that .update only enqueue packet to be
> > processed and we don't wait for it to finish as that would result in
> > really bad performance.
> 
> You can return from update prior to finishing the hash.  However,
> you must return -EINPROGRESS in that case.
> 
> Once the hash has completed then you must export the hash state
> from the hardware into the request object, and then invoke the
> callback to inform the user that the update has finished.
> 
> At that point, the user may call export.
> 
> The user cannot call export prior to the update completing.
>

Oh! Ok, that is neat. Just to make sure everything is clear,
to complete the request it's the same used for final, the
ahash_request_complete(). I tought the -EINPROGRESS,
ahash_request_complete() pattern was only for final.

With the following implementation this is totally ok. Thanks for the
clarification on this.

-- 
	Ansuel
