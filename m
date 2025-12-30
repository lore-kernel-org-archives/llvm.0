Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1772DAFD7
	for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 02:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061373; cv=none; b=onjX8xFh13FJb+KJ5+fzI13YZlMw+C5aER6PwF6oNDMDbFKdBxiHgtcZxGuGy2H98xI7mNG46H+sXjl/CSN+75SUUPNzaR0oxgGjf3JZJl3yE0lf9s24Iqwev+hCaD44eBI8DLixdGPJHkgpJS60EGtx+DZQw5/7AS7NzJ5NVRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061373; c=relaxed/simple;
	bh=1TPUuZRqeK9VE9JKVNfQ7gOUgA9r0Suwe3bu4LqCFiI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MNfYDVsL7w4UHf/Lumyc7fhG7DsBn7B6geZ+3Ou66wSR+LnlLxzrKK4Kc2aMJgY+mqjYQzYRGdfuwULZ36RtMyXLhZRLVjVdWOWt4ikFBm1zWKRO++PFkJxii6ZQu8Y8JuAl9JXT9bF87BUTlq5PamlJwpeMDMqoxAojc9y0uOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3S+dbpwa; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3S+dbpwa"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c0c7e0a8ac1so14469688a12.0
        for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 18:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767061371; x=1767666171; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKB/MFi2JJNcHgRM1ZVpW/6k+K0ih/df/zx7AJgRywM=;
        b=3S+dbpwa9+t5Af7MVQAyjQCQ2gJLjb17gW2GOUSSWsipyGFvpyo/tWkN0mc3R1h9wa
         xH3SmX0EFqJ9xL/eftHPkDhOnS9dbqT9KpZBW3CCCr6jI8IwO/9bXwgvOhCt6tS67AZb
         cJ3qPpGpIOd5eTXR/oKzyC8TrDLRJGUDC5PQr4Ti/bqr80I450uI7z7RvnqgthFMMmPN
         HZjuf8Aor+PhoisP1hZiYc/Gk7ZtKPOaDFCPGoYJUyL6/HcGdTo9yJcmqAajL28EzWi2
         OaswE0+22SJiXgQ5aL0iIgJee9R8tY7kPVDRRtzUEsA2ccltH0juv5z53CMZ6T9JT3GE
         4bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061371; x=1767666171;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKB/MFi2JJNcHgRM1ZVpW/6k+K0ih/df/zx7AJgRywM=;
        b=Ag4ALlR4CCNzsmk9P8CoUhlIbxpgu4cFFkqpXlQfYrZB2LNVPRQUTNC2/kq39yP9Xd
         Keq7hy1MghbYX1Ux4wsgFrEPmTKCf1k8wmMxhVWSvzXk+S7FodlJjzTdObkEtliWYYP/
         Fr5y7WBIxH4TeUNrbQTAdwQ8nNx3hjqrNE9fNkaOXyr8PrYNkskKLvtfEvv/8ExvIHyV
         5aXc0ecGsCVufr1MIGxTWsIHGWoP4Ndiv//o71wja0JONlBORbcczfQarVLvju1N0mi+
         4wgiHZWmtQWXy1u60giKBJj87O3KMpdnDup+wg32d58oU+ZL7cifNq30dq0il6C+NZ5J
         Qsyg==
X-Forwarded-Encrypted: i=1; AJvYcCX6zk5I8blEKUoF3WtSaKXICSXIjc3+w3aRhLK8o/lZodQy6Jv/zxqLfXH1tUMx8Wp/J25m@lists.linux.dev
X-Gm-Message-State: AOJu0YyppQALQM6hT3h81oUFZBOUjfXnUpwlTzKL2ZTejcT4oWZTqhvx
	bDOKbs99PCE2DzSfkfYRtAVl708XfPVPSRZK7CP5svVeZnUQi2a820oIRlXJDG9xxvx5//AW807
	LVWII02Fybw==
X-Google-Smtp-Source: AGHT+IELINBMPFmRxNHDW7vHWpdCROA3hncsEtneXbUH1OrOJmjFny3vsrRGMAMBfntFNvUrUIrN7tzzSSsU
X-Received: from dlbsn2.prod.google.com ([2002:a05:7022:b902:b0:11f:300a:a308])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3718:b0:119:e569:f62e
 with SMTP id a92af1059eb24-121722ecbe0mr22094565c88.39.1767061371145; Mon, 29
 Dec 2025 18:22:51 -0800 (PST)
Date: Mon, 29 Dec 2025 18:22:49 -0800
In-Reply-To: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
 (Justin Stitt's message of "Fri, 05 Dec 2025 14:51:41 -0800")
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Message-ID: <dbx8ikdoso7a.fsf@ynaffit-andsys.c.googlers.com>
Subject: Re: [PATCH 6.1.y RESEND v2] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
From: Tiffany Yang <ynaffit@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Justin Stitt <justinstitt@google.com> writes:

> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways -- it is
> a false positive.

<snip>

Reviewed-by: Tiffany Yang <ynaffit@google.com>

-- 
Tiffany Y. Yang
