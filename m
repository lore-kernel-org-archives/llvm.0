Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8AF3A9DAB
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202000; cv=pass; b=k5riaYNNrtAXMxI0zwCXEBkulIQ61d30SLDiZ4E1Z6juYwVETK/aIy0/8qpflrcKIcfaMPSGR/gwsFysJ+pKIh8P5VdyiWBXiU9YlFjuYbpoe4yNIf2wVU1JpI86fbwUggV9hwl+cHzmcuhoSYdVEcvvfPEtFk46t7ZAkyk6oLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202000; c=relaxed/simple;
	bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX7oThpydnUdGJYzGuNpl3ALt8fYWxyzM5btULoZMWr1LCP4RbQFbAZApMsbxJ2Lejkl8rGuKL0tLfcnONJLLdlJ0CuDiMM3Yhjc5pSMe8OaTeCL++gTwT2knkMd8k9HZWFwlgoVX5seP3GgfVm27BQT7flxMnSJpNOKU6fofmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kKWKsXIy; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kKWKsXIy"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b71515d8adso6427657eec.1
        for <llvm@lists.linux.dev>; Wed, 04 Feb 2026 02:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770201999; cv=none;
        d=google.com; s=arc-20240605;
        b=Tv/rpVffvKNun4Xi7kFT0MNxfU/KlYrZdQ0S/bCK8eK3lwnMNip+jVtSRoGAXx5DGq
         RTq7Opn2nAjDge0T5A52OlrZZe4uV5IEBCEuMZscRRhXHk53NZOarKBE9y9fvJDJT257
         1/H6k/0MyD3fVEQ1dE7pGUnDJfZsq+jp0tk+OUoKmQAULavNK9OmuBfXuBBQUbZxEKNi
         +3O4C0GBDKoxA0uQBSKnHmXi0bnq+eM8lj+pxBjKsxy4REJvV8MP9KTJbM5F2RM9IVAg
         C3GS5XDBNBd3Gd9nCWFmLTK59dOI12w8NFMQuLXA9MVNjLTh1DDn9AK84ElOVm6ZEabg
         nDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=;
        fh=z2BEcZz9VMB3d88PhDGgrHLQbf37VhzfvJbc8Tzrxe8=;
        b=B6Md4qfWTBYDTx6qZlqCwD55odnMLSCVvht79Mo+MMvpRDncYi66l02PYe1PWJX0CG
         oucNoHGq/1DkcEQ7oDWHBst/AGQ0j6xl+s6+/TSv9XyjwVq54q62Ya9GAfnaK8mU4WTC
         Y5Z0Deb0e35lqp+AKOV/RKq/7ObTH24zz986L2UlEEMEChJ6H8nKV7WwJNrPZmii2/mz
         ft2wjYPq2btYLzylbncewegNKQm+FgYCJUtPnKitEmnO8GOnWL85hycnu9x8BYq03c+/
         W8gg0HlfZQuY7+U1q2FNM/WjeBW4uMDdFjn4Lz7g0C0jaSalqGtQbtCqPmPAMDAsOPYe
         Kc7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770201999; x=1770806799; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=;
        b=kKWKsXIy9xFgRhTtZYKCB0DtZbBbPbKFMFzQjCO6pnWjbtCliNR9NBkixFK6Zm96Dm
         UcapNSoIpd+oTeECDrbB1NQgkLMp/ysDbAD4dAKPbOTYvXTqgHTmljy+MnP9nY4VJT4Y
         YDvBo7RohqFMjkr5QREbpPlzt72m5B447KdpFVH9E8WHRbg/O5FGAP1aObk4Fz6ZXlC/
         vHF1xjnSWoNxqRCs1/va+T02XuXY2s7Z1vZvd2G0Qp5BkVuOwuWxG6d4/fkw18je41qn
         5yKFPVcJGObOuRHH+SikjdO9BYNZ4g1EZmMOZcT/zgFUBNplI7N7/l4OgqxphlZZwqzN
         nILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201999; x=1770806799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=;
        b=TCI2iqkR8Ldzj+k6ku/8wPeEaYL5yzlesZUUcrjow/Fteh4rgJzjvJqocKsZbq23/x
         EohOC9Rv1YKR8/pglPQ3l/Lqq0n5xVxzuL4SExoD8UppEfu526TF7LXJSMIMacuC8MOH
         kvaKABH1RvkafGLvApIdWEqer2mGNQgxX5Ec9I/pdY16A4cYYNoJrcPook5N0Ca6BtzW
         wBmMEd+mvh4uES1nAX/SQdQQL7x3eTsg+OjuKrlankstoSrS4X+jX1GguzC+kAx9kIy8
         x+XXcprRV+wd4Iox6Z90dzuHK9hnWSfFjw7pfel90/MbtA+inIAWKj1b0YE6tcP74qIJ
         Odcg==
