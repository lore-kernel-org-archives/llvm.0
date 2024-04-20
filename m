Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198263D3BD
	for <llvm@lists.linux.dev>; Sat, 20 Apr 2024 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653034; cv=none; b=LwshLBd0tnmC4R1q6YSJnQ1ETnzOtjrEkAVCvEQDZHlYrIngQyI97vFsa4EjSTw5i+QsoqhTcTeePl4HwHghXiKL5vIgov9en8tUO4lPDqxXaQCmrsntzTUbMW279nHgpDygiI/4qhhkHLu7zJFDg89Nu9eP3lh8wWddpaKnSQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653034; c=relaxed/simple;
	bh=7fN1X7AuEKLSn7BDMUoq8jVpAE3NIIja69/AWX9iGyk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:In-Reply-To:
	 From:Content-Type; b=HhKxStqgcTSE1pjHTwHf9vmPUpgYQOhzdQPyBrzV5RWnGMbVPu6TEV8j3lMwpaxMSJUMeG5cSM2aQ/1M8fSx3W7Wt9E5ZLvn4G5BbeeOXCECtF0d/f0ZR0OnaYzwgV1f6TfmNSgQbvKyCLuu9R4tUFUsYLs35CVaVCNMlH6f7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZVnlP3C; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZVnlP3C"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-343e46ec237so2549015f8f.2
        for <llvm@lists.linux.dev>; Sat, 20 Apr 2024 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713653031; x=1714257831; darn=lists.linux.dev;
        h=content-transfer-encoding:from:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3edFACX8jpQENcMXve7N03WoFbIGtGdsGvAUD7lFqSM=;
        b=nZVnlP3CwInvJo8inmovVYV20tA9m8QVnuTRNzQ/LumasfZKWP6XKk0gSAmGDNYNdm
         q2pVnZBTpeqLunysn9BRXpOumLm36pSr/l428ibVKblS77kxQHm6wGEBvnKe3OMCA8d+
         w9+A8UqTHSmb7yFPkCqAPdVrMt7CpXkEcdN5TT+fbB2dGGTWoe+iwTU5ajtqzscoRQa3
         Jx4LeDWGRsKTg+8Ik8ysTv7lVJOWTUbboa+BaYpwk1zEl3RjbfZpKdCAKxO4kL+YENaV
         UER7faSpp9lsdUxbjVd7Q5KUJ880SvRdzoyBpV7aHY6HxQEve3TTGqnmfEL8K+gRNy9k
         JmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653031; x=1714257831;
        h=content-transfer-encoding:from:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3edFACX8jpQENcMXve7N03WoFbIGtGdsGvAUD7lFqSM=;
        b=drW+8vuVJ+S5lSYepgsYjJASY/hAKyHh9v0Gk0eMH5ak77nw4pLHeRHgGAMptNw/ya
         EEyZ+5h6eiii/zEU/s7w29KY6AuO0N0Y6bSKNy/am1xZMYTGcWZeaiB0Wyiy2qyEStmZ
         028gyn0R20YE/xFMysuYO0NasVTyjHWhgNaYaZlHPVXw22/Cj1IGkMYjmZkQge4pTQ02
         AMtHx4LAQKjDxM/mK7xzY8a1Zl10wh7vF6umTQMiw6I+mcFnME5mTjYSz965NLUsumNv
         Yn1l3a40F40g9dOjiOhTyZMQ2vdtVUPwRCGdsqDIPa2N/bzZRiSiCv71F22Ip04lETj6
         eDEw==
X-Forwarded-Encrypted: i=1; AJvYcCVh2tKfZO54L+OP1skMDxWby1eXF4Gjg3SHzUI2UEYFBd+M60xmDuLDjWi4ROxk+vY32BSj0gikNRnjnXG0elKQBhDgXA==
X-Gm-Message-State: AOJu0YzAgVecpPbkVI+TPg5mCYwnyNx0CSx3nSwyCF+Dl1RcQG0RTK4M
	qfuoMIulQtezjGgoKcx1HOfsWIqKplQHzdZaoEw/VInwNwxXR9L5
X-Google-Smtp-Source: AGHT+IHE7/rCq/X5hVCefVBXrMqWhBdst02KYftb+ckqD6x+63cTXsdTvW+6x/Mziw9kSdQhEC5kSA==
X-Received: by 2002:a5d:59a8:0:b0:343:7b6b:dcc6 with SMTP id p8-20020a5d59a8000000b003437b6bdcc6mr5259365wrr.30.1713653031029;
        Sat, 20 Apr 2024 15:43:51 -0700 (PDT)
Received: from [172.16.0.2] ([104.28.195.139])
        by smtp.gmail.com with ESMTPSA id s25-20020adfa299000000b0034a5c595a50sm4979162wra.48.2024.04.20.15.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 15:43:50 -0700 (PDT)
Message-ID: <d8b36823-4247-49d4-8de5-d06ea5d85e80@gmail.com>
Date: Sun, 21 Apr 2024 00:43:26 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: irogers@google.com
Cc: acme@kernel.org, andrii@kernel.org, eranian@google.com, jolsa@kernel.org,
 jpoimboe@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 masahiroy@kernel.org, namhyung@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, nicolas@fjasle.eu, peterz@infradead.org,
 trix@redhat.com
References: <20230126190606.40739-4-irogers@google.com>
Subject: Re: [PATCH v4 3/3] objtool: Alter how HOSTCC is forced
Content-Language: en-US
In-Reply-To: <20230126190606.40739-4-irogers@google.com>
From: Tan Nayir <tannayir@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Could this patch be backported to LTS branches? Entire build fails if 
KBUILD_HOSTCFLAGS has flags that would make the libsubcmd incompatible 
with the built objtool, since those flags were not passed to libsubcmd 
before this patch.

One example is that the AOSP GKI builds fail since they set a custom 
sysroot using that variable. For the Google devs, issue b/335829879 is 
relevant.
