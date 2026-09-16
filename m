Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B3D4AB3D0
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582963; cv=none; b=Zwds2i8oWr7FNiJqMe9swr9tUhBYBdqzGAUHgBqGPA29IVI5T/51nT0+LmlpNiu8GVl/922gmtb/6MhIWnnWdRBux5XgZ4HkDTQDR5m6191FOURvsD3jBCkj1Rzwvlmyfn0f6XmAk/nlNE0uEh1MOHd78+AZn2NVyURWuEnrzL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582963; c=relaxed/simple;
	bh=CJl4/tYnVCG1tSYm7J1eyOURkKkuYqP71o2CB21fRdE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=Ngjr5WP2skm5c5536oeAkSX/6yL8qaN9UcBJX7/LbolW1agBP8l5wTqGp77ChylLCsimsXxHvkbmX8Uf5KHR/WMjw58x/VAGDHr2RjasfS9FqBtBTqkjYKpAIHHUupn0QGIvnam4eORXNCsVhJi0x3aix4Tb8Y8zSv1Fx1JEEsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgALukVa; arc=none smtp.client-ip=74.125.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgALukVa"
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e667e3c45so55325e9.1
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582945; x=1790187745; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJl4/tYnVCG1tSYm7J1eyOURkKkuYqP71o2CB21fRdE=;
        b=CgALukVaqpqkb4rWyBCAbwMKYG7RdOfBfg9hp8D2wPyLVNKIVIB0HwKxObpfD43vKX
         a3aDgbZRUho26/q/HzINEx9Zxn+D8n0vF3CtHVfpnws6KGdPg9Q9atVeaQbDPN2tL1ZK
         52/LeBPUcvG2bQgRLWPL/7eB7JHuqzwozGK3sWD+IBiFY71+ntp0EFC6+gAZRdYNZMV+
         fa+ijxS3/Q9b9cgGv3SuYBLTTvCeUccN0Oo9M1fI+JKv+2ViitkPEYYcvdCHJDbIe4Y9
         ywEN1YUdgiFfWliTYvKKdSiSzYVtywcuTVipukw07+Wdhu/Ap+9J54A3ZHSnFyHGtcui
         MRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582945; x=1790187745;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CJl4/tYnVCG1tSYm7J1eyOURkKkuYqP71o2CB21fRdE=;
        b=XwtnQnGf94Gq+qG+59dOsjHiPglIhqemFfWDf46oZi4XUfVBVB7TCQBdjUdW/0ydxK
         BKaNAHUeSCyrdrYPaj1muxWadp7iav31qdQpDFFxo5niS2Yz3xuqyY0e2LFSi5jc7hte
         ars82rMnPEKW02VtBZZ8VKB8CGKwCwXKr5CU/1i4+yhMq2ZncyjhzbkSm8vdilFJ8hOP
         pOWUcFM0KRPT9m0PSGBy4QgEHpYrPguU2KmgASvYVNWhcAMATWhRSfbT25tDlmJG7cl6
         eTjjn9VH2OK/qCiZgXM81G3u1PmSw1oY8ok1pjaHAti+VN1dtmjC0phdrRW12rjE9zNH
         4jzg==
X-Forwarded-Encrypted: i=1; AKwUvBy7wMBWjt3URvk1ukcjTaenjpwPWc1bzrjRWyMrhjANabI3qaNdy0iA6nsKXHzxsyo2MNEb@lists.linux.dev
X-Gm-Message-State: AFuF++mpTAhdXViaIIATeAqP3/C5GdQgf3N2ztad8spm4Q7L9ONMLSXE
	3yxcFX1V41MD9r1kH0En3bQCwBliwjZrHANr3r9QAGpAwbusZwoCDk3F
