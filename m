Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2E28DF36
	for <llvm@lists.linux.dev>; Mon, 21 Jul 2025 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095667; cv=none; b=cGdJZtevh47QuE/wnp064CxbXPwvUUpQGqrKDNa2YK6DHtkFNHOUMYlqLi7uvQZ/pYYHamIz9E1eXdNjtBhQP6fSbJlbwHzF2L7bFzi0dN9hEnPUPU6fjK7lIbRmRa9QO2vnXDq8nWgkjIm2U5hbSKFwrL2K3vO+eRlQ4GJm9gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095667; c=relaxed/simple;
	bh=vvqRmzn5bsiLfDQPVMIJEqn98dYEOaVj5gPI9frgUKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgxVHTimc82FHmHZI0imWYJCVbLGoTWKdtbQeOg3zdSBukQmGKPetn2P4yIUn9I06ePYpiFOutUlcXbGSBU7Bp0sJHjEsV+mRx8YLyXPtRKz0y/BZBakcoa4C52UF/hTGihBdvQBVC6KztZ9fVOM6jgZdJ6/FvoN7Dr9086pt5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hoxOnDYO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hoxOnDYO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2376669f8f.1
        for <llvm@lists.linux.dev>; Mon, 21 Jul 2025 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753095664; x=1753700464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmY+IpkmibE+BnldzW/yUpXObRNwKpLs/0Xryp2VLPA=;
        b=hoxOnDYOhPzu/GVuGQPWFFF6fTULBFGL7sJ9Qw14Usk7hKdgGK21LLRKGyuU61Gy0x
         atU+M/SB0FlXfvFeSBj5wZUpogkQvFPGtY73qdhMu1aetSOdS+X4HOksZCzNt7UWhpMc
         fg1Mvj+IyfAbHU8vuIegPtwSMDAvKKtwdLAAk7ySTCb/CGFcvqvpHc1gEt/9I9GyO9uU
         4bMx4LiVbRzBVrJmFHEsStbaEj/akasB4sYcXcIdkw/g/hrAxV+9TjRuZlGKY94ioh7i
         QEygoxU0kF6Ev4kSfyJT6wsHmJQBlOrtDOGRV4NU0vF6MqwGQjIu8ZZlJTBVeKtZtzq7
         vH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095664; x=1753700464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmY+IpkmibE+BnldzW/yUpXObRNwKpLs/0Xryp2VLPA=;
        b=SmL57NZXN72VGbo3cwtNNI+Rhr7wFZIjhzMPxLmdKrXx0LZLtEpGWsB040+XhLkaKM
         N7FSVM7YBLoYpTlJzi1XLhQQrTOR7EHc4zqmVOMduDj+QrC3Auhxf2l4amFJgnF077vB
         QGKrgeMb0M0xFHci8u4U8RvPwwteB1GnQbedeZ4szQbEOgFJzwIqt4biDRfbvC0bJNvd
         NyXDd5I3mRnLN7VxspFG12Ib6zBUH8Ou8k54v/10m42Fn417PjuYlqLac+sXG1CjXo77
         biIWKMj11S2T5DU+doJf7nDaZwNJ3LXM0VvwFamXGH5tMoWVM/u0LN4XwMb5HwVBbFSj
         JmJg==
X-Forwarded-Encrypted: i=1; AJvYcCVN1Xyswy1nfG5nUx3+0pqnVeYx/likxSf8wULvp4IyRcbG6WbXgkY0Yz/b3PcinzS7BT4s@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxz7MgutYNpmtYvxz2kvroZDtxlKKBOi6dTYPJDcol5WE5xleU
	Vkv0Kvz2KxSIGY6/OBgWL+3eCwo26uluVMXA+RKsgAGGIAk+dfZ9rkgjkVdITvEOpvIbUsrQ6lP
	UrQIbKRS2D9rny9VXMeK1GNZ5e3z33wQ++JNIAlGL
X-Gm-Gg: ASbGncvXqJOishKrOYEz/Qf5omlAkTjh9lVZ0hm+l0AIP8IwzUQna2wCjBjE7ONOkAf
	4FaNz7gcx9479TXYouUAQ2gk3Ku6ZaJQQuPnpmpicVLCusHtThCHPV9AsTFtt0faX3WJadJYTH0
	hsB4d+pew8YwzY8ub/IQyxGH5WIGv0HKRuJARtKO1x3VMyvl7ZYvYqzJySlE7QbxKZ1I4v3Qc0t
	M9HphSvkYubh6PxoY0Kv4qNM/Cgn7OTwwnn
X-Google-Smtp-Source: AGHT+IEDEegBWf7D/JwjxXCNJSDo4l+APz+X0qs4pQdmNxde/72o3MOGn11+E/f6IP+htttyF0gaDT6zRxAPVq+4caU=
X-Received: by 2002:a05:6000:2903:b0:3a5:2cb5:6429 with SMTP id
 ffacd0b85a97d-3b61b222600mr10029667f8f.43.1753095662535; Mon, 21 Jul 2025
 04:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250625051518.15255-1-boqun.feng@gmail.com> <aGKWIFVl4nwSl8SG@Mac.home>
In-Reply-To: <aGKWIFVl4nwSl8SG@Mac.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Jul 2025 13:00:49 +0200
X-Gm-Features: Ac12FXwftzBCY7VjqfRESxSmTve-JCl6P7gakKhAmACJbgq-_ANGdiID8v6daPU
Message-ID: <CAH5fLgj1C-BVAfK8Qoaxb4hV=s74-SNPUeHq9LtmQ5q8aqcd-g@mail.gmail.com>
Subject: Re: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes
 for v6.17
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Tamir Duberstein <tamird@gmail.com>, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Mitchell Levy <levymitchell0@gmail.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Borys Tyran <borys.tyran@protonmail.com>, 
	Christian Brauner <brauner@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:50=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, Jun 24, 2025 at 10:15:13PM -0700, Boqun Feng wrote:
> > Hi Ingo & Peter,
> >
> > This is the updated version from my pull request last cycle:
> >
> > v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-boqun=
.feng@gmail.com/
> >
> > Please take a look, thanks!
> >
>
> Ping ;-) I forgot to add that this is a dependency for Rust version's
> read_poll_timeout(), which is a dependency to a few things:
>
> * In the `Tyr` driver:
>
>   https://lore.kernel.org/rust-for-linux/20250628.224928.6908316292615465=
21.fujita.tomonori@gmail.com/
>
> * In Nova, the gpu driver:
>
>   https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-24-ecf41ef=
99252@nvidia.com/
>
> * In the qt2025 phy driver:
>
>   https://lore.kernel.org/lkml/20250220070611.214262-9-fujita.tomonori@gm=
ail.com/
>
> Thanks!

I would love to see this land to unblock the above users. I wanted to
add that I fixed the Rust language so that it NUL-terminates these
filename strings, so Ingo's concern from the last cycle should not
apply to this version of the PR.

Thanks!
Alice
