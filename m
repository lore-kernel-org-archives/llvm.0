Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658581851
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 00:38:23 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lh5so17465588ejb.10
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 17:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=36Uxd9fzOtQXdUTgT2x6xrnFj/OP6ll4rq+xlPqT6zs=;
        b=I5VK0kFYpdJq7uuW/my6/s1qq5Iyk5Bid9V1MLGMfcqCQWztkAuk9NwGH236IdPw0t
         aSpjgBiqC/nGZwjYEvfyXWTdEcKTcw0+alOVgKlPJp0QxZ51FAjaVDzR72eVHRH3bbvy
         gvkVll0e0g0VmQ4F+5N6/s2DIzf/I27kP/bz1CeUqjpjHLzE3nXgrjkQ/KYJ7YpMHAkl
         X4LL9WElTtiK3lEKN88AvhLMEYbUQuFbdHgajFCsib9S8OAsKjAJ2hwQaDr7Ll+KkdP+
         xKM1XMVuJO2zuGtJCha8Q5jPSh1fIwYoh4vH+EI9GVYm3sM0OCx6oEhE0nGmVgeLFMUN
         dZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=36Uxd9fzOtQXdUTgT2x6xrnFj/OP6ll4rq+xlPqT6zs=;
        b=FGYIfNUbpSND9MiuxDwaNjhNm0Nj6NpN5ctgAapW2OOL4+jZGs5aTCRzY3peGF0JIA
         TdrhuWOwnPlQEWMjkyzCPu/UUwZKh9u72wsZRyNTfEV2bDQLFonLOT7HemObPs5bVYuD
         u5cIkQ8YETmpF685IaBFQJaCJvXvWrLfOFOTqESIgol5bQBEyZjHZuDttGwbHkMNzB3j
         zF5WZ0OpjaAbLm54Q3ygDUPiw+dsHlFuhlE+DBdbxHsJu5gnxEtokkOK3+BG1IbWexT5
         CTAkWOxPtv6t1wXM8amCbSMbuOizEG9bnKHS9Cr8qwkTfpQemQ7jUEBbpebCdIvUEZ1f
         UpXA==
X-Gm-Message-State: ACrzQf1+qXVGXExJZIYiaPwbxcDPzxJbi+7rj+eHQkpMDLyoW2jbjM7c
	LXBG26rTkMMY+4kmML+NHiyfy10GvMF1HXBIke8=
X-Google-Smtp-Source: AMsMyM6Ry07M/XiRvs8DE4XwyxTLWwVw+IwMzGuWJO2lBy5NVGAojN78DUAFSefFqfeYCg1fyKNfsWUJO9lS/CKlptk=
X-Received: by 2002:a17:907:3d86:b0:782:1175:153f with SMTP id
 he6-20020a1709073d8600b007821175153fmr692120ejc.226.1663807101634; Wed, 21
 Sep 2022 17:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1663555725-17016-1-git-send-email-wangyufen@huawei.com> <1663555725-17016-2-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1663555725-17016-2-git-send-email-wangyufen@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 21 Sep 2022 17:38:10 -0700
Message-ID: <CAEf4BzabFB-__1bcYTb8E0ixS0dNZNcp9XNB-McWvQQ98sBR-Q@mail.gmail.com>
Subject: Re: [bpf-next v3 2/2] selftests/bpf: Add testcases for pinning to errpath
To: Wang Yufen <wangyufen@huawei.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 7:28 PM Wang Yufen <wangyufen@huawei.com> wrote:
>
> Add testcases for map and prog pin to errpath.
>
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---

let's drop this selftest, it does global system manipulations just to
check those two if conditions inside pathname_concat(), probably not
worth it.

Also for the future, we shouldn't use CHECK() in new selftests (we
still have CHECK()s because there are like 2 thousand of them in old
selftest, so clean up is not trivial).

>  tools/testing/selftests/bpf/prog_tests/pinning.c   | 67 ++++++++++++++++++++++
>  .../selftests/bpf/progs/test_pinning_path.c        | 19 ++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 tools/testing/selftests/bpf/progs/test_pinning_path.c
>

[...]
