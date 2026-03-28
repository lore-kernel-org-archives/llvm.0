Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03A31282C
	for <llvm@lists.linux.dev>; Sat, 28 Mar 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774705209; cv=pass; b=R/AIvlnHOOHjASvBbpEr+DkCSO4bP5QTZTBkuTKYDhOdBSxi4OT/kS6CAxybuVrZlAzEmQ/ZU9HyaAJhmjsOAGtuR1g9pmEsekXS9NaVREbb8GB+xVZTRC2DBb27cQX8pxUMpRvegWMAfwnm+65i4I+LjAumadzg8lsUq3w/NC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774705209; c=relaxed/simple;
	bh=5ZtQ2cHIQnNPmhkNNEc2uIDy13fXSNOA9me1ZOCMupg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jme3eauz3aJ7P7XNSqlXEq/8cAbPtUw8a6j8oikKF4RW1Y1Am66M+zw1cgENxVqKVKWp0Xq55wns+Ijg0dAGy1iZMPj4cAY+UEscY5fiAkbeDBPWL+0QmBsJABkGOdbnah7XdmyNsk/jQMHUouAu9LNURkx6pyrRTvGi4HkebK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZ92OR6k; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZ92OR6k"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1165586a12.3
        for <llvm@lists.linux.dev>; Sat, 28 Mar 2026 06:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774705207; cv=none;
        d=google.com; s=arc-20240605;
        b=NZZ0kVt0UTn7deA1kYNLfGIzaRe2+Ir0QGl2dxQ8XMLf8Kqv9+w3jlvNETYRzO7PBL
         XuVP6sAYJAzTl6XSNDCmmN18tIhTD157ADaJorRYZb5oPHeezunuDhhTjhS/wc7wIm2N
         SMf3oLc/6DqXRq0cDxm0Dn15ijfLscYNWhXiw+CpV08GuSwhLRsWiC7cYGjq604HwYJ9
         LLaCAb9m4Tz3n+ipFVTQPQeQZKiQqQ//N+LYDGbUYTVFmImeyEuBbrquXxKz78er9iKz
         NRH1jv7sYNyvfyWYaabc38qxpQlcAzHXg21LY9dTNCPcl7aFobyGa6qXbRnROiWbsKnh
         lFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZtQ2cHIQnNPmhkNNEc2uIDy13fXSNOA9me1ZOCMupg=;
        fh=5OMnRG1EmacSDxmK8Ak4Hz6RaxPR5h3aRWtwQyBbR2M=;
        b=dDBkPl81V4ZLbpUF+KpvLCoocx/Q4zUg89fI0QrYcXMQOpvvw/zvdEmtH11FydgKEd
         hi1FldJfgt3fCbTjuqNs8ea7BPEQSyviwny+qlGzWMJEHLyCN7XK2mjRFK3DvrQQ42A7
         34vAW0C5auS6c0LWO1k/YNwiGvwFQfaYFGwMCRD6C+SC1BmE6WBB2CpXwb7vd06rQHZm
         yJcT6NVNNzpYTToZ2H1YS7A4e/cRlRxCeM6EbeqdD6BUktpzcrXMZHVCA/IUot0rneCg
         b1jC+wW8S+I4EaWg2OhPOKHBOeo8GKq493BJjaq0ofZRA2IPQOphIsS12FaJ1X43QO8C
         pY6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774705207; x=1775310007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZtQ2cHIQnNPmhkNNEc2uIDy13fXSNOA9me1ZOCMupg=;
        b=VZ92OR6kiJd6T6RkqHKGQcraFpwzNxojkocWhzJbXemJPLxbY8jdlgBvGaG+rQarAi
         irxmI68U2ZNhHxml6Gd1QDywqjqD/tmMvMd2rmX0/FbCY9Cy/yfCQM5ATGgRG9gOUsK1
         PEUoJbbaKhjVLgXpxTgC17+jN7xj6jB9yjZd5FYVKlqIDIQ4dfH3rTsWvlwkWlB0drRU
         HGQL31vRD6FYNfQU+b0+5Inp1sMHNprKSOWoNohKVg1a7JayrE6IXWTjOqr7z0yHWXv5
         L/Xs2+QfQCpFDQKoerB9Kzh4b//EK3OIBh9uV9JekTyZqZ8YxJIqloiDRbvdnopOL/WD
         SkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774705207; x=1775310007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZtQ2cHIQnNPmhkNNEc2uIDy13fXSNOA9me1ZOCMupg=;
        b=YgdNwUdOfGhfF+h3pFzj+x7bDjRFXW6Wr9QUxRH7ggVh0NIuJW2OHJ819AktNUB1c1
         bsyPXI5r7FLwJrBslB+S+conmNBZ3NrkWry6io4HPY3HmjjPjNfswP79Cn+jpMylvOUn
         eiVMMLb7pgcsCuzEUSvr6ZL3dpwG/rH+dkLwmHz4cSQZf4bv0nB5YNmrqhj7FL14uTv1
         PTftaNQA+pxvimomyo5H+ESXrLslzp8LrVrseSH8KX/x9iOSaC5FIrx0tqbfE0dbkUhq
         /yolYCvjm2J2gcw68eMO6vHa6zzwjhalS5fi0ypR7bASfDQNqRn7eKN8TamgLCR1O+LX
         yz9A==
