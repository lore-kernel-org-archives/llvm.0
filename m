Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914229;
	b=VJJ+vee/qINracAsDQOWNGfI/gJYLi5LVYedQqY9YNIZsRm9pDmYYsKPUS9Z6AKL1cv6
	 97boicdJEmVCt7hxt45yqkMV6gwR8pyLAbGFYBDgMMOJieK67C+duoiSfnzSHMHQyKyWK
	 iDESz3sNBmrT2HwKGjWM26rm+Uv9NjewhHxba4mhxH1+B1UCLOR60SFqN/9SYxoXaO1K4
	 C3a8Tsv3mq9+Q4fvVR8X+qTvH9RCyuQDUdulbvPIjrh0Z6/lbOscN0G6Rwh7cGrkT580v
	 wLMG+Zew2CHcjJFMapP5SuCXkOiS6k5kx+o3pSrHG34k5qJK3BXCGY1XpGLAQUmSNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
	b=TxvoyafD+9R4gyahboSNbRziuyYP5z0wEG2LR6j4CAv15qxFGmMqAf6Mr1FBQAts7Irn
	 6sFINv+EnCYaoTdCM9xnAjM49wt0Aox0lW4LT1WzPD2OVhlFJtbJxpR6l75EcP/DISWUe
	 RR8xfjK8XBJCh0jm54h9pYz/EaPxs/2lr08yLYRCLBOqMnIkxGUIsgW5VX/39+2/g3Jvk
	 4ZJRADE2cLsgROkQj0Q81oJlmflzOa4abCr6eh+HgbSdwR/wOY2rugTEj425YWyRByytt
	 Om6Bk7GQiJsimm3BWIQQE6/45XrJXhCNAnqY2/Sks7iwT8NhXoXiDR6LMWRv5Jcml7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZrAkKCc7;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DECC606A326
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 21:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DECC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZrAkKCc7
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so37742766b.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 13:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914227; x=1794519027; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=ZrAkKCc7itlOkFHyB4vYo/eDYj6psqfqRwA4jtHgEnjQ6Nw3togeJ8Ge1k1r1x5mJe
         ZdjuaC6SkR0xgDE1jiTCmFaEWfIw24FoXn7mDvtihkmo1tamSsxVgZNbJTEqfy8ac7FR
         WFadSuFpVVFAkUHSkyNb5AJnvRw4w+x/DECts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914227; x=1794519027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=WTnhYp4XbcyDbVS7GU7Mi3b7ir18k8pV9sYB3+FJYbEsm+m9ueJPne8VcKBE2Xfaej
         Sd0GslddRit/oeLYaqlYUVGxO0DVE4MgdKIZ1E2fJOU5ixSn4C303AvADmohwxD05d+U
         xErWREZLVRXoD/fE0fvAKVcsW0B2Tz8JshpAhmUnUIWaYgTKCUYTuDAuxup9TB5pZfKS
         xeYr783krF9KPXuNFnXQqhG5TbHzpIk+AVQF5ADawFYEy/girTNsojHbG7++uP8sQtVg
         CWfXPQvlB9mlOo7tQNka5IynQgSehUSJKPE0IEW+245scKfDaXwKyL7nX80cX+TNPaTi
         Pr/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx36O3VbhTvxFEfi2h5diqZD2Xt+luXebOfZBdfQhgAGHlgunqEfojsgxjH/MzwzqNGMoH+@lists.linux.dev
X-Gm-Message-State: APuU4Z++2SY295qR3YbqH81CuHXgb3WoykX38QiIISCCsS9zmg1kjpBv
	eTobcee/TWn0jYTEH1Tkh5MEp64LlPApJ9X5k2yHwQ3RqgWLcBBubU5Qy2vnh0Dy7FYQrLKTprS
	grxta84gM
