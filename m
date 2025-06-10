Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18128C2B2
	for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550780; cv=none; b=axhQSz61PNH6Es7nQyfXsnbCwukdhMrYFUDA+pmgVZHvlzijWLpVXEcqbtS9/M0Fe9S1WcHKZMz2VSuIlqwSfR6zkXFYbrS4PZNB1mSEOno4W57suNGFLVw5VVlVCAz12YYWtIukjdpkcCo75624DlEiSJZFsDim4ufRoMhgcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550780; c=relaxed/simple;
	bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvV+ZKqfWE1Bh3po7L0rIRtIsqLhCSpkEcQEPji0ZdH2EWE98Se6lyHCl+zCIqMa0yoU9g5VAn6Y8sjYSWocOTmlL44KL0ltBltZq4RCyhZmOCp3VKlRhoyOjRHjHLTwi108xr/XWWwzXNR81roes2UWkka7BKjMOKRBBffPckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=YvZMcqLN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="YvZMcqLN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so6722460a12.3
        for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 03:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749550777; x=1750155577; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
        b=YvZMcqLNVN8fibiArSz/ZbgCXRFZ3zo7DxA4KamJ3h+OG8wjjwsMlp2FptHI3RhFzu
         UtEA78+oqjKdSWkM+jaB9v8ka1hhXqvHryMes8TjoQezBoc+CF0w8HbhPPjib2HLLFCo
         k22w7ryz+eaBlK3AsBf1x4wRGzbVoLLLaJT2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550777; x=1750155577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
        b=sfTDz+pXCTOqSiCgjvsVylkcOFWzHJLwFUVJpIRW41V/kR9znxqxvav6xBw1kVQS2d
         rJ9m4VbepLl+ZxRlfWLbzy0dQoAun9J3bJoO0AUujp2KONcIQ/SA/uLDdYYDkC9g67Q1
         IH+JbXwVhKe3fE8GbegBOPPd25Sua8WlidOlYGsa2P4ohNdQqib3wEkZj7t1WfYoKCrF
         LdbhI3I2yFkijM6Ar1HIaQHCO7Y2TuY8dWqrKnNYCDSv4s6GW356FkJcS7VDbEmzBFgk
         wLt1JSYNyG+RGgtfxtCeRyioyDZYGH0Qj6J6fqn5y/0sqvs1YIFaL1OwyvVUVK5J4ib/
         GS4w==
X-Gm-Message-State: AOJu0Yzdtu5zqUPLafx5rW6mmU75bYm6ELgbojWSfuR05ypE9UyWtYr4
	tlCiTS0jtl3cRo9zMhzHK88j1M0FCPI7pWy+rIXKwWeJJ8LeZcm2So/EC0MxikR1ByU=
X-Gm-Gg: ASbGncuCQLb7IYkhkYQmv+GkKLFZB8tac5O3P4s7gAKJtlFxIHALwhEsxpYftP1hwnJ
	GXElH+8gwxPyJYf5r2A2Ib3VF0l1prKTCsSvrYTuxBb1K7WUz7OVp7O7TTwJTsogfSc3JfH4+F1
	Q0zSmKccA7iZgJwdbJMeHSxpD7RyO1z6lCiV+3F2dCuXngv/6O8T179oTmZBUnAnss0QQSSpkvS
	+53LWiZ2hlR7PhPTsv8mpc5fgjInd+XqT+hldyCo0WspOpJ5OETOluowkrL1xC/pU58mYSQiU7/
	y/Uu0gbjB0w1xvOdK8vyWt0jcAXkFc0veS1BxMZ2zAUdNR5aQgMkTsK+mneVNO4s1A==
X-Google-Smtp-Source: AGHT+IHDGq+r2IlKiecsvDQCxKT8f5zu0ppTH97cYtt7W5yjJyBOo4m2JwFoDG0lIxxYNFZqnFnEIQ==
X-Received: by 2002:a05:6402:26c6:b0:607:2a09:38dd with SMTP id 4fb4d7f45d1cf-6082d9b391bmr1857192a12.18.1749550776974;
        Tue, 10 Jun 2025 03:19:36 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dd48esm5869944a12.56.2025.06.10.03.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:19:36 -0700 (PDT)
Message-ID: <1eef4644-f22d-4c5b-8cfe-843ed88c050c@neon.tech>
Date: Tue, 10 Jun 2025 11:19:35 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/mm: Handle alloc failure in phys_*_init()
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <25c5e747-107f-4450-8eb0-11b2f0dab14d@neon.tech>
 <202506100041.N8Bgx8q0-lkp@intel.com>
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <202506100041.N8Bgx8q0-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Apologies for not catching this. New version here:
https://lore.kernel.org/all/a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech/

Em
