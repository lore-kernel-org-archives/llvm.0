Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07D87081A
	for <llvm@lists.linux.dev>; Thu, 12 Feb 2026 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770926633; cv=pass; b=lOM61EaOmsivxOXPeR0ludNZpF45xf9EQphp92TNehb9Uw071vgufourfKahexjpZqMovs96O4j8mUEbTyNRHOzmBGgg1RvFruVo6+fKwyupbogVM8xe6Qp+4fOHmiN1E9r0N7p/ObP7u9aROUKYFFKsdAu0iKfiaUFOhgO7jz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770926633; c=relaxed/simple;
	bh=sluWmViI7IpxKMa2nn/RUCiFtkwPuezKa71baWzwgDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7ATu9gyhsWuGCRhhWvrSEVGsLoIxynXmbNhgIeU97CBymdj/g/UVuUXioJdLyt3dmpHEtbsGLdFdmqyxh8aeSdwQKGx55SzhhSXuR5/sGOco32HsgbSquhJ120glTRBIMDxehc/kyuGGoVuKxMMx8Lp2UcCgiSPmhwlDUqiDcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWYdiJ39; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWYdiJ39"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bab709f867so22830eec.1
        for <llvm@lists.linux.dev>; Thu, 12 Feb 2026 12:03:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770926632; cv=none;
        d=google.com; s=arc-20240605;
        b=W/B5FEAQNmMiwCcqMNRilnTCYYqmL/j6BxlHMtoqI7QF6Xi2ZRMWsKO4YHs73tShpb
         Xm7yIWhioeoi0pDmEXp2i4xz+gF5dUIkJdcskaNWmQcqDo2emHs0tiJMpW1wnmrpI8Xz
         gDHNZvEMZuaDCkEVepzZaLXRqmDubfeg1KXpQ3Bo1w6ymVFjWwp/u+b99Gd2/RZg9MsG
         ywL/5Xn8+5JS5qSpV6QCn+zAxWo6i0TBFRlRZI6tEW7/uACOI0R7VQDpmfhPCzzbw2Mw
         BaCfdiVfwONM0fnCd7o0UOvUCf+S6N+7d/c3ulDxNngUMF0gBKCAXrPuSleNdXrDS0mf
         3J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sluWmViI7IpxKMa2nn/RUCiFtkwPuezKa71baWzwgDA=;
        fh=fkZVY6Evhlz2fLNk44AugXtTOeWSEaVxWuCX9N+SZJw=;
        b=kV/icYAkFahwOXHyeXtlTQYgw+j57hxQPbWPP4AMIgUC8Npo0gYQvOFXVm4lYvrM+j
         E/aIEwNc14TLvH0azBfULWrfaqmrl/PEfpoLD/xEheEJzy1HxA/pdvY04+LUfLhCgLYu
         TvDUN9SgmXTkqStPA6dHJhRRHpDFWFcbUb1TyOWlq79z1JhFSqNO9GUqbXJyznfgmLD7
         lz/D5fDPH+B2vjwqAuEhpBOoUY14vrjvNxun9yRQbEBrE/ZKCVoJcz9O13/1VC7YPTKS
         2sGeiyKo1BhdV8A37oIq712jEZe/+aIRI8LC3NdxPyXERsV1E9MVKx3Wt7b7XT20LgMl
         74sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770926632; x=1771531432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sluWmViI7IpxKMa2nn/RUCiFtkwPuezKa71baWzwgDA=;
        b=VWYdiJ39QeMxykfDLe5n6g6/Av3rS/Y9zG2b4hYX9g+vbUcSvdvwKfJenb3WXktexL
         y7QooBPzOsLSHfHVOh2cxJx/ozeVKWXbgytD0PWvlCE8wk9Q7U5XWtBzGDFEF4NlWTyV
         TvQgbAPsTpE3sBKvqSsKR6Qg3SIRBcLpdYw16FmaqCWM2J0Pw0GB6zVaDZuJcn3qRHOq
         Fd5aRwH+BbARRAu+1VK35DDekOmhMv8I5YGifo4LEatw7JMRb2Xf1RdBMbMN3z3ZDK7l
         W+77PDt9MuptYcOqIpAXQ2rBg9mp0xMuvZ3noeRaxih5RSeoc+c8HCgdpYitAElRtBD1
         +2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770926632; x=1771531432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sluWmViI7IpxKMa2nn/RUCiFtkwPuezKa71baWzwgDA=;
        b=Z2seYlWnceTo8sjJmrPHpuCNu1r3KaxYykXHP+1AVx43qEhCpMf2fzHhed+xGikcQl
         Qt9lmjWlmjfFmWeCzmO+F2jiZvx1iNNQ9kdqattHc37Mj1gxNXIymJDlFs62EhItgSxc
         MnAR+U3qz8ArU6k+37UhCR+uO0NABx141yBfOxk2l9hT+YAXkz+LaMHC7gTYsV9EF6pI
         nLZAYuXwRZOS1Y+ZL6WOfazWy828VKEUaWnWpC7I5dj677r4Gb5Fu2wmDRnDM6/hRNqB
         Dj03hL7zL4MymYfv7yoK+p23xXic7Hhe8oaVmlL29fy1asBd3lxxVmX6qSDa41c7QCtn
         7thQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHr6amjSoF3SYM83MbAljdp2JtxwsSM4OTVDwkJhfZz+LDv6YdEHPyzvSEzBwckWeUn6AZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/A2w/ZOabruvlSy3clF+TvACXeA8db6wLSDQ9syEJkc8qM/9M
	w4xtK3C5MTTQCNJaCIcasjgzcZIIOgZRL5xtaCySxqTRxfMeiS5PHCb4TJdjC8sZJN88PZLAk9w
	fFl++7AzQFw4D2pvYv79VURfynEj+1dk=