X-Gm-Gg: AYBFou3T633Ypl7aj52SjB8xMK1WqT9u2A7L27dxcoIt51jYMShDeX3liAjF1WYiiUE
	qWr7cylRSD4o48E5igbNbzhiE2hjpfvbgMV11jKBx1OwZ7iV6fQXDF6LZslgRoW7Y5nJMt9Td5Y
	Fb/DxNU9P0ZgwBBtiPl8ege6jABXqdskF7CMFqSTb8WYMw9FZvA5W8IRzkoZlVOkUu9BuGSEF3t
	tP8ri4QSm2vK5DmRtxQ53Hw42jxU8wjmKs6C1fs95DnCs88KKdM2T6A5z2b2/zlT0agf67uOjZn
	gwnG6YjV/W5bTtRqfcjmTSdbYNIcg9MBZorXmxtFMHa8fKcHJXu277LJym9AxXYMKOs4x0siWoE
	ml8IYkcy8HcptwahnX3DoWkavJvVOMA6oxE9Uvhs+dcRG8kwjU8PxFFqa8FlRwmEauWedFknjGP
	ACwCt+kcKriba3y7I291HGVB3dXTTeUKGg56ySRxIMk0h8XMTTBMCkThVZWrGhEbjvdZZ7COTp6
	BjvYlUBYCE945aZZF3blPRu2BFILqynwhHhg5l7l13yKgwcYT+Ug1EqdkzlHL4/teJAq8KqC+mV
	gUIVgujfkNm8PptCDHRYsCi9xYJ1cn8bWUZ2LA==
X-Received: by 2002:a05:600c:630a:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49eb7325340mr43310555e9.17.1789582945148;
        Wed, 16 Sep 2026 11:22:25 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf3494dsm8424311f8f.28.2026.09.16.11.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 11:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 20:22:22 +0200
Message-Id: <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
Subject: Re: [PATCH] bpf: local_storage: avoid redundant IRQ save on bucket
 locks
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Usama Arif" <usama.arif@linux.dev>, <ast@kernel.org>,
 <andrii@kernel.org>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <eddyz87@gmail.com>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <jolsa@kernel.org>, <justinstitt@google.com>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <martin.lau@linux.dev>, <morbo@google.com>, <nathan@kernel.org>,
 <ndesaulniers@google.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <yatsenko@meta.com>, <kernel-team@meta.com>, "Amery Hung"
 <ameryhung@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260916181001.201787-1-usama.arif@linux.dev>
In-Reply-To: <20260916181001.201787-1-usama.arif@linux.dev>

+Cc Amery

On Wed Sep 16, 2026 at 8:10 PM CEST, Usama Arif wrote:
> bpf_local_storage_update() takes the map bucket lock while holding
> local_storage->lock. bpf_selem_unlink_map() does the same; its only
> caller holds local_storage->lock. The outer lock is acquired with
> raw_res_spin_lock_irqsave(), so interrupts are already disabled at both
> sites.
>
> Using raw_res_spin_lock_irqsave() for the nested lock saves the already
> disabled IRQ state and issues another IRQ disable. The matching unlock
> tests that saved state before leaving interrupts disabled. On x86-64,
> this adds a pushfq/popq/cli sequence and a test/branch around an
> unreachable sti to each acquisition.
>
> Use raw_res_spin_lock() and raw_res_spin_unlock() instead. They retain
> preemption nesting, memory ordering and resilient-lock bookkeeping. The
> outer unlock remains responsible for restoring the caller's IRQ state.
>
> In the tested clang x86-64 build, this removes five executed instructions
> from each uncontended nested acquisition. It also shrinks
> bpf_local_storage_update() from 1732 to 1702 bytes and bpf_selem_unlink()
> from 1030 to 992 bytes. The affected paths are updates that add or replac=
e
> an element in existing owner storage and successful unlinks.
>
> Document the owner-lock requirement of bpf_selem_unlink_map() and assert
> that interrupts are disabled.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---

Makes sense. But did you observe any measurable improvement with this chang=
e?

> [...]
