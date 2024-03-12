Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0691E865;
	Tue, 12 Mar 2024 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710254189; cv=none; b=BQ4wO45qZRlr6qBIU+IopS3cM7ajV28n8kEl0cui5BdyWbJl9gFNbWfLKfBWvT7hAdJ7xmiGWypA5PJ02FPkObF3R6SqfebCbqI0BeFOzdeljv6x5LVg/OYyuVcEmAJYKYekTDvhFthEbqtp613zivbX+DZsWLMJLPo+7TGJd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710254189; c=relaxed/simple;
	bh=ED7y42skOq6vpiDhb81/LaodfYJYsNpAoJ2BWxBaQew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGMjMfUKt5pl1++RieMOiY43e4gbWsFS/iI/OnBJL/kr+oGO0uOpTsOXAPfthpeh05SCLd5x/zJkzhO91MvX5eKEGEZ8aSzLXLtXj1zYvKvf84hkRG+IFuzD9/8ORA0ATQgTUuCSm5GIc8qmGgBMy56I/FttkTY5xfCi3gDYm4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/tfb9cY; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/tfb9cY"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso2896617a12.2;
        Tue, 12 Mar 2024 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710254187; x=1710858987; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOcn1WNrYYODqZVS4jsCliAtNNntF85voZKLTnfo6gc=;
        b=b/tfb9cYQgudndo0B23f9JrwFHXZ5UUvA48ei0ec8O0ksEqhxGTjWr3wsggTFxJBNs
         gSdCai5T29+uH9LEucrksAIRrOBoxpr7NNQWlZ9If83AAgLhM/3wPykoH8gFZ6i7GBmP
         8FlK3s/bi/TmE5hu+8vxc6TFZQ6NnrO+2x4TMBwLT0U67wBgCLHlFcQWG1lbozd8vuCh
         AYlcV6KmXO1DN3tO48nlNh+0WpbNFERt4h+sYtcuObbLcjManx8z+1ZEZSpu8++Mjvpl
         iYNYbHjgB08Ttww/3S7XKhBWJQRIC1RS+70527ibRBWS2hM9+F1LLJcsZ0o3Cs/4gsWE
         vZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710254187; x=1710858987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOcn1WNrYYODqZVS4jsCliAtNNntF85voZKLTnfo6gc=;
        b=aF+UEroeJE8dQwNA9cEz33NsrPGpHZRp0LpjW/b+I7UAQQYAlJFGh0T3P394/x4hPK
         4R4U34MDiQGtG6TpQmN373pJK7rTwx0KL8w6rLYz4Zah/ftijDjOMU90ADdVaM/WBsBr
         tD7yZw+DjmEUrG/99P0Ul5q6ACNyxJJaSzaXcKXJSO5IoCxMYRDB/4QezFBDVxtLJrXD
         Qb9VjnXMddbwHTNu2A45GkIMiI+4gvqPCyLMgHlz4jM6MPrSc01SCBmDmnPmUjel9D9s
         7IaGWPnJz2vPzLUR38z7lq8cgsgigv89mppz2su5xXFcdeq+py2NN1LeZt1pn9+dXw0v
         NjVw==
X-Forwarded-Encrypted: i=1; AJvYcCUuH/quUMQ3G/C93Hx28EqB+qErh3fL9LFtgZQJI64mt4ic9j4EVYqUo0nh29gsbxnn5Rm4AbrUl7ZKeIP1dLSimfoIJ53pjfcESXcc0gvu6CmGSlZcCosaIry7BAh3
X-Gm-Message-State: AOJu0YxsT/VNE21digMl5Nt245lWCrWRdOSjJkB2OrUl6QscODTU0LzY
	swRjKlFu/zhlF6SISGhiJ+pgmPQbFH9bLoK2X3aFUIfmKNyIQNGOnJCt+oEClxMYpS8Te8hSNpW
	OXLljWEwg3nzTFovtPWFdMDyPPDI=
X-Google-Smtp-Source: AGHT+IGFnfiRhglgUa/oXYk8H4Pns+X3T11FMAuP6jKr6ry572d92o0tbkAh3WYSb8g4xC3CC/zflOzMZPaRVglGaFM=
X-Received: by 2002:a17:90a:e556:b0:29b:b865:3dbd with SMTP id
 ei22-20020a17090ae55600b0029bb8653dbdmr6793973pjb.2.1710254187357; Tue, 12
 Mar 2024 07:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
 <20240307170516.GA1780841@dev-arch.thelio-3990X> <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>
In-Reply-To: <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Mar 2024 15:36:15 +0100
Message-ID: <CANiq72mFt0qXPky2TWqG4CiuqH-9Cg6W53pMf6iQnEXQdi3Lnw@mail.gmail.com>
Subject: Re: Migration to Debian Bookworm and compiler updates for KernelCI
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Denys Fedoryshchenko <denys.f@collabora.com>, kernelci@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 8:10=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Out of interest, is there going to be some Rust toolchains there
> as well?  Having all the reference toolchains to build the kernel
> in a single location would be great I think.  Of course Rust
> support is still a moving target, so maybe it's still a bit too
> early right now - just wondering.

Nathan and I were talking about what could be done in that regard some days=
 ago.

My proposal was essentially providing a Rust toolchain per kernel
release that is currently supported, e.g. one for each LTS, one for
stable, one for mainline, one for next... Each of those based on
Nathan's LLVM builds (given they are already very well optimized for
kernel builds etc.), possibly applying the Rust-side patches to LLVM
and using the same LLVM major that Rust used for that release.

Eventually, when we start supporting several Rust versions in the
kernel, it should be possible to move in other directions too.

Cheers,
Miguel
