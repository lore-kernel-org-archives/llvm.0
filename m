Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD840D579
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856127; cv=pass; b=ZCjhxvsAZZCBxyA7guscMQ3NVd1CNwOi5dZE44NWxqJa/tryJSkwJxievzkOuVQpsynk11umKfG78yHwOAUoqbsX+mdMz/tVn4J99TIB4IDBIgQgJGTo3phtAo4/6ws4uCrhkLKxr3uVUgqCdazvy6LiLvWuhpd0/mzUM7jVnk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856127; c=relaxed/simple;
	bh=bEknJwd69BPqBX6M20MiEGYpWE1pn2YGl/7/sZbmkec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIqvQf6+38Ubp0b3rqSGa/R7YqQ6I8iYB5nVkB7PUAgCY8N6q0wXkM4naNrr3oGhzbh22AVK5wcHxO7RJfUdpDBH30qZBkNDkzDjvIuIVuEyxeyiSuI5kjUPMX0yVHpe2grmtlq0PqxMih9JHjPcWG3heCnSQuL4BD21+T9sFDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5c3C+WU; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5c3C+WU"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bd960e807so119145eec.0
        for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 01:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856125; cv=none;
        d=google.com; s=arc-20240605;
        b=QHEANBLkC4tXTiUM1qRhACEVXvTfD5vE4V4th79lUc8vFx4xIzYXqcnj9N59zq3Qs7
         3JhNpLtUEYpKQBr557XGD1/HLfH6drkNrEbMpNSb1eC/1svWDe75SUQ7jZzldoudzMQd
         1RyBpAQb82TiIBmL3oj/EKoOOLhMYX7sZZiOGgxQlyWJwxnLf/Sjlty9l90lrFGdLSNU
         DrrWCA/cMhm0ckIwGrp+Nb0WI2IE9Jl63rQBHwdFnIhtpbUx1d/iIsPs1RteYMHFA5kD
         1fwticwi1YRpZWVs734vW3+cHJtdUFIUgzXws+LPnpBt3z+iJiy/8rKfg85XOPhgGzFG
         /YDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        fh=ri7PWWPxTbmW65lgtII8Gb4UzcnGgY9GA0kwwCwb1B0=;
        b=iZ8PnM1lxxhuayDp9470toOl2epK3EkXBRuR1FpS1X9arz02JD1ERJCaPq9ujoPHLu
         gsVm4A6/ojjE6vrfEBYqAaAX6OcitTd73AWys7KPpluPdUCFFkAfoQ4qyIwYbGxJjHFm
         l3NBjoMZtmfrLl2plf4OkffPIyecjolu9qRfJsLP2Z2pFVkyPrN53IhEVHtgjziAzqqv
         jgC4oox1xzoV1c9SSPbN8hZMzLJLypLKYlXqHb+BIFhB8pudQxa0qaNgkl+NhLI5xzPg
         QCYvM8gicbwTr1ivZDzJYMfjbk8UyC3Xj2g+JX5sf4IR9ZOkk7Oi4nEKYoXlBV+FdWNa
         E6zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781856125; x=1782460925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        b=h5c3C+WUpzQ+Wddn+7PtGVnE027S/7IacP8twjK7L9Q1jgvUwl9iJ4RPYH2XhFNDDa
         /PxgqNrnbRHeOG7NeP7YjwGILJQlbq1dyOHStI6wBz9T+jZnnq5/9z5nX/M8JgGJ/WCy
         ELmcg/VPQGu5uNWwYHpjvqadf+BDB8NDdg9sQ5lej9gc9AGiBIKeC1GbL3ni6HeuNUf+
         NHkCBnSeZU64T4yypt43nOv+FOjoV/x35k5MKYhhxsx7/hXPvmHPCICyWJHvR97svBiW
         mmBteCpwzkHgb8pFheFYXOMrq3SCOzlLX597HQ53uI+W0zfRxstNt7peg2Ez+owxgF5A
         INLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856125; x=1782460925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        b=NLyOOoEdtv9lMln7I5ZCwroDuvQsZdpGxmqjvy9q6uKfjZlws+USteRzDuXbYlpdUu
         BLXQ6GKtZR2JqwI4eLlldXUJ6awx+LtjPLlU4oSif97B6nRlsQLCwAZZTOvq7CEykvRe
         MXonTfMl9a2YNUTiIP0RYldrFGmgMXgftfmuPCw1+yvJ5mbI9eu31zhF4LWexhSubP6f
         TgwsUrgY8XNueExwSO5b7zSMiMU5qUVa0Lpt4mVld17GtXR/pylwAatoyLpLcIfRW4to
         cvPgNknPIQAb0ih+z17UW1A+FJKQFRmUtwhYysE2eDXa9yb8W/ax8k8GwbSe1UKtkRl2
         eW1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8bGf17cdue+JhitTVUlLb1pDoizffk/ruDV6M/XTE8ocNDKsou/EBE7CBDoVb68Z7m9DxE@lists.linux.dev
