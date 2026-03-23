Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CEE39C658
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271664; cv=pass; b=R451Ho6oDjJFd2BVTkzRVzXWt7Mi5peOBjwkJJQoYejZp8RljBqW/TLkW1tVMhSLioxHAdluhw+0w7VQKQc1mMAIHEq9cFQgToia5fg3IfwI0p47fwkSZjCFuNdxtbt8n80BVxmP0sftzQ/apzWe/Ed2z53NND+ZekTR7OqCmLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271664; c=relaxed/simple;
	bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRDIF9lzf3Np2xOnXCnOKfv2LvBkpwA6wvLvrCxCQvWz4niHk4pDA2ABUt4yf93q+p747wy8PSi12pBXHLyBZCaps+McHF83YXb16v41w0I3N4gOFqtM2HI1kRrMJn+uYa5cOv5oNP5KbOngiIN0PsBBVv9llgl3dtcU65OM+28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bglC0Upq; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bglC0Upq"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128eb45835cso158251c88.1
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 06:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271663; cv=none;
        d=google.com; s=arc-20240605;
        b=i25toIvc4WbG+vbIy1dryTf6QChWCiufXbbzT8wIUSLcRIMz4I+9pRfCbLjpqHdxRa
         s/04tPNSUMwIrsBg60lkNFvxvkBEyvvKPUgz4efL3y2tCTnc23TSGHRyKTlOerOiGyA7
         eXsZGj6kfLdkCikUvBz1Gg0fwBSEv33RQH9cpHM9becmsInIWL+g2rHn4ZNoTAj3eAMu
         N4ptpZU0DgXfQxslDNmBP8ajpTBYD8j/g09VSU8rAfbA63PoI8q/h0InOZRrKpvqRyqm
         bXDHLRRnmt22wckXrN3PcJd9uQDxb1Qtxgx5W7i31Cph8/VKUhJ7bfmho/ED5WMrcn7G
         f6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        fh=GIT1fxL6qnrWl3Q6812zxZ1VWjjuaFygoOzGv8tIXqU=;
        b=gSSwgfCV6/595gzFQyiyRPd1JaKHIgQqJ3m5+1tR3xN0QFPJb8IviIUn1+c/vdDq5s
         4/6FzOZQPDeTgwGGzXADFlzY2UwHb8p1zr+HJVYiWO4Ous6KSMRtnrj4V6QiEa/iFdg4
         6ECUlqEEqjmwM9nj4KcJYNG/lyULZCx8MTyvCEk2hfAivOyYQBKnQc0geyacPlhhSmLE
         LZBLhEjLe8RUxnPKgPIdb/x+JghAflxnDKXbzVmBLreUyJxWOspHdrGemcJpSh3a2Acb
         UgUjwpp6NwO7TxRbQ/238ZbxPxf5SPW8qyl8utqqnrs7AOmom3xcynBvOlj2OaFUV4kI
         8iTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271663; x=1774876463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=bglC0UpqxYC8yYGp9H7R86wf8Ngjf/7xo8fGeGRN4A/5Bf6awBRzw67Kc/mytuRQsv
         4uN/WvO1aGSg5+aqJSH58uOkXhbKkgvzgWCtqOkp/kBMZZp4StKuH44pZDsmbSFXmKJG
         KXRXZ+bD4xzQE47JJkEXKDT/TT0sI1+t+/qHp+F1K5E3WZJTfdA8Pzd2atOwY5r/fd3Q
         rFYp1wcIc6pHTcswYJQ9bETYPaiyoSEu8iK86pyhOS0sNQ5829O14N22qep+iFsIgxSb
         FawM7MwvwaBghpLpc1Mc5RQFDFB8DJWI+J4L9ctc7rJ6PGwTymVcYqi4L7HheafUhs45
         LY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271663; x=1774876463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=P2FPa7noBxZw/PJTbZE4YNQ6XSFbZt5f0Ni24HXvqMbbeSWr7uIcYmCu9u1leqMkqZ
         6f4nEZbIDpJMwzpMjqWEr9IpqPTXtN1BTqc5Op8hx9Mglchs9quQcCwZG7ww7gwD3HPZ
         jd9fe2+NRmdvdJsN1Va0HCoKJnB+SMl2exoiHBhS7DEhwgTD7OUIBSOnvpq+ScEnO6ws
         wf88zOcqil10r9+CcNt9Ujk89vdjsPM1rJMs/1nz0yyfPqt/RXbRuzkhcdlQZbNLyUzC
         nFRGdusJS8VucueS+JLnE/5EIP4FwoV7oMcqi4xuHQvSFi0Ic1FHgEhjjbbuwPqmU20f
         b/DA==
X-Forwarded-Encrypted: i=1; AJvYcCVOdd1oYadwqigeFqFXJhcNuEreuulU3Q0SetDprOGEjawU4TFdx7+G9QrTw0ImbEgma1eG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+n1jd0bsW8/trSnrU9Jxn5BYKQbDbzkI/CRCTaOp2a0IaMQcn
	3juUnzJHZoYmsAglesJsg+Pzny/XC1P5UBpkCzg7ab8CjUmp8NfmsRzRhENMLR0pVhx1poSFmcT
	lelyRC17ziy+k/zIR9XerPnWkdQa93FY=
X-Gm-Gg: ATEYQzyCndxun9Av/p0q14NU8BuC1YGHSeI013jf6pL66PnuC39GqhBqabG5WTNgWLO
	9YzmATGfoEqc42wk2F+CV58y4kzwrWQkKUYLVLKpcRaf2PJa7QHYJn39idqfJv/pFXR3dVic/f5
	RsrVcC/JgPZhTMxRjo8srRPE+FcFCSeSXLT7Pi4PY4MHBcixYaUv+0WB2X0KWhr5JTkzpdE77Kq
	XeCK5VetQa9O/f26OogiLsI63+j33maccBhig++AMIoHlm4BAgfK/iTYS0F/KeU1I5wY7zh1Of0
	amICc30tyigkFl8pqLt4KlStqo/CPiHRkI0D6N30s8bZvH636elsxh4MNjBkTancD0QgtUk4O4k
	ivadOiUAsHZnW8I+52QN9PGA=
X-Received: by 2002:a05:7022:f8d:b0:11e:332:1e01 with SMTP id
 a92af1059eb24-12a726a9b6amr2560622c88.3.1774271662774; Mon, 23 Mar 2026
 06:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
In-Reply-To: <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:14:10 +0100
X-Gm-Features: AQROBzCU6xTHp3fepOJZJySC8VZYOKbiHafZdHuv7S9AawfpKcVFscMWOGjChLE
Message-ID: <CANiq72kbp6cDnNsKb+rPHiEJzOa-EnvR2HHthM-VtT2GMukY-A@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 1:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> The current proposed code for netlink needs this feature, because it
> needs access to inline C functions. Is the implication, following a
> chain of dependencies, that netlink would only build on x86_64 and
> arm64?
>
> If you want netlink on um, arm32, riscv, loongarch you would need a
> different implementation of the binding?

I still don't follow -- this new mode is opt-in, and only a couple
architectures (or whoever decides to support it) would be able to
opt-in. Nothing else changes.

> And a completely different question. Are there other work in progress
> solutions to allow the use of inline C functions? For networking, in
> particularly MAC and protocol code, anything which needs to access a
> struct sk_buf, a solution to this problem will be required. Do you see
> this "fairly exotic approach" as just a sort term bridge until some
> other "boring approach" is ready?

This series is really just a way to increase performance, i.e. it
doesn't really change what we can do.

Cheers,
Miguel
