Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678B3128C0
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073350; cv=pass; b=ry6FS7Pb3vftlJw5a7SeYzwo6KV/pCfHkPkjX/5uyk35/UxlmNmqw64vY8NDVEaQ1tJjgroUsMvN/kkeJtmKLa9YYQgJj3cCyV6UXHxfgzMKSrmqD0e0DJ5U0R8E17/yknqQ9Ck59L9v6Nwr4hcVPtAb3+Cf1ziYCQ0NgR6SQiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073350; c=relaxed/simple;
	bh=ApREFQ6wD6lrVuWgy7MMZK5Ag3Q08NmjlQ1gTMrNQtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/i9bxXE2zGbKe8DjludyuUOezuL6kYvLrmZVcLFqTRN318pYopymbiYAhNfGektLypJVKqlHXF/3T6BHvmUrZ24wdx29zYda6myP08k5h9WevogMbNhkN1m2GTKAfttFdcaT5GbIS38pQ7cmFYsh5GrQWLV3AD9QHnX1yiYalE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yc8Npb/H; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yc8Npb/H"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-11f1fb91996so1808980c88.1
        for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 01:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769073347; cv=none;
        d=google.com; s=arc-20240605;
        b=UfVTh1pTsGmKcPOW0hCv1dc9ZwjnbDJBhUhjhe0wcCFQ1xgWciXj/W1wEascnbK2l3
         D0ny/gSkzjzSQp1t6YWsMDjRUAfH/WzcPYICZpA5Q4g/hPaIhxPJ+T03QMxBfV7UPJCp
         bAXndXc8jormLWmDjvlRS5EC5bTk1txec0yRNlNv8s3MTUl8xVmaLTB1/Lbz4BCtlA2N
         1Y9obQ8fFG4/P1Y8gZ3GYJnB8rUez1cMfObbYbB9fquJzho27FKNCjgYv0IB6OvK1zQW
         nnQbwXaOnKxyjOXdmxNFvOUZC+pCWAbub/SL9vvAsyDjuvrm5eyam6DaiUmr3FmlsoG2
         +T7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O1n87xFYqMZ8hRAVZsvMKMB4Qf2xpXCP3ePnMMEYnPw=;
        fh=/PeYf2mNuQAs5Yw+I5n3FosO7RxVxuy2dQkRIYNJW3o=;
        b=eCsDaBNvVmSq0g3vK0C+ZijeVG5MAmVA6wmQBdyvrLfrwV8IYdPeK2I+6BOsrGlld+
         sh/f/ywNKzV607DMX0cDsI1INsh0jUBQ8BYrGU9+WDtCh+FDZB6bR1lzq2t+OZZRzuAv
         WAVo/gwLUHh+9+g2UafeUNNS5SEd8umn7J3K9pYraLofOrcML87ToSxu9UBIqFlLMf6/
         2d5e0FKfxlq74s/Wkc97Z/KaEX+/pmgPDt41rtBuyHnwmoOTVDTcyJoyFbd1a3WeJi2Z
         Id6ey8M+MjWGc6cgzDSJB4bu+6rMtlVw6+jjUZhSFC6BDSSH61gEggM1neJNMiXt4odf
         MgyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769073347; x=1769678147; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O1n87xFYqMZ8hRAVZsvMKMB4Qf2xpXCP3ePnMMEYnPw=;
        b=Yc8Npb/H6Mg4uaQyHUGBzwj0Jc10gaLVmrdXjy5AirPK91JFux7cG/IPsQ3NqPbnvr
         FRMglzpIPTfrCijrWkk2w8YSLqK5D7IljF2KxTDmjxF/Qi4eqOP7ye+vyifyhysdVyMc
         a/+SJ8KB7f+km/Qn+RLH/ggCdDQMguUZFN4DviPwUUiDaUbnWcswBJp+8cAuQ/HHQG4P
         uHQKeGQ8mjMKhvErQjod8sajVkNtgU0fbvsBNf4sI0Toh+InL7nIQQ4PdTfwUVXtAhd6
         wMy8o+GBtgtPLiIPeJoj0MoRKRpf6whm4nhD0Jz3OEek+htMkhgOmNhnGtfxQyhCESz+
         bXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073347; x=1769678147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1n87xFYqMZ8hRAVZsvMKMB4Qf2xpXCP3ePnMMEYnPw=;
        b=uKvFcCVv3Es4powUIn/jJ0clskmA45wU2SzuntSH0/ywShLg5eEyOOWNmfMRkJkB+q
         DSN9PB7At9VmBT3aVe/p/cFBFn4gkIhWX2AYxjPnK364kkbSeuq/L+do2+A981XcXbKg
         EY/BOgIr7Xme0ZW1NDY0+LaQr5v6jdvWwlO6HH/JC48HE9hWi1O3hd7biMkdeTa3d7ZE
         Az7QXKafLYP9i0YHEm6mmXBYRZJJAay7/0wbtmQPh9sXHD5xnilR19OKgFlehqfGbApd
         8ige8+2XD+z9roDWBLYF/juap2y+MMasMb+E0+ELy0XVZ9YvAKZsgzaDFE6hYRXRLwz2
         cUtg==