X-Gm-Message-State: AOJu0YyBNEXHNE6tWn8FdHqxOvZl3k/Wv1dC/4427EwwvoH1UCdhhQEx
	38otkdrJFUqvjM4q86Sb9ZtQ13UbvrURjrN5V7A8i8AHZs6zJvvybt6RNtqEWPWq759xSXUM17V
	1EhPlFic3IpBh/ImVRXkpMPO3r0nJSSk=
X-Gm-Gg: AfdE7cnweu7GxAN4x/HUy/RT1DuOwMVuKX8S7AcGA0koNiEBxLL624wIBS+k9dgrqU5
	MOdhguVAS1JmMFYutECo5jcLNkMH2j1yDUppsyMtSWb4CIbiA39QvBq07AmFULvp93A4p4fRUwS
	hIMHWL5uG/+NedfPbc9y3jSfioGsfMjBofM3LdW/ya96e1p68wItz67oLOZsaYlRk4/XG0H96XP
	BwsKIMOb5RJiInUoWcurmB/bX1wO+ZAe4a5fvDS74VdCOBdPlwaUks+W2MZuy20dF3n8EOj9F5N
	0dBSjjgPc3Bp7uB5rkqyeMm8Th/BFtDB9ur1mDLBMxqbZm99hUBzH7IH72FPnoTo8i+UbBV+5bQ
	LeNiIhvf9UyUf
X-Received: by 2002:a05:7301:4083:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30c0710707emr738158eec.3.1781856124490; Fri, 19 Jun 2026
 01:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
In-Reply-To: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 10:01:51 +0200
X-Gm-Features: AVVi8CffKMpkvKaXkC2a14km4xiSSCQKaVxWsJd6YpU-ayq5fx4Qr3XyLO-NClY
Message-ID: <CANiq72kbbhHA8d2wtNbaPR5Xx2kC25_D1r-EEeZWn7ojo=M7iQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Due to a rustc bug, the -Cforce-frame-pointers=3Dy flag only emits the
> frame-pointer annotation for functions, but not for the module. This
> means that functions generated by the LLVM backend such as
> 'asan.module_ctor' do not receive the frame-pointer annotation.
>
> This is likely to lead to broken backtraces and may also cause issues
> with ftrace if these features are used with functions generated by the
> LLVM backend.
>
> Thus, use -Zllvm_module_flag to work around this rustc bug if using a
> rustc without the fix.
>
> Cc: stable@kernel.org
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Link: https://github.com/rust-lang/rust/pull/156980
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

    [ The fix [1] has landed for Rust 1.98.0 (expected release on
      2026-08-20). - Miguel ]

    [ - Adjusted Cc: stable@ as discussed.

      - Added comment with link to the PR, similar to what we did in commit
        ac35b5580ace ("rust: arm64: set uwtable llvm module flag for
        CONFIG_UNWIND_TABLES").

        - Miguel ]

By the way, as far as I understand, the `vger.` version of the Cc:
stable@ address is the one that should be used normally:

  Use ``Cc: stable@kernel.org`` instead when fixing unpublished vulnerabili=
ties:
  it reduces the chance of accidentally exposing the fix to the public by w=
ay of
  'git send-email', as mails sent to that address are not delivered anywher=
e.

Cheers,
Miguel
