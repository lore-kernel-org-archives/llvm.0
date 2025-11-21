Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89EA33E34D
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716093; cv=none; b=mXWjOpNtOFKfoDhKh4YSwCxevf/H3qCvW/ilLfaR2Mddz8XHOxrqlY+iBlTYtaAhnQLNlvOuxUBegpFDOpFuIt7p163J6lHmBqK0//7bmE2/OIBmzfIq9o86T0WX4TuWMe4GMU0iWay1ikAdO7tHWhbrf8IGTqhJ1BReIQqsGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716093; c=relaxed/simple;
	bh=uBP0W7YNdO57kJqyfbG/oxzENxCPSzspfFTSGKkz7BQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H0Tgy8xBRIB4uNtmpayE/YiLYllhMm93Jy2UTRV2WJlObB74NtSSBDEINKo3RUq3EYF/xtIlBKHXtsy5/zaHU5zkQABVX4Uj/eMIWSmw00RkX+n32ypUyzRFpwh/SAfG5SFQ+5vL9zfZ0eoBiwVShuqoiMoV9KWULupD4bqc+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=34yPio0k; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="34yPio0k"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477563a0c75so9915755e9.1
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 01:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763716090; x=1764320890; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=al+Nw9pptU9WC9PnBGXiDkOKAM9ETnNOvRMBFz/7sF8=;
        b=34yPio0kFqRHqQwwad8gqFHLAianNO+vbPq7n8d7sq/n47j5puE/3t/QS9O5L3S2d7
         xSVVU3h5Z+4n2Swy25fMG3Iya4CdxLbXs4s6BBWc+OoIVreI0ak6Ba1cBT7gwoQrO7Kl
         Fp8ag38Au07fBCtpf3Dvd82rEqpHQA278turQTQouLbLGLOCj4dQni3w0L06o+vKnm7Y
         foQsIdLtjJdbAqgLWuA918BLq9JGQeWIRFbCgbzxf59lDgQGaF8o/Lv4TEGcPYONFe/S
         M10u2rHC8AMJLpHGmTFxJP8BaQ68W9AhhRuvY2jXYLuJioDDA3g6/mogYioc9hOIMxUT
         sb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716090; x=1764320890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=al+Nw9pptU9WC9PnBGXiDkOKAM9ETnNOvRMBFz/7sF8=;
        b=pODQiEpSDUi0mWNWQisx8tQSDnQPrV+V7XFHuAHpQDwywepf7BmwQ0XDRKYai0/TMP
         cGeReccGLIJ3sbVEvWU6r4nQLBmG+Bb99j2yFKZ9VRt3hvq3n+eH2L1BHjaYE89To2LT
         TlXn4jTm4UvE4pFZxvrFRhEI0563pu+b01kYN/qASGK7fbDWoVZtTpyQRTEmiwCKcgfr
         7/41uymF2fKIOCN7LJYnX1OVhoTKXuJQtlIP9aO+RPxiBzK3hiuVaGjDnxODcro9MTTv
         DoPTCz9oFkW81qZb6CJYZf/c9jajJmQ3h0EHxz9MNVpg8lBLyrSkC7kdNNRM6aUkdY+k
         OT2A==
X-Forwarded-Encrypted: i=1; AJvYcCUS6ksGZnsnj9X4gRtnSBzggiFexkg1Xmx6JHdk4QAfK3/pOO82jtO32JOl6WpxYjTHJksO@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcd/lYW/ubLfmT8f5gYnLXplz9JPcVWXxSFunam+cm+xc4Ay5B
	5EANznCN/JFS/nqyOlqzoFU3byResNrA1Pm8qX+Cbe9y2da3jbDJmkHr8qcK4l1JABL8PgDsZ0W
	q/0CqSABrupSsLbNeLg==
X-Google-Smtp-Source: AGHT+IEdrDcqbH7vAlZv1Rn1uYyJ5HQB5sQCRxjZt52n+6AQMlVKXOnSQHUlYVs8jycmYRM0JYcUHwiCmoajA+c=
X-Received: from wmbjd14.prod.google.com ([2002:a05:600c:68ce:b0:474:979d:a20d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45cf:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-477c01eb9b2mr15025395e9.27.1763716090113;
 Fri, 21 Nov 2025 01:08:10 -0800 (PST)
Date: Fri, 21 Nov 2025 09:08:09 +0000
In-Reply-To: <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
Message-ID: <aSAr-aA2U26lr3iI@google.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 21, 2025 at 03:13:16PM +0900, Alexandre Courbot wrote:
> On Fri Nov 21, 2025 at 1:41 AM JST, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> > commit: 01e345e82ec3a5a7edeb9fa0dcb7fd4b0e5c534e [9676/10599] rust: num: add Bounded integer wrapping type
> > config: loongarch-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511210055.RUsFNku1-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> ld.lld: error: undefined symbol: rust_build_error
> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u8, 1>>::from_expr) in archive vmlinux.a
> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u32, 4>>::from_expr) in archive vmlinux.a
> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u16, 8>>::from_expr) in archive vmlinux.a
> 
> Mmm, I don't like this. The expressions that are failing are extremely
> simple, for instance:
> 
>     Bounded::<u8, 1>::from_expr(1)
> 
> So if the compiler is unable to assess that this won't fail, this might
> be a deal-breaker for `from_expr` and we might need to remove it. :(
> 
> This would also mean a lot more runtime checks when working with
> bitfields and registers. Or can we assume that this is a compiler
> problem on this particular architecture?

Yeah, it sounds like from_expr() isn't going to work.

Alice