X-Forwarded-Encrypted: i=1; AJvYcCXER0wte0eaZIfNxI5sC6zdzeE4i/KsrIs4CZRnctUa4vsjhjXJDWZDXjc+s14MvczUozM9@lists.linux.dev
X-Gm-Message-State: AOJu0YzWsfEzWd26YPW8LxRtY1yDWyamxWok1oRcCHjLFXxe0qD1DyS1
	+oazsFe6oJ3oYpC2qNimX48kStVN0wwFnmDWI9Of8R55VW+ePcM8qHxLG894kDlkqeTxLs78QvW
	5qnnaidxcyrzdBmWZmrNV+f0p5O0kdkEz/g65yUE+
X-Gm-Gg: AZuq6aJGuvA3K2flZQBOINIkcmPdanBjpSolgZraRSEW8np9vIXjbzh08Zd5yMZQzOp
	eXVPNyGROWMqwRkE/nyRkNsY8Uz4jctzSCYTlhm7vTY4oKO3iNBWFG96C4JNUXs6K6oI7xCaszR
	3VvCJq3H8jFzxZ730Nuk9ABzPR2ymfTzJxZWpuBCTfRrdqugHHRtxHFhBhnNv0N1rhoiYshcGuC
	WMiOQcda3WQcuzMV2RK/zUKBlKU6RcTx2Twp73LwTRYC2g+95ZuNF/2uKZlVbX4/nBMd0B851YQ
	RYKwt5g55944+FCJG9lhDAoz9Q==
X-Received: by 2002:a05:7022:eacf:b0:119:e55a:9bf5 with SMTP id
 a92af1059eb24-126f478dab9mr1212137c88.17.1770201998956; Wed, 04 Feb 2026
 02:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin> <aYHgNSF5a3F7UGU_@willie-the-truck>
In-Reply-To: <aYHgNSF5a3F7UGU_@willie-the-truck>
From: Marco Elver <elver@google.com>
Date: Wed, 4 Feb 2026 11:46:02 +0100
X-Gm-Features: AZwV_QgT8kiMwUIl_me4txlYVSU9o0fAA5wwpILgXvkftY8OJh5BYQhTCavfUPo
Message-ID: <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Will Deacon <will@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
[...]
> > > What does GCC do with this? :/
> >
> > GCC currently doesn't see it, LTO is clang only.
>
> LTO is just one way that a compiler could end up breaking dependency
> chains, so I really want to maintain the option to enable this path for
> GCC in case we run into problems caused by other optimisations in future.

It will work for GCC, but only from GCC 11. Before that __auto_type
does not drop qualifiers:
https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)

So to summarize, all supported Clang versions deal with __auto_type
correctly for the fallback; GCC from version 11 does (kernel currently
supports GCC 8 and above). From GCC 14 and Clang 19 we have
__typeof_unqual__.

I really don't see another way forward; there's no other good way to
solve this issue. I would advise against pessimizing new compilers and
features because maybe one day we might still want to enable this
version of READ_ONCE() for GCC 8-10.

Should we one day choose to enable this READ_ONCE() version for GCC,
we will (a) either have bumped the minimum GCC version to 11+, or (b)
we can only do so from GCC 11. At this point GCC 11 was released 5
years ago!
