Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7950E5B8
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706104; cv=none; b=FkXbuU+iwzqQmVe0f+cAjTbDaNjSyhSvbCtWKSLBvsQV/N42CiqIGM0HglMpgRcreBevdCR/gcEVItVqxshzGGILZFGe3FqADQpKyCwpxVUsQXSYl0mIs7Tr/cCVf8UxVQW4fi7yJNJLrgbWG0wGhoy5XWJXWp1dlbHHGJV+4+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706104; c=relaxed/simple;
	bh=CP4jlLryAjoI33ocElOZhqE2VCS2aVzTcIdup6lEKC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e74gQgzJkNoRdjNvFJZ3hnNfLVxuZ4Rn+rIYtShgrPgEWD/ybY7MtNAJTCPnfvqEK60HXF6h9DVgJvIbTwUiZPB0T5qeqoaudOJDOY5IroHhAqjitdoiZ4T+i/CLch7W9MvdYxJPPzuErZmU0JF7CNdKODE8ZSOdDmbE9UtLUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phLar3Iv; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phLar3Iv"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afbfe4247so42039f8f.0
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790706101; x=1791310901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asWxT5bycUxVtD+OugmEsRzTNrfaIi0ZXtMhr+mg13Q=;
        b=phLar3IvAguLv7YSM2Jw0cNqgdWm0TSOJcmoM8U0cpS1KSQkqGxlAgqTfTLb5+AQWn
         sqqpRbUJ5zbfSpfKf0wdUzU7uLHWiFphZZ3Uc1zd4IiBV3cXS4JCnGPM3VvzUCYaWyY4
         HWgRJTFUa5URGjh0aGIJaLqteaJDKLWISYskeO3dpgJOHJ+/5bnvb5SZFae7NThs/Uj7
         Gxx/C0bVl+QbRcZculrNFuOIQvFW9QU1lFsI9SHh2MU4nrJJWGkbNfh7gn/snlb2gxNJ
         kj+mA8xSOSt/va1Gfl0bEw2K85VSTfUEIzbzNrJN586sj7trhGEpOVt0laInXfInhhfS
         tGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706101; x=1791310901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=asWxT5bycUxVtD+OugmEsRzTNrfaIi0ZXtMhr+mg13Q=;
        b=xnmPZ+HEIv/ZYnUYTF2F9MvJJpDY1zFtu+FIWy2cxvEolxuFQFRC7w0I7M47evFItm
         r99t0tB6LJ1X6p1riM3xYjkBmmg3+vUuZuenDlQLOtd3Qpk5WPi6G43I4Ur+xdjsMqe9
         b7ebI7+0DNq/R5bpc0wgF1O0Iq+d6ylboekXanZVqybwZWVo/lIUp/2VoE6NmLt7WRb1
         /1aucZ21/Byh3VOjC0JEXgKMPf6MlCNYaQixbLM1DN+5TXOVE7bHQ2AtCX8ijI1dtW5V
         fIzGLERReAgu3NmEWtXiVAw5nj9y4fhB1Iv5Haq84eNBXEorLX/UOKhixu4XoiSSm1aK
         RMVA==
X-Forwarded-Encrypted: i=1; AKwUvBy/088jTUUdg3h7kD8OTPQIfyHatnAMC4uRHSKI6GA/Xgl7QmfnC8Xh4m1U00fLv1qUwiR3@lists.linux.dev
X-Gm-Message-State: AFuF++m/s6gGSPQN0KkPnkDZJ8nnNlJ3l0iMp2bcPfHJ5Kr/29fLC0AP
	zc5Yem3ZyX8lBjQVn5KmMuX1827v332t322Z44Lhwplgjq6TWak8hjOy
