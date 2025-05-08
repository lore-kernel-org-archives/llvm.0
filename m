Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B5822129F;
	Thu,  8 May 2025 23:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747624; cv=none; b=jhWBFUM9zIU6JT78O2eJVvJFwwwFg2PhVuszA1MTf60gfR+52Nv+SBSsorO/FaPfctMM/bMEIfXdXFu4dYXaZQHwIF1JbTEa2OSbawWiVrPJCQ0cMWh69Bktn1RVA3OXS3OVGgdVhTV1Sosjyvg6Bd1iMNzT1PKG2Q8e/M0SSyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747624; c=relaxed/simple;
	bh=UUWwBn0rncdSTvqDy6og+SIyhjFFbURwK0mnp5D1754=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBpgGYJYqBPYIZYxC0Gba9oep1J5hIhMAv41/DGQcuswrywTEPg9aN8h+F0TIgpYcxGXRiAud5UpNYuXuUxp/vDyNOeOPJ+Wn8jIvIB7zzluBsIvrPBWmVqnl3ZeMtIB6RJyrEpS1gyM0XLQCTVQ9egjUSmqxuVm5dlmqsyNgL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GshmrQna; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GshmrQna"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ace333d5f7bso259090766b.3;
        Thu, 08 May 2025 16:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746747621; x=1747352421; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4XCAHAZpzbjMjFqk38iU3CCdfAml8ce6xfHMngiKe84=;
        b=GshmrQna2SeM+fv70jzymKpO7DG7GJmOhHZjF1WGSeg6MOHIzXII3kNFD/cZFNY/YE
         ESWnih9KX5I/D3LG1SE57P2qh7IZNcW/i4g4zOucaYlhzxVMiKpoNR15e2B3DmTFJo3w
         DS32K4IC7QnCNdfwq0KAIRxsWCorr+Wfq6D6levVdIWWjZAe/xyrlNvYbR9nnhVM/0h2
         qg8GjcNynw8Ywei1OdygfNsf1McfGtLrAO7iGaZIjFua9cyrLSll32XlsMQo9ddQmy1m
         jNgN/LVLKPOqS8gatl6icly55f1AVDNNLwUgXFqGuUs88oe1B9oy44oH+ksPeeIKGmtO
         njjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746747621; x=1747352421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XCAHAZpzbjMjFqk38iU3CCdfAml8ce6xfHMngiKe84=;
        b=vVkgbz1jMSWwsM1ZCvSyQpySUIJoN/QCdkXoVFwUa6PWN17Ju7dUJjN+cI83rq4sYx
         u5sVyVWP29Cfz7HdKG22w7IFVh4x1dwvgkLkb+8uIkcDYGpk64RpRGvB96An4P/GKEsp
         ECBXYg7LO0de1AJjeRMVUgKym4SqwuFh3uhB0lBNaSSqDQZUAmkWDZsbELtoOBQeHnCH
         i5z0E5ilSvhSiPZRc0sCWVAahnlzHEEtBa3bFv9LXosQod62f5zwtZwWx/hPSNM5afQk
         kG2FAAqNYz0rduc5kJe85AyBCOOyo9Ft7Sn3ro+Tu+WJ2G9vSEq5mgqfoppbEdvGe4WG
         ibQg==
X-Forwarded-Encrypted: i=1; AJvYcCUJxU5N+2NemdfOur2pKME8Em9d2ETABxnFt197DZe9DdoDMX8O14K3+Pc8TufylMaAQH3EeYuo0uEZuGAEJg==@lists.linux.dev, AJvYcCXhm8EMkwT4e//bkDqTR0e8sYeSfym54R9c1kJYCGAFCAlWIAaIAYvj+BFetAb3amcZBRVn@lists.linux.dev
X-Gm-Message-State: AOJu0YzWbzaSpDU99jRZuAIrpftyJZiz5t7OeJA/8ro8XSGJGxEuRFX7
	w1etWtVkKokd5/+zJohzV/w1PSTxs4BqzYjN7upy6z+jKcuE/mgbFH1wu3KfxPaDynIvAklEfS1
	29U+47iaCA2XaerTg3UUSyZ+prGY=
X-Gm-Gg: ASbGncvo24WTVwvt747UwcUKYrAaIEeiURi+/05PtJFmwpbrZflSTapvdElLXiPOZ8B
	8pcuq6DdDdES8unki6jURvdVJVDhej5e/YF6wsGBDdrv5RvBSka/CgAfkItt1lhpwfxIV8NTsnX
	M94deHupU2+ncYMOlD4lF9zNQFaUsEtCO6OuoYCrGQmxtunBdSwnX0nKnKiO8fYBPiAzU=
X-Google-Smtp-Source: AGHT+IHApQ5OFCfaQS1mUn74daoOJX19yzwZ3sgdO7xX9LpbyPb3Jm1cvNGKxG3HLWErcANGLvfkwfd4xsmogUZmAeU=
X-Received: by 2002:a17:907:8b8b:b0:ace:6fa7:5ed3 with SMTP id
 a640c23a62f3a-ad218ea5b8emr158033066b.4.1746747621004; Thu, 08 May 2025
 16:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000adb08b061413919e@google.com> <681c597f.050a0220.a19a9.00bd.GAE@google.com>
In-Reply-To: <681c597f.050a0220.a19a9.00bd.GAE@google.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 9 May 2025 01:39:44 +0200
X-Gm-Features: AX0GCFuVY9CBMsQxhMgZpZ1X-fEBQ2fptYrxdbELCJogxYT5Wfp2wwF916mNEpY
Message-ID: <CAP01T7525zDpL8nhsLLULCK1Qzw8wVCmHuCX_81Z_HaQAs-q4g@mail.gmail.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in trie_delete_elem
To: syzbot <syzbot+9d95beb2a3c260622518@syzkaller.appspotmail.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, elic@nvidia.com, haoluo@google.com, 
	hdanton@sina.com, jasowang@redhat.com, john.fastabend@gmail.com, 
	jolsa@kernel.org, kafai@fb.com, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	lkp@intel.com, llvm@lists.linux.dev, martin.lau@linux.dev, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, 
	michal.kukowski@infogain.com, michal.switala@infogain.com, mst@redhat.com, 
	netdev@vger.kernel.org, norbert.kaminski@igglobal.com, 
	norbert.kaminski@infogain.com, norkam41@gmail.com, 
	oe-kbuild-all@lists.linux.dev, parav@nvidia.com, rostedt@goodmis.org, 
	sdf@fomichev.me, sdf@google.com, song@kernel.org, songliubraving@fb.com, 
	syzkaller-bugs@googlegroups.com, wojciech.gladysz@infogain.com, yhs@fb.com, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

#syz fix: bpf: Convert lpm_trie.c to rqspinlock

On Thu, 8 May 2025 at 09:21, syzbot
<syzbot+9d95beb2a3c260622518@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 47979314c0fe245ed54306e2f91b3f819c7c0f9f
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Date:   Sun Mar 16 04:05:37 2025 +0000
>
>     bpf: Convert lpm_trie.c to rqspinlock
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=140598f4580000
> start commit:   c2933b2befe2 Merge tag 'net-6.14-rc1' of git://git.kernel...
> git tree:       net-next
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
> dashboard link: https://syzkaller.appspot.com/bug?extid=9d95beb2a3c260622518
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108e1724580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177035f8580000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: bpf: Convert lpm_trie.c to rqspinlock
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