X-Gm-Gg: AZuq6aLE96NFi/luvsG6QtjnxdU/Adb26bLyShLkUU5QjjktsiGG+mmUbzs3CnVe01Q
	YhkAzfKY5QYg1/vkA+6Fnm7zEMlOi+/3alco1xRhQCKp4r7a7pUJ52zhr/804eJLXCBjOuWmDzz
	HvnCbGwH6DFiEiDxQj7VLbH94DUftcyWniKB0cIaYM5zd53GI7dJ5Y6oFrfOEOgyxnPgDGbOJpK
	0CmmpeMO3uYKjRsDg6fBNp92nWYX35tgcafVx5DSbC2y4xd43LQ0CfZ4DndYOTQ31oB7oWawm/n
	CouLwaFzX6nPQnArF7rS+uRlwExTXesSzF2emHa+UBQ/m4Gw1FyRcl+wZMsLmRWroeXwmKca6Hh
	ngNH/YuAdOfzo6EUSlwJzWeGG
X-Received: by 2002:a05:693c:2c93:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2baba0ae6b2mr21865eec.6.1770926631915; Thu, 12 Feb 2026
 12:03:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aYhfK3tB0X6Y_GyV@gmail.com> <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
 <CANiq72k6ZHbW+tnX8jjOUaj4aSMigEaH4SEkODX==OJBseKCug@mail.gmail.com>
 <20260211195139.GB3482274@ax162> <CAAt6xTtmrrZh-+H-jV+bcteZwG1jabraTxWQ-uLJ_N9h1ZLxdA@mail.gmail.com>
In-Reply-To: <CAAt6xTtmrrZh-+H-jV+bcteZwG1jabraTxWQ-uLJ_N9h1ZLxdA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 21:03:39 +0100
X-Gm-Features: AZwV_QhXlesg5M0169bOpJQNxPBT5ixofoCGPmCxFzgcSF7apXd9xsdeY-8Yyk0
Message-ID: <CANiq72=pR7ScacS84yCn+nw57Q_2gGvbpFPfNSwJx7+WwW8YkQ@mail.gmail.com>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
To: Aaron Ballman <aaron@aaronballman.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Marco Elver <elver@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Bart Van Assche <bvanassche@acm.org>, "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 1:22=E2=80=AFPM Aaron Ballman <aaron@aaronballman.c=
om> wrote:
>
> FWIW, I continue to be in full support of adding post-commit CI
> resources for testing Linux kernel needs. I'm not super familiar with
> the infrastructure side of things, but I'm happy to help make
> connections with the folks who do know if it's of help.

Thanks Aaron. Like Nathan, if you could keep me in the loop, that
would be great!

By the way, the Rust and `bindgen` cases are a pre-merge CI, i.e. PRs
do not get merged if it fails to build. Post-commit is good too, but I
mention it because the Rust one shows it is possible to do even
pre-merge without being a big hassle to compiler developers.

Relatedly, by chance, just a few hours ago there has been a PR in
upstream Rust for a compiler bug fix that only the Linux kernel CI job
exercised -- apparently not a single one of 1832 open source crates
tested exercised the bug. So it shows the kernel is quite a good test
case ;)

Cheers,
Miguel
