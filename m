Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4251CCECB;
	Wed, 23 Oct 2024 16:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700492; cv=none; b=jGK7hwvgL5/vH7gA+622qfMAqqcUi70rCaz9clGs5eCoJciwiL5hcm15gqN7MFGvcprW/9+92KnK94Ezjgd9Yoq6Rf2cm6lZa110zOYOLTbJHWrLa/A0lNtxiODXSqw8Ge8RzZa+GWVktKZrcnhYwMq6VWCwawX4HSdBB/61I/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700492; c=relaxed/simple;
	bh=5KduzXwOb/XgpyNfRKXJyAE/X4V7KASZMU1Pyj7ApSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLsbTbB93BwyCeOwJsbY/UI5mSMGYvvTysV5XHl7PX+vI+R7bkoCqbhPhofWRRrrXDbqDatbJ+fJPXaBgp3zyfAaIaUYKGWp95ti7k+2c6k4bXa/zQ9OHq6b9bpql1KWzapsL+J4h4j76zWSUCng7unhsN30Yg6zS1RMT+zVv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpf4Mu4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpf4Mu4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29336C4CEE5;
	Wed, 23 Oct 2024 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700491;
	bh=5KduzXwOb/XgpyNfRKXJyAE/X4V7KASZMU1Pyj7ApSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bpf4Mu4ktxJS3qhtIbwji6/6XRFSkssL2rlt4yBgmropBU6AdZ6yV5QG539sWuvzV
	 ddD/NmEz76FEtAvQFH+XdeIt9sqeMJmc/ucyFYxbXR/Sk4RM16gPO1fy9M4o3PaccD
	 NfuvCBP2HnMi1pCCN4Av8ude2PELd+ksEnOoSFBaaFS/ME4viHznlgPo0sHboX8mfu
	 uWsoIBL21KTuaBfI7e/1e9Y6zZYQXkX9TzdFA02vgFIy9NVa4rPJsun8ZLffu+eIM8
	 iR5OVm8spT8gxQZXigShF0oZv3a4YOJvMbaaYPLkFcyXLqvqxGDi5kg5etgHWI1EWu
	 vrit/SaaSjYnw==
From: Will Deacon <will@kernel.org>
To: Marco Elver <elver@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	llvm@lists.linux.dev,
	syzbot+908886656a02769af987@syzkaller.appspotmail.com,
	Andrew Pinski <pinskia@gmail.com>
Subject: Re: [PATCH 1/2] kasan: Fix Software Tag-Based KASAN with GCC
Date: Wed, 23 Oct 2024 17:21:21 +0100
Message-Id: <172969587091.1722746.16856042092493192617.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241021120013.3209481-1-elver@google.com>
References: <20241021120013.3209481-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Oct 2024 14:00:10 +0200, Marco Elver wrote:
> Per [1], -fsanitize=kernel-hwaddress with GCC currently does not disable
> instrumentation in functions with __attribute__((no_sanitize_address)).
> 
> However, __attribute__((no_sanitize("hwaddress"))) does correctly
> disable instrumentation. Use it instead.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] kasan: Fix Software Tag-Based KASAN with GCC
      https://git.kernel.org/arm64/c/894b00a3350c
[2/2] Revert "kasan: Disable Software Tag-Based KASAN with GCC"
      https://git.kernel.org/arm64/c/237ab03e301d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
