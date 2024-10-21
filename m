Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3119939E
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729529926; cv=none; b=LKaASa6zUttCPXKj58JHaDlYsB7HntUVk1WPCa5uffQFA50v1gV7C/zewBNGjiAqCwvClljIgSa/S0yDvGqLNsMHu414j5xvcFKCpPapDwyCL3Qn8JodwIuGoNbzvRH4KbOFyJMJw8rRIGV/a1H+fOyAO1v8lluF5GNiympA2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729529926; c=relaxed/simple;
	bh=rWNFdfqAINsqgIPmQ58XV9XMhtcFfEUW3JM86HlYGr8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAZXP3tHGqznqI2/7k8d96L1kw0/EbTrNSGp0M8g8Di1XVVD/GauHWbaxGk9eJu2tIK3Wk+OeghqWk26Ku+Twn3W+IyJKR6wfT1omCIWPMgb7YWCmf3i3Tq0tTozOfX0HDbG5W5Rp4sxD/sIIc0x1ZJ5mnfqsI7pLj9HYNQ7FVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAv8HON3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAv8HON3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so52628155e9.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729529920; x=1730134720; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3O3ZqCsjCEbziUzYAzv6B3rVVFyqYjTTrhAS14y6FHs=;
        b=nAv8HON3ql/e30+MceodUUKxCF36VNrQkyaYcUqzTjFe0+J2dYSQIbE2aT8k4II24f
         6thUO4Q+TRW/L5t36zlK+p+Zi+4Z6nhcIlXV2w/c5eoDo8q3jieD+7spqUxk7kyLwzHA
         LTx0kH0eUa1YxWtvEDhXr11LsgujZhH2D+/Z8fvL9eYaQwuTlgZQRRcRo9aM3VnND+ua
         9ivNWzTijOO1n5WNkIK+nyQIMDfTN9Uj0HJ7zupho6JFPRpocl2SD1GgLWlrmHuheDNB
         hT/9VnjyQLN9Jro8phG5mJSERXpQzcXK4hMg0N1RNoZ0tNRBe2TZXqu4PvkeiQx3LTeI
         zHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729529920; x=1730134720;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O3ZqCsjCEbziUzYAzv6B3rVVFyqYjTTrhAS14y6FHs=;
        b=ofwPU5j69PA8hGHfjCK1XJv1ZjVI4B3Iqe7O4y/bJBhkHAyJ0fzQgzqbnP96jWLOjM
         2warqpBgRb/Y9jOpZnuCNF+6vSGtBgbm1Odam5jRdHosMgNI7yCk1fhXzs+D8hRFfTd2
         a/dBJAhJWkac6FKP6VMAhkYdTtS+yvQtPDvLkFU8AjdgsfRhgbRd9vshdHRt0dXedZC1
         jTkdPEn//zb95d54qPnsGn15ZEsnMivMdXQqs2d+oQN7C+1dqE75GxOGyqlkuMW6sZCa
         0W5HZDyYu5tV877I/IpBJwe8yG2rL9fDCFUIwEfH6QkMdYymGvRG32FRUpeCxfYzX7aO
         b4pg==
X-Forwarded-Encrypted: i=1; AJvYcCVgSTsaEt92PYJIQ9b4YgKfJ+r8CFOjqNMQ4NQZGlvyC4UdsSEgkveDJb6ivU69qJvD1/o5@lists.linux.dev
X-Gm-Message-State: AOJu0YyfBOzeax8WSClE8kDyfDw6pfrS0cA5oglo7Bflki710Pj9tSKc
	+tPUgoJTW3JcxAYgcEUjAvUIPQFGH3X42bpRAIvy7bJFeSQx1IHF
X-Google-Smtp-Source: AGHT+IH1rjzoflHlQy1RKRZo1OcQNF67Ti3665AgAQE6ZaNOhsVxI9Vt11YMbl4rTj+b9b6YG51a2Q==
X-Received: by 2002:a05:600c:3b9c:b0:42c:bc22:e074 with SMTP id 5b1f17b1804b1-43161691787mr101963005e9.29.1729529919498;
        Mon, 21 Oct 2024 09:58:39 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2fa7sm64477955e9.34.2024.10.21.09.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 09:58:38 -0700 (PDT)
Message-ID: <6716883e.050a0220.3afab9.2304@mx.google.com>
X-Google-Original-Message-ID: <ZxaIO9f6AC_DIsyY@Ansuel-XPS.>
Date: Mon, 21 Oct 2024 18:58:35 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Richard van Schagen <vschagen@icloud.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/3] dt-bindings: crypto: Add Inside Secure
 SafeXcel EIP-93 crypto engine
References: <20241021145642.16368-1-ansuelsmth@gmail.com>
 <20241021145642.16368-2-ansuelsmth@gmail.com>
 <20241021-extenuate-glue-fa98a4c7f695@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-extenuate-glue-fa98a4c7f695@spud>

On Mon, Oct 21, 2024 at 05:50:25PM +0100, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 04:56:38PM +0200, Christian Marangi wrote:
> > Add bindings for the Inside Secure SafeXcel EIP-93 crypto engine.
> > 
> > The IP is present on Airoha SoC and on various Mediatek devices and
> > other SoC under different names like mtk-eip93 or PKTE.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v3:
> > - Add SoC compatible with generic one
> > Changes v2:
> > - Change to better compatible
> > - Add description for EIP93 models
> 
> RFC v3, but I don't see any comments explaining what you're seeking
> comments on.

I feel comments for the DT part are finished, if Rob is ok with the
following compatibles.

The RFC is more for the driver part and this is patch part of the series.

-- 
	Ansuel
