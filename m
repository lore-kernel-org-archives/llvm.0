Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD24A3595D
	for <llvm@lists.linux.dev>; Sat, 21 Feb 2026 01:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771638815; cv=pass; b=nyBAx2oFLQe4hV4gVAbrWMf/gJxZ/Zqr16VKBD3qyxSlwldf262ckJpPQVIu2NGRsiNhvwQ6qk/EFKoOWn0xa7hdEASHfZ1IHJ+BP8crhSkb9Hqr54b3zHfMZ0qXnmbHFXeXZKg8+gu5xfUPI84skM4ei0aUGOKhbcZ07EyiZ1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771638815; c=relaxed/simple;
	bh=3OjH7n2Wfy0kaVOmZH2x7qSbyM0irwR0JIoRINfr6rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cI0wiezdWusEf1NjceU3837Jl5cg2OUhefAaZ7K7O3L5x5DoQpdgZTI+t9h0wVhYKm+R0/CG50b5f3bCaOKcA/APX+DARrLboacQ1OX09ROM6kI3tTpalOZyrtWisb5ut071TgwZ1h4PuPRh18rjMH9GB3R/+IutsW7OgV0fjDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMrOaRN6; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMrOaRN6"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649c070ef3bso2646949d50.3
        for <llvm@lists.linux.dev>; Fri, 20 Feb 2026 17:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771638813; cv=none;
        d=google.com; s=arc-20240605;
        b=O4S1w+sX/Ysu/KWBcRwe481vR53uW9Ts1b5xvmjyiv6fwIn8+ye69njuL3JqANikH7
         U1AQC3YV4lclTsH+9hWJGs2eVesTqaBxs1UDfr8HEZ96ZGyMm9s9m3K0/eezepMIp9ti
         6Qr+qB0nfKXP3Gpima9vLQpWiepakW+vuItFCJs5Laonmfv8bBtIjgrao//bW+7qgOpu
         uRb1odHLwzijAsTdtEV5d1dl54y0Y++FfYZwUdSnPuDKLB+9fhhppo0d7K9FXtCedYr6
         2tGjgcFb87NyWpoTupGouDbQeLJhadd/Uf6D5y2Zi9NE6sk8x3jDdgaBm0jdtnmJukEU
         Xy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3OjH7n2Wfy0kaVOmZH2x7qSbyM0irwR0JIoRINfr6rY=;
        fh=ucK4XECs5Ea1GVsu9Bli2PEUWfh0IMhOMn2WH0koY1Q=;
        b=HQ9XnL0l3xBnn/ItE7K7Jcgn1m42MTSx2qzG/nSoNLGT2hIvS73v6+jm0HlMDZ8v4T
         JVqLHi5jLUohkYSP//jNLVEy2s7mHjsqF1xASwtVDx6peyK8vWrSC6v9Nz/91V52fZJd
         5AV7Je+6/qAq/hUmyeWmysM6wH7q6gaITW2ryhoLD2HRUhlPUAl0/3G3WLn84BrIHyVs
         WQt8oW82mf1zBkrK53RaRA0B1Qj4uZzNoqXi6QP+j24nttM+FOfiT3QYkRmA93bkFjOD
         GXi5SvWLGHXKUPvCZdbt94vTD58vewIw0Zw/ukM/fvR/FxZVjwJ0TrRkLpulix2T2lUB
         u/Ow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771638813; x=1772243613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OjH7n2Wfy0kaVOmZH2x7qSbyM0irwR0JIoRINfr6rY=;
        b=QMrOaRN6GDdqVmqN0w3x3I4xZY4v8JiuBViE61DJ/fUId6DYkK3vO54SxkqccdrGkd
         NCUjROH0Wo9FRwM1yrTGBxysqYHikM6+x2bNNBm4c4kC7XVlzuLzX0UUS4ehNIpIbm20
         cB7QGdx4lBt3UMtjxa/Ecz80i/40ipg6nEnOeVh7N9svbs3avScaepJt59VdXfOeivbV
         h5lps+/40+JP6ISPkA5F9m8UX+oRCllbddU6z4kbu91RTmcD+DfpT5qW3SRAb4FPjdKc
         I5x0n/nECZiE1yX65YbtSR3prIsczGoVLymFtbnQ/pBMZugYu1sbnsEqtGJ/C4Jv1wrx
         lsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771638813; x=1772243613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3OjH7n2Wfy0kaVOmZH2x7qSbyM0irwR0JIoRINfr6rY=;
        b=SZeK5L0UmQZ9cRm2ZUC7rQ3Ps+5tiuOinlU/HTuLsCS7zeIWSVNzSbAPZjR37Risxf
         nl5HKQowv8kw8YQ8by22n7Avb4NEG5qXB0weg4MMVsUrsUTa5aqAfyaZv5BH2+qOJzcK
         m/qTXfot1ROZxqYcJh8EPlnGDxei+BWPB6mdOEjdIo1MtIRSQw/7z+3u7zkZ8J51j1+E
         0dyKdV64qPNIEreE1HAAeXs6xRHkooUd1mhZuJB/7mrs3JZXrGwg5dg/IkKns/ImeMAz
         fPmZ4ArcgIyQx8eD4twqcZLqcDuXgCzrz9IGhNfiepgATV1JFAndYhds6annyvUlZqsH
         Czwg==
