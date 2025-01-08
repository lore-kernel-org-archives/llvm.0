Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA961A262A
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305213; cv=none; b=BV82If+f5aOaUwJAgdsUoMkXrcbx6nD3jIh8gzSzD75TGyCEk2STIn3PLAgZtSU3fGI5OZzmlB+fGU4OuMAq0RuK+N2jEOjZi8Dh4Ixr8+9eu2pe+Ek3C5qg9zz4LWrHVEKdd1t1hIcMOJ/RG6ShwL+KBCWsForV2Fgs4+wakK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305213; c=relaxed/simple;
	bh=dpW07r02+vAWiXyYKKllW9tQ/V7+u4ovL/HDCCgJWQE=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZnHiyW5Rpuj+zvsfcEcp4jyo1RekKKEeur4D9zUpz2g5vsqTMTTZgfutNtHgyt1s35nTnBlnEAg9yeSzdF2GPik0zrrAyLQ34wskXvZM+sDYOUDasja+0lDNf4MFfHpUa/8yNX4oGFOhaEKRXqv+XRz2ECN3CtSOgcQrb9EAuHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FJ9bPJsi; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FJ9bPJsi"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6e8fe401eso1344278285a.2
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305210; x=1736910010; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpwGF4ZPc5zkh/c6DMxwRDr8v/VzMYpFaykW6r71bZk=;
        b=FJ9bPJsi3ylcWIfeeQHMoPIRGSW8Pu4zphxBrT8YDHxb1B37Vas8ceHYr4L9LgGTas
         5ZUld4j0d/IpPRbg5BrrEHCwuh03csIfra38ooomX4dSW3ljC0nRRWTbE5Bp0WZ249d/
         +NNxQccHnWpXXI1LzRBoo/FWBXnJ6mpwz1jqw0e7XEaQYwKM40uqKraT85V1Njq01E42
         CMmCx0zEOYqp8BDKxRynHINM7E6TZ/+YkoJVpGkJ1qQNaWeTTQnd1Y9/FqmHXQo6Z6Nl
         BnsAF/pLxj4hlZc7iayaUh+xrHO78gC84LEYnuFDnOWGH77MqHwnuIJ3EVOKa97fmkG7
         IBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305210; x=1736910010;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zpwGF4ZPc5zkh/c6DMxwRDr8v/VzMYpFaykW6r71bZk=;
        b=sFj2vqNejYCpBnAsjkFX5tXH/s9AR3pogZ+gU+obPzDVkhyRKjasvI/mzmiFSopa/c
         XQ22IUCzVDexREemBVNnNYL5ctAgQ2msFCKjbn9seR1fHbLCjiK3YFXkjrMXgjHdFgBX
         UE68hyzIc9kn+hiPxbgpR0IZgE5VKEHt8oEp1rE1iTD6N/QYEKBVfsiGMFNNzZGQhrV5
         B98inZhEcFHSi3JQaGPjT98nr4F4wkvhVlSlX4j7RGZvid18bQVQtJMRzi9SAeEeMgEp
         NvCxdEHQMy/vHKru/TOmN8aYNodEqffWUyU+bFhBRcQHEj89sAMFCHcl1Q065KMwKwfW
         m8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWUU3ReKo/3WkgOhmr1Xt7RHVdKsGcfZ7NmtISWxSJzRHIMWRRAEVtFPM8rnS1TJhWZOooJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/6r3UJfeotVYM4m4tiMIzHiVYzm3GrjkJJtXc2Nv8ja0GKPnb
	hHKDqmqMRYhfNVs1pOh9K7scZd94y3sTr3B6L/nfepx+O5yvCBoSv59USPXtZQ==
X-Gm-Gg: ASbGncvutW3PQ7F4mwFFD35rHx0f9GOud/Ij7/m7XT4+FvspbBWQ0QFUr8vuvAAuTb6
	jSR77RHcYcDtF7XFCW97CgiLJBzR8QI9kJZfVPXdol9z7DfnSBcrBYQpno9n6ImWMMUt68MpGFE
	56wxrdvN56ElQZn5l/pyfDgtKfXuSJx5WFHb+n8EVhDIr+Ut4dQCOnGmyJyUe9Qotwduas0aaUu
	BWf7UqSnDKy/btWfwl/9Va6EUnWsiC3zzT/cVrE2FJ35L0UYpA=
X-Google-Smtp-Source: AGHT+IG9lHm2hSXpL2ALHMVYpNGR+NPhmNlgxnbcIWTjNSbgzaPtBoqVZFBXmmBFrsxuavT1v+9vtg==
X-Received: by 2002:a05:620a:240d:b0:7b1:e0f:bf9b with SMTP id af79cd13be357-7bcd97afd59mr145106485a.45.1736305210186;
        Tue, 07 Jan 2025 19:00:10 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2f8fe6sm1637237185a.51.2025.01.07.19.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:09 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:09 -0500
Message-ID: <e1e67dea8520f71bc54377a93e26d849@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 19/22] selinux: validate symbols
References: <20241216164055.96267-19-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-19-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Some symbol tables need to be validated after indexing, since during
> indexing their referenced entries might not yet have been indexed.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/policydb.c | 94 ++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)

Out of curiosity, have you measured the policy load times before and
after this patchset?  I'd like to understand the performance impact of
the additional checks and validations.

--
paul-moore.com