X-Gm-Gg: AYBFou1plqcLW/ocKkzpsbrU6JH0JFpUGUYSFt9chjP2miapm+KbO9sKPvG4WXz+ktT
	01Io+IWLP754uFLdDq7argHWexmUv62d7UZTsuze+1E2yDIXa0tsxtMojlIP1cryWF1z6K0TvsA
	mBOPDT0aVL+Yq9WzmwraLXyBgNUNz7XShkKbbTDBNurnmVcIhhQbfSga0eRo0DGAd5Ah1P2T3Rm
	a9Po+5AwUCnuRDbE17Asg7E0+0p47gLIW3MHS7g7kDByFNcUUV0c7h+g56kY9sqkp6QG2LqKDmb
	680I5bI7kx+kplvnxi6TKuk3SiEFTxcArLl9qw25xkNyIqNxA3HgqaX4GhOueCmsuUHAbn8w4EK
	GPzrK+GJT7dLH36V6QU/iJte5cBB1n4rTWN+9nw7RfaimFGhJB0y1XaO18Pog2OWUkfM9Tg3ceg
	ztVSH4Y0GGcHCDnGmdh+JrMxqq3Pk5zS4V5SC+ov9m8wzWU5crRdtne3jJ+VvYxySreG0wg9qVB
	5sh9EcwEZnIMJf/GLrcCK8nt5fGmcU=
X-Received: by 2002:a05:600c:6986:b0:4a0:87d:81e4 with SMTP id 5b1f17b1804b1-4a0087d8302mr80719615e9.1.1790706100902;
        Tue, 29 Sep 2026 11:21:40 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f6c05bsm283385e9.4.2026.09.29.11.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:21:40 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: KPrateek.Nayak@amd.com,
	Vishal.Badole@amd.com,
	justinstitt@google.com,
	kayracizmeci@gmail.com,
	klaus.kusche@computerix.info,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ricardo.neri@intel.com,
	stable@vger.kernel.org,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: Re: [PATCH] sched/cache: Honor asym packing over cache aware scheduling on hybrid system
Date: Tue, 29 Sep 2026 21:21:37 +0300
Message-ID: <20260929182137.196669-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d7cd3f7d528dff79d2a702543e7d97a44c0c078b.camel@linux.intel.com>
References: <d7cd3f7d528dff79d2a702543e7d97a44c0c078b.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tim :>,

> > Let's say when entering can_migrate_llc_task(), dst_cpu is CPU0, while src_cpu is CPU1.
> > And CPU0 has a bigger asym_prio than CPU1. No SMT. When entering can_migrate_llc_task() and sched_asym()
> > from there sched_use_asym_prio() returns true without checking if the core is fully idle or not.

> sched_asym() does check whether the destination core is idle in sched_use_asym_prio() for non SMT domain.
> 
>                   (false for non-SMT sd)           (check idle core)
>        return sd->flags & SD_SHARE_CPUCAPACITY || is_core_idle(cpu);
> 
> That is also a pre-condition for setting group_asym_packing.

Sorry for not showing the code earlier, here it is: 

static inline bool is_core_idle(int cpu)
{
	int sibling;

	for_each_cpu(sibling, cpu_smt_mask(cpu)) {
		if (cpu == sibling)
			continue;

		if (!idle_cpu(sibling))
			return false;
	}

	return true;
}
static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
{
	if (!(sd->flags & SD_ASYM_PACKING))
		return false;

	if (!sched_smt_active())
		return true;

	return sd->flags & SD_SHARE_CPUCAPACITY || is_core_idle(cpu);
}

On sched_use_asym_prio(), before the idle check a CPU without SMT returns true.
But I'm actually wrong on that one because on that one we're laying
on the idle protection outside to the CPU. If there are not any
other brothers, and I'm idle then my brother-family
is idle... Ah I messed up describing this.

But is there are any idle protection outside? I couldn't
find any. I could be missing something tho.

> > And sched_asym_prefer() comes back true too, so sched_asym() returns true and, we just returned mig_unrestricted.
> >
> > I could be missing something, If I'm not tho is that on purpose? If it is, the last paragraph needs to change
> > since it says that "asym packing tries to migrate task to an empty core" and after that "higher performing idle core"

> I think I did try to point out the idle core aspect in my commit log:

> "When asym packing tries to migrate task to an empty
> core that has higher priority than source cpu, let asym packing win.
> Moving tasks to a higher performing idle core will buy more
> performance than cache co-location."

I know. I was trying to say that if we're not choosing an idle
core this needs to change.

Thanks,
Kayra

