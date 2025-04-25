Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9FA49620
	for <llvm@lists.linux.dev>; Fri, 25 Apr 2025 01:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545014; cv=none; b=q7wVUmWOPnei60yDdp1BoedA0veI8pZj1CHeKTqzuS2txtuOuDKgn/9b27TOGpKteseIostxIb1f41ouqwKkRfWdiodcsQI9RRHMLebVdXkJysD/tZMkxhF3mKXEk6cRot8k+pwiVdkJpT1B4wVrRIZ6aScMMAX5uHAaLsBJSQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545014; c=relaxed/simple;
	bh=p5aAM8nvuq5KR9Vajvi+nQEW2Rln1Bwv8GwF4gnQeO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiVRJ9m1h9zCgwhLwQp398E3DJzDKzY78hlEMVZSpj+MksObJkcqK7jRRCHKKNctUpYMjKzO6H84uKqZupH2gHAlDVom1bZGFx8FOkLyuBs4dmtQvAOLlPXCnsY+3xuZxoORQ3WiLMcvAtnfp7nHPc2I/Q4YgzAsJZrbstPdTLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LlsczicW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LlsczicW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2aeada833so339602666b.0
        for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 18:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745545010; x=1746149810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7Zbmc9PFyMIhUbm13T2e4rkkq7qjR76gjJbFxlv9Tw=;
        b=LlsczicWLgkMeQiWk2QOGMque86BFkB6iJBO4/oSy2eLunu6TaqJSxaogXCud2vRim
         8BCInAtIkg+Y+8pDtZWIsebPjcNF3888/TnqGZIuC0fY3iTWp5yQlOPPPU0xJnUYR6+h
         /UW4IxYwNQret+2+0lWsi9PmHJ8IM8MtIJD4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745545010; x=1746149810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7Zbmc9PFyMIhUbm13T2e4rkkq7qjR76gjJbFxlv9Tw=;
        b=uoZHvMjy1mG9ZeEA7Vt9Bb78oXr6c+PHRrz61UG/b4SAGzKKLAtSewL11NJntIZw6Y
         8vpczyf+TthBodT8iGfPV5zcj4WXIHkJ1ncgIW5XLyzMEgIJHsbhWlq872d9Ua0yd0EJ
         sTYurAAs4SvlDJHwATwzA1mIgPb2bEiQqJYYrFkjGnlsAscauuKHfknuPpBExYozcHMd
         vvKP2HBvMS1hq/WsL59EsADo7q8bEfScrEBjDyDqhKZZ40iI3Khfk6Pv44X8ITPS0N6Y
         ZFYElOgiIt7Zis5asSWqkZESIX/FC3W68PqMYG4tC3VrcRlkb/wQaLnzobcLpVE6fO3+
         xjqA==
X-Gm-Message-State: AOJu0Yx4Uj9my8FPzzVCfnAyIj/fUj6z7mLJtvZhtQyqLGdFFpzTA6S5
	Bg39L7B7VdlvdhkMaDmfJD49VrosdlM0+Sao3oe9J3sG7ua+42GQuDvD3e1JaBUDJiVVNJSd9Ka
	mRnfzdw==
X-Gm-Gg: ASbGnctn4oI3sOgrjmuTKJqaYch2o/8c09yL+z/flV7zv/HDpL9KTgIbxhCDUaLexOd
	f75dy469EJ19pAUkt4LANYEypQ7hONY1+TMCt2q/4MBAyXwT1e/3C+AY5NIS/lFJ7qc0CQ3c0Dt
	q7QkclAWHMvHaF3y38TzpojEzJ7l3y/sJZwtuWijZazHAiJHsTxxdNtsEv0HFsK/NYhf6kG5Y0j
	Owut2bMP292Q//d2Krxa51F00oRl92gY1tqDWWvqsE8bZh5G6jobYgYpnBg9LtkipZc77n9xYhc
	XWvEKvmoui89a9kYDr/QUfyF8ZOLubK1KnYKBMvAIl+JxvUB0IXAkVwY9lDSiTFZjjMr8mWVo+H
	f5oRkpigrTMN+MBcSVcLn8/jL1g==
X-Google-Smtp-Source: AGHT+IHLPAfUf63Rvdx2VWlliCwLF+m4sPXto4uzb0EPz0KywNHuuTeFK03CpqAd9KzrZJnuTIJLPA==
X-Received: by 2002:a17:907:1c98:b0:aca:aeb4:938e with SMTP id a640c23a62f3a-ace733d15ebmr27653166b.8.1745545010161;
        Thu, 24 Apr 2025 18:36:50 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed701f9sm47075966b.139.2025.04.24.18.36.49
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 18:36:49 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so755613a12.0
        for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 18:36:49 -0700 (PDT)
X-Received: by 2002:a17:907:97c4:b0:ace:4870:507c with SMTP id
 a640c23a62f3a-ace5a44a4bdmr367221766b.23.1745545009283; Thu, 24 Apr 2025
 18:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425003342.GA795313@ax162>
In-Reply-To: <20250425003342.GA795313@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Apr 2025 18:36:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
X-Gm-Features: ATxdqUH_oZs_YreS6F_9--y11jLu023Kq43k2pNb3lC2tv-avxOMETPk50B1xGw
Message-ID: <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
Subject: Re: Adding __popcountsi2 and __popcountdi2
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 17:33, Nathan Chancellor <nathan@kernel.org> wrote:
>
> I figured added
> these may not be as bad as the wcslen() case because most architectures
> generally have an optimized popcount implementation and I am not sure
> compiler builtins are banned entirely from the kernel but I can
> understand if it is still contentious.

Why does the compiler even bother to do this if the architecture
doesn't have the popcount instruction? The function call is quite
possibly more expensive than just doing it the stupid way.

But if you want to do this, put the damn thing as an alias on the code
that actually *does* the SW fallback in lib/hweight.c.

Because the way your patch does it now, it takes "I'm doing stupid
things" to the next level by turning that function call into *two*
function calls - first calling __popcountsi2, which then calls
__sw_hweight32.

Let's not do stupid things, ok?

              Linus
