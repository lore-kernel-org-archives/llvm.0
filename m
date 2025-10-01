Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AE72EA491
	for <llvm@lists.linux.dev>; Wed,  1 Oct 2025 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759321565; cv=none; b=MyMW9yQbMnwntlCpqkoc34X0iJnNvAu8bt4hk4vJdFe59XpYahZddzN3GPRsEKoVT2fGN8tpW0mCxzC0QG2c3nVexogoXI2M/Ztt1ceuNH8PA/fmbzOBpsBG173V+WYbnQOs8gvLciKV5i8D/vptozSkaZTJAvebiN3sLyhtX9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759321565; c=relaxed/simple;
	bh=3ayNbCgEBpgJcWx7QrG/+sfX9FPJmaUZWIZVJumsQGU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WW+hZEUiBUc0jmbaGze2eEWOR71wf8aPPrU3a9YbLZiwGQ4tfE8EKSb/5UpYIJDAz0ePrvGM8Mz6vQClEGeJjq8QCtjN5KdvYy1E3EqRyuCnFh2VoI2DBiyIvOC3FJHmmIuASoLJt0c9xoFbrYxq19NWoo1sTiRhesuFnQZCl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cdwjhsa/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cdwjhsa/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e4d34ff05so19874665e9.2
        for <llvm@lists.linux.dev>; Wed, 01 Oct 2025 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759321562; x=1759926362; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ayNbCgEBpgJcWx7QrG/+sfX9FPJmaUZWIZVJumsQGU=;
        b=cdwjhsa/7hCTzEaU9hgOktTyKwybvxhr53kyq7FuxfIYh+LxsXPHmTgNutrwQVK1hi
         TqkzHkXmgEJONDvgXXM4clK4HNgIG5f9+b6KA+GZHfUalXExn5RVrOCEIYxbSPwlrM11
         +WGopDrvDu8sMyq/AndnHq2pyr+Fv9ch6vltSksOBlR9uHP2cecWzTqVV8hz6vhZGtTa
         Ekox+XJk4gM8VZ2UIoYKraXHG4HV8aRra41zIkz2bAW1xu5qjacxVYTI/gBthlACZene
         hg5j2/yRSdXR6mzWaO5Nh/xLMy6BFY1VXIqYp7eeaIce15qf7QTy+wlVune8SGkP2CSz
         jytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759321562; x=1759926362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ayNbCgEBpgJcWx7QrG/+sfX9FPJmaUZWIZVJumsQGU=;
        b=myeEmBb3DDRgDfurzGEdKE+Mq/4mhpWUquoVdNdMAJdr2GdgZDk4DKr6Pc9kCmJWuO
         1rh2TFP5MKRg8q4qp1jrQScK8NXzQMr7Ok4hLamL8gUQTU1FF2LaASI1WoUskVkEDly3
         fY2Rrwll0KkSr74CsO3RNPgglAPuFfKyEBvkYf8iK2YuIFCW3zNO4cz7iEvDMPYZXGWv
         YTG5o8LFrW88BvMpXPtIEt+eXy+Ma9gpsb4ZeRMpTfELYnjinTPFwkuA+uX7XyAA0TB9
         HGrYKxCO/X6U6aY9MnGGA2ceDd0VnWmiz85Iep5w1fNJPsJvrjc9FJtFeFBszb3R6gb3
         WBSw==
X-Gm-Message-State: AOJu0YwiS9PitWZJWEX3CTWiZ/DQ0pABh0m2yetOMTtb/VjH4WikMcFe
	rw003l6cDtCz7f+ZhyU+hGYpWoBOEWEYJUh7xx0FAvfPMYaX+fqCK04vJF7Bxi7b2anRPDzVSRR
	HzmOttOpMfH5piQ==
X-Google-Smtp-Source: AGHT+IHhvLWUAOpfrdTW7oF5fo1iHNdyUu7ve/F2YpxM44Rj8ywwvuvN6K0k8Lfbtju5XwvYHXm0pqfTKrxDrQ==
X-Received: from wmbgx21.prod.google.com ([2002:a05:600c:8595:b0:45d:e2f3:c626])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37cc:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-46e6121ba13mr29447395e9.15.1759321561760;
 Wed, 01 Oct 2025 05:26:01 -0700 (PDT)
Date: Wed, 01 Oct 2025 12:26:00 +0000
In-Reply-To: <202509272136.N4ELb64u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250924-b4-asi-page-alloc-v1-3-2d861768041f@google.com> <202509272136.N4ELb64u-lkp@intel.com>
X-Mailer: aerc 0.21.0
Message-ID: <DD6ZFZGBMSLA.7BSBIIJN0SLP@google.com>
Subject: Re: [PATCH 03/21] x86/mm: factor out phys_pgd_init()
From: Brendan Jackman <jackmanb@google.com>
To: kernel test robot <lkp@intel.com>, Brendan Jackman <jackmanb@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <mingo@redhat.com>, <tglx@linutronix.de>, 
	<akpm@linux-foundation.org>, <david@redhat.com>, <derkling@google.com>, 
	<junaids@google.com>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	<reijiw@google.com>, <rientjes@google.com>, <rppt@kernel.org>, 
	<vbabka@suse.cz>, <x86@kernel.org>, <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat Sep 27, 2025 at 7:29 PM UTC, kernel test robot wrote:
> Hi Brendan,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bf2602a3cb2381fb1a04bf1c39a290518d2538d1]

I've fixed this and the others in my WIP branch but I will wait a bit
longer before sending a v2..

They're all real issues - one of them confirms I have not exercised the
CMA with this code (by demonstrating that I did not even compile with
CONFIG_CMA=y). This one is just a benign bug that only shows up with
W=1.
