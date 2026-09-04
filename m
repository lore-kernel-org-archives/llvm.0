Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AD447A0B8
	for <llvm@lists.linux.dev>; Fri,  4 Sep 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524315; cv=pass; b=lvIvuwfSPhRLvAxiUEBcov7GScWni9FTSmWIFOq6AHh0VJprPOmr5XlZ+O1X7HPDiDZK+Kh422kE+0M9Dcicj4FOsVOxuVSaqW4kwOmdf/tEvg8boyHOfxWY/5n7dQ2Ndx/dMrTxnFxBIJb2bXWhYKW4FPPlPOZh8PvpCqReRA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524315; c=relaxed/simple;
	bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5YOkYBIuH79IJ80CrgrFuGrGG8TQFGTJXBdWKsOKbEvKMdps42DO+FyqiVP8sS3W11nAH4x+HwB5ssYgx2W5HilUdYI7FJ7K7QU5GanZ4tlaBo7pAz5rmN9ICh6EFlKGAn9etODHoLvHT0n1AEHZitVyIldjlxnDqas4MaMiSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSAKF4Bw; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSAKF4Bw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d5862bc921so2231895ad.1
        for <llvm@lists.linux.dev>; Fri, 04 Sep 2026 05:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788524313; cv=none;
        d=google.com; s=arc-20260327;
        b=GqkbvlPXpiAsMIr9Mj/yIyuGRNBa4J9+/6EcZxXEkrfSOpQFotTc6vxhCJftcwfi0y
         rXEN7rXWMIBMA9fINpRa0r5aLfok4Cbn8aPPFz3x11c6oLdXUuqLaNAl4Bmvf5Oeir1+
         3zWYUA8HHSV+OYwI1voN2ZTB1DbrP/FBI9Cc0UOQdYPniZpdEqDnS4RSQLAbsh/J33kT
         +QYUQmI1wLkgvr4kFEEBZD+xGaC2B9xuhgb0XclLVu/wpFRURmhg3o7ONfw3lDbsjlaP
         qlROROGq0XfCcqw7EQmIPKBilJ9vDRtfgJNzPQL8RvL6TU9kkRKi3v+3/kIsOld3Z3s8
         wifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        fh=b/Tt7ymQLzqczHFH4n4KYt0zQ0oCjD4wxF3cCWOLJfo=;
        b=U+MyIF0YD3YGDiJl0G9Kz4WPZk41iXkFpbmq7RnEgJNWJk0YJCxpIrZfTAIAtLHARI
         XuhFUQg98hZTNXAwtNQcY3uf93uWPxSnY3HWTR6PI8RlvYiqAjjrXH8Uxe0XnxvHUkj+
         DPqcjDaDluo+NZ9ZmLzkbgSTHkl9dGUfEcC+ox+EL2ygQAn4u6/j6JQGCq0EorX15LcA
         KGuaVTVEYIErCvddFAPE4GpFl28DBKnC7xSupoZuBRYQkr5rVLBgcuZOpqFzZSjhSN7J
         3Ix9aQNLtNRhdFsIjpivKXwEymRFLPO9f4Y0ngV8vUTTn7hHhC4Kw/8H85YKr3lHebRx
         HYnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524313; x=1789129113; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=hSAKF4BwPR0UGUqiQX/BSmuWfIaHafErIsTx3xy3BsoEwakw6oZy6iUGXv4vyNHX3z
         //4nhNekuXVc6YAKmBdHCioxHCRuJk3fWq3szbwUBZcos9pxwnp1eH6O48eNTlTK48fy
         G0779Z/VEFQIURmE19VHz48TB5rVDXCqGDzji9hW2qw3Olj/3JzjXxqo/wKXgP7f+16U
         jJMVGaaDpJ5/6W00szh2BtIUwrcT10nfqdwxWASJRsjDxS8SVgYMGi5Bfr9A7GLO7kqS
         WsZMogxeaIf9fztUWOEgJMerHx6v41F1tWiwMtxTIXz0fMqvG4aEWnEkDT1p4lg3LSCN
         IwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524313; x=1789129113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=lZ5p5oIGNVHrwHQtso9nnpQsPvB6BDLJ95DBVxjI3GvXYXVmr3J+8uo5+jGzgnjly4
         GrhI9F+1j7borgrVEDXSUJYfB0rLkAb3hqi/dduWzfRvrMXNWI7edNhPAFhqRApxDCNs
         EYzu5n+MzThpsgmV1GmQTyB2eVckARvW/txVvpLSp54dRpSiKbyFS0qZu7NV/jXYVOlr
         9Ltx16G4u0psTZZuO/knDHicaIuA60HqCL7lHEareQIWbJQC4upYgrSNosU5/0+e75MT
         gNdOXUTLAEmO/P76A82l0IKR+cMRp4UqPn/1LNZBuGuMbHc84XLPreVPyDJV5xLBSHfy
         fykg==
