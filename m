Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE53EDAD7
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621330; cv=pass; b=nJ5oxC4JOxXR4ZYxN8Bm0VK0UE2ZYOaELxJODSM0/k1fOo5uGv+rmGTiqPxQg2AAozgpcW5W9YDjAWcywMOumdw9Yh0tjVOMXWezBqkpsxxJwGCgQZ08QzYSWygLcHprAVCjzXQPrDpKZarLozh99taUFNwJKVw5Nsy8uoWvvEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621330; c=relaxed/simple;
	bh=KTDK3vOxt1fIVdHhRs3HNHtD5rFi66H7oz+TrzUybAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTMBgq/lScUklGL6ex3mpQL9Ptt33CGqBXDsLIp5RXILeu7dz1W/isVSIbREPzQbbyuJXSlf4savevzTOAdZ+6rXBYTujs7HmUz20VsxEJWq1kSfSUaH06EzDRsNjMChBFLi1OYaZ7h/3fm7VXvu6UAVRZscryK7xPf5Xwd8P70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VasB4bsZ; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VasB4bsZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-487012ce896so13515915e9.0
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 07:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621327; cv=none;
        d=google.com; s=arc-20240605;
        b=WNCsKV7exAfhw1Mgd2EGjWZQ1g+8v++8zfn/EJmlgGXluWdQeR+7CnWTXQcQ0tTAD1
         hTBnbXdquH0YU4x0IxgINre8kn3q7UJMu/QRC8c+zWXs+2io5CfXSpaOajusqrZvDDsI
         Dw0gdIu2v6YQuwTU8xDL1q+wZMm0gJUT3B1QbkqYq6hq+qAQC+l/pmTzTUzhcH+UsU4o
         v6F9+XKCCVp4hhQUIBDhGuT/E0HM0S4/LqKrmWsD/wHod5UNI81Dy9Gpnrh7VMFpHAOd
         wMsJwq5QlIpsG/08/mZZBO+Xfq4zQR6pHRrW8jfT93njHXAvOWJVbPTluh6dqZz3AQ7H
         BXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        fh=bqsrsZWVRa9IucATg7nv4n1YHCMV/mfOcNUJx0P5bcg=;
        b=fXqBJFrQ9D2qo9hEVsssO0dmCELIWZpL3iReigw7Rw7SP/667Rry64WxIG/X//OR0T
         BvfVYfD1X0i5ij/7j55PY5fOfDi0PxW9+e3iBYYDgzQSnp/foxixgTQoFmo4KnvAZoAy
         tW+yfIxj9EJlLiPwPiY0UswJAjbFG2T/rplbBJgh+7qwM7K+Q50DenVYWtGcpk7C8Dg6
         nDrJDqRLn92hJxkKM/ifq7lpjddzp4S8m1ph0lg7u2z+c2oawzL88ZpAOXnxJqkxjEeH
         py/V2MvZQowdgFTgfHQlTAQbx2otKr4oo37dbWHIysHvOx/bNuQbcxsF9htMmtHIkoQX
         ETEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774621327; x=1775226127; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        b=VasB4bsZo/LKzZs1gMfKHahKlBlqbNbkuDSje0ce95FnLeAieMbHlvt7m529ZqFL0L
         N7uoX+pqT9Gv82t9Tzxw1dMJZw8oMCEXcL4qPvpGCmBhkBrGhVuoOTDb5PF7M/pNF3tP
         dPMqkhOTGWsA0rQQGaulwjAkZSb4sDPlzCmD0XJB9euEXXpkBUcs/QTddYFKVRkk2Buz
         Q6UkzXmU5euMvj4eN3P0gQCpR9Wm50/0as15IG/MvxczN3vva5T8oW4ZNo7g0LRoozfF
         mzr+sis4Qx3hPgkEcSALPm6Vm817wBirg7OpsBlEGDYsoFwZJF5afsPxg5IbeQw08M0H
         qbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621327; x=1775226127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        b=S4y2qd419q8IyMk691tGxfhRZwrsUoLbir/Rb4jIUYnRH1ggSNyxoMwLRyXGxSBxxn
         tWHWj3AnCEoTegh1VRh1gacHrPgftIzim3zNqcKjHG/z0qz7WlCYsCU0ZYpmhixnNyAa
         riyM7D8s1H7jjm/gcoQkzLBpyTwN+jaHdi4LRM7eRhy5ReEbH2SWmvwcttmo4W8KBqJH
         vqGmzlqJwGATqDp61udvyYifHVnS8/P8JrfgGssJunhIfmRUHhJk/0RCj8XNV6PGrsrk
         1/t//PzD5p9YPP3ojpE9EhiqjoCOYcjZ3yPEMdZ+5I1xiIQo023Ro0jp/caNVVH7p+5F
         2ikQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5m6gKUWjdz65g5nXcgPmvTKKQZhwvHqmlkCFDcQSUmSuW0+IDyHHfX3wGK8IcSOckHy1h@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5vvU9ZV/YUg0do6iXBs/tXG0LDl0TdvtBw02fG0zAtWeqQHi6
	Eyw4XKzP5wHgKwfkJoOe1ahasPAcn+pXIK8GSTdEiZCwo9qI0hfv4UI/Tyq0lMIXwe2daU3Jpzt
	kd3uNXfRmnQ982jmawoHZcpPDU1obTV4=
