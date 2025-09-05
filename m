Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D2321D011
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757052104; cv=none; b=F5YDXsizwGEetqUdkktw/dC6SY+3O/t/CsG+C81rvcigsWapHayckd9lECzuOR4FhxqFm5olvbxO5jYUWT7+vXvHsnARjxTJt2eRBYNf7SKUxxFiHVAvzAXdM8IJu3bB2pu25JrlqrRE44n4/XZm8zOUK7i38mwfDzd6DCASPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757052104; c=relaxed/simple;
	bh=3knstRovj93xkUytRtrTV4g+ye1JGAHeEex24QMnCko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=inYYYIMIOU3FWWRgJX0KjEo6K0c8xDTwjgIJmjjDZQlNltTyz7Wctd1PY+1/4iRzBPTBcSQes5/NRtA/rnVwf76dpTsNiR1KWhExpgt+yL+NgMBOMyNnWH9iszQnjmvONHF6HkSm547q+Bxn0w0IGnyqksfN1qmJu2bdQpGX/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jg92GSH6; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jg92GSH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Od
	8KnfSygcUPovid5hxz+wVBe3lxMm/XME01VPFpLt0=; b=Jg92GSH6RVWVFg6wot
	74T4jMndPS0t3kUMA/e91Gfc+bTzmRNco9fP5qES/eQJ3suWB+LvaKEHom6y73W/
	V/jJ+S74HkuxsWWuAxddboyIIt84XeTJa/spfyhnxLd7NbNjnm7MptPz7f6bkfvy
	g0oogz6hwh/V16icIufEI9Cwo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3eap7fLpok1QJGQ--.24371S2;
	Fri, 05 Sep 2025 14:00:28 +0800 (CST)
From: Feng Yang <yangfeng59949@163.com>
To: eddyz87@gmail.com
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	martin.lau@linux.dev,
	sdf@fomichev.me,
	song@kernel.org,
	yangfeng59949@163.com,
	yonghong.song@linux.dev
Subject: Re: [PATCH v2 bpf-next] selftests/bpf: Fix the invalid operand for instruction issue
Date: Fri,  5 Sep 2025 14:00:26 +0800
Message-Id: <20250905060026.1285979-1-yangfeng59949@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7a037c0579e1cbabb83935c05c24ddbc6bc43327.camel@gmail.com>
References: <7a037c0579e1cbabb83935c05c24ddbc6bc43327.camel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3eap7fLpok1QJGQ--.24371S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWxWFW5CrykKF1UCF48Zwb_yoW8JFWrpF
	yrWr1DKF4rJFyUJr13Jw4aqF1Yvw4SkrWrGrW8Ar9rGr90ywsIyFyxGryY9asIgw47u3yY
	9rW8X3yfCw4qyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRcTmhUUUUU=
X-CM-SenderInfo: p1dqww5hqjkmqzuzqiywtou0bp/1tbipRO-eGi6aW8nQAACsA

On Thu, 04 Sep 2025 08:48:45 -0700 Eduard Zingerman wrote:

> On Thu, 2025-08-28 at 10:01 +0800, Feng Yang wrote:
> > From: Feng Yang <yangfeng@kylinos.cn>
> > 
> > The following issue occurs when compiling with clang version 17.0.6:
> > progs/compute_live_registers.c:251:3: error: invalid operand for instruction
> >   251 |                 "r0 = 1;"
> >       |                 ^
> > <inline asm>:1:22: note: instantiated into assembly here
> >     1 |         r0 = 1;r2 = 2;if r1 & 0x7 goto +1;exit;r0 = r2;exit;
> >       |                             ^
> > 1 error generated.
> > 
> > Use __imm_insn to fix this issue.
> > 
> > Fixes: 4a4b84ba9e453 ("selftests/bpf: verify jset handling in CFG computation")
> > Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> > ---
> 
> Hi Feng,
> 
> This message felt through cracks a bit.  It's a minor thing, of
> course, but there is a legit question of how much backward we'd like
> to support clang versions for the test suite.
> 
> Could you please provide some detail on your build environment,
> why do you want to run the tests with older clang?

Hi Eduard,

Actually, there is no specific reason to test with an older version of Clang.
It's just that the Clang downloaded from the source is this version,
and installing a newer version by myself would be rather troublesome.

clang version 17.0.6
GNU Make 4.4.1
gcc (GCC) 12.3.1
linux version: 6.6
arch: x86-64