X-Gm-Gg: AYBFou0luS4n+fAJtAJl24eyBsenpxKBJiF7HvZic3WM/V/gSqhMDW8g9CRH8wEZH4G
	HLW5a/YuXDJw41RemUnAvvLfvxd4Z9KSTVcv3y4lvSkd9VsEqwGfCkfxZwjf0G7Sqv+pGvNR3dV
	1Q5vYpottnHtFVk3Ycire0AlHD3iV4dbplxJAYBx5tkE85hkxWAQRM76zS0fhXQlhnuNPaWeB4I
	3nLGcA9Lup+3Ryse+0eLj6yVYXPzfoU5Rs+VbdPRap3J75IwfMxY/Khc07r51Z5R8KAEuhYs6gn
	cozRsnpXUWCK64cwjsD2w2lI6zldm/ZBBQYt0nqw4F7ZIvjrucrz4qkOfGLUzYSWkmBItlnVBtt
	meSKi/FGW0pVh3AoIJ8zQfB/dkIgREmnRXQbE7KNRu238aXeI0V26ZkBdrniNqCq2NyfccSijOP
	++mvjss/iQQq3HvwVt6sVyi/QHsMX9w3Jq0mu+V9Qtl7N3UWEbvEX3/+rRMPcoVGfHEhmEwzTey
	/eFDCjOK3NE444VSzlpC4QUwu7RfWN/7G7lpoNwdWt7+rm65NUEnewr3P1eRMuALMhJywUPCqhv
	3cr4lba7pGsAP0ukCHGPg630+Zl6Qu4OQSGbjLIPxca2pUVTFyI70F80sUv/aqn7MyF+VEE2cJr
	suiH3kpCUSGTx
X-Received: by 2002:a17:906:9fcb:b0:c29:4a1f:76be with SMTP id a640c23a62f3a-c4d3526b521mr61903466b.20.1793914227415;
        Thu, 05 Nov 2026 13:30:27 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c1ee1sm18739366b.64.2026.11.05.13.30.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:30:25 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so25466f8f.3
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 13:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxCv8k0YLXt1HEnAvFFwAXnPDyU1VLUE25YRpiEk1M8rKbAiTPrd0Fu81rcROn78j4l20yR@lists.linux.dev
X-Received: by 2002:a05:6000:46cc:b0:492:a72:92fc with SMTP id
 ffacd0b85a97d-49277e91d94mr899867f8f.44.1793914223349; Thu, 05 Nov 2026
 13:30:23 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
In-Reply-To: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:30:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
X-Gm-Features: AclHuK8NeWv7Eqboity3c_xvquX4Ve8KJUxgkkfaa6zSURNg96EK107B0KPq_54
Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> The issue you mentioned regarding excessive time in applyFlowInference
> comes from Profi.
>
> The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> FS discriminators). There are known issues when using Profi with
> FS-AFDO; enabling Profi actually degrades performance compared to
> original profile propagation. When we tested and worked on AutoFDO for
> the kernel, we did not enable Profi.
>
> While I haven't looked into this specific bug yet and am unsure if it
> is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> to disable Profi for now.

Interesting. I can suggest that to the team digging into it and see if
it solves the problem. My AI agent says it will though. It claims that
the default flipped recently and "-fno-sample-profile-use-profi" will
restore the old (tested) behavior.

Should I send a patch adding that flag?


> Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> reservations about adding it for the following reasons:
> 1.  It is heuristic-based and not enabled by default. I am unsure how
> thoroughly it has been tested, so we should assess it further before
> enabling it.

FWIW, we did find that Android seems to enable this globally across
its userspace, which suggests it has been fairly well tested. You can
see the change here, which landed about 1.5 years ago.

https://android-review.git.corp.google.com/c/platform/build/soong/+/3524291

A few notes:

* That change _also_ adds
"--salvage-stale-profile-max-callsites=3D2000". Internally, there has
been debate about whether adding that would be a good idea, too.

* This kernel change _also_ adds the flag to rust compiling.


> 2.  The recommended usage model for kernel AutoFDO (as documented) is
> to use the same source. While it might help in an iterative build
> model, I don't see a strong reason to use it if there is no source
> drift.

Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
for the exact source. ...but from my experience, that's not what
happens in reality. If nothing else, developers locally working on the
kernel still want to keep the AutoFDO optimizations so they're testing
as close to what's in the field as possible. However, the act of
working on the kernel will touch _some_ of the source. Keeping AFDO
working as much as possible seems nice to me. Of course, I'm by no
means an AutoFDO expert and mostly just got dragged into this issue,
so happy to defer to the experts. ;-)

-Doug
