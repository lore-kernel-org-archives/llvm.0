Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A11B85EE
	for <llvm@lists.linux.dev>; Sat,  7 Sep 2024 00:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725670113; cv=none; b=K9uDmJU47ltHQRL2ewqBZTaZwdIwmS/RvY+T9wueDhcv2nqDe6uCtVmlDVJRfrY7gDJLY9SdGV+3zg6IDvq1zK7EUwiuhi8TbgIWSL4w45jVNehIszGwWSWdGQV5zZwiVaDD7pr1Veq5WlAE2QGBbwykCh0e9ijiDE79nOYy3YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725670113; c=relaxed/simple;
	bh=UFUaOWELgtMfFEsfIQ6vW+7mTZedBrO6HDqKObAmwFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faw378equNpvSk9rLIqd1P6OM3v+oog1Oj5TgeVTbjtf44Mgqjs49FOZNJRi4yjYM3TRcr8teENjl1lJ3AhuyzqS9Iiu/ZSeVcLNxuVuka+aDNifmktjMFeFjq8zj20H/Ia03mpF+sj0A3WK2pvxovZy6/ysWUKrQ6QfvZJPudw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I/uZnogo; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I/uZnogo"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f502086419so32295411fa.3
        for <llvm@lists.linux.dev>; Fri, 06 Sep 2024 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1725670109; x=1726274909; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8jlGegiEN/nXhAMG4ddyYE+bSxApyov+rlpPE1WvsoM=;
        b=I/uZnogoVeR7q64qCn2sdPgITiAggheV0EjOa+cyJYFwjRHTJMnsmbCmi4HVS2sPW5
         3B9RjOD4tFU8vLKkZlb89UNcMHXwfXt+K9JsYIc4Qi+F9V7ubaXTlKWC02bAqUP8pTNC
         WZKvvrgWLsyTxOPOIXDwzbnv4MIOkHg93tkn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725670109; x=1726274909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jlGegiEN/nXhAMG4ddyYE+bSxApyov+rlpPE1WvsoM=;
        b=DNADXVrlTZeP8ChsCvpq/AmBGjfjCxJeOPYtCWVcMb5VitpdmJvIrhplmv05Ns4/qb
         YPfAwn4u8rlt5NqwrSID9avnTPLoUfqi1ao4Rya1iO7SJ7uB/dbEF803uZfI6WgPQ/zF
         fJeBCNKsRWyEVwjr5SRU8CZYeuru7HvmmyzDLNoVYjsjpgOyNHAma1LlPCZ6fO+/4CH3
         YQNDvgmiJhZXt54Xx46QFJQBOUXEey21tmi9Lkxm4OsvMG8pqZJozOwDMti4YOpUG5P5
         XozaHVWVutYvPAPS6SNLnK0kNdNBHE/6tp5Cy7kJMsStgaZNHo9z/XTQhc8jDPiu0YCl
         zd0A==
X-Forwarded-Encrypted: i=1; AJvYcCUvVIR6A5ymw5sJ2tty57VEWSO38Imm5NZen4kcnBMc+jlfz/Rhx8nfRFM7SZUrmo7WDt1d@lists.linux.dev
X-Gm-Message-State: AOJu0YzTsGWz/g+RK7QcjGfmBcv1bPPDMQGMd9UOu0Az+iseZA4FhKzm
	9KzDO0Z2KtmBQSRVDyRJVW+lKBFtdMRRt/WrhG65DlfkQ5NEIqel19VHWKx906uljjNHVlfLfZj
	r/U0=
X-Google-Smtp-Source: AGHT+IHUnGellZAFtOxCHo2Spaz84cuzT7tI4Ym2YcUE07lvptHTYgqwWWWgHQLhffUBpZI1rkycGA==
X-Received: by 2002:a2e:4612:0:b0:2f6:61f3:c618 with SMTP id 38308e7fff4ca-2f751f85ae9mr24624691fa.43.1725670107941;
        Fri, 06 Sep 2024 17:48:27 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c009944sm329471fa.63.2024.09.06.17.48.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 17:48:27 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so30463531fa.2
        for <llvm@lists.linux.dev>; Fri, 06 Sep 2024 17:48:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYSKz5DZOAGCX49KgYMuOecLtjIGnAQkAdKCmJBSfnJoUza3n3c79bBYB+n10GWMofy6N8@lists.linux.dev
X-Received: by 2002:a2e:6111:0:b0:2f3:e2fd:7dcd with SMTP id
 38308e7fff4ca-2f751ea7abdmr23935841fa.6.1725670106422; Fri, 06 Sep 2024
 17:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240906154517.191976-1-pbonzini@redhat.com> <CAHk-=wjK7HF3dQT8q_6fr3eLGvKS+c46PdYNVAsHRyQRgcgiyw@mail.gmail.com>
 <20240906233958.GA1968981@thelio-3990X>
In-Reply-To: <20240906233958.GA1968981@thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Sep 2024 17:48:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi0ePNgwLfk8yddABjnZh+gcL9dV2E8mxLKfb=8LHFQ-g@mail.gmail.com>
Message-ID: <CAHk-=wi0ePNgwLfk8yddABjnZh+gcL9dV2E8mxLKfb=8LHFQ-g@mail.gmail.com>
Subject: Re: [GIT PULL] KVM fixes for Linux 6.11-rc7
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sept 2024 at 16:40, Nathan Chancellor <nathan@kernel.org> wrote:
>
> This was brought up to GCC at one point and they considered its current
> behavior as working as intended from my understanding:
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91432

Their argument seems to be "the missing fallthrough has no effect".

Which is true.

But they seem to be missing that it has no effect *NOW*.

One major problem case is that people tend to add new cases to the end
of a switch() statement, not counting that final "default: break".

So the "it doesn't have any effect NOW" is true, but the next time
somebody edits that and doesn't check warnings, it *will* have very
strange behavior, and it won't be affecting the newly added case, but
some entirely unrelated previous case.

So I really think the lack of warnings is a gcc mis-feature. It leaves
code in a bad situation going forward.

Oh well.  Many times I have had to disable warnings entirely because
they have too many false positives, so I guess the occasional "doesn't
warn enough" is still a better problem to have.

And at least we have (a) clang warning about it and (b) require the
warnings going forward and use -Werror, so at least for the kernel the
"when somebody edits that code, you get surprising behavior" case
_will_ get noticed.

                 Linus
