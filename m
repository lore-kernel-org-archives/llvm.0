Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB70A41
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 00:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858077; cv=none; b=gjSUw3p3bmFaH/nklEy0hkLakIIh2+DdLD9/9Xb6pnEUsOVJpizSMxJZX3kcEa4zAkJdubcHNAFMrpWHep+LVOfnpq0CPQUcOrmFMzQ7ZD9AkRDvJknfEpQ0A9PxMWpFRU36DrkgGcuTgZNVud6OatMX8QVIPLkHvMf9Brr+N7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858077; c=relaxed/simple;
	bh=1vCILVEyGVSQU/BaNJu/07EPmz9jNtXTnLe2Mcgq1i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mGGWYaDhVxPpkzyQmNmGUOtjDudezT5jmneAcS1wPwqvlIcIvCKCQ4Oc2C9rxQj+E1UJpF8Wwwr4NR5SgNYPN9xeXvlblkvK4Atv7hGp9PtFY2axMacyuY09e2KjPiWkWFzp5DKmmHXXRcy8eATXjEBnRHx/23EzJGgGRFOmhuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcIji30N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcIji30N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD23EC4CEED;
	Wed,  3 Sep 2025 00:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756858076;
	bh=1vCILVEyGVSQU/BaNJu/07EPmz9jNtXTnLe2Mcgq1i0=;
	h=Date:From:To:Cc:Subject:From;
	b=bcIji30NQLj4HZqs6v1qTXwNK1BeyyWIfPLIMl45vHHI81ftfOf1Yg2+Jkg1VdcKG
	 cVadxdARo9w0sf1cOuodyN85pJmc6S3Lt9YfwjakVHevGsrdswbHYwiGB25WLarbBD
	 scZ/qKs/DW/eK3qW8LhnqdBm7WgIxdzrl0ff/4Oa5WpLXpX7t+y2K0coTvGGqKmIoA
	 vOYt7/F6iviRB6yoAi9Eop8UXjF+5hl4Z3OR+IY7KVm1blGd0vCloEiSbI+ZYU2jP9
	 SkOZO8ZuMzyrf8xygcYg0+aYukD0j2BstHaU60z1Tem4IoWGSbkEZ2IoWluDuJK8Sp
	 cvZMmb4An4IXg==
Date: Tue, 2 Sep 2025 17:07:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, llvm@lists.linux.dev
Subject: clang-22 -Walloc-size in mm/kfence/kfence_test.c in 6.6 and 6.1
Message-ID: <20250903000752.GA2403288@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi kfence folks,

After [1] in clang, I am seeing an instance of this pop up in
mm/kfence/kfence_test.c on linux-6.6.y and linux-6.1.y:

  mm/kfence/kfence_test.c:723:8: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror,-Walloc-size]
    723 |         buf = krealloc(buf, 0, GFP_KERNEL); /* Free. */
        |               ^

I do not see this in linux-6.12.y or newer but I wonder if that is just
because the memory allocation profiling adds some indirection that makes
it harder for clang to perform this analysis?

Should this warning just be silenced for this translation unit or is
there some other fix that could be done here?

[1]: https://github.com/llvm/llvm-project/commit/6dc188d4eb15cbe9bdece3d940f03d93b926328c

Cheers,
Nathan