X-Forwarded-Encrypted: i=1; AJvYcCUW5vmzfe/QCGwcD3oqtsWCWFzGDigbhqU+2Z9968vE4zxP/sBP6GM7arr7udt/8/21gY0x@lists.linux.dev
X-Gm-Message-State: AOJu0YzALroBYGM+XcqfRieYFa85hShtnIcONsZ7isBGhnGgaONFNIF8
	AHBa5jgrZdO9KiObmXQXS3Fxq2pizgSQr8aRk6mIxCZUwjmFGzISx5sz0ASU/GLDuHjqb49rccb
	dVcskT0i2UmRv3V8BrsBvOaRmxw0gZRXLDvOWuEqv
X-Gm-Gg: AZuq6aLxchpe5T20LUlADF1QDeUk5o2/LmDkfgbXkh7v77uDZuAmNByuDUUOOZKPttI
	0fYItbaGI4Ld77sMtIWhhQoefBOWzQgiK5liOSMQeV67ne5weX8v9ZTP+Bc7xq9oaJDnaFWej3d
	1hLf7FAD2Ui2mdYsX9pI9ZFLA6Az6JMM91kxunUNwW5ZFAWbVtCtlpavlbVFJOs5uZ9RhBI3l0b
	e/+FZbv0FcZvpM/6uKSkEvBLxDko4ofsOdZIhPvr51Aifj5GBaTumJtlRDPWt2QKcNugDQAQb2t
	V2ZmzvkcxUUJDYEB+ciGsads
X-Received: by 2002:a05:7022:e29:b0:123:2c98:f65d with SMTP id
 a92af1059eb24-1244b335a6fmr16241369c88.13.1769073347169; Thu, 22 Jan 2026
 01:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115005231.1211866-1-elver@google.com> <20260115213311.GG830755@noisy.programming.kicks-ass.net>
 <aWmRlXZaOOUvU_Nv@elver.google.com> <20260116150750.GG831050@noisy.programming.kicks-ass.net>
 <20260116151043.GA18805@lst.de> <20260116152016.GI831050@noisy.programming.kicks-ass.net>
 <20260116152741.GA19823@lst.de> <20260116154754.GN830755@noisy.programming.kicks-ass.net>
 <20260121202427.099c36ab@gandalf.local.home>
In-Reply-To: <20260121202427.099c36ab@gandalf.local.home>
From: Marco Elver <elver@google.com>
Date: Thu, 22 Jan 2026 10:15:10 +0100
X-Gm-Features: AZwV_QhGh7voJH5MAcuySEgpJuXAIpe-F3-jeqsaVEkPu_SPOZ3AqDPdU9cf4RA
Message-ID: <CANpmjNPDnFHr9yu1n9Sw3K+sqSfQoM-OHm6vmgjrfVaGMNHmOQ@mail.gmail.com>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jan 2026 at 02:24, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 16 Jan 2026 16:47:54 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:
>
> > struct obj {
> >       spinlock_t      lock;
> >       int             state __guarded_by(lock);
> > };
> >
> > struct obj *create_obj(void)
> > {
> >       struct obj *obj = kzmalloc(sizeof(*obj), GFP_KERNEL);
> >       if (!obj)
> >               return NULL;
> >
> >       spin_lock_init(&obj->lock);
> >       obj->state = INIT_STATE; // error: ->state demands ->lock is held
> > }
>
> I haven't seen all the other approaches, but would a macro be able to hide
> it with some kind of obfuscation from the compiler?
>
>
>         GUARD_INIT(obj->state, INIT_STATE);
>
> which would be something like a WRITE_ONCE() macro. I'm not sure what
> tooling there is to disable checks for a small bit of code like this.

Something like this is now a documented alternative [1]. Basically this works:

   context_unsafe(obj->state = INIT_STATE);

For single guarded fields, that's as simple as it gets.

[1] https://lore.kernel.org/all/20260119094029.1344361-1-elver@google.com/
