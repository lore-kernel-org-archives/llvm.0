Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304D372EC0
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785583; cv=none; b=hbiPYqvTX1MwmoUTLgSamfpjJ3fIn7mmaMLelZdotnNse6KG9XLG37di1kM2KMCVRO3EeLlkd+Pzu7adrVW4o+ZilVr01qAkEuW/9VkKYw54NW2rtgny496g5dqHMSGSye4hjNZ50dKyqbGcyV9pZGuRdy+JSEfnBjLwzFPevHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785583; c=relaxed/simple;
	bh=Iz39VoQcC2EnN23JBnYwOZYmPqabSxCe/ZNcxzWbq8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTWu1Hbr9ghm+jbXqmn+nA7Wc37ZNj/Zd0D03rDk0f4IiA/TZnj4E3kSiBTPYYkx05jMjWrtOWcdAAK3LY+kCIrqSIMTCLzIPyedLNV4rgZ6ZE/jfE47FkcgnnoiUPKHmmlM4dgGddXob2oxhj86fAOS/Ttxcwu+q9LDSqXlSa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSyLZfU1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSyLZfU1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8419ab3a297so656184b3a.2
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779785581; x=1780390381; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=InJMAp5dveD8bJ+7VPqWcHSAuX65wXSmTpY0vYoc1U0=;
        b=qSyLZfU1DCMxjZZZGDRvJQ2jCbN9K0GyKYPHKpsZIX8vNVMjmFLvtcwf1HUBUKAoca
         4w0sx8oovXuvPoS3OGthZy1unZull4pOyWpVjcwNnvEMsmK7rt4eHlF1gNkHDDz+cMBq
         etQQ+ojZpVdml0Z4RvjXZNRcLSOh16OFu2nfCUoMhDSbF5iuRGPvbRVm3mypFqXgTR9s
         Dq+09zEo8yNNBrpL3kbnono/t8G2T4rb98qvOpbN78kli7MzBfBb+hRMdka0YtHF37Mq
         G9kL5etvuCAOOYoBEZkjTRhMrGjgpHA+FbEVWBUlEAcsqZAFhrD+cilplKiKkiP7dTiS
         CzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785581; x=1780390381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InJMAp5dveD8bJ+7VPqWcHSAuX65wXSmTpY0vYoc1U0=;
        b=rL+O/hr8dIatF0GQ+8kqhSfcth/XtcSl8kE7JUegKJaFEi50QrlHacIoN0l8sJKwkk
         +4bIVl9ASXpu8g5gfSGINKP3Xy45nv2YLkUDD3vt7RMK2c3M/ASMrGPemms5xNFi8xGO
         LyaeCzLq5u+Ml7sVdz+gnAXf7KjFdMnzNJzwDhFonsNGf+3+RM4vzvGizn8niEtH06o4
         27FYZY+6MPp620X8YJIAN75ImkEJBHD1g1WLTz4eGKDv7lWZL7Ff+mx0VWQr1KmkDEJb
         46GajLfpddSUXzWGNCXpLIa6LqpulUS0qf/6K08Es7/lzo51/W+4/kjLhuXH6NbEZAbp
         PGfA==
X-Forwarded-Encrypted: i=1; AFNElJ/LVlP+rX7ooTaMmplUfG5Pw/q4mHzPQZELfTz3zUr60oikU5HDDtw+0Jwa+Hfl0Gtzz1Dp@lists.linux.dev
X-Gm-Message-State: AOJu0YytjkW+I+xX0IvC2f/ivnTlz26wuJO7lHb59+zVKDnFKO13AtBn
	6FB6qHtdTWFUmPU3egg4yvO72T7bZV0gUZODETvMU/BMGCgxXfq4hd2x
X-Gm-Gg: Acq92OE1qFSr70pyngVrawcWJfHyAiTvdX2lmU6IivYPM5oPphH4IvFz8wIoHSEaiCB
	od4MbyLomQ/GTuXGvqRlpjBVo/8BWPc8m1mKyn8QfbbzBDy7Kr0+RQiB39zM8DA5McHa14aWBM1
	zARZRQOUenO0UMTgQNZ8veVAVSAw0SvopDCzLkzm7BxvUNWNzcI1YelvTYYC8bM0+/l4B1c0bpL
	6YufTLiAN0PSA/RITJmFFeRR9/XHun7reI62g8PuR5mAhSXNGG27rpeu4Sy6DAKE02kW8xHjBJl
	k04EXzLNRzQK6Jgtykl9u3wzemS3dxSmKMxflP5bUWXA1MmryXeySrVF4RXQz49R4Am6/rnhY3/
	FXSjovZUibbICRiI1jxZpq3fx2i8Kk/qaFk6uvqz9rWr8q2DTT1hhaBS4OSTlXvqDiS/xSQgiCB
	LTKaQFqBDieF318mFUssN4/r+5ry+nzGFUANqXZktsxAemp9sbZRlUxBOr80OupV2xX/8=
X-Received: by 2002:a05:6a00:2da4:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-8415f19e22fmr16062880b3a.20.1779785581098;
        Tue, 26 May 2026 01:53:01 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b06fa2sm13385336b3a.23.2026.05.26.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:53:00 -0700 (PDT)
Date: Tue, 26 May 2026 14:22:49 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>

On Mon, May 25, 2026 at 08:16:53PM +0200, Miguel Ojeda wrote:
> On Wed, May 20, 2026 at 8:48 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > Minimum `rustc` version required for powerpc is 1.95 as some critical
> > features required for compiling rust code for kernel are not there.
> 
> Which critical features?
Hey Miguel,

Right now i can only think of inline asm. I can rerun the whole thing
with 1.85 and figure out the issues with 1.85. I'll get back on this.

>
> > For example Stable inline asm support which got merged in 1.95.
> 
> It is not needed that the support is stable, but rather that
> everything you may need works.
> 
I wanted inline asm be stable, I was skeptical about inline asm to be
unstable and potentially messing up the whole system. That's the reason
I waited for the stable support to get merged before sending out this
patch series.

> From a quick test (with a dummy example that may not be
> representative), ppc64 inline assembly seems to work for a long time,
> way before Rust 1.95.
> 
> So, which is the actual version that it is needed? i.e. 1.95.0 doesn't
> seem to be required at least due to that.
> 
Yeah it may be true. I'll test out the 1.85 rustc and come back with the
results.

> That is why I am asking about the critical features above, because it
> may be that this works since earlier versions.
> 
> (I wonder if this patch and s390's similar one influenced each other?)
>
I am not aware of s390x way of approaching support for rust so can't say
anything about that.

> Thanks!
> 
> Cheers,
> Miguel

Regards,
Mukesh