X-Forwarded-Encrypted: i=1; AJvYcCXorDyTD+9hK+5Bx5wtKrneV6wBQXrQptwE9jZkKBwdmvlbA6/qeVvFfGqUmcseyVsM6JF4@lists.linux.dev
X-Gm-Message-State: AOJu0YzKHObGzgM6ox6WCTAaefBi+u0NxIHmNbDBieNyITvsgtgmgxDj
	9Zanq9tsrQye/4BlpO78zzaP9+q3Bqm+wCFLEtHyD4ilJSqBAh+zcOcxuUpnetV75UT6pOM0TWY
	gLVshPEukHq4tPK3Uwy76clX2znbn24E=
X-Gm-Gg: AZuq6aIq3Q3wR9BK5Zc87+2Sm7VlB2XOkrpSPiMikWug/lS7O6KesZqrKoy4ZLEOt2r
	sGRAcRgwi7mmGMDjayjbiKj7x0yzwtKxWwXO9QX2zaQUdc9ztuUJnxEL/uId0qymg8eansmjDTC
	YLvdS8lq/tMPNjay+Mmx72h62ck08CVrANbWRfaxKuHhwMmmjuuU73yoh2GjDNoH1NvS0RDOL3O
	pc1mJLak7OukDwan661T5zzQrhqIMrbcaArG0MRCNz4Rklesb8t8sUMn8HzcuLNj5H8AN5AmBkr
	5HvW8xgaxkNk/CO8mX8sl28T7MvC
X-Received: by 2002:a05:690e:130c:b0:64a:de99:8b58 with SMTP id
 956f58d0204a3-64c78d17284mr1594373d50.49.1771638813574; Fri, 20 Feb 2026
 17:53:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214102005.1398306-1-sun.jian.kdev@gmail.com>
 <20260220193353.21870-1-sun.jian.kdev@gmail.com> <20260220194836.GP1282955@noisy.programming.kicks-ass.net>
In-Reply-To: <20260220194836.GP1282955@noisy.programming.kicks-ass.net>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Sat, 21 Feb 2026 09:53:22 +0800
X-Gm-Features: AaiRm538Y67EA9AnZLh0Y64vfZ49zmdnn9yjBJfjN1yQHNXS5ydazV26meb_76Y
Message-ID: <CABFUUZHVCBOAzT6eFvTy1OFYDfRZERwjuYhNc6OMHP-5UKwY6A@mail.gmail.com>
Subject: Re: [PATCH v2] sched: rcu: fix rq->{curr,donor} address space annotations
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 3:48=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Sat, Feb 21, 2026 at 03:33:53AM +0800, Sun Jian wrote:
> > With CONFIG_SCHED_PROXY_EXEC enabled, struct rq::curr and rq::donor are
> > annotated as __rcu. Several call sites access these pointers as plain
> > struct task_struct * while holding rq locks, which triggers address
> > space warnings from sparse.
>
> Yeah, lets not do this. It makes the code horrible.
Understood, I'll drop it.