X-Forwarded-Encrypted: i=1; AKwUvBz2B1JnOvxzu/G9PS3NdJZFk4fuXftl200nzc2kNnreDBfZ1xtPmRe1tvxKqRqqfMKPdhrw@lists.linux.dev
X-Gm-Message-State: AFuF++kmFGcyENHRaB2u9us/pYDHHGKDcvnzbNu/SEASP3Lw0OKcZFVD
	Io4G6i23HEj3IGzUWOx/U5MD93cH1U0kiVM9KqeCqvg77HXijxzNZy/o85jOAfyiOOBBdM82prS
	DARlKN8PH3XH0nhgQHTXIzhLecT/QkE0=
X-Gm-Gg: AYBFou2OjjpweQXMClklAumyuhbmVfcGUAErKnCTW3SzJS85nwIgct4bK7pwi/mf1KZ
	AzIkRY0dF50dZnRh3hgvxjsV5LqqqNxCUNiYiq2sFtpoYRPLZ8HKRDpjawaQ4F/NXEF+ulCtXoc
	h3eYBrf8sxHaLUu8Th5nOLUAkaJ2c2E7jo/j0KX2dejutdGHrFSQIrfyGnWSazwGWk3wi7LESbG
	EARTgMISNuUk1vvo0etNi6sFml6gakjlZ54hzEWhfMToAu5AXn1ingfzo0TYAB3nFWQhNPR9VhX
	Ol2Ou2+eL8/GPZZA3lFKr7dDP5WcCFAk3imB0/aGnR6j/scJdk+MBjueMseA/jkmG8579gOiL6G
	FYqUA0y1lXJfwZ9ORMckugkype2dfW7hmdQRPFIFmgnbCNjxAJnXPk3fY26Qf
X-Received: by 2002:a17:90b:5404:b0:396:d28e:b52 with SMTP id
 98e67ed59e1d1-39b26229b5dmr5722108a91.3.1788524312944; Fri, 04 Sep 2026
 05:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev> <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
In-Reply-To: <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 14:18:19 +0200
X-Gm-Features: AcwNN1W-BJa7t0_HMwRoOS4jQPgmmEa3lTrRn_StsdokzqumkRB4EleU3vHebmI
Message-ID: <CANiq72kg3Z5rB28H4Ck+EzqQgiRSSowBMe3YW6p_iNwOG_dzWA@mail.gmail.com>
Subject: Re: [PATCH RFC 6/8] arm64: ftrace: Support CALL_OPS on kernels built
 with kCFI
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:20=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> Gate CALL_OPS under CFI on ARM64_CFI_PERMITS_CALL_OPS, which needs
> clang 21 or newer and RUST off. rustc has its own flag for the prefix
> NOPs and this patch does not pass it, so Rust functions would have no
> prefix and a different hash offset.

Why doesn't the patch pass the flag to `rustc`?

(Looking at later patches) Ah, is it because you defer it to the last patch=
?

Thanks!

Cheers,
Miguel
