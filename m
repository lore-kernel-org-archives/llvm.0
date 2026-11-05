Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908041;
	b=pU5O4ZZA7dvxdKj9i+QwT8+CzIKksGegDoe3ikJPNmY+1w5WHcal9LyyhSbhXnhpNA7w
	 Uwx9OsZKBxGjzkSakDPqs0DxGdzYMRPImnJ/dPdMHfCpsMpAST0Ldc2CpGvEp5VtBUWsV
	 rTMYATai++Day62Xoxn3UqdwmjiN9L3nb1fvVoyC+16NZJxNVikH/fspR+1xA9SV8WCey
	 eDppBf4xSgyVKOjbORjxqqq1TX7yMuIrOUV4b9LT+3gSzR/NUjx/HZ9OOXgIYLoM9xM1w
	 arU03L0hufrnF9YjdyoDUe7WapWjOlQ4rjge1xTDWnYeBIe0bvuSVdQeqNdsFrIfheg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
	b=LI7v1yzQxLgurF/SjgLvOsyf7b2p3wR7eDDd/teOifk9x9t12oeExrt9WqUJQC55ww8k
	 xxGrAdkBBKwcV4pC6z/DUnLUFkeLjs5fAxFWDqjiC5z54MzV/4bcOcBydjEQxEIUXo4Gp
	 +XAJ0MOBHhQd4n/sN4v+DIzVHEUf/3zWGF9wReNSOGumzRqIlERa1RpsJgPitq68Yt12E
	 262ZcUlebJeR/7/NvKD7ECgyNrHBMmGkA0aQ+QiPmODiGRiP4nJW2zifrShPJGr8S93AV
	 4J2QY5kIIRDToiqPYkKCCIxWhwCtUWUf3UEofGjxbHHiKL/G2AYIA5xJaIpJ02pwVIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHMtunaU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA828606B04C
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 19:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA828606B04C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHMtunaU
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36d499f6ab6so250911eec.3
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 11:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908040; cv=none;
        d=google.com; s=arc-20260327;
        b=fRck06LOp/XmvycDoYlWIhmvQyahpbMayca/wCKuubhcrXilJHrNF0Ig+4vxbNrJ3u
         XC2bY3fp8KJ4O/vynzONXvnuvnlA5eFIUgN8qXITNquPJ1mqcENc6RgNN55ALL7pK/vD
         X/OEVzj7ZSzuTOaw1nWZr0eWe1hMvgjxpdDGc+Py1+pgABVuW9q4SHZ2KNKP0wra43/n
         NjlW2IUvn8xQ2NM65ATlFfwzVmg7SOpMiCqZfUG+N/HgYLWQ8cQwmh0WFXFfNbcSADuu
         qzTcXbxTsa2PKYZc1I52KOAu1f1l0VjhDwNHqKHHF97gd+7CAbesrxHiQfOhVF19OXj0
         k+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        fh=v0hH/L4dQZRd3+xpuXCWT4h2ogqj8MUR/adf37fs2OY=;
        b=EcVbFr4JJid/CFe+M3EYnx+uXkMqrpHVQU2HaLP8Z6KVi4jLhCuOxwUF56CvviM3Tg
         qSoJuQnSiVAaiSd86oKZT0M2askUvzGWX98gkNFcnhXUR8C5FypiQq6uGypM6kY6Vbrs
         f4I3piNktgfuZ7tYW9Q6nVCNJuHhfCI8qhIp3skcr5v0EWGcHzJdbZ4etlMc2ynvTRjP
         4RzYH/SNux3LLr2vDBI59g+l/cx7nvNPX8l6Z9q5ySFOifRgb7kq2ognQCIlfzR7h+EV
         KkoRYJviCqgG4YkjSsuFOgEQGBis0aMl+sYnu3a8PQo0hivNZcxvKzvZ6Li8k8Sg3hjh
         qHSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908040; x=1794512840; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=UHMtunaUsTpK/XILpbO997jFCOWus5Tnc4+GCqO0EZeuQvpCPye5/rS/dGP90i9RkQ
         05wloS9J9ZQVSAke8TOicRlyhJSva+s3oTTIWUEuUKxp7kXVWX1VXkbzSmd/EDklgL/A
         UNIyy2sEATP26A8dIXMerDRZpccd05Zv8lUTuyP+otTeeHQVtAOhVCAJ1kXHDBO2OwDl
         HFWvL86QPapgin9q6oef9BTT3KZBfP+NpacaK6pAPA2zk4zFn6brZH6UPTaL/u16MshM
         XpwbW1vhP/vvj6Fkkw2fs7ycc/pRv4iYxFlvlgQOf53YHW0/sMMioTP7Zno3+EchxnsA
         OvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908040; x=1794512840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=lU823semDkpHk2XoGKkqhPYO+aYszq61/B9KOR7TdYpU2TwNCvwnJzNXLxC8sU6bXp
         u/PKUoGuT2+36GXlmQx+YLPmOQsP6jo9N1gD5jU+C6MQnayb2LOOnCnHjQX9tjDrIU/a
         gQdQ1qVtHCxK/JV9LolHjCa36/4ZfEism7KT22AnptlT7Dfn2dJo7EifT4Y5BWBUsS08
         /11Z4NXY+okO5lmhXrDqCCCbVWXOfPju8Pu6dfodKtU1YlAwhXVlEHm9cQkTa1yvorEr
         dqMEBqNmmwTmcZo9ah2KAxORKoaqt0/eW4QsftBcPVWAsicosxfJqsWbirI3dHDlkhke
         iUDQ==
