Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1677A10FF
	for <llvm@lists.linux.dev>; Fri,  3 Feb 2023 05:07:55 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id y25so6192991lfa.9
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 21:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dSI47TN1rvpQZQfzrMXdYQdHL57hkynNgY6fDRFFlN4=;
        b=UTcc51f+Jh6rBfVA0K8Gf8DRxVq0kI4W7jOIALB6af2YUvG0i8Tv8DCXEuSRlLa7a0
         C1ZVWOtxx0wpExXVmqVM2JnVxIpacZva/f3Fs6zPAlV9ts+R/oNNAdEnDz3/iPt9A+6U
         ZegmZ4KOGVfykFJfwNU+nsPW0IIJphBkZuwgKDmrxhOovy6WWkL2GX8phI/dkZt7AZpc
         gRJ4YdSMTgNioIKg2Dqh7q8QMVZg3whkK+i/PXVHBYi42Zy6jhmIHVK0v76jJ+hgaOId
         E5kGfJpD2Oa2kboOxRtKNz0I62p48a1Met52452dLnmiDhHzSq0XegfUVwMwZvruWgJp
         9fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSI47TN1rvpQZQfzrMXdYQdHL57hkynNgY6fDRFFlN4=;
        b=iiaIQraSgwbyIbv8yBcGPwlpZC4e3I9ygKRolucEIGtnozPrztyLscrnxGeN+b3r31
         i2QwbBkL5uw98t7qAoaVZColwdpJTO980X6eDzCuZUlHYRiPU5a6RndUSy60L0KmeA2A
         vOPR0fzUlarZ0TafTHowwrohD/SowtCsW9s2DPw3cK7n1UPI9Y/od10DNIJwidIEPV9G
         AV7Fxk4mbPsc5zsvzxctV+/tKCdoCKdR/BZBmadSwt15b1Tuw4kEcgN1zrM+TLx7aHYx
         XXrTyhKCuPiLd1EQyUNFE3DhbTy/id1nGnhVWrocNPtBpEocXp4naY80g/KJggWUACid
         Xmmg==
X-Gm-Message-State: AO0yUKXfaY41VQ7vk2YozdyTEe1F76fQG9JvLn2yr6e+7ue++/i4gxSU
	PR4WmFy0KGYqVAV3bVRaV/86rbYrN90Ed99wZ265Yg==
X-Google-Smtp-Source: AK7set/QQMcSjP18PtuXeZRhLR2/W2UW755nYMG0W6Md1KoY4A19NKki1v6DMYCVH/30aIkpfpN4CfdW7+5JTAkq3Ys=
X-Received: by 2002:a05:6512:32c8:b0:4d8:5d6a:4 with SMTP id
 f8-20020a05651232c800b004d85d6a0004mr1699418lfg.107.1675400872846; Thu, 02
 Feb 2023 21:07:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000009da4c705dcb87735@google.com> <0000000000007a0f9905f3bf9d9d@google.com>
In-Reply-To: <0000000000007a0f9905f3bf9d9d@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 3 Feb 2023 06:07:39 +0100
Message-ID: <CACT4Y+Y6sCOwGKKcOyv+Qtjai0AX==Rg7pnjLXbeSO-d7LDAaw@mail.gmail.com>
Subject: Re: [syzbot] WARNING in check_map_prog_compatibility
To: syzbot <syzbot+e3f8d4df1e1981a97abb@syzkaller.appspotmail.com>
Cc: andrii.nakryiko@gmail.com, andrii@kernel.org, ast@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, davem@davemloft.net, 
	haoluo@google.com, hawk@kernel.org, john.fastabend@gmail.com, 
	jolsa@kernel.org, kafai@fb.com, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, martin.lau@linux.dev, 
	memxor@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, song@kernel.org, 
	songliubraving@fb.com, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Feb 2023 at 00:06, syzbot
<syzbot+e3f8d4df1e1981a97abb@syzkaller.appspotmail.com> wrote:
>
> This bug is marked as fixed by commit:
> bpf: Relax the requirement to use preallocated hash maps in

Let' try to fix line wrapping in the commit title:

#syz fix:
bpf: Relax the requirement to use preallocated hash maps in tracing progs.


> But I can't find it in the tested trees[1] for more than 90 days.
> Is it a correct commit? Please update it by replying:
>
> #syz fix: exact-commit-title
>
> Until then the bug is still considered open and new crashes with
> the same signature are ignored.
>
> Kernel: Linux
> Dashboard link: https://syzkaller.appspot.com/bug?extid=e3f8d4df1e1981a97abb
>
> ---
> [1] I expect the commit to be present in:
>
> 1. for-kernelci branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>
> 2. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
>
> 3. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
>
> 4. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
>
> The full list of 10 trees can be found at
> https://syzkaller.appspot.com/upstream/repos
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000007a0f9905f3bf9d9d%40google.com.