X-Gm-Gg: ATEYQzyG4gfAREMMlnFczY0XXN/Y495wT3WPZLglg0jTnZTzGJLvfruU/aA4v28mOBC
	u0WdAY4XGsAgydTN80GMDyoiNFBhVI9HL4RCEIwh8ENHubjUov4jF/eHEj9wLcTSBoQ0Smzurbt
	DSFZdDpfC4g+PZr4DWlWWc2YuTAaZrUdzBSbOjz4v6HORQvOtyvaGo6d7NL/44ExKcWt/TEns6T
	92VyV6pwZIVZMImbU4ZrMhBYiVmLS48yTPU70GM1iNur0rWRQjWNwVo4txkYzxJPdcg6GhPckTh
	At0oos1pMaXKaFE66yMZqVDhfXlBCcfs6+ssI/RraYXM0raBRJN+nvPi2FRwwmT/48OMaQvpbX7
	nUshGRpU1fT0OCY55LrnMH5iMKw==
X-Received: by 2002:a05:600c:4f91:b0:486:f634:ef1 with SMTP id
 5b1f17b1804b1-48727eda549mr46648885e9.17.1774621327165; Fri, 27 Mar 2026
 07:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <20260327114741.91500-2-pilgrimtao@gmail.com>
In-Reply-To: <20260327114741.91500-2-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Mar 2026 07:21:56 -0700
X-Gm-Features: AQROBzBIPfZAUsMrDB7LBzUtbbmaH79IMxVvd9bzKdqKC91ZGulsOHpJpWVa3Bc
Message-ID: <CAADnVQJizm+Y8_AE0rjJnBCrvNc+ThiWdbc-ZuUZqYTLtf=MOA@mail.gmail.com>
Subject: Re: [RFC 1/2] block: Introduce the UFQ I/O scheduler
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, pjw@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	tmgross@umich.edu, Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-block@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 4:49=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.com> =
wrote:
>
> +
> +__bpf_kfunc bool bpf_request_put(struct request *rq)
> +{
> +       if (req_ref_put_and_test(rq))
> +               return false;
> +
> +       return true;
> +}

...

> +BTF_ID_FLAGS(func, bpf_request_put)

I bet you knew this is not safe and despite that you still
decided to hack it this way.
This corner cutting is a red flag for this patchset and
your link list patches.
Since you got caught doing this you need to prove much harder
that you know what you're doing and there are no other safety issues.