X-Gm-Message-State: APuU4Z94HbhWTIOPXhG58EmaSENcLdqtBkj171tWSPeMMMhmqsxbXfxD
	mN+RR6w/du9aMhEzUyyBCVcPmCRJsA62xCn4hZFDnk96aFZCbnjAcmOCci4jToRurSDX6yAISyU
	bYv7UakfwlywnvQbZGswg3BO5XvIwr7g=
X-Gm-Gg: AYBFou0cFOh8s2HKBGZUmbxgaKUmNhg+nSEDscE5xz73zrZfhxDJ+nPaVLsY6Qxiym8
	z/J4xrr/NmtT0JMblQ48ZcwIT6gygcumYK+Sk/koi0lyvyAff2fByl4M3vaYL2QUbB00bDKYPkC
	RwXFpYNoX6Dmrw5DMKQz9DeZavldaJgLFzDavPQW7Rj0Jj+8a950EUhnfOZgAQO2iCZ41z/NpJK
	HBIidnnrR5H23qunBBSWeuK+fsAYiDTb8WqpIMe46UQmYjKB47/nnqIt6HlMEYKyZxkQEV5GGuU
	CKQGvFGJJD5NWJSNPQL3AVTvmozjeIlFwWOeKKspV05OaqhgoHBh0qcGi/LL8RuiYKpxAoRdwse
	Xkx4ZwMzm1cPYQbtoSz+fS8cTnTHC1muHRQgXKYrXfpYv+L5v5RFn48a27dIhw/Ibhlxw9/Lbli
	5AURya4E9Xw+LSYgcxhVXYOwbtFrPx1tYBiTEldS3zjrP27hAki+gLwOxJUke8oxiRUeSq9f0K9
	Px7FDBvEyn/DjL6qhzUF26+F7VnjtA5Achn
X-Received: by 2002:a05:7301:da07:b0:36d:cd5d:d809 with SMTP id
 5a478bee46e88-36f75831c52mr274847eec.1.1793908039634; Thu, 05 Nov 2026
 11:47:19 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
In-Reply-To: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Nov 2026 20:47:05 +0100
X-Gm-Features: AclHuK8sCw5nDzEQ97QtRVn9Wki3tWu_M3cQQh4H35CVD10ErpOISlcCaQDiaQU
Message-ID: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> since LLVM 17) for C, Rust, and ThinLTO builds when

> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile

I double-checked that the flag was introduced in LLVM 17 as the cover
letter mentions, and so it is likely fine given the Rust 1.85.0
compiler (i.e. our minimum) supports LLVM 18 as the minimum major
version, but if the patch goes ahead in the end, then we should make
sure it works well with that one (or probably you already did, in
which case, please ignore this!).

Cheers,
Miguel
