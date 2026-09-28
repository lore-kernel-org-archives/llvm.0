Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1645376A0B
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 23:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639262; cv=pass; b=FveGXmowRKZN9WIdnmhQNGTQClEv1XbPWddVhG4GnIuSwElw0e+XV26haqeUrQ1b7LSQ1A1gHzmaj+YQFRYRL4GhDcgBczvADP8lUpNH7ueQQNo6vKYkGsR9rlFWnWVaWwIDoJfTTERtKQsjE9XhQ8WyRvx5iZE4UcUDKqmykdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639262; c=relaxed/simple;
	bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dKEpK195f+qyq2yfCLUQgUB4mWBLss2tsp+YCntTIUD9djwrU6UexuDA8ZIXGdMTyaywuajqXZ409LCkJMisfwPjaPH7/SSMLUTvjhuOE8IELD8F7Kh7sFAKzZKspTss3/xJ/dg0ddwH37pWOghI/H8WrQ0kve/irNrzK7/bb+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkSldZzk; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkSldZzk"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a6525e763aso25324441fa.0
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 16:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639259; cv=none;
        d=google.com; s=arc-20260327;
        b=eev/Xo+yOi+hCW5ofYm4Rx+/JFcRP2a8teG3Uv+cQ0G7YdGMo+W5LRAysKUVm4PC7v
         iReUw2iWWD/SJWz0eEMyIqGfZ/jqCNzD6yk4huOKVSWoGZzCnb3nQpO69URGbxlDBhMZ
         aozEBqP36CTAQdHxP5pPbmnIbv2+zOT/yxJ34Bjm0tn6ifU+godwWJLpnBzMlHaaLnNR
         cZ6FlyWCrqv8kminfez1fa92oN2NNSCHq0Ma9H30PJ4TPrJD8YBkxlIQMzT73hVfobMV
         amMQontUfLGQnP5+OSPqTVeUkAFO/yQKXDWDFZMrBLlLXxDnmnhimWSMob79r3DALAc+
         CmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
        fh=+ehVFPIEaAvL9be75OkCYqm87KsuG9RDZCkKYf54Vnc=;
        b=mf0lduuTmh/0D+MAZ+q1F1W1hXnTvXwnTh3Jvc5wzAKHc6jS0m8dP1H7sq8dwHyd2p
         JnNEgBIu4GHS47WuCRDs5NlVFml3Zbm2HGIRKHqg0nXbncnZrW9pihHTwxwe3b2/kow7
         bJykkdgNeHdaCYPQzB7cSezpEEXOhRYxUmUDp/za7oIfZsEuVPefdE6nOU22TDuohRiw
         /T7MA6wwXXrs+Jq4M0AjGC8h1oXEb+fK4iqiP43yB2pu/Od5FMC4ZvrpmOKKhDvaWnr+
         5oTtFnRaQcfY2I05NrhWkiizEkLO2Ko6bPwLj4Dx5Lku1Y0P/06L4PfJa6F0HerZUXht
         Msuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639259; x=1791244059; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
        b=BkSldZzkSWLujBjduhH+TxsnsmVmikWeVCFZx+DW8mFNRlL42a5jgBbsYS0esFOS93
         BqL77tTWjDNL7v9G/5XzDHhiQZeDEf4UfE4zwHOk/W6LByHtVrey/y847Qhy8YVK+GS8
         jAj4oPHdnWUfTV2SQOUpPf5w5PLddl6uAzBKU0kl3BmAbZxGGRKc4Uvd9PAWswUvBHrR
         lT3Go0LkQguKvXpHXNruxqukCkg8osjL2PZe4xMi0zLv6Ok45KRUCHyt5IxHmYzhET7r
         +NZJ/3rHwQG3OWIwgkP0j+hgzk+PxM8M/JsiyTwjh/pspRA111dwQUPrYsYasbLVHh5S
         KmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639259; x=1791244059;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
        b=YTRzFf3OWYfsn6+tMp/VjowxaPQakacZDjtp26XvbavNOp59FpKotkCCG6M1WbJk+2
         zQvAKjl/x99reGr7hwrV1cjIHwMiDTljuQEKOWIfVTl6ks3rl/bmYuN4AoovB2WDVXmT
         RggmIzhoETw1a9ob94sM23QKyQIMDORXOr5jlUBSQ2Z3wFxVB+QtoKBjMEJ9geJalutZ
         rFRNdw4i0Xu6PrdME6Rgr0leccjDnx4dWjk3/H+Id0cnhEdx4yYo2RA8FhmaTKq4RH5y
         Lf8im50YQh3d6m/nXbO8aV+dX0BjvaO0zYWxCDHmb4pFaAEi3+If9j6WfcflzahW6vrq
         x93A==
X-Forwarded-Encrypted: i=1; AKwUvBxKz5zxiiuAHpgh2wZtyIC+/U7hfPajDqf8R/DxYjxxDQ/RArkc0bQdJHddMlaEHh9PxKlV@lists.linux.dev
X-Gm-Message-State: AFq9FYKxNMK0AeiMOYkLbsviyUWrUfNNJhDMbF04Uzj+wsPjsZeAIjgf
	6accs/Wc/aoWMD1ezfaucWwYWCPWeHbo2288b1KQFnJTxLsuxLvrzmHCtgWmQ4aB1IqE8++bgzf
	cd7l5fVJRvohxeBp3cykRPdJeI85+/1M=
X-Gm-Gg: AYBFou23UjAO/eO+sOQ1655NNESxyg/dCLqrB3t40dY0Pa4x+ubCVZTUDBX+9VEkyV9
	ks7zXu08VQY5XZsd9MWak9CybcFtxSDyHizkF18tYSqLVHBg065UBeq+IJ0KhJaORsgQCd97yUp
	x3vw46Qv+y/OVk9BFZw6GTvvfOtrmxJVW3Hs86oNEnqWeg1aOOFQfmXp0+EEJg40L6F0R7ZpOHQ
	UPzeAuSBHV6tN5doL7SNgYqY56qMmkr4mGD2R5Zt+yCoW51AfvY3aDq5o6EhyLPrEAgvMueYRwI
	AyYTSW+AOIIGP0VCxoZW8tO6LzRDB6DYjAC3daS9h3zPIAUamH5i1IQhn597lWaggbXBe88Nani
	jb4ZvPV22hpXN+PRkQ9DmysbR3bE9W8EYUd14DbsF3mw50XNHBxxtApVpTf/jqdk0Nug5oUyl
X-Received: by 2002:a05:651c:b0e:b0:3a6:568f:40dc with SMTP id
 38308e7fff4ca-3a6568f4370mr24957201fa.2.1790639258883; Mon, 28 Sep 2026
 16:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:26 -0400
X-Gm-Features: AclHuK-F4KwTB3L0zw0yce4vdiYkxCjFy1htwvqvL4sLssm6GQ_gSjmsUXDF2TU
Message-ID: <CAGLNFZetqY9WOioph=1U4Ek-KaSm_ZzNrUo-r1QjT-8tbhWodA@mail.gmail.com>
Subject: [RFC] scripts: should run-clang-tools propagate analyzer failures?
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In v7.3-rc4, run-clang-tools.py prints clang-tidy output but does not use
the subprocess return code. A test analyzer that prints a failure and
exits 17 makes the wrapper exit 0.

Is the wrapper intended to signal analyzer failures to its caller? If so,
I can send a separate patch that returns nonzero when any analyzer worker
fails. I have tested the control flow with a stub analyzer; I have not
tested a full kernel compilation database.