X-Forwarded-Encrypted: i=1; AJvYcCUcVBOXPToKKrKeFWADo+O0nOhc/x895+JSNnqawV6neYBdufKzSkx9j83/xOD9TFjfYjuv@lists.linux.dev
X-Gm-Message-State: AOJu0YxYToVs50Q3yqHt39E/kOjifra1nPYkOYNBO4X+aNxSuZjM8RRw
	7gzrZNRr3+vI/vYmPBQkd122Sq+7VuHWeGrLu5pqDUjso2qgLYXahQE4G2AM7cmaxQh3n8E5m02
	FjuEJO/PdZn+haPZBVwx5ja8biS6PJXA=
X-Gm-Gg: ATEYQzwuVbkhOLz+Ulg9/iaib4XZ5sPGmFhggw5qxDMZK535MFdRTtrSHVIQf62k7AQ
	wLmZnScX9m5FWZYA3G8DrZwuwxza5Byawwyrj3YOLxmVJzvweA5Y/Msw25ikVV+RJSuTFKc1Yh2
	B40nXDywddYrO1TjbUerdu70ejXLHSf6TSB/RjE48a/5efD7/3R+FLdSkyznsUk92pDZOGjaeSQ
	/rNjJ5TBg1wGluFZDOhLajHVATGCDM+Th+u0KaAssV+Blytg/6Tsre2p2gemr3AncMz4q8vtyZe
	w0Q8wKg=
X-Received: by 2002:a05:6a00:1789:b0:82a:6de8:fa50 with SMTP id
 d2e1a72fcca58-82c95e45d30mr6453604b3a.18.1774705207164; Sat, 28 Mar 2026
 06:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <91bacd7d-6ec0-4888-be0d-f11a6607f38f@acm.org>
In-Reply-To: <91bacd7d-6ec0-4888-be0d-f11a6607f38f@acm.org>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Sat, 28 Mar 2026 21:39:55 +0800
X-Gm-Features: AQROBzBTENtnZtQhxmzRNb76sGSIhzOCRnc5fvzKUgEMLoc4tyX_zU5SvhHxtug
Message-ID: <CAAWJmAZe+pyfju+37-dfjYUdwRR1ae6Rq8OJjZea76d2CPkEMA@mail.gmail.com>
Subject: Re: [RFC 0/2] block: Introduce a BPF-based I/O scheduler
To: Bart Van Assche <bvanassche@acm.org>
Cc: axboe@kernel.dk, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:48=E2=80=AFPM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> On 3/27/26 4:47 AM, Chengkaitao wrote:
> > I have been working on adding a new BPF-based I/O scheduler. It has bot=
h
> > kernel and user-space parts. In kernel space, using per-ctx,
>
> Does "ctx" perhaps refer to struct blk_mq_hw_ctx? If so, please use the
> abbreviation "hctx" to prevent confusion with struct blk_mq_ctx (block
> layer software queue).

Here, ctx refers to struct blk_mq_ctx. The intent is: when no eBPF
policy is attached, the new I/O scheduler behaves like the none
scheduler; when an eBPF policy is attached, the blk_mq_ctx queues
maintained by the new I/O scheduler serve as backup and fallback
for the eBPF program.

> For what type of block devices is this new type of I/O scheduler
> intended? This new type of I/O scheduler is not appropriate for hard
> disks. To schedule I/O effectively for harddisks, an I/O scheduler must
> be aware of all pending I/O requests. This is why the mq-deadline I/O
> scheduler maintains a single list of requests across all hardware
> queues.

This new I/O scheduler targets mechanical hard disks. The scheduler
can be aware of all pending I/O requests, and users can maintain a
single list of requests in an eBPF program.

> Additionally, this new I/O scheduler is not appropriate for the fastest
> block devices. For very fast block devices, any I/O scheduler incurs a
> measurable overhead.

For the fastest block devices, avoiding extra scheduling policy is
often the best policy. In some customized workloads, however, extra
policy may be needed, for example priority scheduling, cgroup-aware
differentiation, or fine-grained metrics. Those scenarios have not
been validated with real demos yet, but the approach seems viable.

> > I implemented
> > a simple elevator that exposes a set of BPF hooks. The goal is to move =
the
> > policy side of I/O scheduling out of the kernel and into user space,
>
> What does "into user space" mean in this context? As you know BPF code
> runs in kernel context.

Sorry, my wording was inaccurate. It would be more appropriate to
phrase it as "into user-defined BPF programs".

--=20
Yours,
Chengkaitao
