Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C242C21F4
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539777; cv=none; b=bCGxUEC5uQHiBJxrMh2KkEt5E07oYvY/fWJIYxYg/o/nVSnsEdZNBN9pnqAGXg6vx1iqCTct/dVvhczHpSiOeoX2jgPWNuoQDRQu+NqStVNdaSNbj1OPojli064CcrlIMbjk0a413HVnuEGr8oGB1Ml/e5XdtOe5+bxBEMIM8OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539777; c=relaxed/simple;
	bh=Ugr7IgQEch7CkBgCAdZs0bbGqpAGoYyvZ+rvrv51b08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9WeX3geRxJt3L8xWbWEUGOqkhvJXYpgHoEJBTUssK8CHPNkQgHBd8SsAs5f7Bxd1YlQNu+xaehAIjlczPV/W8VKoVx+SiZCo5WNzuwYE2r17pcB76eebq518VTstDdaWmWNTL9gtU+B5KR2Oy1oZNgE6CO+bOqGjPXVse0p86Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bvu1Hrp3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bvu1Hrp3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33b9e574734so74096a91.3
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539775; x=1761144575; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugr7IgQEch7CkBgCAdZs0bbGqpAGoYyvZ+rvrv51b08=;
        b=Bvu1Hrp3oCub7rqGqyD5mX2I0IB1fY/XJ8JL2RVVLloQMWghyynw1Ap4TZjI6QzrWq
         QN5op46mcEEN3xhm/rRuA/eh2BoCvrbityvfiPxh3Sesw4YSfilSV6hPTLA+h1YhE/a7
         rm2BrhnLuUbkCrICB9ya+NBQj7+ADzyzXihutHnwCZVEIa8g7II+32bxECnAm7jV+srS
         kohhOnwJirdyDRRBqkACIf9MTdqwRFkbqtz9hc/pguybdxmRe44l0vSsLDbEyBQtVSIb
         Rs7VbvnEuiI9sFC8HMjX6pWYjKcTcvCKlBMm3tSJnYlPHpvUcl2j8n5hdMvd3uolMvLg
         3tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539775; x=1761144575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugr7IgQEch7CkBgCAdZs0bbGqpAGoYyvZ+rvrv51b08=;
        b=fZ3fKSX3BENPiEwPgw5ZLDKRTuU/y12UI3Sm7EviSoW3hDCNypE0pNmNu3AgHaUlNT
         EebjDo8mu8Y1y4gTq4TQP3PpsX0Zelgmh/4zIEJnuOiderSMKKzN6Nq9hiEEZCRnazQj
         PReuzFtxm46edg7r0bV4iDyoWG+VfcRCOzKS+hlTueKJD4cMWymtk9hKPpAUJVNBnXJ3
         tKutenWYZbqGKMRVIqTbEoM43uf2sceghw85KkAj28e1cMQyXux24H8yDtjud1LA4o1+
         62t3YdODqHdvRGI+KufLuZE0Ta2BQDjhS1eQs18UokvnxJYaPXvWlJ9wskVO/EBi3OWc
         hHHA==
X-Forwarded-Encrypted: i=1; AJvYcCXUTERm8WOy542z+1DhnhuJ4OtDedOaloifhg9ORucCsML334ROr9XcgTnSa0/WPbI8YNnV@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp+LTAp0/I3XX/RAIgRymT+Q29fg68/bXN/L7yE6T7EuU+eXCx
	CA1SPrTRwEm17XBt7uX897S54ZBN86zB1tnkpIju/1WFmpgz4ynoO4DB2+vhfDxbuOHV7YDI9SO
	zlm84Dv89KsN4OIGktO7F4f1r5RW7LB0=
X-Gm-Gg: ASbGncviGm3f8QMSczKg/27GyTT7luCU/DK/A3wIWHO6dnLedN29e3sskR++R+jjcNH
	BsU45ULDW3FP81pgLhwUsIN/MOHJjh9PEdMADqUOI2uZmhP96ZxFbxsABgGbZ4pdTv9rVwHCxF9
	u+Uvbpjjc6CJQm5YzeapUFQR/vQFvQe+mUK+qvU6QEB0Xs2KIdXBefz7QDvObZw3MNKo74ijDSn
	eXXeGVfBA8+53m5egdTSrVYRng79Fe8OQ2Plg==
X-Google-Smtp-Source: AGHT+IE69LKH/NE6WW9KYSfgI5K8eXDRrZSpNwn7Zg+fzj0drMI9U+jkzmrowvG1UrutOgnm3kdrLWQIhWCejBy9GBI=
X-Received: by 2002:a17:90b:3ec5:b0:334:29f0:a7e4 with SMTP id
 98e67ed59e1d1-33b5138e32cmr36496555a91.21.1760539775424; Wed, 15 Oct 2025
 07:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912195339.20635-1-yana2bsh@gmail.com> <20250912131722.74658ec0@kernel.org>
In-Reply-To: <20250912131722.74658ec0@kernel.org>
From: =?UTF-8?B?0K/QvdCwINCR0LDRiNC70YvQutC+0LLQsA==?= <yana2bsh@gmail.com>
Date: Wed, 15 Oct 2025 17:49:22 +0300
X-Gm-Features: AS18NWC8jphTpk8XmfrNi0U2OyQEvZMStTycvFUqIt8mxiSBHWFeGjYnyBqSIBA
Message-ID: <CAEP49o+-=HeW4NgB5a0H6gM9tPJg=oNeUA1iCbXq_1qZPPaGnA@mail.gmail.com>
Subject: Re: [PATCH 6.1 00/15] genetlink: Test Netlink subsystem of Linux v6.1
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The motivation for this work is to improve the test coverage and
reliability of the Netlink subsystem, specifically for the core
af_netlink.c and genetlink.c components. While the subsystem is
critical for kernel-userspace communication, its coverage by the
existing selftests is quite limited.

To quantify the improvement, these new selftests achieve the following
line coverage (as measured by gcov):
- net/netlink/af_netlink.c: 84.0%
- net/netlink/genetlink.c: 88.8%

Integrating these tests into the upstream suite will provide long-term
stability and make it safer to refactor or add new features to the
Netlink core in the future.

=D0=BF=D1=82, 12 =D1=81=D0=B5=D0=BD=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 23:1=
7, Jakub Kicinski <kuba@kernel.org>:


=D0=BF=D1=82, 12 =D1=81=D0=B5=D0=BD=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 23:1=
7, Jakub Kicinski <kuba@kernel.org>:
>
> On Fri, 12 Sep 2025 22:53:23 +0300 Yana Bashlykova wrote:
> > This series adds comprehensive testing infrastructure for Netlink
> > and Generic Netlink
> >
> > The implementation includes both kernel module and userspace tests to
> > verify correct Generic Netlink and Netlink behaviors under
> > various conditions.
>
> What is the motivation for this work?
